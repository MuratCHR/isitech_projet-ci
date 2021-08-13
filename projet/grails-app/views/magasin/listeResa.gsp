<%@ page import="projet.MagasinController" %>
<!doctype html>
<html lang="fr" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Réservation créneau</title>
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
                    <a class="nav-link active" aria-current="page" href="../../#">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../../magasin/index">Liste des magasins</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../../reservation/index">Réservation</a>
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
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="8deux8"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="9deux9"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="10deux10"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="11deux11"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="12deux12"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="13deux13"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="14deux14"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="15deux15"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)"  id="16deux16"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="17deux17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="8trois8"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="9trois9"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="10trois10"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="11trois11"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="12trois12"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="13trois13"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="14trois14"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="15trois15"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="16trois16"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="17trois17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="8quatre8"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="9quatre9"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="10quatre10"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="11quatre11"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="12quatre12"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="13quatre13"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="14quatre14"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="15quatre15"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="16quatre16"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="17quatre17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="8cinq8"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="9cinq9"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="10cinq10"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="11cinq11"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="12cinq12"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="13cinq13"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="14cinq14"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="15cinq15"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="16cinq16"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="17cinq17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="8six8"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="9six9"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="10six10"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="11six11"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="12six12"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="13six13"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="14six14"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="15six15"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="16six16"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="17six17"></li>
            </ul>
            <ul class="time-slot">
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="8sept8"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="9sept9"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="10sept10"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="11sept11"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="12sept12"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="13sept13"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="14sept14"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="15sept15"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="16sept16"></li>
                <li class="time-slot-item" onclick="getIdClick(this.id)" id="17sept17"></li>
            </ul>


<script>
    var listHoraires = []
</script>
<g:each in="${getByHoraire}" var="r" id="1">
    <g:if test="${r.'placeRestantes' == null}">
        ${magasinInstance.placeTotale}
        <script>
            listHoraires.push(${magasinInstance.placeTotale})
        </script>
    </g:if>
    <g:else>
        ${r.'placeRestantes'}
        <script>
            listHoraires.push(${r.'placeRestantes'})
        </script>
    </g:else>
</g:each>
            <script>

                for (let heure = 8; heure < 18; heure++) {
                    let heurePlusTrente = heure+1;
                    let text = heure + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                    let variable = heure+"prem"+heure
                    document.getElementById(variable).innerHTML = text;
                    document.getElementById(variable).setAttribute('value', heure + ' ' + heurePlusTrente);

                }

                for (let heure = 18; heure < 28; heure++) {
                    console.log(heure)
                    let heurePlusTrente = heure + 1 - 10 ;
                    let text = heure - 10 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                    let heuremoinsDix = heure-10
                    let variable1 = heuremoinsDix + "deux" + heuremoinsDix
                    document.getElementById(variable1).innerHTML = text;
                    document.getElementById(variable1).setAttribute('value', heure + ' ' + heurePlusTrente);
                }

                for (let heure = 28; heure < 38; heure++) {
                    let heurePlusTrente = heure + 1 - 20 ;
                    let text = heure - 20 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                    let heuremoinsDix = heure-20
                    let variable1 = heuremoinsDix + "trois" + heuremoinsDix
                    document.getElementById(variable1).innerHTML = text;
                    document.getElementById(variable1).setAttribute('value', heure + ' ' + heurePlusTrente);
                }

                for (let heure = 38; heure < 48; heure++) {
                    let heurePlusTrente = heure + 1 - 30 ;
                    let text = heure - 30 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                    let heuremoinsDix = heure-30
                    let variable1 = heuremoinsDix + "quatre" + heuremoinsDix
                    document.getElementById(variable1).innerHTML = text;
                    document.getElementById(variable1).setAttribute('value', heure + ' ' + heurePlusTrente);
                }


                for (let heure = 48; heure < 58; heure++) {
                    let heurePlusTrente = heure + 1 - 40 ;
                    let text = heure - 40 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                    let heuremoinsDix = heure-40
                    let variable1 = heuremoinsDix + "cinq" + heuremoinsDix
                    document.getElementById(variable1).innerHTML = text;
                    document.getElementById(variable1).setAttribute('value', heure + ' ' + heurePlusTrente);
                }

                for (let heure = 58; heure < 68; heure++) {
                    let heurePlusTrente = heure + 1 - 50 ;
                    let text = heure - 50 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                    let heuremoinsDix = heure-50
                    let variable1 = heuremoinsDix + "six" + heuremoinsDix
                    document.getElementById(variable1).innerHTML = text;
                    document.getElementById(variable1).setAttribute('value', heure + ' ' + heurePlusTrente);
                }

                for (let heure = 68; heure < 78; heure++) {
                    let heurePlusTrente = heure + 1 - 60;
                    let text = heure - 60 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                    let heuremoinsDix = heure-60
                    let variable1 = heuremoinsDix + "sept" + heuremoinsDix
                    document.getElementById(variable1).innerHTML = text;
                    document.getElementById(variable1).setAttribute('value', heure + ' ' + heurePlusTrente);
                }
            </script>
        </div>
    </div>


    <g:each in="${results}" var="r" id="1">
        <g:if test="${r.'ouvertLeMidi' == '0'}">
            <script type="text/javascript">
                var btnCopy = document.getElementById("12prem12");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("12prem12").style.cssText = 'background-color:#C9C9C9;';

                btnCopy = document.getElementById("12deux12");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("12deux12").style.cssText = 'background-color:#C9C9C9;';

                btnCopy = document.getElementById("12trois12");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("12trois12").style.cssText = 'background-color:#C9C9C9;';

                btnCopy = document.getElementById("12quatre12");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("12quatre12").style.cssText = 'background-color:#C9C9C9;';

                btnCopy = document.getElementById("12cinq12");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("12cinq12").style.cssText = 'background-color:#C9C9C9;';

                btnCopy = document.getElementById("12six12");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("12six12").style.cssText = 'background-color:#C9C9C9;';

                btnCopy = document.getElementById("12sept12");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("12sept12").style.cssText = 'background-color:#C9C9C9;';


                btnCopy = document.getElementById("13prem13");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("13prem13").style.cssText = 'background-color:#C9C9C9;';
                btnCopy = document.getElementById("13deux13");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("13deux13").style.cssText = 'background-color:#C9C9C9;';
                btnCopy = document.getElementById("13trois13");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("13trois13").style.cssText = 'background-color:#C9C9C9;';
                btnCopy = document.getElementById("13quatre13");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("13quatre13").style.cssText = 'background-color:#C9C9C9;';
                btnCopy = document.getElementById("13cinq13");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("13cinq13").style.cssText = 'background-color:#C9C9C9;';
                btnCopy = document.getElementById("13six13");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("13six13").style.cssText = 'background-color:#C9C9C9;';
                btnCopy = document.getElementById("13sept13");
                btnCopy.className += " disabled";
                btnCopy.onclick = null;
                document.getElementById("13sept13").style.cssText = 'background-color:#C9C9C9;';
            </script>
        </g:if>
    </g:each>





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
.time-slot-item:hover{
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

    <g:if test="${fieldValue(bean: magasinInstance, field: "ouvertLeMidi") == 'false'}">
        <br><b>Pas ouvert entre 12 et 14h !</b><br>
    </g:if>


<script type="text/javascript">
    var ladate=new Date()
    var tab_mois=new Array("Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre");
    var getLeMoisSuivant = ladate.getMonth()


    var jourDeLaSemaine = new Date().toLocaleString('en-us', {  weekday: 'long' });
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1).get;
    //console.log("test affichage date : " + tomorrow.getUTCDate());


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

    function contientUnCreneau(array, nombreRepere) {
        var returnIdAndNombreRepere = []
        for (var i = 0; i < array.length; ++i) {
            if (parseInt(array[i]) === nombreRepere + 1) {
                console.log('Different de false')
                var longueurChiffreNB = parseInt(array[i]+1)
                var idRetourne = array[i].substring(longueurChiffreNB, array[i].toString().length - longueurChiffreNB);
                console.log(idRetourne)
                returnIdAndNombreRepere.push(nombreRepere+1)
                returnIdAndNombreRepere.push(idRetourne)
                return returnIdAndNombreRepere;
            }else if(parseInt(array[i]) === nombreRepere - 1){
                console.log('Different de false')
                var longueurChiffreNB = parseInt(array[i]).toString().length;
                var idRetourne = array[i].substring(longueurChiffreNB, array[i].toString().length - longueurChiffreNB);
                returnIdAndNombreRepere.push(nombreRepere-1)
                returnIdAndNombreRepere.push(idRetourne)
                return returnIdAndNombreRepere;
            }
        }
        return false;
    }

    function getOnlyId(array) {
        var onlyIdArray = []

        for (var i = 0; i < array.length; ++i) {
            var longueurChiffreNB = parseInt(array[i]).toString().length;
            var idRetourne = array[i].substring(longueurChiffreNB, array[i].toString().length - longueurChiffreNB);
            onlyIdArray.push(idRetourne)
        }

        return onlyIdArray
    }


    var compteur = 1;
    var listId = []
    var premierNombreRepere = 0;

    function getIdClick(clicked_id)
    {
        var x = document.getElementById(clicked_id).value;
        var id = clicked_id;
        console.log('ID : ' + id)
        listId.push(clicked_id);
        premierNombreRepere = parseInt(listId[0]);

        document.getElementById(listId[0]).style.cssText = 'background-color: #0279b3;border-color: #0279b3;color: #fff;';
        console.log('COMPTEUR : ' + compteur);
        console.log(parseInt(listId[listId.length - 1]) )
        console.log('Nombre repère : ' + premierNombreRepere)
        console.log('Liste : ' + listId);
        console.log('--------------------------')
        if(parseInt(listId[listId.length - 1]) + 1 === premierNombreRepere && compteur <= 2 && getOnlyId(listId)[0] == getOnlyId(listId)[listId.length-1] || parseInt(listId[listId.length - 1]) - 1 === premierNombreRepere && compteur <= 2 && getOnlyId(listId)[0] == getOnlyId(listId)[listId.length-1] || parseInt(listId[listId.length - 1]) === premierNombreRepere && compteur <= 2 && getOnlyId(listId)[0] == getOnlyId(listId)[listId.length-1] ) {

            if(hasDuplicates(listId)) {
                if(parseInt(clicked_id) === premierNombreRepere) {
                    console.log('petit deplicata horaire de base');
                    document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                    premierNombreRepere = premierNombreRepere+1
                    listId = []
                    compteur = 1;
                    console.log('Nombre repère : ' + premierNombreRepere)
                    listId.pop();

                }else {
                    console.log('petit deplicata');
                    listId.pop();
                    listId.pop();
                    console.log('Liste : ' + listId);
                    document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                }

            }else {
                console.log('1 de plus ou de moins');
                document.getElementById(clicked_id).style.cssText = 'background-color: #0279b3;border-color: #0279b3;color: #fff;';
                compteur++;
            }
        }

        if(compteur > 2 && hasDuplicates(listId)) {
            if(parseInt(clicked_id) === premierNombreRepere) {
                console.log('petit deplicata horaire de base');
                if(contientUnCreneau(listId, premierNombreRepere) !== false) {
                    console.log('Définition dun autre créneau de référence');
                    premierNombreRepere = contientUnCreneau(listId, premierNombreRepere)[0]
                    console.log('Nombre repère à présent : ' + premierNombreRepere)
                    var newNombreRepere = premierNombreRepere.toString() + contientUnCreneau(listId, premierNombreRepere)[1] + premierNombreRepere.toString()
                    console.log('Return function : ' + contientUnCreneau(listId, premierNombreRepere))
                    console.log('test affichage id : ' + contientUnCreneau(listId, premierNombreRepere)[1])
                    console.log('Nouvel id : ' + newNombreRepere)
                    listId = []

                    listId.push(newNombreRepere)
                    compteur = 1;
                }else {
                    console.log('Aucun créneau de référence')
                    premierNombreRepere = null;
                    listId = [];
                    compteur = 0;
                }
                document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                console.log('Nombre repère : ' + premierNombreRepere);

            }else {
                console.log('petit deplicata condition compteur > 2');
                listId.pop();
                listId.pop();
                console.log('Liste : ' + listId);
                document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                compteur = 1;
            }
        }
    }
</script>

</html>

<!--
SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = 1) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = 1 AND reservation.heureDebut = '12:00:01' AND reservation.dateReservation = '2021-08-10') as placeRestantes
-->
