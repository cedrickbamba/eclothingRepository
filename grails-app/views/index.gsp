<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			
			#featured {
    position: relative;
    width: 618px;
    margin: 0 auto;
    background: #130D0A;
    border: 1px solid #261a14;
}

#texto{
	 
	 color: #c67114;
	 font-size: 2em;
}
#featured-wrap #featured-ribbon {
	position: absolute;
	/*background: white;*/
	background:url(../images/grails_logo.png);
	width: 110px;
	height: 110px;
	top: -5px;
	right: -7px;
	z-index: 99999;
}
#featured-wrap .image-block {
    margin-top: 30px;
    margin-bottom: 30px;
    margin-left: 30px;
    float: left;
    width: 339px;
}
#featured-wrap .image-block img {
    padding: 0;
    border: none;
}
#featured-wrap .text-block h2 a {
    color: #E2DBD8;
}
#featured-wrap .text-block {
    margin-top: 20px;
    margin-bottom: 30px;
    margin-right: 30px;
    float: right;
    width: 493px;
}
#featured-wrap .text-block .post-meta a {
    color: #549207;
}

.clearfix:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0;
}
.ie7 .clearfix { zoom: 1; } /* IE7 */
			
			
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
				color: #fff;
				
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
			
			
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Categoria</h1>
			<ul>
				<li><g:link controller="photo" action="showPhotoGalleryFeminino">Roupas Femininas</g:link></li>
				<li><g:link controller="photo" action="showPhotoGalleryMasculino">Roupas Masculinas</g:link></li>
				<li><g:link controller="photo" action="showPhotoGalleryInfantil">Roupas Infantis</g:link></li>
				<li><g:link controller="menu" action="aboutUs">About Us</g:link></li>
			</ul>
			
		</div>
		<div id="page-body" role="main">
			
			
			<div id="featured-wrap"><article id="featured" class="clearfix">

   				 <div id="featured-ribbon"></div>

   				 <div class="image-block">
   					
					
					 <a title="" href="#"><img  width="560" height="510" alt="featured" src="images/HomeEclo1.jpg" /></a> 
  				 </div>
  				 
  				 <div class="text-block">
        			<h2 id="texto">Leia-me Primeiro</h2>
        			<p>
       				Esse site é foi desenvolvido para permitir ao voce, nosso cliente fazer suas compras online de 
       				diversos produtos que ofereçemos. Fica a vontade para navegar pelo site. Agradeçcemos já pela escolha!
       				 </p>
       			</div>
  				 
  			</article></div>
  			
		
		
		
			<h1>Welcome to Grails</h1>
			<p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
