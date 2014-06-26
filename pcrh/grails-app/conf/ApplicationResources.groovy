modules = {
    application {
        resource url:'js/application.js'
    }

    'jquery_last' {
        resource url: 'js/jquery-2.1.1.min.js' , disposition: 'head'
    }

    'jquery_validate_last' {
        dependsOn 'jquery_last'
        resource url: 'js/jquery.validate.min.js'
        resource url: 'js/additional-methods.min.js'
        resource url: 'js/messages_es.js'
    }


    'bootstrap_last' {
        dependsOn 'jquery_last'
        resource url: 'js/bootstrap.js'
        resource url: 'css/bootstrap.css'
        resource url: 'js/bootstrap-datepicker.js'
        resource url: 'css/datepicker.css'
        resource url: 'js/bootstrap-multiselect.js'
        resource url: 'css/bootstrap-multiselect.css'
    }

    'kickstart_utils' {
        dependsOn 'bootstrap_last'
        resource url: [dir: 'kickstart/js',				file: 'kickstart.js']
        resource url: [dir: 'kickstart/js',				file: 'checkboxes.js']
        resource url: [dir: 'kickstart/css',			file: 'docs.css']
        resource url: [dir: 'kickstart/css',			file: 'kickstart.css']
    }


}