<%@ page import="eclothing.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="produto.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${produtoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="produto.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${produtoInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'itenspedidos', 'error')} ">
	<label for="itenspedidos">
		<g:message code="produto.itenspedidos.label" default="Itenspedidos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${produtoInstance?.itenspedidos?}" var="i">
    <li><g:link controller="itempedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itempedido" action="create" params="['produto.id': produtoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itempedido.label', default: 'Itempedido')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="produto.photos.label" default="Photos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${produtoInstance?.photos?}" var="p">
    <li><g:link controller="photo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="photo" action="create" params="['produto.id': produtoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'photo.label', default: 'Photo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="produto.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: produtoInstance, field: 'preco')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'tamanhos', 'error')} ">
	<label for="tamanhos">
		<g:message code="produto.tamanhos.label" default="Tamanhos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${produtoInstance?.tamanhos?}" var="t">
    <li><g:link controller="tamanho" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tamanho" action="create" params="['produto.id': produtoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tamanho.label', default: 'Tamanho')])}</g:link>
</li>
</ul>

</div>

