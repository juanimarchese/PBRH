<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="Salida" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
    <script>
        $( window ).load(function() {
            $('#show-salida').find('input, textarea, button, select').attr('disabled','disabled');
            $('.form .btn').each(function(){
                $(this).hide()
            });
            $('.form .acciones').each(function(){
                $(this).hide()
            });
        })

    </script>
</head>

<body>

<section id="show-salida" class="first">

    <fieldset class="form">
            <g:render template="form"/>
    </fieldset>


</section>
</body>

</html>
