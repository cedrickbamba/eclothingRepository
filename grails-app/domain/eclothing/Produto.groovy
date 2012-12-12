package eclothing
import com.icodeya.Photo


class Produto {
	
	String descricao
	Float preco
	String nome 

    static constraints = {
		
		nome(blank:false)
    }
	
	static hasMany = [itenspedidos:Itempedido, photos:Photo, tamanhos:Tamanho]
	
	
	String toString(){
		return "${nome}, ${descricao}, ${preco}"
		}
}
