<%@ page import="com.pcrh.Persona; com.pcrh.Hecho" %>
<h3>Datos Generales</h3>
<hr style="border-top: 2px solid #eeeeee;margin-top: 1px">
<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Numero</label>

            <div>
                <g:textField class="form-control required" name="idHecho" id="idHecho" value="${hecho?.idHecho}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div>
            <label class="control-label">Fecha</label>
            <div>
                <bs:datePicker class="form-control required" name="fechaHecho" precision="day" value="${hecho?.fechaHecho}"
                               noSelection="['': '']"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[id:'caratula',label: 'Caratula',name: 'caratula.caratula',nameOther: 'caratula.otherDescription',
                                                                        from: com.pcrh.enums.EnumCaratula.values()*.getValor(),keys: com.pcrh.enums.EnumCaratula.values()*.name(), value: hecho?.caratula?.caratula?.name(),otherValue: hecho?.caratula?.otherDescription
        ]"/>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Hora Solicitud</label>

            <div>
                <g:textField class="form-control hora" name="horaSolicitud"  value="${hecho?.horaSolicitud}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Hora Arribo</label>

            <div>
                <g:textField class="form-control hora" name="horaArribo" value="${hecho?.horaArribo}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Hora Final</label>

            <div>
                <g:textField class="form-control hora" name="horaFinal" value="${hecho?.horaFinal}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[id:'comisaria',label: 'Comisaria',name: 'comisariaInterviniente.comisaria',nameOther: 'comisariaInterviniente.otherDescription',
                                                                        from: com.pcrh.enums.EnumComisaria.values()*.getNombre(),keys: com.pcrh.enums.EnumComisaria.values()*.name(), value: hecho?.comisariaInterviniente?.comisaria?.name(),otherValue: hecho?.comisariaInterviniente?.otherDescription
        ]"/>
    </div>

    <div class="col-lg-4">
        <g:render template="/_common/components/comboWithOther" model="[id:'fr',label: 'Forma Recepción',name: 'formaRecepcion.formaRecepcion',nameOther: 'formaRecepcion.otherDescription',
                                                                        from: com.pcrh.enums.EnumFormaRecepcion.values()*.getValor(),keys: com.pcrh.enums.EnumFormaRecepcion.values()*.name(), value: hecho?.formaRecepcion?.formaRecepcion?.name(),otherValue: hecho?.formaRecepcion?.otherDescription
        ]"/>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Movil</label>

            <div>
                <g:textField class="form-control " name="movil" value="${hecho?.movil}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-4">
        <div >
            <label class="control-label">Dirección del Hecho</label>

            <div>
                <g:textField class="form-control " name="lugarHecho.direccion" value="${hecho?.lugarHecho?.direccion}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Localidad del Hecho</label>

            <div>
                <g:textField class="form-control " name="lugarHecho.localidad" value="${hecho?.lugarHecho?.localidad}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">

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
    <div class="col-lg-4">
        <div >
            <label class="control-label">Magistrado Interviniente</label>

            <div>
                <g:textField class="form-control " name="magistradoInterviniente" value="${hecho?.magistradoInterviniente}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Victima</label>

            <div>
                <g:textField class="form-control " name="victima" value="${hecho?.victima}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Imputado</label>

            <div>
                <g:textField class="form-control " name="imputado" value="${hecho?.imputado}"/>
            </div>
        </div>
    </div>
</div>

<div class="row">
    %{--<div class="col-lg-4">
        <div >
            <label class="control-label">Jerarquia Perito</label>

            <div>
                <g:textField class="form-control " name="perito.jerarquia" value="${hecho?.perito?.jerarquia}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Nombre Perito</label>

            <div>
                <g:textField class="form-control " name="perito.nombre" value="${hecho?.perito?.nombre}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div >
            <label class="control-label">Apellido Perito</label>

            <div>
                <g:textField class="form-control " name="perito.apellido" value="${hecho?.perito?.apellido}"/>
            </div>
        </div>
    </div>--}%
    <div class="col-lg-4">
        <g:render template="/_common/components/comboMultipleWithOther" model="[id:'especialidad',label: 'Especialidad',labelSeleccion: 'especialidades',name: 'especialidad.especialidades',nameOther: 'especialidad.otherDescription',
                                                                                from: com.pcrh.enums.EnumEspecialidad.values()*.getValor(),keys: com.pcrh.enums.EnumEspecialidad.values()*.name(), value: hecho?.especialidad?.especialidades?.toString(),otherValue: hecho?.especialidad?.otherDescription
        ]"/>
    </div>
    <div class="col-lg-4">
        %{--Comobo de peritos--}%
        <g:render template="/_common/components/comboMultipleObjectWithOther" model="[id:'peritos',label: 'Peritos',labelSeleccion: 'peritos',name: 'peritos.peritos',nameOther: 'peritos.otros',
                                                                                from: Persona.findAll()*.toString(),keys: Persona.findAll()*.getId(), value: hecho?.peritos?.peritos?.toString(),otherValue: hecho?.peritos?.otros
        ]"/>
    </div>
</div>

<div class="row">
   
    <div class="col-lg-12">
        <div >
            <label class="control-label">Observaciones</label>

            <div>
                <g:textArea class="form-control" style="resize: none;" name="observaciones" value="${hecho?.observaciones}" rows="5" cols="40"/>
            </div>
        </div>

    </div>

</div>

<div class="row">

    <div class="col-lg-4">

        <label class="control-label">Sin Evidencia</label>

        <div>
            <g:select  class="form-control required" id="sinEvidencia" name="resultado.sinEvidencia" from="${[1,0]}"  value="${hecho?.resultado?.sinEvidencia ?: 1}" valueMessagePrefix="boolean.select" />
        </div>
    </div>

    <div class="col-lg-4">

        <label class="control-label">No Moradores</label>

        <div>
            <g:select  class="form-control required" id="noMoradores" name="resultado.noMoradores" from="${[1,0]}"  value="${hecho?.resultado?.noMoradores ?: 1}" valueMessagePrefix="boolean.select" />
        </div>
    </div>

    <div class="col-lg-4">

        <label class="control-label">No Preservado</label>

        <div>
            <g:select  class="form-control required" id="noPreservado" name="resultado.noPreservado" from="${[1,0]}"  value="${hecho?.resultado?.noPreservado ?: 1}" valueMessagePrefix="boolean.select" />
        </div>
    </div>

</div>

<div class="row">
<div class="col-lg-12">

        <g:render template="evidencias" model="['resultadoInstance':hecho?.resultado]" />

</div>
</div>





