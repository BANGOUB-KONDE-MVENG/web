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
        
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    
     <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Custom styles for this template -->
   <script src="../js/ie-emulation-modes-warning.js"></script><style type="text/javascript"></style>
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

   
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
                <li class="active"><a href="./inscription.kbm">Inscriptions</a></li>
            <li><a href="">A propos</a></li>
            <li><a href="">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
        
             <div class="starter-template">
            <br/><br/><br/>
        <h1>Formulaire d'inscription</h1>
        
            <p>Les champs avec * sont obligatoires</p>
            <form name="formulaire" action="./Confirmationinscription.kbm" method="post" >
<pre>

Nom:     <input class="form-control" type="text" size="40" name="nom" >
Prénom:  <input class="form-control" type="text" size="40" name="prenom"> 
Adresse:  <input class="form-control" type="text" size="40" name="adresse"> 
Courriel: <input class="form-control" type="text" size="40" name="courriel">
Téléphone:  <input class="form-control" type="text" size="40" name="telephone">
                <input type="hidden" name="id" value="${monid}" /> 
            <input type="submit" value="Envoyer"> <input type="reset" value="Annuler">


</pre>
</form>
        
      <%-- Affiche l'expression contenue dans la variable "message" de la requête --%>
<c:out value="${message}" />
      </div>
        
