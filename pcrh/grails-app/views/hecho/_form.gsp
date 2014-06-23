<%@ page import="com.pcrh.Hecho" %>
                   <div class="row">
                       <div class="col-lg-6">
                           <div class="${hasErrors(bean: hecho, field: 'idHecho', 'error')} ">
                               <label class="control-label">Numero</label>
                               <div>
                                   <g:textField class="form-control" name="idHecho" value="${hecho?.idHecho}"/>
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


%{--
			<div class="${hasErrors(bean: hecho, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="_DemoPage.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${hecho?.name}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myDate', 'error')} ">
				<label for="myDate" class="control-label"><g:message code="_DemoPage.myDate.label" default="My Date" /></label>
				<div>
					<bs:datePicker class="form-control" name="myDate" precision="day" value="${hecho?.myDate}" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myDate', 'error')}</span>
				</div>
			</div>
--}%

			
<%--			<div class="${hasErrors(bean: hecho, field: 'myDate', 'error')} ">--%>
<%--				<label for="myDate2" class="control-label"><g:message code="_DemoPage.myDate2.label" default="My Date2" /></label>--%>
<%--				<div class="row">--%>
<%--					<bs:customDatePicker class="form-control col-xs-2" name="myDate2" value="${hecho?.myDate2}" noSelection="['':'-Choose-']"/>--%>
<%--					<span class="help-inline">${hasErrors(bean: hecho, field: 'myDate2', 'error')}</span>--%>
<%--				</div>--%>
<%--			</div>--%>
			
			%{--<div class="${hasErrors(bean: hecho, field: 'myBoolean', 'error')} ">
				<label for="myBoolean" class="control-label"><g:message code="_DemoPage.myBoolean.label" default="My Boolean" /></label>
				<div>
					<bs:checkBox class="form-control" name="myBoolean" value="${hecho?.myBoolean}" />
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myBoolean', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myInt', 'error')} required">
				<label for="myInt" class="control-label"><g:message code="_DemoPage.myInt.label" default="My Int" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="number" name="myInt" required="" value="${hecho.myInt}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myInt', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myShort', 'error')} required">
				<label for="myShort" class="control-label"><g:message code="_DemoPage.myShort.label" default="My Short" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="number" name="myShort" required="" value="${hecho.myShort}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myShort', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myLong', 'error')} required">
				<label for="myLong" class="control-label"><g:message code="_DemoPage.myLong.label" default="My Long" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="number" name="myLong" required="" value="${hecho.myLong}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myLong', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myFloat', 'error')} required">
				<label for="myFloat" class="control-label"><g:message code="_DemoPage.myFloat.label" default="My Float" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="number" name="myFloat" step="any" required="" value="${hecho.myFloat}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myFloat', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myDouble', 'error')} required">
				<label for="myDouble" class="control-label"><g:message code="_DemoPage.myDouble.label" default="My Double" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="number" name="myDouble" step="any" required="" value="${hecho.myDouble}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myDouble', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myByte', 'error')} required">
				<label for="myByte" class="control-label"><g:message code="_DemoPage.myByte.label" default="My Byte" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="number" name="myByte" required="" value="${hecho.myByte}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myByte', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myChar', 'error')} required">
				<label for="myChar" class="control-label"><g:message code="_DemoPage.myChar.label" default="My Char" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="number" name="myChar" required="" value="${hecho.myChar}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myChar', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myByteArray', 'error')} ">
				<label for="myByteArray" class="control-label"><g:message code="_DemoPage.myByteArray.label" default="My Byte Array" /></label>
				<div>
					<input class="" type="file" id="myByteArray" name="myByteArray" />
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myByteArray', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myInteger', 'error')} ">
				<label for="myInteger" class="control-label"><g:message code="_DemoPage.myInteger.label" default="My Integer" /></label>
				<div>
					<g:field class="form-control" type="number" name="myInteger" value="${hecho.myInteger}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myInteger', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myTimeZone', 'error')} ">
				<label for="myTimeZone" class="control-label"><g:message code="_DemoPage.myTimeZone.label" default="My Time Zone" /></label>
				<div>
					<g:timeZoneSelect class="form-control" name="myTimeZone" value="${hecho?.myTimeZone}"  noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myTimeZone', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myLocale', 'error')} ">
				<label for="myLocale" class="control-label"><g:message code="_DemoPage.myLocale.label" default="My Locale" /></label>
				<div>
					<g:localeSelect class="form-control" name="myLocale" value="${hecho?.myLocale}"  noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myLocale', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myCurrency', 'error')} ">
				<label for="myCurrency" class="control-label"><g:message code="_DemoPage.myCurrency.label" default="My Currency" /></label>
				<div>
					<g:currencySelect class="form-control" name="myCurrency" value="${hecho?.myCurrency}"  noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myCurrency', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: hecho, field: 'myEnum', 'error')} required">
				<label for="myEnum" class="control-label"><g:message code="_DemoPage.myEnum.label" default="My Enum" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="myEnum" from="${kickstart._DemoPage$Suit?.values()}" keys="${kickstart._DemoPage$Suit.values()*.name()}" required="" value="${hecho?.myEnum?.name()}"/>
					<span class="help-inline">${hasErrors(bean: hecho, field: 'myEnum', 'error')}</span>
				</div>
			</div>--}%

