package eclothing

class Tamanho {

	Integer medida
	
	static constraints = {
	
		medida(inList:[12, 14, 20, 36, 38, 40, 42, 44, 46, 48])
	}
	
	static belongsTo = [produtoT:Produto]
}
