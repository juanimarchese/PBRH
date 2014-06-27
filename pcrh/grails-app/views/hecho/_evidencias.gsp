<script type="text/javascript">
    var childCount = ${resultadoInstance?.evidencias?.size()} + 0;

    var cantFilas = childCount;
    $( window ).load(function () {
        if(childCount == 0) $("#headerChildList").hide();
        else $("#noneChildList").hide();
    })


    function addEvidencia(){
        var htmlId = 'resultado.evidencias['+childCount+'].';

        var clone = $("#evidencia_clone").clone()

        var hiddenId = clone.find("input[id$=id]");
        hiddenId.attr('id',htmlId + 'id').attr('name',htmlId + 'id');

        if (hiddenId.attr('value') === null || hiddenId.attr('value') == ""){
            hiddenId.remove();
        }

        clone.find("input[id$=deleted]")
                .attr('id',htmlId + 'deleted')
                .attr('name',htmlId + 'deleted');

        clone.find("input[id$=newInstance]")
                .attr('id',htmlId + 'newInstance')
                .attr('name',htmlId + 'newInstance')
                .attr('value', 'true');

        var sectorInput = clone.find("input[id$=sector]");
        sectorInput.attr('id',htmlId + 'sector')
                .attr('name',htmlId + 'sector');


        var numeroInput = clone.find("input[id$=numero]");
        numeroInput.attr('id',htmlId + 'numero')
                .attr('name',htmlId + 'numero');

        var tipoSelect = clone.find("select[id$=tipo]");
        tipoSelect.attr('id',htmlId + 'tipo')
                .attr('name',htmlId + 'tipo');

        var cantInput = clone.find("input[id$=cantidad]");
        cantInput.attr('id',htmlId + 'cantidad')
                .attr('name',htmlId + 'cantidad');


        var evidenciaInput = clone.find("input[id$=observaciones]");
        evidenciaInput.attr('id',htmlId + 'observaciones')
                .attr('name',htmlId + 'observaciones');

        clone.attr('id', 'evidencia'+childCount);

        $("#childList").append(clone);

        /*$("#form").validate();
        sectorInput.rules("add", { required:true,caracter: "^[A-Z]$"  });
        numeroInput.rules("add", {required:true,numero: "^[0-9]+$"});
        cantInput.rules("add", {required:true,numero: "^[0-9]+$"});*/

        clone.show();
        sectorInput.focus();
        childCount++;
        cantFilas++;
        //$("#cantEvidencias").attr('value', cantFilas);
        if(cantFilas> 0) {
            $("#noneChildList").hide();
            $("#headerChildList").show();
        }
    }

    $(document).on('click', '.del-evidencia', function() {
        //find the parent div
        var prnt = $(this).parents(".evidencia-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=newInstance]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }
        cantFilas--;
        //$("#cantEvidencias").attr('value', cantFilas);
        if(cantFilas == 0) {
            $("#headerChildList").hide();
            $("#noneChildList").show();
        }
    });


</script>

<div class="row">
    <div class="col-lg-12">
        <h3>Carga de Evidencias
            <a class="btn btn-success btn-sm" onclick="addEvidencia();return false;" title="Agregar Evidencia">
                <i class="glyphicon glyphicon-plus-sign"></i>
            </a>
        </h3>
    </div>
</div>
<hr style="border-top: 2px solid #eeeeee;margin-top: 1px;margin-bottom: 18px;">


<div id="childList" style="padding-bottom: 10px">
    <div id="noneChildList" class="row" style="margin-top: -15px">
        <div class="col-lg-12" style="text-align: center;">
            <h5>-- No hay ninguna evidencia para mostrar --</h5>
        </div>
    </div>
    <div id="headerChildList" class="row" >
        <div class="col-lg-1">
            <label class="control-label">Sector</label>
        </div>
        <div class="col-lg-1">
            <label class="control-label">Numero</label>
        </div>
        <div class="col-lg-2">
            <label class="control-label">Tipo</label>
        </div>
        <div class="col-lg-1">
            <label class="control-label">Cantidad</label>
        </div>
        <div class="col-lg-6">
            <label class="control-label">Observaciones</label>
        </div>
        <div class="col-lg-1 pull-right acciones">
            <label class="control-label">Acciones</label>
        </div>


    </div>
    <g:each var="evidencia" in="${resultadoInstance?.evidencias}" status="i">
        <!-- Render the evidencia template (_evidencia.gsp) here -->
       %{-- <g:hiddenField id="cantEvidencias" name='cantEvidencias' value='${resultadoInstance?.evidencias?.size() ?: 0}'/>--}%
        <g:render template='evidencia' model="['evidencia':evidencia,'i':i,'hidden':false]"/>
        <!-- Render the evidencia template (_evidencia.gsp) here -->
    </g:each>
</div>

<hr style="border-top: 2px solid #eeeeee;margin-top: 1px">
