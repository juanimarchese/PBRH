package pcrh

import com.pcrh.Evidencia
import com.pcrh.Hecho
import com.pcrh.ResultadoHecho
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
        def hecho = new Hecho(params)
        [hecho: hecho]
    }

    def save() {
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
          def hecho = Hecho.get(params.id + '/' + params.anio)
          if (!hecho) {
              flash.message = message(code: 'default.not.found.message', args: [message(code: '_DemoPage.label', default: 'Hecho'), params.id])
              redirect(action: "list")
              return
          }
          [hecho: hecho]
      }

      def edit() {
          def idHecho = params.id + "/" + params.anio
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
            hecho.resultado.evidencias.removeAll(_toBeDeleted)
        }
    }
    /*
      def delete() {
          session.demopage = null
          flash.message = message(code: 'default.deleted.message', args: [message(code: '_DemoPage.label', default: '_DemoPage'), params.id])
          redirect(action: "list")
      }*/
}
