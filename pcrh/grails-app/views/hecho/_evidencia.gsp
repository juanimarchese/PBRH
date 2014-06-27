<div id="evidencia${i}" class="evidencia-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='resultado.evidencias[${i}].id' value='${evidencia?.id}'/>
    <g:hiddenField name='resultado.evidencias[${i}].deleted' value='false'/>
    <g:hiddenField name='resultado.evidencias[${i}].newInstance' value='false'/>
<div class="row" style="padding-top: 5px">
    <div class="col-lg-1">
        <g:textField class="form-control required caracter" name='resultado.evidencias[${i}].sector' value='${evidencia?.sector}' />

    </div>
    <div class="col-lg-1">
        <g:textField class="form-control required numero" name='resultado.evidencias[${i}].numero' value='${evidencia?.numero}' />

    </div>
    <div class="col-lg-2">
       <g:select class="form-control" name='resultado.evidencias[${i}].tipo'
                  from="${com.pcrh.enums.EnumTipoEvidencia.values()*.getValor()}"
                  keys="${com.pcrh.enums.EnumTipoEvidencia.values()*.name()}"
                  value='${evidencia?.tipo?.name()}'/>

    </div>
    <div class="col-lg-1">
        <g:textField class="form-control required numero" name='resultado.evidencias[${i}].cantidad' value='${evidencia?.cantidad}' />

    </div>
    <div class="col-lg-6">
      <g:textField class="form-control" name='resultado.evidencias[${i}].observaciones' value='${evidencia?.observaciones}' />

    </div>
    <div class="col-lg-1 pull-right" style="text-align: center">
        <span class="del-evidencia" >
            <div class="btn btn-danger btn-sm" title="${message(code: 'default.button.delete.label', default: 'Delete')}">
                <i class="glyphicon glyphicon-trash"></i>
            </div>
        </span>

    </div>


</div>

</div>