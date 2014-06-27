<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="Hecho" />
    <title>Subir PU</title>
</head>

<body>

<section id="upload-pu-hecho" class="first">

   %{-- <g:hasErrors bean="${hecho}">
        <div class="alert alert-danger">
            <g:renderErrors bean="${hecho}" as="list" />
        </div>
    </g:hasErrors>--}%


    <g:render template="commonjs"/>
    <g:uploadForm action="uploadPUFile">
        <fieldset class="form" >
            <div align="center">
                <div>
                    <g:hiddenField name="idHecho" value="${hecho?.idHecho}" />
                    <input type="file" name="file" class="required" />
                </div>

            </div>
        </fieldset>
        <br>
        <div class="form-actions" align="center">
            <g:submitButton class="btn btn-primary" name="form" value="Subir" onclick="submitForm();return false;"/>
            <g:link controller="hecho" action="list" class="btn btn-danger">Cancelar</g:link>
        </div>
    </g:uploadForm>

</section>

</body>

</html>
