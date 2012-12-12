<%@ page import="eclothing.Pedido" %>



<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'forma_pagamento', 'error')} ">
	<label for="forma_pagamento">
		<g:message code="pedido.forma_pagamento.label" default="Formapagamento" />
		
	</label>
	<g:select name="forma_pagamento" from="${pedidoInstance.constraints.forma_pagamento.inList}" value="${pedidoInstance?.forma_pagamento}" valueMessagePrefix="pedido.forma_pagamento" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'data_pedido', 'error')} required">
	<label for="data_pedido">
		<g:message code="pedido.data_pedido.label" default="Datapedido" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_pedido" precision="day"  value="${pedidoInstance?.data_pedido}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'situacao_pagamento', 'error')} ">
	<label for="situacao_pagamento">
		<g:message code="pedido.situacao_pagamento.label" default="Situacaopagamento" />
		
	</label>
	<g:select name="situacao_pagamento" from="${pedidoInstance.constraints.situacao_pagamento.inList}" value="${pedidoInstance?.situacao_pagamento}" valueMessagePrefix="pedido.situacao_pagamento" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'situacao_pedido', 'error')} ">
	<label for="situacao_pedido">
		<g:message code="pedido.situacao_pedido.label" default="Situacaopedido" />
		
	</label>
	<g:select name="situacao_pedido" from="${pedidoInstance.constraints.situacao_pedido.inList}" value="${pedidoInstance?.situacao_pedido}" valueMessagePrefix="pedido.situacao_pedido" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="pedido.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${eclothing.Cliente.list()}" optionKey="id" required="" value="${pedidoInstance?.cliente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'data_entrega', 'error')} required">
	<label for="data_entrega">
		<g:message code="pedido.data_entrega.label" default="Dataentrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_entrega" precision="day"  value="${pedidoInstance?.data_entrega}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="pedido.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${pedidoInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'itenspedido', 'error')} ">
	<label for="itenspedido">
		<g:message code="pedido.itenspedido.label" default="Itenspedido" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pedidoInstance?.itenspedido?}" var="i">
    <li><g:link controller="itempedido" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="itempedido" action="create" params="['pedido.id': pedidoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'itempedido.label', default: 'Itempedido')])}</g:link>
</li>
</ul>

</div>

