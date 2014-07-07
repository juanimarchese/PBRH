<%@ page import="com.pcrh.Persona; com.pcrh.Hecho" %>
<script type="application/javascript">
    function hideClass(classId) {
        $(classId).each(function (item) {
            $(this).hide()
        });
    }

    function showClass(classId) {
        $(classId).each(function (item) {
            $(this).show()
        });
    }

    function hideShow(id, classArray) {
        if ($(id).val() == 0) {
            for(var i=0;i<classArray.length;i++){
                hideClass(classArray[i]);
            }

        } else {
            for(var i=0;i<classArray.length;i++){
                showClass(classArray[i]);
            }
        }
    }


    function onChangeMoradores() {
        hideShow("#noMoradores",[".moradores"] );
        if ($("#noMoradores").val() == 0) {
            hideClass(".evidencia");
        } else {
            onChangeEvidencia();
        }
    }

    function onChangeEvidencia() {
        hideShow("#sinEvidencia", [".evidencia"])
    }
    function onChangeConsigna() {
        hideShow("#consignaPolicial", [".consigna"])
    }
    $(window).load(function () {
        onChangeMoradores();
        onChangeEvidencia();
        onChangeConsigna();
        var configTime = {
            pickDate: false,
            language:'es'
        };
        $('#datetimepicker1').datetimepicker(configTime);
        $('#datetimepicker2').datetimepicker(configTime);
        $('#datetimepicker3').datetimepicker(configTime);
    });

</script>

<h3>Datos Generales</h3>
<hr style="border-top: 2px solid #eeeeee;margin-top: 1px">

<div class="row">
    <div class="col-sm-4">
        <div>
            <label class="control-label">Numero</label>

            <div>
                <g:textField class="form-control required" name="idHecho" id="idHecho" value="${hecho?.idHecho}"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Fecha Hecho</label>

            <div>
                <bs:datePicker class="form-control required" name="fechaHecho" precision="day"
                               value="${hecho?.fechaHecho}"
                               noSelection="['': '']"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Fecha Pericia</label>

            <div>
                <bs:datePicker class="form-control required" name="fechaPericia" precision="day"
                               value="${hecho?.fechaPericia}"
                               noSelection="['': '']"/>
            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col-sm-4">
        <div>
            <label class="control-label">Hora Solicitud</label>

            <div>
                <g:textField class="form-control hora timepickerClass" id="datetimepicker1" name="horaSolicitud" value="${hecho?.horaSolicitud}" data-date-format="HH:mm"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Hora Arribo</label>

            <div>
                <g:textField class="form-control hora timepickerClass" id="datetimepicker2" name="horaArribo" value="${hecho?.horaArribo}"  data-date-format="HH:mm"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Hora Final</label>

            <div>
                <g:textField class="form-control hora timepickerClass" id="datetimepicker3" name="horaFinal" value="${hecho?.horaFinal}"  data-date-format="HH:mm" />
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <g:render template="/_common/components/comboWithOther"
                  model="[id  : 'comisaria', label: 'Comisaria', name: 'comisariaInterviniente.comisaria', nameOther: 'comisariaInterviniente.otherDescription',
                          from: com.pcrh.enums.EnumComisaria.values()*.getNombre(), keys: com.pcrh.enums.EnumComisaria.values()*.name(), value: hecho?.comisariaInterviniente?.comisaria?.name(), otherValue: hecho?.comisariaInterviniente?.otherDescription
                  ]"/>
    </div>

    <div class="col-sm-4">
        <g:render template="/_common/components/comboWithOther"
                  model="[id  : 'caratula', label: 'Caratula', name: 'caratula.caratula', nameOther: 'caratula.otherDescription',
                          from: com.pcrh.enums.EnumCaratula.values()*.getValor(), keys: com.pcrh.enums.EnumCaratula.values()*.name(), value: hecho?.caratula?.caratula?.name(), otherValue: hecho?.caratula?.otherDescription
                  ]"/>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Movil</label>

            <div>
                <g:textField class="form-control " name="movil" value="${hecho?.movil}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <div>
            <label class="control-label">Dirección del Hecho</label>

            <div>
                <g:textField class="form-control required" name="lugarHecho.direccion" value="${hecho?.lugarHecho?.direccion}"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Localidad del Hecho</label>

            <div>
                <g:textField class="form-control required" name="lugarHecho.localidad" value="${hecho?.lugarHecho?.localidad}"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">

        <label class="control-label">Zona</label>

        <div>
            <g:select class="form-control required" name="lugarHecho.zona" noSelection="['': 'Seleccionar']"
                      from="${com.pcrh.enums.EnumZona.values()*.getValor()}"
                      keys="${com.pcrh.enums.EnumZona.values()*.name()}"
                      value="${hecho?.lugarHecho?.zona?.name()}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <div>
            <label class="control-label">Magistrado Interviniente</label>

            <div>
                <g:textField class="form-control " name="magistradoInterviniente"
                             value="${hecho?.magistradoInterviniente}"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Victima</label>

            <div>
                <g:textField class="form-control " name="victima" value="${hecho?.victima}"/>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div>
            <label class="control-label">Imputado</label>

            <div>
                <g:textField class="form-control " name="imputado" value="${hecho?.imputado}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">

    <div class="col-sm-4">
        <g:render template="/_common/components/comboMultipleWithOther"
                  model="[id  : 'especialidad', label: 'Especialidad', labelSeleccion: 'especialidades', name: 'especialidad.especialidades', nameOther: 'especialidad.otherDescription',
                          from: com.pcrh.enums.EnumEspecialidad.values()*.getValor(), keys: com.pcrh.enums.EnumEspecialidad.values()*.name(), value: hecho?.especialidad?.especialidades?.toString(), otherValue: hecho?.especialidad?.otherDescription
                  ]"/>
    </div>

    <div class="col-sm-4">
        %{--Comobo de peritos--}%
        <g:render template="/_common/components/comboMultipleObjectWithOther"
                  model="[id  : 'peritos', label: 'Peritos', labelSeleccion: 'peritos', name: 'peritos.peritos', nameOther: 'peritos.otros',
                          from: Persona.findAll()*.toString(), keys: Persona.findAll()*.getId(), value: hecho?.peritos?.peritosIDs(), otherValue: hecho?.peritos?.otros
                  ]"/>
    </div>

    <div class="col-sm-4">
        <g:render template="/_common/components/comboWithOther"
                  model="[id  : 'fr', label: 'Forma Recepción', name: 'formaRecepcion.formaRecepcion', nameOther: 'formaRecepcion.otherDescription',
                          from: com.pcrh.enums.EnumFormaRecepcion.values()*.getValor(), keys: com.pcrh.enums.EnumFormaRecepcion.values()*.name(), value: hecho?.formaRecepcion?.formaRecepcion?.name(), otherValue: hecho?.formaRecepcion?.otherDescription
                  ]"/>
    </div>
</div>

<div class="row">

    <div class="col-sm-4">

        <label class="control-label">Consigna Policial</label>

        <div>
            <g:select class="form-control required" id="consignaPolicial" name="consignaPolicial" from="${[1, 0]}"
                      value="${hecho?.consignaPolicial ?: 0}" valueMessagePrefix="boolean.select"
                      onchange="onChangeConsigna();"/>
        </div>
    </div>

    <div class="col-sm-4 consigna">

        <label class="control-label">Movil Consigna</label>

        <div>
            <g:textField class="form-control " name="movilConsigna" value="${hecho?.movilConsigna}"/>
        </div>
    </div>

</div>

<div class="row">

    <div class="col-sm-12">
        <div>
            <label class="control-label">Observaciones</label>

            <div>
                <g:textArea class="form-control" style="resize: none;" name="observaciones"
                            value="${hecho?.observaciones}" rows="5" cols="40"/>
            </div>
        </div>

    </div>

</div>

<div class="row">

    <div class="col-sm-4">

        <label class="control-label">Preservado</label>

        <div>
            <g:select class="form-control required" id="noPreservado" name="resultado.noPreservado" from="${[1, 0]}"
                      value="${hecho?.resultado?.noPreservado ?: 0}" valueMessagePrefix="boolean.select"/>
        </div>
    </div>

    <div class="col-sm-4">
        <label class="control-label">Moradores</label>

        <div>
            <g:select class="form-control required" id="noMoradores" name="resultado.noMoradores" from="${[1, 0]}"
                      value="${hecho?.resultado?.noMoradores ?: 0}" valueMessagePrefix="boolean.select" onchange="onChangeMoradores();"/>
        </div>

    </div>

    <div class="col-sm-4 moradores">
        <label class="control-label">Evidencia</label>

        <div>
            <g:select class="form-control required" id="sinEvidencia" name="resultado.sinEvidencia" from="${[1, 0]}"
                      value="${hecho?.resultado?.sinEvidencia ?: 0}" valueMessagePrefix="boolean.select"
                      onchange="onChangeEvidencia();"/>
        </div>

    </div>



</div>


<div class="row">
    <div class="col-sm-12 evidencia">

        <g:render template="evidencias" model="['resultadoInstance': hecho?.resultado]"/>

    </div>
</div>





