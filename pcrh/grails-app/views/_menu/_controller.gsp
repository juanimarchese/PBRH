<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_USER">
<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu<b class="caret"></b></a>
	<ul class="dropdown-menu">
			<li class="controller">
				<g:link controller="main" action="index">
						<i class="glyphicon glyphicon-home"></i> Inicio
				</g:link>
			</li>
            <li class="controller">
                <g:link controller="main" action="index">
                    <i class="glyphicon glyphicon-plus-sign"></i> Nuevo Hecho
                </g:link>
            </li>
            <li class="controller">
                <g:link controller="main" action="index">
                    <i class="glyphicon glyphicon-search"></i> Consultar Hechos
                </g:link>
            </li>
            <sec:ifAllGranted roles="ROLE_JEFE">
                <li class="controller">
                    <g:link controller="main" action="index">
                        <i class="glyphicon glyphicon-plus-sign"></i> Nueva Salida
                    </g:link>
                </li>
                <li class="controller">
                    <g:link controller="main" action="index">
                        <i class="glyphicon glyphicon-search"></i> Consultar Salidas
                    </g:link>
                </li>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <li class="controller">
                    <g:link controller="main" action="index">
                        <i class="glyphicon glyphicon-stats"></i> Ver Estadisticas
                    </g:link>
                </li>
            </sec:ifAllGranted>
    </ul>
</li>
</sec:ifAnyGranted>
