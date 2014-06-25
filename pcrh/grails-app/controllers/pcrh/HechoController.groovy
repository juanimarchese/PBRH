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

        // find the phones that are marked for deletion
        def _toBeDeleted = hecho.resultado.evidencias.findAll {(it?.deleted || (it == null))}

        // if there are phones to be deleted remove them all
        if (_toBeDeleted) {
            hecho.resultado.evidencias.removeAll(_toBeDeleted)
        }

        if (!hecho.hasErrors() && hecho.save(flush: true)) {
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
    /*
      def edit() {
          def _DemoPageInstance = session.demopage
          _DemoPageInstance?.clearErrors()
          _DemoPageInstance?.validate()
          [_DemoPageInstance: _DemoPageInstance]
      }

      def update() {
          def _DemoPageInstance = session.demopage
          if (!_DemoPageInstance) {
              flash.message = message(code: 'default.not.found.message', args: [message(code: '_DemoPage.label', default: '_DemoPage'), params.id])
              redirect(action: "list")
              return
          }

          if (params.version) {
              def version = params.version.toLong()
              if (_DemoPageInstance.version > version) {
                  _DemoPageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: '_DemoPage.label', default: '_DemoPage')] as Object[],
                          "Another user has updated this _DemoPage while you were editing")
                  render(view: "edit", model: [_DemoPageInstance: _DemoPageInstance])
                  return
              }
          }

          _DemoPageInstance.properties = params

          session.demopage = _DemoPageInstance

          flash.message = message(code: 'default.updated.message', args: [message(code: '_DemoPage.label', default: '_DemoPage'), _DemoPageInstance.id])
          redirect(action: "show", id: _DemoPageInstance.id)
      }

      def delete() {
          session.demopage = null
          flash.message = message(code: 'default.deleted.message', args: [message(code: '_DemoPage.label', default: '_DemoPage'), params.id])
          redirect(action: "list")
      }*/
}
