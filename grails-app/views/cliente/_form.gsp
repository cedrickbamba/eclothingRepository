<%@ page import="eclothing.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="50" required="" value="${clienteInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="cliente.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${clienteInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="cliente.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" required="" value="${clienteInstance?.telefone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'rg', 'error')} required">
	<label for="rg">
		<g:message code="cliente.rg.label" default="Rg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" required="" value="${clienteInstance?.rg}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="cliente.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="endereco" name="endereco.id" from="${eclothing.Endereco.list()}" optionKey="id" required="" value="${clienteInstance?.endereco?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'pedidos', 'error')} ">
	<label for="pedidos">
		<g:message code="cliente.pedidos.label" default="Pedidos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clienteInstance?.pedidos?}" var="p">
    <li><g:link controller="pedido" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pedido" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pedido.label', default: 'Pedido')])}</g:link>
</li>
</ul>

</div>

