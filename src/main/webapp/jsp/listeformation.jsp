<%-- 
    Document   : listeformation
    Created on : 26 mai 2016, 12:28:02
    Author     : jacques
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Liste des Formations</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    
     <link href="../css/bootstrap.css" rel="stylesheet">
     <link rel="stylesheet" href="./css/style-toolSearch.css" type="text/css" media="screen" />
     <link href="./css/style-body.css" rel="stylesheet">
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Custom styles for this template -->
   <script src="../js/ie-emulation-modes-warning.js"></script><style type="text/javascript"></style>
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="./js/main-search.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    <body>
          <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"  aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="./Listetitreformation.kbm">Fomation en Ligne</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="./Listetitreformation.kbm">Accueil</a></li>
                <li class="active"><a href="./liste.kbm">Catalogue</a></li>
                <li class=""><a href="./inscription.kbm">Inscriptions</a></li>
            <li><a href="">A propos</a></li>
            <li><a href="">Contact</a></li>
          </ul>
            <div class="img-search"></div>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
     <!-- debut serach -->
         <div id="container-search">
	     <div class="search-content">
		<div class="search-title">
                    Recherhe dans notre catalogue
                </div>
		<div class="search-critere">
		    <div class="top">
			<ul>
			    <li> 
                                <input type="checkbox" checked="checked" value="byDefault" >Formations
                            </li>
			    <li> 
                                <input type="checkbox" value="byDate" >Formations par date
                            </li>
			    <li> 
                                <input type="checkbox" value="byPlace" > Formations par lieu
                            </li>
			</ul>
		    </div>
		    <div class="bottom">
			<div class="byDefault">
			    <form method="post" action="./resultatrecherchetitre.kbm">
				<input type="text" placeholder="Rechercher une formation ..." />
				<input type="submit" value="Valider" />
			    </form>
			</div>
			<div class="byDate">
			    <form method="post" action="./resultatrecherchedate.kbm">
				Du <input type="date" name="datedebut" />
				Au <input type="date"  />
				<input type="submit" value="Valider" />
			    </form>
			</div>
			<div class="byPlace">
			    <form method="post" action="./Recherchelocation.kbm">
				<input type="text" placeholder="Lieu de formation ..." name="locId"/>
				<input type="submit" value="Valider" />
			    </form>
			</div>
		    </div>
					     
		</div>
	    </div>
	</div>
         
         <!-- fin serach -->
         
    <div class="container">

        <div class="starter-template">
            <br/><br/><br/>
            <!--
        <p class="lead">Voici la liste de nos Formations vous pouvez consulter les détails<br>en cliquant sur chaque titre</p>
      -->
        </div>
        
        <div class="container-formation">
                <div class="title-container">
                    Catalogue de formations
                </div>
              <c:choose>
                <c:when test="${listeCourse == null}">
                    <p>Aucune formations disponisble</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="lstfor" items="${listeCourse}">  
                        <div class="items-formations training">
                            <div class="book"></div>
                            <div class="title">
                                ${lstfor.course.title}
                            </div>
                            <div class="date">
                                du ${lstfor.startDate} au ${lstfor.endDate}
                            </div>
                            <div class="option">
                                <a class="details" href="${pageContext.request.contextPath}/description.kbm?id=${lstfor.id}">
                                            Détails
                                        </a> | 
                                <a class="record" href="${pageContext.request.contextPath}/inscription.kbm?id=${lstfor.id}">
                                    Inscription       
                                </a>
                            </div>
                        </div>  
                    </c:forEach>    
                </c:otherwise> 
             </c:choose>
            </div>

    </div><!-- /.container -->
   
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../js/jquery.js"><\/script>')</script>
    <script type="text/javascript"  src="../js/bootstrap.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script type="text/javascript"  src="../js/ie10-viewport-bug-workaround.js"></script>
  
   
    </body>
</html>
