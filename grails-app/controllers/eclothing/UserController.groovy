package eclothing

class UserController {

   def login = {}
   def logout = {
	   
	   flash.message = "Obrigado, Sessao Encerrada ${session.user.login}"
	   session.user = null
	   redirect(action:"login")
   }
   def authenticate = {
	   
	   def user =
	   User.findByLoginAndPassword(params.login,
	   params.password.encodeAsSHA())
	   if(user){
	   session.user = user
	   flash.message = "Seja bem-vindo(a) ${user.login}!"
	   redirect(controller:"cliente", action:"list")
	   }else{
	   flash.message =
	   "Por favor, ${params.login}.Tente novamente."
	   redirect(action:"login")
	   }
   }
   
   def beforeInterceptor = [action:this.&auth,
	   except:['login', 'logout', 'authenticate']]
	   def auth() {
	   if(!session.user) {
	   redirect(controller:"user", action:"login")
	   return false
	   }
	   if(!session.user.admin){
	   flash.message = "Tsk tsk—admins only"
	   redirect(controller:"cliente", action:"list")
	   return false
	   }
	   }
   
}
