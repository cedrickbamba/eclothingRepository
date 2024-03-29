
<%@ page import="eclothing.Endereco" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
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
		<div id="list-endereco" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'endereco.numero.label', default: 'Numero')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'endereco.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />
					
						<g:sortableColumn property="cep" title="${message(code: 'endereco.cep.label', default: 'Cep')}" />
					
						<g:sortableColumn property="cidade" title="${message(code: 'endereco.cidade.label', default: 'Cidade')}" />
					
						<g:sortableColumn property="rua" title="${message(code: 'endereco.rua.label', default: 'Rua')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enderecoInstanceList}" status="i" var="enderecoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enderecoInstance.id}">${fieldValue(bean: enderecoInstance, field: "numero")}</g:link></td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "cep")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "cidade")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "rua")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enderecoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
