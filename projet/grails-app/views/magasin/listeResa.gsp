<%@ page import="projet.MagasinController" %>
<!doctype html>
<html lang="fr" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Accueil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="logo_d2m-removebg.png"/>

    %{--    <asset:stylesheet src="application.css"/>--}%



    <!-- Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.js"></script>
    <style>
    #map { position: absolute; top: 100px; bottom: 0; width: 75%; }
    </style>

</head>


<%--
MENU NAVBAR
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand"><b>D2M</b></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarCollapse" style="">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="magasin/index">Liste des magasins</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="reservation/index">Réservation</a>
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

<!-- Remove the container if you want to extend the Footer to full width. -->
<body>

<br><br><br>
<script src="//cdn.jsdelivr.net/npm/less@4.1.1" >
</script>
<div class="time-picker-container" style="width: 100%">
    <h4 id="testChangeMonth" style="text-align: center">Aout 2021</h4>

    <script>
        var ladate=new Date()
        var tab_mois=new Array("Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre");
        var getLeMoisSuivant = ladate.getMonth()
        var dateDebut = ladate.getDate()
        var heureRealTime = ladate.getHours();
        var datePlusSix = ladate.setDate((ladate.getDate() + 6))
        document.getElementById("testChangeMonth").innerHTML = "Du " + dateDebut + " " + tab_mois[ladate.getMonth()] + " " + ladate.getFullYear() + " au " +  + ladate.getDate() + " " + tab_mois[ladate.getMonth(ladate.setDate((ladate.getDate() + 6)))] + " " + ladate.getFullYear();
        var jourDeLaSemaine = new Date().toLocaleString('en-us', {  weekday: 'long' });
    </script>


    <div class="time-picker">
        <div class="row time-picker-header">
            <ul class="date-slot">
                <li class="date-slot-wrapper">
                    <div class="date-slot-item">
                        <span class="date-slot-day" id="jour1">Lundi</span>
                        <span class="date-slot-date" id="dayjour1">11</span>
                    </div>
                </li>
                <li class="date-slot-wrapper">
                    <div class="date-slot-item">
                        <span class="date-slot-day" id="jour2">Mardi</span>
                        <span class="date-slot-date" id="dayjour2">12</span>
                    </div>
                </li>
                <li class="date-slot-wrapper">
                    <div class="date-slot-item">
                        <span class="date-slot-day" id="jour3">Mercredi</span>
                        <span class="date-slot-date" id="dayjour3">13</span>
                    </div>
                </li>
                <li class="date-slot-wrapper">
                    <div class="date-slot-item">
                        <span class="date-slot-day" id="jour4">Jeudi</span>
                        <span class="date-slot-date" id="dayjour4">14</span>
                    </div>
                </li>
                <li class="date-slot-wrapper">
                    <div class="date-slot-item no-free-slot">
                        <span class="date-slot-day" id="jour5">Vendredi</span>
                        <span class="date-slot-date" id="dayjour5">15</span>
                    </div>
                </li>
                <li class="date-slot-wrapper">
                    <div class="date-slot-item">
                        <span class="date-slot-day" id="jour6">Samedi</span>
                        <span class="date-slot-date" id="dayjour6">14</span>
                    </div>
                </li>
                <li class="date-slot-wrapper">
                    <div class="date-slot-item">
                        <span class="date-slot-day" id="jour7">Dimanche</span>
                        <span class="date-slot-date" id="dayjour7">14</span>
                    </div>
                </li>
            </ul>
        </div>

        <div class="row">
<!--
ICI FAIRE BOUCLE POUR AFFICHAGE HORAIRES
IF CONDITION POUR LE PREMIERJOUR : si heureactuelle > heure affichés, griser la case
-->
            <ul class="time-slot">
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="8prem8"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="9prem9"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="10prem10"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="11prem11"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="12prem12"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="13prem13"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="14prem14"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="15prem15"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="16prem16"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="17prem17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux8"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux9"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux10"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux11"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux12"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux13"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux14"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux15"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)"  id="deux16"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="deux17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois8"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois9"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois10"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois11"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois12"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois13"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois14"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois15"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois16"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="trois17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre8"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre9"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre10"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre11"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre12"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre13"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre14"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre15"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre16"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="quatre17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq8"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq9"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq10"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq11"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq12"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq13"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq14"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq15"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq16"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="cinq17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six8"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six9"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six10"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six11"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six12"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six13"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six14"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six15"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six16"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="six17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept8"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept9"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)"  id="sept10"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept11"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept12"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept13"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept14"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept15"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept16"></li>
                <li class="time-slot-item" onclick="this.style['background'] = '#0279b3'; this.style['border-color'] = '#0279b3';this.style['color'] = '#fff';getIdClick(this.id)" id="sept17"></li>
            </ul>
            <script>
                for (let heure = 8; heure < 18; heure++) {
                    let heurePlusTrente = heure+1;
                    // Ceci sera exécuté 5 fois
                    // À chaque éxécution, la variable "pas" augmentera de 1
                    // Lorsque'elle sera arrivée à 5, le boucle se terminera.
                    let text = heure + ':00' + ' - ' + heurePlusTrente + ':00'
                    let variable = heure+"prem"+heure
                    let variable1 = "deux"+heure
                    let variable2 = "trois"+heure
                    let variable3 = "quatre"+heure
                    let variable4 = "cinq"+heure
                    let variable5 = "six"+heure
                    let variable6 = "sept"+heure
                    document.getElementById(variable).innerHTML = text;
                    document.getElementById(variable).setAttribute('value', heure + ' ' + heurePlusTrente);
                    document.getElementById(variable1).innerHTML = text;
                    document.getElementById(variable1).setAttribute('value', heure + ' ' + heurePlusTrente);
                    document.getElementById(variable2).innerHTML = text;
                    document.getElementById(variable2).setAttribute('value', heure + ' ' + heurePlusTrente);
                    document.getElementById(variable3).innerHTML = text;
                    document.getElementById(variable3).setAttribute('value', heure + ' ' + heurePlusTrente);
                    document.getElementById(variable4).innerHTML = text;
                    document.getElementById(variable4).setAttribute('value', heure + ' ' + heurePlusTrente);
                    document.getElementById(variable5).innerHTML = text;
                    document.getElementById(variable5).setAttribute('value', heure + ' ' + heurePlusTrente);
                    document.getElementById(variable6).innerHTML = text;
                    document.getElementById(variable6).setAttribute('value', heure + ' ' + heurePlusTrente);
                }
            </script>
        </div>
    </div>

</div>
<style type="text/css">
.time-picker {
    margin: 10px;
}
.time-picker-header {
    position: relative;
}
.date-slot {
    list-style: none;
    padding: 0;
}
.date-slot-wrapper {
    width: 13%;
    text-align: center;
    float: left;
}
.date-slot-item {
    margin: 0 20px 10px;
    padding: 10px;
    border: 1px solid transparent;
}
.date-slot-item.active {
    border: 1px solid #0279b3;
}
.date-slot-item.no-free-slot > * {
    color: #666;
}
.date-slot-day,
.date-slot-date {
    display: block;
}
.date-slot-day {
    font-size: 16px;
    line-height: 24px;
    color: #666;
}
.date-slot-date {
    font-size: 24px;
    line-height: 36px;
    color: #000;
}
.time-slot {
    list-style: none;
    padding: 0;
    float: left;
    display: inline-block;
    width: 13%;
}
.time-slot-item {
    font-size: 14px;
    line-height: 22px;
    color: #666;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 10px;
    margin: 10px 20px;
    text-align: center;
    cursor: pointer;
}
.time-slot-item:hover, .time-slot-item:focus, .time-slot-item:active,
.time-slot-item.picked {
    background: #0279b3;
    border-color: #0279b3;
    color: #fff;
}


.time-picker-container {
    width: 900px;
    background: #fff;
    padding: 80px;
}
</style>
<script type="text/javascript">

    var ladate=new Date()
    var tab_mois=new Array("Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre");
    var getLeMoisSuivant = ladate.getMonth()


    var jourDeLaSemaine = new Date().toLocaleString('en-us', {  weekday: 'long' });
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1).get;
    console.log("test affichage date : " + tomorrow.getUTCDate());


    var tomorrow = new Date();
    var jourDeLaSemaine = new Date().toLocaleString('fr-fr', {  weekday: 'long' });

    var date = new Date();
    date.setDate(date.getDate() + 1);

    document.getElementById("jour1").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour1").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour2").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour2").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour3").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour3").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour4").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour4").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour5").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour5").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour6").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour6").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour7").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour7").innerHTML = tomorrow.getUTCDate();

</script>


</body>
</body>
<!-- Footer -->
<footer class="text-center text-white" style="background-color: #3f51b5">
    <!-- Grid container -->
    <div
            class="text-center p-3"
            style="background-color: rgba(0, 0, 0, 0.2)"
    >
        © 2021 Copyright Tous droits réservés
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->

<style type="text/css">
footer {
    position:fixed;
    left:0px;
    bottom:0px;
    width:100%;
}

</style>

<script>

    function hasDuplicates(array) {
        var valuesSoFar = Object.create(null);
        for (var i = 0; i < array.length; ++i) {
            var value = array[i];
            if (value in valuesSoFar) {
                return true;
            }
            valuesSoFar[value] = true;
        }
        return false;
    }

    var counter = 0;
    var listId = [];

    function getIdClick(clicked_id)
    {
        var x = document.getElementById(clicked_id).value;
        var id = clicked_id.substring(clicked_id.length-3, clicked_id.length);
        listId.push(id);

        if(counter < 2 && !hasDuplicates(listId)) {
            counter++;
            console.log('Insertion array');
            document.getElementById(clicked_id).style.cssText = 'background-color: #0279b3;border-color: #0279b3;color: #fff;';
        }else if(counter == 2) {
            if(hasDuplicates(listId)) {
                counter--;
                document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                listId.pop();
                listId.pop();
            }
        }else {
            document.getElementById(clicked_id).style.cssText = 'background-color: none;';
            if(counter >= 1) {
                counter--;
            }

            listId.pop();
            listId.pop();
        }

        console.log('COMPTEUR : ' + counter);
    }
</script>
</html>

<!--
SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = 1) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = 1 AND reservation.heureDebut = '12:00:01' AND reservation.dateReservation = '2021-08-10') as placeRestantes

-->