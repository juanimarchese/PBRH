<%@ page import="kickstart._DemoPage" %>
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

    <script type="text/javascript">
        $(function (){
                $.validator.addMethod(
                        "hora",
                        function(value, element, regexp) {
                            var re = new RegExp(regexp);
                            return this.optional(element) || re.test(value);
                        },
                        "El formato debe ser HH:mm (HH: [00-23],mm: [00-59])  Ej: 12:15, 05:05"
                );

                $.validator.addMethod(
                        "idHecho",
                        function(value, element, regexp) {
                            var re = new RegExp(regexp);
                            return this.optional(element) || re.test(value);
                        },
                        "El formato debe ser Numero/Año, Ej: 1/2014"
                );

                $("#form").validate();
                $(".required").each(function (item) {
                    $(this).rules("add", {
                        required: true
                    });
                });
                $("#idHecho").rules("add", {
                    idHecho: "^[0-9]+\/[0-9]{4}$"
                });

                $(".hora").each(function (item) {
                    $(this).rules("add", {
                        hora: "^([0-1][0-9]|2[0-3]):[0-5][0-9]$"
                    });
                });

                $(".datepicker").each(function (item) {
                    $(this).attr('readonly','readonly');
                    $(this).addClass("readOnlyDP");
                });


        });
    </script>
	<g:form name="form" action="save" class="form-horizontal"  enctype="multipart/form-data">
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
        <br>
		<div class="form-actions" align="center">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Limpiar</button>
		</div>
	</g:form>
    <!-- Render the evidencia template (_evidencia.gsp) hidden so we can clone it -->
        <g:render template='evidencia' model="['evidencia':null,'i':'_clone','hidden':true]"/>
    <!-- Render the evidencia template (_evidencia.gsp) hidden so we can clone it -->

</section>
		
</body>

</html>
