package eclothing

class Endereco {

	String rua
	Integer numero
	String bairro
	String cidade
	String estado
	String cep
	
    static constraints = {
		
		numero(blank:false)
		estado(inList:["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "MA", "MT", "MS", "MG", "PA", "PB",
			           "PR","PE","PI", "RJ", "RN", "RS", "RO","RR","SC", "SP","SE", "TO"])
		
    }
	
	static hasMany = [clientes:Cliente]
	
	String toString(){
		return "${numero}, ${rua}"
		}
}

