<%@ page import="eclothing.Endereco" %>



<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="endereco.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${enderecoInstance.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="endereco.estado.label" default="Estado" />
		
	</label>
	<g:select name="estado" from="${enderecoInstance.constraints.estado.inList}" value="${enderecoInstance?.estado}" valueMessagePrefix="endereco.estado" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} ">
	<label for="bairro">
		<g:message code="endereco.bairro.label" default="Bairro" />
		
	</label>
	<g:textField name="bairro" value="${enderecoInstance?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} ">
	<label for="cep">
		<g:message code="endereco.cep.label" default="Cep" />
		
	</label>
	<g:textField name="cep" value="${enderecoInstance?.cep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} ">
	<label for="cidade">
		<g:message code="endereco.cidade.label" default="Cidade" />
		
	</label>
	<g:textField name="cidade" value="${enderecoInstance?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'clientes', 'error')} ">
	<label for="clientes">
		<g:message code="endereco.clientes.label" default="Clientes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${enderecoInstance?.clientes?}" var="c">
    <li><g:link controller="cliente" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cliente" action="create" params="['endereco.id': enderecoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cliente.label', default: 'Cliente')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'rua', 'error')} ">
	<label for="rua">
		<g:message code="endereco.rua.label" default="Rua" />
		
	</label>
	<g:textField name="rua" value="${enderecoInstance?.rua}"/>
</div>

