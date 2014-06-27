<script type="text/javascript">
    $( window ).load(function () {
        var isOther = false;
        var createHiddens = function(){
            $('#'+'${id}'+'_div_hidden').html("");
            var values = $('#'+'${id}'+'_sel').val();
            if (values != null && values.length > 0){
                for (var i=0;i<values.length;i++){
                    $('#'+'${id}'+'_div_hidden').append("<input type='hidden' value='"+values[i]+"' name='"+"${name}"+"["+i+"]"+"' />")
                }
            }
        }

        function showOther() {
            $('#' + '${id}' + '_div_other').show();//else it is shown
            $('#' + '${id}' + '_txt').addClass("required");
            $('#' + '${id}' + '_div_ppal').removeClass("col-lg-12");
            $('#' + '${id}' + '_div_ppal').addClass("col-lg-5");
        }

        function hideOther() {
            $('#' + '${id}' + '_txt').removeClass("required");
            $('#' + '${id}' + '_div_other').hide(); //this field is hidden
            $('#' + '${id}' + '_div_ppal').removeClass("col-lg-5");
            $('#' + '${id}' + '_div_ppal').addClass("col-lg-12");
        }

        var onChange = function (element, checked) {
            if (element.val() == "OTRO" && checked) {
                showOther();
            } else if (element.val() == "OTRO" && !checked) {
                hideOther();
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
                    if(elements[i] == "OTRO") isOther = true;
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

        if (isOther) {
            showOther();
        } else {
            hideOther();
        }
        createHiddens();

    });
</script>

<div class="row">
    <div class="col-lg-5" id="${id}_div_ppal">
        <label class="control-label">${label}</label>

        <div>

          <g:select id="${id}_sel" class="form-control required" name="${id}_val"
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


