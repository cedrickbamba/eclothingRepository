package eclothing

class Cliente {

	String nome
	String email
	String telefone
	String rg
	
	
    static constraints = {
		
		nome(blank:false, maxSize:50)
		email(email:true)
		telefone(blank:false)
		rg(blank:false)
		endereco()
		
    }
	
	static belongsTo = [endereco:Endereco]
	static hasMany = [pedidos:Pedido]
	
	String toString(){
		return "${nome}, ${rg}"
		}
}
