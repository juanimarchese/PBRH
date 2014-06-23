package pcrh

import com.pcrh.Hecho
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
        [hecho: new Hecho(params)]
    }

    def save() {
        def _DemoPageInstance = new Hecho(params)
        _DemoPageInstance.clearErrors()
        _DemoPageInstance.validate()
        // store demopage in session (instead of in the database)
        session.demopage = _DemoPageInstance
        flash.message = message(code: 'default.created.message', args: [message(code: '_DemoPage.label', default: '_DemoPage'), _DemoPageInstance.id])
        redirect(action: "show", dp: _DemoPageInstance)
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
