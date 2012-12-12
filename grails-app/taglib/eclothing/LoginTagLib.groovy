package eclothing

class LoginTagLib {
def loginControl = {
if(request.getSession(false) && session.user){
out << "Seja bem-vindo(a) ${session.user.login} "
out << """[${link(action:"logout",
controller:"user"){"Logout"}}]"""
} else {
out << """[${link(action:"login",
controller:"user"){"Login"}}]"""
}
}
}