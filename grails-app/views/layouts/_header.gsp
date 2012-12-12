<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
   
  <div id="header">
	<a class="header-main"href="${resource(dir:'')}"><img src="${resource(dir:'images',file:'logo_01_big.png')}"alt="Grails" border="0" /></a>
	<p class="header-sub">Come discover your new style of dress here!</p>
	</div>
	
	<div id="MeuCarrinho">
		
		 <g:link controller="menu" action="meuCarrinho"><img src="${resource(dir:'images',file:'meucarrinho_1x.png')}"alt="Grails" border="0" /></g:link>
		
	</div>
	
	<div id="loginHeader">
		<g:loginControl />
	</div>
	
</body>
</html>