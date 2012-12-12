
<%@ page import="eclothing.Pedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="nav" role="navigation">
		
		<g:if test="${session?.user?.admin}">
				<div class="nav">
				
					<ul>
					<li>
					<span class="menuButton">
						<a class="home" href="${createLink(uri: '/')}">Home</a>
					</span>
					</li>
					<li>
					<span class="menuButton">
						<g:link class="create" action="create">
							<g:message code="default.new.label" args="[entityName]"/>
						</g:link>
					</span>
					</li>
					</ul>
				</div>
			</g:if>
			
		</div>
		<div id="list-pedido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="forma_pagamento" title="${message(code: 'pedido.forma_pagamento.label', default: 'Formapagamento')}" />
					
						<g:sortableColumn property="data_pedido" title="${message(code: 'pedido.data_pedido.label', default: 'Datapedido')}" />
					
						<g:sortableColumn property="situacao_pagamento" title="${message(code: 'pedido.situacao_pagamento.label', default: 'Situacaopagamento')}" />
					
						<g:sortableColumn property="situacao_pedido" title="${message(code: 'pedido.situacao_pedido.label', default: 'Situacaopedido')}" />
					
						<th><g:message code="pedido.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="data_entrega" title="${message(code: 'pedido.data_entrega.label', default: 'Dataentrega')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "forma_pagamento")}</g:link></td>
					
						<td><g:formatDate date="${pedidoInstance.data_pedido}" /></td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "situacao_pagamento")}</td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "situacao_pedido")}</td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "cliente")}</td>
					
						<td><g:formatDate date="${pedidoInstance.data_entrega}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pedidoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
