<%@ page import="com.icodeya.Photo" %>



<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="photo.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="photo" name="photo" />
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'caption', 'error')} ">
	<label for="caption">
		<g:message code="photo.caption.label" default="Caption" />
		
	</label>
	<g:select name="caption" from="${photoInstance.constraints.caption.inList}" value="${photoInstance?.caption}" valueMessagePrefix="photo.caption" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="photo.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${eclothing.Produto.list()}" optionKey="id" required="" value="${photoInstance?.produto?.id}" class="many-to-one"/>
</div>

