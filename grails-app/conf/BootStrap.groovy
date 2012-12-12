import eclothing.Cliente
import eclothing.Endereco
import eclothing.Produto
import eclothing.User
import grails.util.GrailsUtil
import  java.lang.String

class BootStrap {
		
    def init = { 
		
		servletContext ->
		
		
		switch(GrailsUtil.environment){
			case "development":
			def admin = new User(login:"admin",
			password:"admin",
			role:"admin")
			admin.save()
			if(admin.hasErrors()){
			println admin.errors
			}
			def user = new User(login:"cedrick",
			password:"cedrick",
			role:"user")
			user.save()
			if(user.hasErrors()){
			println user.errors
			}
			
			break
			
			case "production" : break
		}
		
			/*
			
			def ender = new Endereco(
				rua:"Inconfidentes",
				numero:"530",
				bairro:"Cidade Jardim",
				cidade:"São Carlos",
				estado:"SP",
				cep:"1366581"
			)
			ender.save()
			if(ender.hasErrors()){
				println ender.errors
			}
			
			
			
			def cedrick = new Cliente(
				nome:"Cedrick",
				email:"cedrick.bamba@yahoo.fr",
				telefone:"92479011",
				rg:"12233434"
			)
			cedrick.save()
			if(cedrick.hasErrors()){
				println cedrick.errors
			}
			
			
			def bamba = new Cliente(
				nome:"Bamba",
				email:"bamba@yahoo.fr",
				telefone:"92475589",
				rg:"45464"
			)
			bamba.save()
			if(bamba.hasErrors()){
				println bamba.errors
			}
			
			def produto = new Produto(
				descricao:"produto1",
				preco:"150",
				desenho:"http://gmail.com/cedrick",
				nome:"produto1",
				tamanho:"46",
			)
			produto.save()
			if(produto.hasErrors()){
				println produto.errors
			}
			def produto1 = new Produto(
				descricao:"produto2",
				preco:"250",
				desenho:"http://gmail.com/bamba",
				nome:"produto2",
				tamanho:"46",
			)
			produto1.save()
			if(produto1.hasErrors()){
				println produto1.errors
			}
			
			break
			
			case "production" : break
		}
		
		*/
		
    }
    def destroy = {
    }
}
