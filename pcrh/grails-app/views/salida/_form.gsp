<%@ page import="com.pcrh.Evidencia; com.pcrh.Persona; com.pcrh.Hecho" %>
<script type="application/javascript">

    $(window).load(function () {
        $("#evidencia").hide();

        $("#hechoDropDown").change(function () {
            if(this.value != undefined && this.value != ""){
            $.ajax({

                url: "/pcrh/salida/evidencias",

                data: "idHecho=" + this.value,

                cache: false,

                success: function (html) {
                    $("#evidencia").show()
                    $("#evidenciaDropDown").html(html);

                }

            });
            } else {
                $("#evidencia").hide()
            }
        });

        var idHecho = "${salida?.hecho?.getIdHecho()}";

        if(idHecho != undefined && idHecho != ""){
            $("#hechoDropDown").change();
        }

        <g:if test="${showEntrada}">
            $('#edit-salida').find('input, textarea, button, select').attr('readonly','readonly');
           $("#fechaSalida").removeClass('readOnlyDP') ;

            $("#fechaEntrada").removeAttr('readonly');
            $("#update").removeAttr('readonly');

        </g:if>

    });

</script>

<h3>Datos Generales</h3>
<hr style="border-top: 2px solid #eeeeee;margin-top: 1px">

<div class="row">

    <div class="col-sm-4">

          <div>
              <label class="control-label">Fecha Salida</label>

              <div>
                  <bs:datePicker class="form-control required" name="fechaSalida" precision="day"
                                 value="${salida?.fechaSalida}"
                                 noSelection="['': '']"/>
              </div>
          </div>



    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Hecho</label>

            <div>
                <g:if test="${freezeEvidence}" >
                   <g:textField  id="hechoDropDown" class="form-control required" name="hecho" value="${salida?.hecho?.getIdHecho()}" disabled="disabled"/>
                </g:if><g:else>
                <g:select id="hechoDropDown" class="form-control required" name="hecho"
                          noSelection="['': 'Seleccionar']"
                          from="${Hecho.getHechosConEvidencia()*.getIdHecho()}"
                          keys="${Hecho.getHechosConEvidencia()*.getIdHecho()}"
                          value="${salida?.hecho?.getIdHecho()}"/>
                </g:else>
            </div>
        </div>
    </div>


    <div class="col-sm-4" id="evidencia">
        <div>
            <label class="control-label">Evidencia</label>

            <div>
                <g:if test="${freezeEvidence}" >
                    <g:textField  class="form-control required" name="evidenciaTxt" value="${salida?.evidencia?.toString()}" disabled="disabled"/>
                    <g:hiddenField name="evidencia" value="${salida?.evidencia?.getId()}"/>
                </g:if><g:else>
                <g:select id="evidenciaDropDown" class="form-control required" name="evidencia"
                          noSelection="['': 'Seleccionar']"
                          from="${Evidencia.findAll()*.toString()}"
                          keys="${Evidencia.findAll()*.getId()}"
                          value="${salida?.evidencia?.getId()}"/>
                </g:else>
            </div>
        </div>
    </div>

</div>

<div class="row">

    <div class="col-sm-12">
        <div>
            <label class="control-label">Destino</label>

            <div>
                <g:textArea class="form-control" style="resize: none;" name="destino"
                            value="${salida?.destino}" rows="1" cols="40"/>
            </div>
        </div>

    </div>

</div>

<div class="row">

    <div class="col-sm-12">
        <div>
            <label class="control-label">Observaciones</label>

            <div>
                <g:textArea class="form-control" style="resize: none;" name="observaciones"
                            value="${salida?.observaciones}" rows="5" cols="40"/>
            </div>
        </div>

    </div>

</div>

<g:if test="${showEntrada}">
<div class="row">
    <div class="col-sm-4"></div>
    <div class="col-sm-4">
        <label class="control-label">Fecha Entrada</label>

        <div>
            <bs:datePicker class="form-control required" name="fechaEntrada" precision="day" id="fechaEntrada"
                           value="${salida?.fechaEntrada}"
                           noSelection="['': '']"/>
        </div>
    </div>
</div>
</g:if>





