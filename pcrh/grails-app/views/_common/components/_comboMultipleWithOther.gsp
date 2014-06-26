<script type="text/javascript">
    $( window ).load(function () {
        var onChange = function (element, checked) {
            if (checked) {
                /*Todo Agregar HIDDENS que viajen para agregar a la lista*/
            }
            if (element.val() == "OTRO" && checked) {
                $('#' + '${id}' + '_div_other').show();//else it is shown
                $('#' + '${id}' + '_txt').addClass("required");
                $('#' + '${id}' + '_div_ppal').removeClass("col-lg-12");
                $('#' + '${id}' + '_div_ppal').addClass("col-lg-5");

            } else if (element.val() == "OTRO" && !checked) {
                $('#' + '${id}' + '_txt').removeClass("required");
                $('#' + '${id}' + '_div_other').hide(); //this field is hidden
                $('#' + '${id}' + '_div_ppal').removeClass("col-lg-5");
                $('#' + '${id}' + '_div_ppal').addClass("col-lg-12");
            }
        };

        var optionFour = {
            numberDisplayed: 4,
            nonSelectedText: 'Seleccionar',
            nSelectedText: '${labelSeleccion}',
            onChange: onChange
        };

        var optionOne = {
            numberDisplayed: 1,
            nonSelectedText: 'Seleccionar',
            nSelectedText: '${labelSeleccion}',
            onChange: onChange
        };
        $('#'+'${id}'+'_sel').multiselect(optionOne);
        var valuesToSet = '${value}';
        var elements = valuesToSet.split(",");
        for (var i= 0; i< elements.length ;i++){
            if (elements[i] != undefined && elements[i] != ""){

                $('#'+'${id}'+'_sel').multiselect('select', elements[i]);
            }
        }

        var createHiddens = function(){

        }

        $('#'+'${id}'+'_txt').removeClass("required");
        $('#'+'${id}'+'_div_other').hide(); //hide field on start
        $('#'+'${id}'+'_div_ppal').removeClass("col-lg-5");
        $('#'+'${id}'+'_div_ppal').addClass("col-lg-12");


    });
</script>

<div class="row">
    <div class="col-lg-5" id="${id}_div_ppal">
        <label class="control-label">${label}</label>

        <div>

          <g:select id="${id}_sel" class="form-control required" name="${name}"
                      from="${from}"
                      keys="${keys}"
                      multiple="multiple"/>
        </div>
    </div>

    <div id="${id}_div_other" class="col-lg-7">
        <label class="control-label">Descripcion</label>

        <div>
            <g:textField id="${id}_txt" class="form-control" name="${nameOther}" value="${otherValue}"/>
        </div>
    </div>

    <div id="${id}_div_hidden">

    </div>
</div>


