<%@ page import="eclothing.Tamanho" %>



<div class="fieldcontain ${hasErrors(bean: tamanhoInstance, field: 'medida', 'error')} required">
	<label for="medida">
		<g:message code="tamanho.medida.label" default="Medida" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="medida" from="${tamanhoInstance.constraints.medida.inList}" required="" value="${fieldValue(bean: tamanhoInstance, field: 'medida')}" valueMessagePrefix="tamanho.medida"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tamanhoInstance, field: 'produtoT', 'error')} required">
	<label for="produtoT">
		<g:message code="tamanho.produtoT.label" default="Produto T" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produtoT" name="produtoT.id" from="${eclothing.Produto.list()}" optionKey="id" required="" value="${tamanhoInstance?.produtoT?.id}" class="many-to-one"/>
</div>

