
<%@ page import="com.pcrh.Hecho" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="Hecho" />
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

            <g:sortableColumn property="idHecho" title="Numero" />

            <g:sortableColumn property="fechaHecho" title="Fecha" />
            <g:sortableColumn property="caratula" title="Caratula" />

            <g:sortableColumn property="comisariaInterviniente" title="Comisaria" />

            <g:sortableColumn property="lugarHecho" title="Lugar" />

            <g:sortableColumn property="magistradoInterviniente" title="Magistrado" />

            <th style="color: #428bca">PU</th>
            <th style="color: #428bca">LEF</th>
            <th style="color: #428bca">Acciones</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${hechoList}" status="i" var="hechoVar">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" params="[id: hechoVar.idHechoNumero , anio: hechoVar.idHechoAnio]">${fieldValue(bean: hechoVar, field: "idHecho")}</g:link></td>

                <td><g:formatDate format="dd/MM/yyyy" date="${hechoVar.fechaHecho}"/>${fieldValue(bean: hechoVar, field: "fechaHecho")}</td>

                <td>${fieldValue(bean: hechoVar, field: "caratula")}</td>
                <td>${fieldValue(bean: hechoVar, field: "comisariaInterviniente")}</td>
                <td>${fieldValue(bean: hechoVar, field: "lugarHecho")}</td>
                <td>${fieldValue(bean: hechoVar, field: "magistradoInterviniente")}</td>

                <td>
                    <div align="center">
                    <g:if test="${hechoVar?.pu != null}">
                        <g:link action="download" id="${hechoVar?.pu?.id}" title="Descargar PU" role="button" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-download"></i></g:link>
                    </g:if><g:else>
                        -
                    </g:else>
                </div>
                </td>
                <td>
                    <div align="center">
                    <g:if test="${hechoVar?.lef != null}">
                        <g:link action="download" id="${hechoVar?.lef?.id}" title="Descargar LEF" role="button" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-download"></i></g:link>
                    </g:if><g:else>
                        -
                    </g:else>
                </div>
                </td>

                <td>
                    <div align="center">
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

                </td>

            </tr>
        </g:each>
        <g:if test="${hechoList.size() == 0}">
            <tr class="odd" style="text-align: center">

                <td colspan="8">
                    -- No hay hechos para mostrar --
                </td>

            </tr>
        </g:if>
        </tbody>
    </table>
    <div class="container" align="center">
        <bs:paginate total="${hechoTotal}"  params="${params}" />
    </div>
</section>

</body>

</html>
