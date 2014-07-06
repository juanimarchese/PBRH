<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_USER,ROLE_JEFE">
    <ul class="nav navbar-nav">
        <li class="controller">
            <g:link controller="main" action="index">
                <i class="glyphicon glyphicon-home"></i> Inicio
            </g:link>
        </li>
    </ul>
    <ul class="nav navbar-nav">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Hechos<b class="caret"></b></a>
            <ul class="dropdown-menu">

                <li class="controller">
                    <g:link controller="hecho" action="create">
                        <i class="glyphicon glyphicon-plus-sign"></i> Nuevo Hecho
                    </g:link>
                </li>
                <li class="controller">
                    <g:link controller="hecho" action="index">
                        <i class="glyphicon glyphicon-search"></i> Consultar Hechos
                    </g:link>
                </li>

            </ul>
        </li>
    </ul>
    <sec:ifAnyGranted roles="ROLE_JEFE,ROLE_ADMIN">
    <ul class="nav navbar-nav">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Salidas<b class="caret"></b></a>
            <ul class="dropdown-menu">


                    <li class="controller">
                        <g:link controller="salida" action="create">
                            <i class="glyphicon glyphicon-plus-sign"></i> Nueva Salida
                        </g:link>
                    </li>
                    <li class="controller">
                        <g:link controller="salida" action="index">
                            <i class="glyphicon glyphicon-search"></i> Consultar Salidas
                        </g:link>
                    </li>


            </ul>
        </li>
    </ul>
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_JEFE,ROLE_ADMIN">
    <ul class="nav navbar-nav">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Estadisticas<b class="caret"></b></a>
            <ul class="dropdown-menu">

                    <li class="controller">
                        <g:link controller="main" action="index">
                            <i class="glyphicon glyphicon-stats"></i> Ver Estadisticas
                        </g:link>
                    </li>

            </ul>
        </li>
    </ul>
    </sec:ifAnyGranted>
</sec:ifAnyGranted>

