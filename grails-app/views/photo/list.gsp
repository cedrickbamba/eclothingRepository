
<%@ page import="com.icodeya.Photo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'photo.label', default: 'Photo')}" />
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
		<div id="list-photo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="photo" title="${message(code: 'photo.photo.label', default: 'Photo')}" />
					
						<g:sortableColumn property="caption" title="${message(code: 'photo.caption.label', default: 'Caption')}" />
					
						<th><g:message code="photo.produto.label" default="Produto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${photoInstanceList}" status="i" var="photoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${photoInstance.id}">${fieldValue(bean: photoInstance, field: "photo")}</g:link></td>
					
						<td>${fieldValue(bean: photoInstance, field: "caption")}</td>
					
						<td>${fieldValue(bean: photoInstance, field: "produto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${photoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
