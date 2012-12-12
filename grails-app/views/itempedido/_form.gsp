<%@ page import="eclothing.Itempedido" %>



<div class="fieldcontain ${hasErrors(bean: itempedidoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="itempedido.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${itempedidoInstance.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: itempedidoInstance, field: 'pedido', 'error')} required">
	<label for="pedido">
		<g:message code="itempedido.pedido.label" default="Pedido" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pedido" name="pedido.id" from="${eclothing.Pedido.list()}" optionKey="id" required="" value="${itempedidoInstance?.pedido?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itempedidoInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="itempedido.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${eclothing.Produto.list()}" optionKey="id" required="" value="${itempedidoInstance?.produto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itempedidoInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="itempedido.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${itempedidoInstance.quantidade}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: itempedidoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="itempedido.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: itempedidoInstance, field: 'valor')}" required=""/>
</div>

