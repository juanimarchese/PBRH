package pcrh

import com.pcrh.Documento
import com.pcrh.Evidencia
import com.pcrh.Hecho
import com.pcrh.ResultadoHecho
import com.pcrh.Salida
import grails.plugins.springsecurity.Secured

/**
 * HechoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN','ROLE_USER','ROLE_JEFE'])
class HechoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def list = Hecho.list(params);
        def count = Hecho.count()
        //Todo - Poner filtros
        [hechoList: list ? list : [], hechoTotal: count ? count : 0, params: params ]
    }

    def create() {
        def hecho = new Hecho()
        [hecho: hecho]
    }

    def save() {
        def idHecho = params.idHecho

        if(Hecho.exists(idHecho)){
            flash.message = "Error al crear el hecho - Ya existe ese numero de hecho"
            redirect(action: "create", params: params)
            return;
        }
        def hecho = new Hecho()
        hecho.properties = params

        hecho.clearErrors()
        hecho.validate()

        updateEvidencias(hecho)

        if (!hecho.hasErrors()  && hecho.save(flush: true)) {
            flash.message = message(code: 'default.created.message', args: ["Hecho", hecho.idHecho])
            redirect(action: "index")
        } else {
            flash.message = "Error al crear el hecho"
            redirect(action: "create", params: params)
        }
    }

      def show() {
          if(!Hecho.exists(params.id + '/' + params.anio)){
              flash.message = message(code: 'default.not.found.message', args: ["Hecho", params.id])
              redirect(action: "list")
              return
          }
          Hecho hecho = Hecho.get(params.id + '/' + params.anio)
          [hecho: hecho]
      }

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

    private void clearMultiSelectOptions(Hecho hecho) {
        hecho.especialidad.especialidades.clear();
        hecho.peritos.peritos.clear();
    }

    private void updateEvidencias(Hecho hecho) {
        def _toBeDeleted = hecho.resultado.evidencias.findAll { (it?.deleted || (it == null)) }

        // if there are phones to be deleted remove them all
        if (_toBeDeleted) {
            for(Evidencia e : _toBeDeleted){
                def salidas = Salida.executeQuery("from Salida s where s.evidencia.id = " + e.id);
                if (salidas == null) continue;
                for (Salida s : salidas){
                    s.delete(flush: true);
                }
            }
            hecho.resultado.evidencias.removeAll(_toBeDeleted)

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

    def uploadPU(){
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

    def uploadPUFile() {
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
    }

    def uploadLEF(){
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

    def uploadLEFFile() {
        def file = request.getFile('file');
        if(file.empty) {
            flash.message = "El archivo no puede estar vacio"
        } else {
            def idHecho = params.idHecho
            def hecho = Hecho.get(idHecho)
            if(hecho.getLef() != null){
                hecho.getLef().delete(flush: true);
            }
            Documento documentInstance = createDocumento(file)
            hecho.setLef(documentInstance);
            hecho.save(flush: true);
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
