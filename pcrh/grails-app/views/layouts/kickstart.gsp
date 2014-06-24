<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>

    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'favicon.ico')}" sizes="72x72">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'favicon.ico')}" sizes="114x114">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'validate.css')}" type="text/css">

    <%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
    <r:require modules="jquery"/> <%-- jQuery is required for Bootstrap! --%>
    <r:require modules="jquery-validate"/> <%-- jQuery is required for Bootstrap! --%>
    <r:require modules="bootstrap"/>
    <r:require modules="bootstrap_utils"/>

    <r:layoutResources/>
    <g:layoutHead/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
		<script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

    <%-- For Javascript see end of body --%>
</head>

<body>
<g:render template="/_menu/navbar"/>

<!-- Enable to overwrite Header by individual page -->
<g:if test="${pageProperty(name: 'page.header')}">
    <g:pageProperty name="page.header"/>
</g:if>
<g:else>
    <g:render template="/layouts/header"/>
</g:else>

<g:render template="/layouts/content"/>

<!-- Enable to overwrite Footer by individual page -->
<g:if test="${pageProperty(name: 'page.footer')}">
    <g:pageProperty name="page.footer"/>
</g:if>
<g:else>
    <g:render template="/layouts/footer"/>
</g:else>

<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
<g:if test="${pageProperty(name: 'page.include.bottom')}">
    <g:pageProperty name="page.include.bottom"/>
</g:if>
<g:else>
    <!-- Insert a modal dialog for registering (for an open site registering is possible on any page) -->
    <g:render template="/_common/modals/registerDialog" model="[item: item]"/>
</g:else>

<!-- Included Javascript files and other resources -->
<r:layoutResources/>


<script>

    $(document).ready(function() {
        jQuery.extend(jQuery.validator.messages, {
            required: "Este campo es obligatorio.",
            remote: "Por favor, rellena este campo.",
            email: "Por favor, escribe una dirección de correo válida",
            url: "Por favor, escribe una URL válida.",
            date: "Por favor, escribe una fecha válida.",
            dateISO: "Por favor, escribe una fecha (ISO) válida.",
            number: "Por favor, escribe un número entero válido.",
            digits: "Por favor, escribe sólo dígitos.",
            creditcard: "Por favor, escribe un número de tarjeta válido.",
            equalTo: "Por favor, escribe el mismo valor de nuevo.",
            accept: "Por favor, escribe un valor con una extensión aceptada.",
            maxlength: jQuery.validator.format("Por favor, no escribas más de {0} caracteres."),
            minlength: jQuery.validator.format("Por favor, no escribas menos de {0} caracteres."),
            rangelength: jQuery.validator.format("Por favor, escribe un valor entre {0} y {1} caracteres."),
            range: jQuery.validator.format("Por favor, escribe un valor entre {0} y {1}."),
            max: jQuery.validator.format("Por favor, escribe un valor menor o igual a {0}."),
            min: jQuery.validator.format("Por favor, escribe un valor mayor o igual a {0}.")
        });
    });
</script>
</body>

</html>