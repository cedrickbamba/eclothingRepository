
<%@ page import="eclothing.Tamanho" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tamanho.label', default: 'Tamanho')}" />
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
		<div id="list-tamanho" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="medida" title="${message(code: 'tamanho.medida.label', default: 'Medida')}" />
					
						<th><g:message code="tamanho.produtoT.label" default="Produto T" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tamanhoInstanceList}" status="i" var="tamanhoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tamanhoInstance.id}">${fieldValue(bean: tamanhoInstance, field: "medida")}</g:link></td>
					
						<td>${fieldValue(bean: tamanhoInstance, field: "produtoT")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tamanhoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
