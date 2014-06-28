
<%@ page import="com.pcrh.Hecho" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="Salidas" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script>
        $( window ).load(function() {
            $('.disabled').click(function () {return false;});
        });
    </script>
</head>

<body>

<section id="list-hecho" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <g:sortableColumn property="hecho.idHecho" title="Hecho" />

            <g:sortableColumn property="evidencia" title="Evidencia" />
            <g:sortableColumn property="fechaSalida" title="Fecha" />

            <g:sortableColumn property="destino" title="Destino" />


            <th style="color: #428bca">Constrancia</th>
            <th style="color: #428bca">Acciones</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${salidaList}" status="i" var="salidaVar">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" params="[id: salidaVar.id]">${fieldValue(bean: salidaVar, field: "hecho.idHecho")}</g:link></td>

                <td>${salidaVar.evidencia.toString()}</td>
                <td><g:formatDate format="dd/MM/yyyy" date="${salidaVar.fechaSalida}"/></td>

                <td>${fieldValue(bean: salidaVar, field: "destino")}</td>


                <td>
                   %{-- <div align="center">
                    <g:if test="${hechoVar?.pu != null}">
                        <g:link action="download" id="${hechoVar?.pu?.id}" title="Descargar PU" role="button" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-download"></i></g:link>
                    </g:if><g:else>
                        -
                    </g:else>
                </div>--}%
                </td>

                <td>

                </td>%{-- <div align="center">
                        <span class="">
                            <g:link action="uploadPU" params="[id: hechoVar.idHechoNumero , anio: hechoVar.idHechoAnio]" role="button" class="btn btn-primary btn-sm" title="Subir PU">
                                <i class="glyphicon glyphicon-upload"></i> PU
                            </g:link>
                        </span>
                        <span class="">
                            <g:link action="uploadLEF" params="[id: hechoVar.idHechoNumero , anio: hechoVar.idHechoAnio]" role="button" class="btn btn-primary btn-sm" title="Subir LEF">
                                <i class="glyphicon glyphicon-upload"></i> LEF
                            </g:link>
                        </span>
                    <span class="">
                        <g:link action="edit" params="[id: hechoVar.idHechoNumero , anio: hechoVar.idHechoAnio]" role="button" class="btn btn-success btn-sm" title="Editar">
                            <i class="glyphicon glyphicon-pencil"></i>
                        </g:link>
                    </span>

                    <g:render template="/_common/modals/deleteSymbolLink" model="[id: hechoVar.idHechoNumero , anio: hechoVar.idHechoAnio]"/>
                    </div>
--}%

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
        <bs:paginate total="${salidaTotal}"  params="${params}" />
    </div>
</section>

</body>

</html>
