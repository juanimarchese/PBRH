<%@ page import="com.pcrh.Hecho" %>
                   <div class="row">
                       <div class="col-lg-6">
                           <div class="${hasErrors(bean: hecho, field: 'idHecho', 'error')} ">
                               <label class="control-label">Numero</label>
                               <div>
                                   <g:textField class="form-control required" name="idHecho" value="${hecho?.idHecho}" />
                                   <span class="help-inline">${hasErrors(bean: hecho, field: 'idHecho', 'error')}</span>
                               </div>
                           </div>
                       </div>
                       <div class="col-lg-6">
                           <div class="${hasErrors(bean: hecho, field: 'fechaHecho', 'error')} ">
                               <label class="control-label">Fecha</label>
                               <div>
                                   <bs:datePicker class="form-control" name="fechaHecho" precision="day" value="${hecho?.fechaHecho}" noSelection="['': '']" />
                                   <span class="help-inline">${hasErrors(bean: hecho, field: 'fechaHecho', 'error')}</span>
                               </div>
                           </div>
                       </div>
                   </div>



