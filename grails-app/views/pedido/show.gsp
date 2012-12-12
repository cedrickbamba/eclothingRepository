
<%@ page import="eclothing.Pedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pedido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pedido">
			
				<g:if test="${pedidoInstance?.forma_pagamento}">
				<li class="fieldcontain">
					<span id="forma_pagamento-label" class="property-label"><g:message code="pedido.forma_pagamento.label" default="Formapagamento" /></span>
					
						<span class="property-value" aria-labelledby="forma_pagamento-label"><g:fieldValue bean="${pedidoInstance}" field="forma_pagamento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.data_pedido}">
				<li class="fieldcontain">
					<span id="data_pedido-label" class="property-label"><g:message code="pedido.data_pedido.label" default="Datapedido" /></span>
					
						<span class="property-value" aria-labelledby="data_pedido-label"><g:formatDate date="${pedidoInstance?.data_pedido}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.situacao_pagamento}">
				<li class="fieldcontain">
					<span id="situacao_pagamento-label" class="property-label"><g:message code="pedido.situacao_pagamento.label" default="Situacaopagamento" /></span>
					
						<span class="property-value" aria-labelledby="situacao_pagamento-label"><g:fieldValue bean="${pedidoInstance}" field="situacao_pagamento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.situacao_pedido}">
				<li class="fieldcontain">
					<span id="situacao_pedido-label" class="property-label"><g:message code="pedido.situacao_pedido.label" default="Situacaopedido" /></span>
					
						<span class="property-value" aria-labelledby="situacao_pedido-label"><g:fieldValue bean="${pedidoInstance}" field="situacao_pedido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="pedido.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${pedidoInstance?.cliente?.id}">${pedidoInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.data_entrega}">
				<li class="fieldcontain">
					<span id="data_entrega-label" class="property-label"><g:message code="pedido.data_entrega.label" default="Dataentrega" /></span>
					
						<span class="property-value" aria-labelledby="data_entrega-label"><g:formatDate date="${pedidoInstance?.data_entrega}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="pedido.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${pedidoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.itenspedido}">
				<li class="fieldcontain">
					<span id="itenspedido-label" class="property-label"><g:message code="pedido.itenspedido.label" default="Itenspedido" /></span>
					
						<g:each in="${pedidoInstance.itenspedido}" var="i">
						<span class="property-value" aria-labelledby="itenspedido-label"><g:link controller="itempedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pedidoInstance?.id}" />
					<g:link class="edit" action="edit" id="${pedidoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
