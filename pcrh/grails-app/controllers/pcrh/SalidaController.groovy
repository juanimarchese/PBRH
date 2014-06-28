package pcrh

import com.pcrh.Documento
import com.pcrh.Evidencia
import com.pcrh.Hecho
import com.pcrh.Salida

/**
 * SalidaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SalidaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def list = Salida.list(params);
        def count = Salida.count()
        //Todo - Poner filtros
        [salidaList: list ? list : [], salidaTotal: count ? count : 0, params: params ]
    }

    def create() {
        def evidencia = Hecho.getHechosConEvidencia()
        if (evidencia == null || evidencia.size() == 0){
            flash.message = "Error - No hay hechos con evidencia"
            redirect(action: "list")
            return
        }
        def salida = new Salida()
        [salida: salida]
    }

    def evidencias = {

        def evidencias = Evidencia.findAll("from Evidencia e where e.resultado.hecho.idHecho =:id and not exists (from Salida s where s.evidencia = e)", [id: params.idHecho])
        render g.select(keys: evidencias*.id, from: evidencias*.toString(), id: 'evidenciaDropDown', name: "evidencia")

    }


    def save() {
        def salida = new Salida()
        salida.properties = params

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

       def show() {
            if(!Salida.exists(params.id)){
                flash.message = message(code: 'default.not.found.message', args: ["Salida", params.id])
                redirect(action: "list")
                return
            }
           Salida salida = Salida.get(params.id)
            [salida: salida]
        }
    /*
       def edit() {
           def idHecho = params.id + "/" + params.anio
           if(!Hecho.exists(idHecho)){
               flash.message = "Error - El hecho no existe"
               redirect(action: "list")
               return;
           }
           def hecho = Hecho.get(idHecho)
           hecho?.clearErrors()
           hecho?.validate()
           [hecho: hecho]
       }


       def update() {
           def idHecho = params.idHecho
           def hecho = Hecho.get(idHecho)
           if (!hecho) {
               flash.message = message(code: 'default.not.found.message', args: ["Hecho", params.id])
               redirect(action: "list")
               return
           }

           if (params.version) {
               def version = params.version.toLong()
               if (hecho.version > version) {
                   hecho.errors.rejectValue("version", "default.optimistic.locking.failure",
                           ["Hecho"] as Object[],
                           "Otro usuario estaba editando este hecho mientras usted lo hacia")
                   render(view: "edit", model: [hecho: hecho])
                   return
               }
           }

           clearMultiSelectOptions(hecho)

           hecho.properties = params

           updateEvidencias(hecho)

           if (!hecho.hasErrors()  && hecho.save(flush: true)) {
               flash.message = message(code: 'default.updated.message', args: ["Hecho", hecho.idHecho])
               redirect(action: "index")
           } else {
               flash.message = "Error al editar el hecho"
               redirect(action: "edit", params: params)
           }

       }

       def delete() {
           def idHecho = params.id + "/" + params.anio
           def hecho = Hecho.get(idHecho)

           try {
               hecho.delete(flush: true)
               flash.message = message(code: 'default.deleted.message', args: ["Hecho", idHecho])
           }
           catch (org.springframework.dao.DataIntegrityViolationException e) {
               flash.message = "No se pudo borrar el Hecho " + idHecho
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

       def uploadConstancia(){
           def idHecho = params.id + "/" + params.anio
           if(!Hecho.exists(idHecho)){
               flash.message = "Error - El hecho no existe"
               redirect(action: "list")
               return;
           }
           def hecho = Hecho.get(idHecho)
           hecho?.clearErrors()
           hecho?.validate()
           [hecho: hecho]

       }

       def uploadConstanciaFile() {
           def file = request.getFile('file');
           if(file.empty) {
               flash.message = "El archivo no puede estar vacio"
           } else {
               def idHecho = params.idHecho
               def hecho = Hecho.get(idHecho)
               if(hecho.getPu() != null){
                   hecho.getPu().delete(flush: true);
               }
               Documento documentInstance = createDocumento(file)
               hecho.setPu(documentInstance);
               hecho.save(flush: true);
           }
           redirect (action:'list')
       }*/
}
