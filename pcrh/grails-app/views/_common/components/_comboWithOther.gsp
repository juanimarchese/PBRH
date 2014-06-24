<script type="text/javascript">
    $(document).ready(function () {
        $('#'+'${label}'+'_txt').removeClass("required");
        $('#'+'${label}'+'_div_other').hide(); //hide field on start
        $('#'+'${label}'+'_div_ppal').removeClass("col-lg-5");
        $('#'+'${label}'+'_div_ppal').addClass("col-lg-12");

        $('#'+'${label}'+'_sel').change(function () {

            var $index = $('#'+'${label}'+'_sel').index(this);

            if ($('#'+'${label}'+'_sel').val() != 'OTRO') { //if this value is NOT selected
                $('#'+'${label}'+'_txt').removeClass("required");
                $('#'+'${label}'+'_div_other').hide(); //this field is hidden
                $('#'+'${label}'+'_div_ppal').removeClass("col-lg-5");
                $('#'+'${label}'+'_div_ppal').addClass("col-lg-12");
            }
            else {
                $('#'+'${label}'+'_div_other').show();//else it is shown
                $('#'+'${label}'+'_txt').addClass("required");
                $('#'+'${label}'+'_div_ppal').removeClass("col-lg-12");
                $('#'+'${label}'+'_div_ppal').addClass("col-lg-5");
            }
        });
    });
</script>

<div class="row">
    <div class="col-lg-5" id="${label}_div_ppal">
        <label class="control-label">${label}</label>

        <div>
            <g:select id="${label}_sel" class="form-control required" name="${name}" noSelection="['': 'Seleccionar']"
                      from="${from}"
                      keys="${keys}"
                      value="${value}"/>
        </div>
    </div>

    <div id="${label}_div_other" class="col-lg-7">
        <label class="control-label">Descripcion</label>

        <div>
            <g:textField id="${label}_txt" class="form-control" name="${nameOther}" value="${otherValue}"/>
        </div>
    </div>

</div>
