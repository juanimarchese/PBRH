<nav id="Navbar" class="navbar navbar-fixed-top navbar-inverse" role="navigation">

    <div style="background-image:url('${resource(dir: "images", file: "background.jpg")}');height: 100px">
        <div align="center">
            <g:img dir="images" file="logoseguridad.png"  height="100px"/>
        </div>
    </div>

    <div class="container">
	
	    <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
			</button>
	
			<a class="navbar-brand" href="${createLink(uri: '/')}">
				Registro de Hechos
				<small> v${meta(name:'app.version')}</small>
			</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">

		<ul class="nav navbar-nav">
			<g:render template="/_menu/controller"/>
		</ul>

    	<ul class="nav navbar-nav navbar-right">
 			<g:render template="/_menu/admin"/>
			<g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
		</ul>

		</div>
	</div>
</nav>
