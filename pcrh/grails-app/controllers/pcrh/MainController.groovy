package pcrh

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class MainController {

    def index() {
        redirect( controller: 'home', action: 'index', view: 'index')
    }
}
