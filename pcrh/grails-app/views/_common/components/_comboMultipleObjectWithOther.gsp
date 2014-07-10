<script type="text/javascript">
    $( window ).load(function () {
        var createHiddens = function(){
            $('#'+'${id}'+'_div_hidden').html("");
            var values = $('#'+'${id}'+'_sel').val();
            if (values != null && values.length > 0){
                for (var i=0;i<values.length;i++){
                    $('#'+'${id}'+'_div_hidden').append("<input type='hidden' value='"+values[i]+"' name='"+"${name}"+"["+i+"]"+".id' />")
                }
            }
        }

        var onChange = function (element, checked) {
            if (element.val() == "OTRO" && checked) {
                $('#' + '${id}' + '_div_other').show();//else it is shown
                $('#' + '${id}' + '_txt').addClass("required");
                $('#' + '${id}' + '_div_ppal').removeClass("col-sm-12");
                $('#' + '${id}' + '_div_ppal').addClass("col-sm-5");

            } else if (element.val() == "OTRO" && !checked) {
                $('#' + '${id}' + '_txt').removeClass("required");
                $('#' + '${id}' + '_div_other').hide(); //this field is hidden
                $('#' + '${id}' + '_div_ppal').removeClass("col-sm-5");
                $('#' + '${id}' + '_div_ppal').addClass("col-sm-12");
            }
            createHiddens();
        };

        var setValues = function() {
            var valuesToSet = '${value}';
            valuesToSet = valuesToSet.replace('[','');
            valuesToSet = valuesToSet.replace(']','');
            var elements = valuesToSet.split(", ");
            for (var i = 0; i < elements.length; i++) {
                if (elements[i] != undefined && elements[i] != "") {
                    $('#' + '${id}' + '_sel').multiselect('select', elements[i]);
                }
            }
        }

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

        setValues();
        $('#'+'${id}'+'_txt').removeClass("required");
        $('#'+'${id}'+'_div_other').hide(); //hide field on start
        $('#'+'${id}'+'_div_ppal').removeClass("col-sm-5");
        $('#'+'${id}'+'_div_ppal').addClass("col-sm-12");
        createHiddens();
    });
</script>

<div class="row">
    <div class="col-sm-5" id="${id}_div_ppal">
        <label class="control-label">${label}</label>

        <div>

          <g:select id="${id}_sel" class="form-control required" name="${id}_val"
                      from="${from}"
                      keys="${keys}"
                      multiple="multiple"/>
        </div>
    </div>

    <div id="${id}_div_other" class="col-sm-7">
        <label class="control-label">Descripción</label>

        <div>
            <g:textField id="${id}_txt" class="form-control" name="${nameOther}" value="${otherValue}"/>
        </div>
    </div>

    <div id="${id}_div_hidden">

    </div>
</div>


