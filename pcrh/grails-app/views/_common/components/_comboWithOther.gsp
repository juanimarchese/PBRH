<script type="text/javascript">
    $(document).ready(function () {
        $('#'+'${id}'+'_txt').removeClass("required");
        $('#'+'${id}'+'_div_other').hide(); //hide field on start
        $('#'+'${id}'+'_div_ppal').removeClass("col-lg-5");
        $('#'+'${id}'+'_div_ppal').addClass("col-lg-12");

        $('#'+'${id}'+'_sel').change(function () {

            var $index = $('#'+'${id}'+'_sel').index(this);

            if ($('#'+'${id}'+'_sel').val() != 'OTRO') { //if this value is NOT selected
                $('#'+'${id}'+'_txt').removeClass("required");
                $('#'+'${id}'+'_div_other').hide(); //this field is hidden
                $('#'+'${id}'+'_div_ppal').removeClass("col-lg-5");
                $('#'+'${id}'+'_div_ppal').addClass("col-lg-12");
            }
            else {
                $('#'+'${id}'+'_div_other').show();//else it is shown
                $('#'+'${id}'+'_txt').addClass("required");
                $('#'+'${id}'+'_div_ppal').removeClass("col-lg-12");
                $('#'+'${id}'+'_div_ppal').addClass("col-lg-5");
            }
        });
    });
</script>

<div class="row">
    <div class="col-lg-5" id="${id}_div_ppal">
        <label class="control-label">${label}</label>

        <div>
            <g:select id="${id}_sel" class="form-control required" name="${name}" noSelection="['': 'Seleccionar']"
                      from="${from}"
                      keys="${keys}"
                      value="${value}"/>
        </div>
    </div>

    <div id="${id}_div_other" class="col-lg-7">
        <label class="control-label">Descripcion</label>

        <div>
            <g:textField id="${id}_txt" class="form-control" name="${nameOther}" value="${otherValue}"/>
        </div>
    </div>

</div>
