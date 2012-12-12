package eclothing

class Itempedido {

	Integer numero
	//Integer pedido_id
	//Integer produto_id
	Integer quantidade
	Float valor
	
    static constraints = {
		numero(blank:false)
		pedido()
		produto()
    }
	
	static belongsTo = [pedido:Pedido, produto:Produto]
	
	
	String toString(){
		return "${numero}"
		}
	
}
