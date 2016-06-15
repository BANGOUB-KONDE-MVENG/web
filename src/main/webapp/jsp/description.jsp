<%-- 
    Document   : description.jsp
    Created on : 2 juin 2016, 00:42:25
    Author     : jacques
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    
     <link href="../css/bootstrap.css" rel="stylesheet">
        <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
       <link rel="stylesheet" href="./css/style-toolSearch.css" type="text/css" media="screen" />
      <link href="./css/style-body.css" rel="stylesheet">
       <script src="../js/ie-emulation-modes-warning.js"></script><style type="text/javascript"></style>
       <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="./js/main-search.js"></script>
   
        <title>Detail Formations</title>
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
				Au <input type="date" name="datefin" />
				<input type="submit" value="Valider" />
			    </form>
			</div>
			<div class="byPlace">
			    <form method="post" action="./Recherchelocation.kbm">
				<select name="locId">
                                        <c:choose>
                                            <c:when test="${locations == null}">
                                                <option value=""> ---- </option>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="lst" items="${locations}">  
                                                    <option value="${lst.id}"> ${lst.city} </option>  
                                                </c:forEach>    
                                            </c:otherwise> 
                                         </c:choose>
                                 </select>
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
                        Détail Formations
                    </div>
                
                   <div class="info-formations">
                        Titre :  <c:out value="${Macourse.course.title}"/><br/>
                        Date de début : <c:out value="${Macourse.startDate}"/><br/>
                        Date de fin : <c:out value="${Macourse.endDate}"/><br/>
                        Lieu :  <c:out value="${Macourse.location.city}"/> <br/><br/>
                        
                        <a class="record" href="${pageContext.request.contextPath}/inscription.kbm?id=${Macourse.id}">
                                    Inscription       
                        </a>
                   </div>
                   
                   <div class="title-container">
                        Participants
                   </div>
                   <div class="container-participant">
                       <c:choose>
                            <c:when test="${participants == null}">
                                <p>Aucun participants pour cette formation</p>
                            </c:when>
                            <c:otherwise>
                                <table class="tab-participant">
                                    <thead>
                                        <td class="np">Nom</td>
                                        <td class="np">Prénom</td>
                                        <td class="ad">Adresse</td>
                                        <td class="ph"> Téléphone</td>
                                        <td class="em"> Mail</td>
                                    </thead>
                                    <c:forEach var="lst" items="${participants}"> 
                                        <tr>
                                            <td class="np">${lst.lastname}</td>
                                            <td class="np">${lst.fisrtname}</td>
                                            <td class="ad">${lst.address}</td>
                                            <td class="ph"> ${lst.phone}</td>
                                            <td class="em"> ${lst.email}</td>
                                        </tr>
                                    </c:forEach>  
                                </table>   
                            </c:otherwise> 
                         </c:choose>
                   </div>
            </div>
         </div>
        
      
        
       
      </div>
        
    </body>
</html>
