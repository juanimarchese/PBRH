package pcrh

import com.pcrh.Documento
import com.pcrh.Evidencia
import com.pcrh.Hecho
import com.pcrh.Salida
import com.pcrh.security.User
import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.SpringSecurityService

/**
 * SalidaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN','ROLE_JEFE'])
class SalidaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    SpringSecurityService springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.sort = "fechaSalida"
        params.order = "desc"
        def list = Salida.list(params);
        def count = Salida.count()
        //Todo - Poner filtros
        [salidaList: list ? list : [], salidaTotal: count ? count : 0, params: params ]
    }

    def create() {
        def evidencia = Hecho.getHechosConEvidencia()
        if (evidencia == null || evidencia.size() == 0){
            flash.message = "No hay hechos con evidencia sin salida"
            redirect(action: "list")
            return
        }
        def salida = new Salida()
        [salida: salida,freezeEvidence: false]
    }

    def evidencias = {

        def evidencias = Evidencia.findAll("from Evidencia e where e.resultado.hecho.idHecho =:id and not exists (from Salida s where s.evidencia = e and s.fechaEntrada is  null)", [id: params.idHecho])
        render g.select(keys: evidencias*.id, from: evidencias*.toString(), id: 'evidenciaDropDown', name: "evidencia")

    }


    def save() {
        def salida = new Salida()
        salida.properties = params



        salida.setLastUpdated()

        setCurrentUser(salida)
        salida.clearErrors()
        salida.validate()

        if (!salida.hasErrors()  && salida.save(flush: true)) {
            flash.message = message(code: 'default.created.message', args: ["Salida", salida.id])
            redirect(action: "index")
        } else {
            flash.message = "Error al crear la salida"
            redirect(action: "create", params: params)
        }
    }

    def setCurrentUser(Salida salida) {
        salida.setCreationUserId(((User)springSecurityService.currentUser).getId());
    }

       def show() {
            if(!Salida.exists(params.id)){
                flash.message = message(code: 'default.not.found.message', args: ["Salida", params.id])
                redirect(action: "list")
                return
            }
           Salida salida = Salida.get(params.id)
            [salida: salida,freezeEvidence: true]
        }

       def edit() {
           def idSalida = params.id
           def showEntrada = params.showEntrada != null ? params.showEntrada : false;
           if(!Salida.exists(idSalida)){
               flash.message = "Error - La salida no existe"
               redirect(action: "list")
               return;
           }
           def salida = Salida.get(idSalida)
           salida?.clearErrors()
           salida?.validate()
           [salida: salida,showEntrada: showEntrada,freezeEvidence: true]
       }


       def update() {
           def idSalida = params.id
           def salida = Salida.get(idSalida)
           if (!salida) {
               flash.message = message(code: 'default.not.found.message', args: ["Salida", params.id])
               redirect(action: "list")
               return
           }

           if (params.version) {
               def version = params.version.toLong()
               if (salida.version > version) {
                   salida.errors.rejectValue("version", "default.optimistic.locking.failure",
                           ["Salida"] as Object[],
                           "Otro usuario estaba editando esta salida mientras usted lo hacia")
                   render(view: "edit", model: [salida: salida])
                   return
               }
           }


           salida.properties = params

           setCurrentUser(salida)
           if (!salida.hasErrors()  && salida.save(flush: true)) {
               flash.message = message(code: 'default.updated.message', args: ["Salida", salida.id])
               redirect(action: "index")
           } else {
               flash.message = "Error al editar la salida"
               redirect(action: "edit", params: params)
           }

       }

       def delete() {
           def idSalida = params.id
           def salida = Salida.get(idSalida)

           try {
               salida.delete(flush: true)
               flash.message = message(code: 'default.deleted.message', args: ["Salida", idSalida])
           }
           catch (org.springframework.dao.DataIntegrityViolationException e) {
               flash.message = "No se pudo borrar la Salida " + idSalida
           }
           redirect(action: "list")

       }


       private Documento createDocumento(file) {
           def documentInstance = new Documento()
           documentInstance.filename = file.originalFilename
           documentInstance.filedata = file.getBytes()
           documentInstance.save(flush: true)
           documentInstance
       }

        def markAsReturned(){
            params.showEntrada = true
            redirect(action: "edit", params: params)
        }

       def uploadConstancia(){
           def idSalida = params.id
           if(!Salida.exists(idSalida)){
               flash.message = "Error - La salida no existe"
               redirect(action: "list")
               return;
           }
           def salida = Salida.get(idSalida)
           salida?.clearErrors()
           salida?.validate()
           [salida: salida]

       }

       def uploadConstanciaFile() {
           def file = request.getFile('file');
           if(file.empty) {
               flash.message = "El archivo no puede estar vacio"
           } else {
               def idSalida = params.id
               def salida = Salida.get(idSalida)
               if(salida.getArchivoConstancia() != null){
                   salida.getArchivoConstancia().delete(flush: true);
               }
               Documento documentInstance = createDocumento(file)
               salida.setArchivoConstancia(documentInstance);
               salida.save(flush: true);
           }
           redirect (action:'list')
       }

    def download(long id) {
        Documento documentInstance = Documento.get(id)
        if ( documentInstance == null) {
            flash.message = "Documento no encontrado"
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentInstance.filename}\"")

            def outputStream = response.getOutputStream()
            outputStream << documentInstance.filedata
            outputStream.flush()
            outputStream.close()
        }
    }
}
