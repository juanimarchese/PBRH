<%@ page import="com.pcrh.Hecho" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="Salida"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <script>
        $(window).load(function () {
            $('.disabled').click(function () {
                return false;
            });
        });
    </script>
</head>

<body>

<section id="list-hecho" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <g:sortableColumn property="hecho.idHecho" title="Hecho"/>

            <g:sortableColumn property="evidencia" title="Evidencia"/>
            <g:sortableColumn property="fechaSalida" title="Fecha" width="35px"/>

            <g:sortableColumn property="destino" title="Destino"/>


            <th style="color: #428bca" width="30px">Constancia</th>
            <th style="color: #428bca" width="200px">Acciones</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${salidaList}" status="i" var="salidaVar">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            params="[id: salidaVar.id]">${fieldValue(bean: salidaVar, field: "hecho.idHecho")}</g:link></td>

                <td>${salidaVar.evidencia.toString()}</td>
                <td><g:formatDate format="dd/MM/yyyy" date="${salidaVar.fechaSalida}"/></td>

                <td>${fieldValue(bean: salidaVar, field: "destino")}</td>


                <td>
                     <div align="center">
                     <g:if test="${salidaVar?.archivoConstancia != null}">
                         <g:link action="download" id="${salidaVar?.archivoConstancia?.id}" title="Descargar Constancia Salida" role="button" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-download"></i></g:link>
                     </g:if><g:else>
                         -
                     </g:else>
                 </div>
                </td>

                <td>
                    <div align="center">
                        <span class="">
                            <g:link action="uploadConstancia" params="[id: salidaVar.id]"
                                    role="button" class="btn btn-primary btn-sm" title="Subir Constancia Salida">
                                <i class="glyphicon glyphicon-upload"></i> Constancia
                            </g:link>
                        </span>
                        <span class="">
                            <g:link action="edit" params="[id: salidaVar.id]"
                                    role="button" class="btn btn-success btn-sm" title="Editar">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </g:link>
                        </span>

                         <g:render template="/_common/modals/deleteSymbolLink"
                                   model="[id: salidaVar.id]"/>
                    </div>
                </td>

            </tr>
        </g:each>
        <g:if test="${salidaList.size() == 0}">
            <tr class="odd" style="text-align: center">

                <td colspan="8">
                    -- No hay salidas para mostrar --
                </td>

            </tr>
        </g:if>
        </tbody>
    </table>

    <div class="container" align="center">
        <bs:paginate total="${salidaTotal}" params="${params}"/>
    </div>
</section>

</body>

</html>
