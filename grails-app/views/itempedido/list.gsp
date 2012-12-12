
<%@ page import="eclothing.Itempedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itempedido.label', default: 'Itempedido')}" />
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
		<div id="list-itempedido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'itempedido.numero.label', default: 'Numero')}" />
					
						<th><g:message code="itempedido.pedido.label" default="Pedido" /></th>
					
						<th><g:message code="itempedido.produto.label" default="Produto" /></th>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'itempedido.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'itempedido.valor.label', default: 'Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itempedidoInstanceList}" status="i" var="itempedidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itempedidoInstance.id}">${fieldValue(bean: itempedidoInstance, field: "numero")}</g:link></td>
					
						<td>${fieldValue(bean: itempedidoInstance, field: "pedido")}</td>
					
						<td>${fieldValue(bean: itempedidoInstance, field: "produto")}</td>
					
						<td>${fieldValue(bean: itempedidoInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: itempedidoInstance, field: "valor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itempedidoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
