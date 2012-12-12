package eclothing

class Pedido {

	//Integer cliente_id
	String descricao
	Date data_pedido
	Date data_entrega
	String forma_pagamento
	String situacao_pagamento
	String situacao_pedido
	
    static constraints = {
		
		forma_pagamento(inList:["Por Boleto", "Por Cartao de Credito", "A Vista por Transferencia Eletronica"])
		data_pedido(validator:{return (it >= new Date())})
		situacao_pagamento(inList:["Nao Pago", "Pago"])
		situacao_pedido(inList:["Fechado", "Aberto"])
		cliente()
    }
	
	static belongsTo = [cliente:Cliente]
	static hasMany = [itenspedido:Itempedido]
	
	
	String toString(){
		return "${descricao}, ${data_pedido.format('MM/dd/yyyy')}"
		}
	
}
