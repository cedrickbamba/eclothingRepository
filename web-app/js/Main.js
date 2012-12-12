
var i = 1;

function trocaImagens(url) {

  document.getElementById("minhaImg").style.backgroundImage= url;
  i++;

}
						
setInterval((function(){
	if(i == 5){
	  i = 1;
   }
  var url ="url(images/HomeEclo" + i + ".jpg"; 
  trocaImagens(url)}, 1000);
