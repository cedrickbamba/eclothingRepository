<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>ROUPAS FEMININAS</title>

<r:require module="photoGallery"/>

</head>
<body>
 
  <div class="body">
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
		
		<h1>ROUPAS FEMININAS</h1>
  </div>
  
   <div class="pikachoose">
  <ul id="pikame">        
  <g:each in="${photos}">
  	<g:if test="${it?.getCaption() == 'Roupas Femininas'}">
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
