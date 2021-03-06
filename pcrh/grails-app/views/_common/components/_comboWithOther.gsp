<script type="text/javascript">
    $( window ).load(function () {
        function showOther() {
            $('#' + '${id}' + '_div_other').show();//else it is shown
            $('#' + '${id}' + '_txt').addClass("required");
            $('#' + '${id}' + '_div_ppal').removeClass("col-sm-12");
            $('#' + '${id}' + '_div_ppal').addClass("col-sm-5");
        }
        function hideOther() {
            $('#' + '${id}' + '_txt').removeClass("required");
            $('#' + '${id}' + '_div_other').hide(); //hide field on start
            $('#' + '${id}' + '_div_ppal').removeClass("col-sm-5");
            $('#' + '${id}' + '_div_ppal').addClass("col-sm-12");
        }

        function checkOther() {
            if ($('#' + '${id}' + '_sel').val() != 'OTRO') { //if this value is NOT selected
                hideOther()
            }
            else {
                showOther();
            }
        }

        $('#'+'${id}'+'_sel').change(function () {
             checkOther();
        });

        checkOther();
    });
</script>

<div class="row">
    <div class="col-sm-5" id="${id}_div_ppal">
        <label class="control-label">${label}</label>

        <div>
            <g:select id="${id}_sel" class="form-control required" name="${name}" noSelection="['': 'Ninguna']"
                      from="${from}"
                      keys="${keys}"
                      value="${value}" />
        </div>
    </div>

    <div id="${id}_div_other" class="col-sm-7">
        <label class="control-label">Descripción</label>

        <div>
            <g:textField id="${id}_txt" class="form-control" name="${nameOther}" value="${otherValue}"/>
        </div>
    </div>

</div>
