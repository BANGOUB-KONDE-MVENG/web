<%-- 
    Document   : inscriptionformatiion
    Created on : 26 mai 2016, 12:40:46
    Author     : jacques
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <title>Inscription</title>    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    
     <link href="../css/bootstrap.css" rel="stylesheet">
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/style-toolSearch.css" type="text/css" media="screen" />
     <link href="./css/style-body.css" rel="stylesheet">
     <script src="../js/ie-emulation-modes-warning.js"></script><style type="text/javascript"></style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/main-search.js"></script>

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
                      <li class=""><a href="./liste.kbm">Catalogue</a></li>
                      <li class="active"><a href="./inscription.kbm">Inscriptions</a></li>
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
            </div>
        
            <div class="container-formation">
                    <div class="title-container">
                        Inscription à une session de formation
                    </div>
                
                    <div class="container-inscription">
                        <c:choose>
                                <c:when test="${message != null }">
                                    <div class="box-message"> ${message}</div>
                                </c:when>
                        </c:choose>   
                        
                        <form name="formulaire" action="./Confirmationinscription.kbm" method="post">
                            <div>
                                Nom:     <input class="form-control" type="text" size="40" name="nom" >
                            </div>
                            <div>
                                Prénom:  <input class="form-control" type="text" size="40" name="prenom"> 
                            </div>
                            <div>
                                Adresse:  <input class="form-control" type="text" size="40" name="adresse"> 
                            </div>
                            <div>
                                Courriel: <input class="form-control" type="text" size="40" name="courriel">
                            </div>
                            <div>
                                Téléphone:  <input class="form-control" type="text" size="40" name="telephone">
                            </div>
                            <c:choose>
                                <c:when test="${monid != null }">
                                    <div>
                                        Inscription à : <br/>
                                    <c:choose>
                                        <c:when test="${currentcours != null }">
                                            <span>
                                               ${currentcours.course.title} 
                                                             - du ${currentcours.startDate} au ${currentcours.endDate}
                                            </span>
                                        </c:when>
                                    </c:choose>        
                                    <input type="hidden" name="id" value="${monid}" />
                                   </div>
                                </c:when>
                                <c:otherwise>
                                 <div>
                                  Selectionner une Session de cours  <br/>
                                    <c:choose>
                                        <c:when test="${coursesession == null }">
                                            <span>Aucune session de cours trouvé</span>
                                        </c:when>
                                        <c:otherwise>
                                            <select name="id">
                                                <c:forEach var="lst" items="${coursesession}">  
                                                        <option value="${lst.id}"> 
                                                            ${lst.course.title} 
                                                             - du ${lst.startDate} au ${lst.endDate}
                                                        </option>
                                                </c:forEach> 
                                            </select>
                                        </c:otherwise> 
                                    </c:choose>
                                 </div>
                                </c:otherwise> 
                             </c:choose>
                                    
                            <div>
                               <input type="submit" value="Envoyer"> <input type="reset" value="Annuler">
                            </div>
            
                        </form>
                    </div>
                </div>

    </div><!-- /.container -->
        
        
    </body>
        
