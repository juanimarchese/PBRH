
<%@ page import="kickstart._DemoPage" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="Hecho" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
    <script>
        $( window ).load(function() {
            $('#show-hecho').find('input, textarea, button, select').attr('disabled','disabled');
            $('.form .btn').each(function(){
                $(this).hide()
            });
            $('.form .acciones').each(function(){
                $(this).hide()
            });
            $(".multiselect").removeClass("disabled");
            $(".multiselect").removeAttr("disabled");
            $(".multiselect-container input").each(function(){$(this).attr("disabled","disabled")})
        })

    </script>
</head>

<body>

<section id="show-hecho" class="first">

    <fieldset class="form">
            <g:render template="form"/>
    </fieldset>


</section>
<script>
    $( window ).load(function() {

        $(".multiselect").removeClass("disabled");
        $(".multiselect").addClass("customDisable");
        $(".multiselect").removeAttr("disabled");
        $(".multiselect-container input").each(function(){$(this).attr("disabled","disabled")})
    })

</script>
</body>

</html>
