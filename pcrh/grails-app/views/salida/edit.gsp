<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="Salida" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-salida" class="first">

	<g:hasErrors bean="${salida}">
	<div class="alert alert-danger">
		<g:renderErrors bean="${salida}" as="list" />
	</div>
	</g:hasErrors>

    <g:render template="commonjs"/>
    <g:form name="form" action="update" class="form-horizontal"  enctype="multipart/form-data">
        <g:hiddenField name="id" value="${salida?.id}" />
		<g:hiddenField name="version" value="${salida?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
        <br>
		<div class="form-actions" align="center">
			<g:submitButton class="btn btn-primary" name="update" value="${message(code: 'default.button.update.label', default: 'Update')}" onclick="submitForm();return false;"/>
            <g:link controller="salida" action="list" class="btn btn-danger">Cancelar</g:link>
        </div>
	</g:form>


</section>
			
</body>

</html>
