<%@ page import="com.pcrh.Hecho" %>
<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Numero</label>

            <div>
                <g:textField class="form-control required" name="idHecho" value="${hecho?.idHecho}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div>
            <label class="control-label">Fecha</label>
            <div>
                <bs:datePicker class="form-control" name="fechaHecho" precision="day" value="${hecho?.fechaHecho}"
                               noSelection="['': '']"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[label: 'Caratula',name: 'hecho.caratula.caratula',nameOther: 'hecho.caratula.otherDescription',
                                                                        from: com.pcrh.enums.EnumCaratula.values()*.getValor(),keys: com.pcrh.enums.EnumCaratula.values()*.name(), value: hecho?.caratula?.caratula?.name(),otherValue: hecho?.caratula?.otherDescription
        ]"/>


    </div>
</div>



