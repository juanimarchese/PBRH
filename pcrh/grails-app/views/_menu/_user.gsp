<%--<ul class="nav pull-right">--%>
	<li class="dropdown">
	
<sec:ifNotLoggedIn>

		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			<i class="glyphicon glyphicon-user"></i>
    		Ingresar<b class="caret"></b>
		</a>

		<ul class="dropdown-menu" role="menu">
			<li class="form-container">
				<form action="${postUrl}" method="post" accept-charset="UTF-8">
                    <input class="form-control" style="margin-bottom: 15px;" type="text"		placeholder="Username" id="username" name="j_username">
					<input class="form-control" style="margin-bottom: 15px;" type="password"	placeholder="Password" id="password" name="j_password">
					<input style="float: left; margin-right: 10px;" type="checkbox" name="${rememberMeParameter}" value="${hasCookie}" id="remember-me" >
					<label class="string optional" for="user_remember_me"> Remember me</label>
					<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Sign In">
				</form>
			</li>

		</ul>

</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
	<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
			<!-- TODO: Only show menu items based on permissions (e.g., Guest has no account page) -->
		<i class="glyphicon glyphicon-user icon-white"></i>
        <sec:loggedInUserInfo field="username"/><b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu">
			<!-- TODO: Only show menu items based on permissions -->
			<li class=""><a>
				<i class="glyphicon glyphicon-user"></i>
				Perfil
			</a></li>
			<li class=""><a href="${createLink(uri: '/')}">
				<i class="glyphicon glyphicon-cogs"></i>
				Configuración
			</a></li>
            <li class="divider"></li>
			<li class=""><a href="${createLink(uri: '/logout')}">
				<i class="glyphicon glyphicon-off"></i>
				Salir
			</a></li>
		</ul>
</sec:ifLoggedIn>

	</li>
%{--</ul>--}%

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="show"><g:message code="default.user.unknown.label"/></g:link>
	</li>
</ul>
</noscript>
