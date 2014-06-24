<%@ page import="com.pcrh.Hecho" %>
<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Numero</label>

            <div>
                <g:textField class="form-control required" name="hecho.idHecho" value="${hecho?.idHecho}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div>
            <label class="control-label">Fecha</label>
            <div>
                <bs:datePicker class="form-control required" name="hecho.fechaHecho" precision="day" value="${hecho?.fechaHecho}"
                               noSelection="['': '']"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[id:'caratula',label: 'Caratula',name: 'hecho.caratula.caratula',nameOther: 'hecho.caratula.otherDescription',
                                                                        from: com.pcrh.enums.EnumCaratula.values()*.getValor(),keys: com.pcrh.enums.EnumCaratula.values()*.name(), value: hecho?.caratula?.caratula?.name(),otherValue: hecho?.caratula?.otherDescription
        ]"/>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Hora Solicitud</label>

            <div>
                <g:textField class="form-control " name="hecho.horaSolicitud" value="${hecho?.horaSolicitud}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Hora Arribo</label>

            <div>
                <g:textField class="form-control " name="hecho.horaArribo" value="${hecho?.horaArribo}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Hora Final</label>

            <div>
                <g:textField class="form-control " name="hecho.horaFinal" value="${hecho?.horaFinal}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[id:'comisaria',label: 'Comisaria',name: 'hecho.comisariaInterviniente.comisaria',nameOther: 'hecho.comisariaInterviniente.otherDescription',
                                                                        from: com.pcrh.enums.EnumComisaria.values()*.getNombre(),keys: com.pcrh.enums.EnumComisaria.values()*.name(), value: hecho?.comisariaInterviniente?.comisaria?.name(),otherValue: hecho?.comisariaInterviniente?.otherDescription
        ]"/>
    </div>

    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[id:'fr',label: 'Forma Recepción',name: 'hecho.formaRecepcion.formaRecepcion',nameOther: 'hecho.formaRecepcion.otherDescription',
                                                                        from: com.pcrh.enums.EnumFormaRecepcion.values()*.getValor(),keys: com.pcrh.enums.EnumFormaRecepcion.values()*.name(), value: hecho?.formaRecepcion?.formaRecepcion?.name(),otherValue: hecho?.formaRecepcion?.otherDescription
        ]"/>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Movil</label>

            <div>
                <g:textField class="form-control " name="hecho.movil" value="${hecho?.movil}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Dirección del Hecho</label>

            <div>
                <g:textField class="form-control " name="hecho.lugarHecho.direccion" value="${hecho?.lugarHecho?.direccion}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Localidad del Hecho</label>

            <div>
                <g:textField class="form-control " name="hecho.lugarHecho.localidad" value="${hecho?.lugarHecho?.localidad}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">

        <label class="control-label">Zona</label>

        <div>
            <g:select class="form-control required" name="${hecho.lugarHecho.zona}" noSelection="['': 'Seleccionar']"
                      from="${com.pcrh.enums.EnumZona.values()*.getValor()}"
                      keys="${com.pcrh.enums.EnumZona.values()*.name()}"
                      value="${hecho?.lugarHecho?.zona?.name()}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Magistrado Interviniente</label>

            <div>
                <g:textField class="form-control " name="hecho.magistradoInterviniente" value="${hecho?.magistradoInterviniente}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Victima</label>

            <div>
                <g:textField class="form-control " name="hecho.victima" value="${hecho?.victima}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Imputado</label>

            <div>
                <g:textField class="form-control " name="hecho.imputado" value="${hecho?.imputado}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Jerarquia Perito</label>

            <div>
                <g:textField class="form-control " name="hecho.perito.jerarquia" value="${hecho?.perito?.jerarquia}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Nombre Perito</label>

            <div>
                <g:textField class="form-control " name="hecho.perito.nombre" value="${hecho?.perito?.nombre}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Apellido Perito</label>

            <div>
                <g:textField class="form-control " name="hecho.perito.apellido" value="${hecho?.perito?.apellido}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[id:'especialidad',label: 'Especialidad',name: 'hecho.especialidad.especialidad',nameOther: 'hecho.especialidad.otherDescription',
                                                                        from: com.pcrh.enums.EnumEspecialidad.values()*.getValor(),keys: com.pcrh.enums.EnumEspecialidad.values()*.name(), value: hecho?.especialidad?.especialidad?.name(),otherValue: hecho?.especialidad?.otherDescription
        ]"/>
    </div>


</div>





