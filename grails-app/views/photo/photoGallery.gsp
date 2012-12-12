<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Photo Gallery Sample</title>
  
  <r:require module="photoGallery"/>
  
</head>
<body>
 
<div class="nav" role="navigation">
		
		
				<div class="nav">
				
					<ul>
					<li>
					<span class="menuButton">
						<a class="home" href="${createLink(uri: '/')}">Home</a>
					</span>
					</li>
					
					</ul>
				</div>
			
		</div>
     
 
  <div class="pikachoose">
  <ul id="pikame">        
  <g:each in="${photos}">
  	<g:if test="${it?.getCaption() == 'Roupas Masculinas'}">
  	Hello{it?.getCaption()}!
   <li><a href="${createLink(controller:'photo', action:'displayPhoto', id: it.id)}" target="_blank">
    <img src="${createLink(controller:'photo', action:'displayPhoto', id: it.id)}">
    </a>
    <span>
    ${it?.getProduto()}
    </span>
        </li>
        </g:if>
       </g:each>
      </ul>
     </div>
     
     <script language="javascript">
        $.noConflict();          jQuery(document).ready(
        function($){
         $("#pikame").PikaChoose({showCaption:true,autoPlay:false});
        });
      </script>
     
</body>
</html>