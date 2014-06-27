<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="Hecho" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-hecho" class="first">

	<g:hasErrors bean="${hecho}">
	<div class="alert alert-danger">
		<g:renderErrors bean="${hecho}" as="list" />
	</div>
	</g:hasErrors>

    <g:render template="commonjs"/>
    <script type="application/javascript">
       $(window).load(function(){
           $("#idHecho").attr("readonly","readonly");
       })

    </script>
	<g:form name="form" action="update" class="form-horizontal"  enctype="multipart/form-data">
		<g:hiddenField name="version" value="${hecho?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
        <br>
		<div class="form-actions" align="center">
			<g:submitButton class="btn btn-primary" name="update" value="${message(code: 'default.button.update.label', default: 'Update')}" onclick="submitForm();return false;"/>
            <g:link controller="hecho" action="list" class="btn btn-danger">Cancelar</g:link>
        </div>
	</g:form>
    <!-- Render the evidencia template (_evidencia.gsp) hidden so we can clone it -->
        <g:render template='evidencia' model="['evidencia':null,'i':'_clone','hidden':true]"/>
    <!-- Render the evidencia template (_evidencia.gsp) hidden so we can clone it -->

</section>
			
</body>

</html>
