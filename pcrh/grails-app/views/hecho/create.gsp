<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="Hecho" />
	<title>Nuevo Hecho</title>

</head>

<body>

<section id="create-hecho" class="first">

	<g:hasErrors bean="${hecho}">
	<div class="alert alert-danger">
		<g:renderErrors bean="${hecho}" as="list" />
	</div>
	</g:hasErrors>

    <g:render template="commonjs"/>
	<g:form name="form" action="save" class="form-horizontal"  enctype="multipart/form-data">
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
        <br>
		<div class="form-actions" align="center">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" onclick="submitForm();return false;" />
            <g:link controller="main" action="index" class="btn btn-danger">Cancelar</g:link>
		</div>
	</g:form>
    <!-- Render the evidencia template (_evidencia.gsp) hidden so we can clone it -->
        <g:render template='evidencia' model="['evidencia':null,'i':'_clone','hidden':true]"/>
<!-- Render the evidencia template (_evidencia.gsp) hidden so we can clone it -->

</section>
		
</body>

</html>
