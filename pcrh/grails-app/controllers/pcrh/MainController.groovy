package pcrh

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN','ROLE_USER','ROLE_JEFE'])
class MainController {

    def index() {
        redirect( controller: 'home', action: 'index', view: 'index')
    }
}
