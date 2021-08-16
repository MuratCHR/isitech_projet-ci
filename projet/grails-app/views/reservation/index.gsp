<%--
  Created by IntelliJ IDEA.
  User: merygbeguet
  Date: 17/04/2021
  Time: 13:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>LISTE DES MAGASINS</title>
    <!-- Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

</head>

<%--
MENU NAVBAR
--%><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand"><b>D2M</b></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarCollapse" style="">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../">Accueil</a>
                </li>
                %{--                <li class="nav-item">--}%
                %{--                    <a class="nav-link" href="#">Link</a>--}%
                %{--                </li>--}%
                %{--                <li class="nav-item">--}%
                %{--                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--}%
                %{--                </li>--}%
            </ul>
            <form class="d-flex">
                <button class="btn btn-danger" type="submit">Espace Pro</button>
            </form>
        </div>
    </div>
</nav>


<body>
<div class="container" style="padding-top: 80px;"> </div>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID du magasin</th>
        <th scope="col">Nom du magasin</th>
        <th scope="col">Localisation</th>
        <th scope="col">Date de réservation</th>
        <th scope="col">Heure début</th>
        <th scope="col">Heure fin</th>

    </tr>
    </thead>
<g:each in="${reservationList}" status="i" var="ReservationInstance">

        <tbody>
        <tr>
            <th scope="row">${fieldValue(bean: ReservationInstance, field: "idMagasin") }</th>
            <th scope="row">${reservationList.idMagasin ? fieldValue(bean: ReservationInstance.magasin, field: "nom") : ""}</th>
            <th scope="row">${reservationList.idMagasin ? fieldValue(bean: ReservationInstance.magasin.ville, field: "codePostal") : ""}</th>
            <th scope="row">${fieldValue(bean: ReservationInstance, field: "dateReservation") }</th>
            <th scope="row">${fieldValue(bean: ReservationInstance, field: "heureDebut") }</th>
            <th scope="row">${fieldValue(bean: ReservationInstance, field: "heureFin") }</th>
        </tr>
        </tbody>
</g:each>
</table>

<g:form controller="reservation" action="create">
    <fieldset class="form">
        <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idMagasin', 'error')}">
            <label for="idMagasin">
                <g:message code="idMagasin.label" default="nom du magasin" />
            </label>
            <g:select name="idMagasin" from="${projet.Magasin.list()}" optionKey="id" value="${ReservationInstance? ReservationInstance.idMagasin : ''}" noSelection="['':'Choisir un magasin']" class="mySelect" />
        </div>

        <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'dateReservation', 'error')}">
            <label for="dateReservation">
                <g:message code="dateReservation.label" default="dateReservation" />
            </label>
            <g:textField name="dateReservation" value="${ReservationInstance?.dateReservation}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureDebut', 'error')}">
            <label for="heureDebut">
                <g:message code="heureDebut.label" default="heureDebut" />
            </label>
            <g:textField name="heureDebut" value="${ReservationInstance?.heureDebut}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureFin', 'error')}">
            <label for="heureFin">
                <g:message code="heureFin.label" default="heureFin" />
            </label>
            <g:textField name="heureFin" value="${ReservationInstance?.heureFin}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'nbPlace', 'error')}">
            <label for="nbPlace">
                <g:message code="nbPlace.label" default="nbPlace" />
            </label>
            <g:textField name="nbPlace" value="${ReservationInstance?.nbPlace}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idPersonne', 'error')}">
            <label for="idPersonne">
                <g:message code="idPersonne.label" default="idPersonne" />
            </label>
            <g:textField name="idPersonne" value="${ReservationInstance?.idPersonne}"/>
        </div>
    </fieldset>
<fieldset class="buttons">
    <g:submitButton name="Ajouter" class="create" />
    </fieldset>
</g:form>
</body>
</html>