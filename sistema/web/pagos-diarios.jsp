<%-- 
    Document   : pagos-diarios
    Created on : 3/04/2018, 12:12:54 PM
    Author     : sic16030
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Recuperacion</title>
        <link rel="shortcut icon" href="image/logoSicsa/icon-sicsa.png">
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">

        <!--HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script>
        <script type="text/javascript" src="highcharts/exporting.js"></script>
        <!--HIGHCHARTS-->

        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-pagocuenta.js"></script>
        <script type="text/javascript" src="js/arcade-clientes.js"></script>

        <style>
            .innerb {
                overflow: auto;
                height: 25em;
            }

            .innerb_recuperacion {
                overflow: auto;
                height: 24em;

            }

            .show_print {
                display: none;
            }

            .align_center {
                text-align: center !important;
            }

            .margin_0 {

                margin: 0px !important;
            }

            @media print {
                .hide_print {
                    display: none !important;
                }

                .show_print {
                    display: block;
                }

                iframe {
                    height: 98% !important;
                }

                table {
                    font-size: 8px !important;
                }

                #datos_tabla4 {
                    width: 97% !important;
                    font-weight: bold;
                }
            }
        </style>

    </head>

    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">

            <!--BEGIN CONTENT-->
            <!-- row linea si solo ocupas un div con la mitad o menos del tamaño pon un row siguiente y salta a la siguiente-->
            <!--Recuerda que la pantalla se divide en 12 dependiendo del col s que uses 12 como 100% -->
            <div class="show_print">
                <div class="row">
                    <div class="col s3 align_center">
                        <h6 class="margin_0"><img src="images/TELCEL.png" style=" height:52px ; width:82px;"></h6>
                    </div>
                    <div class="col s6 align_center">
                        <h5 class="margin_0">Estadistica Telcel</h5>
                        <h5 class="margin_0" id="region_titulo"></h5>
                    </div>
                    <div class="col s3 align_center">
                        <h5 class="margin_0"><img src="images/SICSA.png" style=" height:52px ; width:82px;"></h5>
                    </div>

                </div>
                <div class="row">
                    <div class="col s3">
                        <p class="align_center margin_0"></p>
                        <p class="align_center margin_0"></p>
                    </div>
                    <div class="col s2">
                        <p id="fecha_print" class="align_center margin_0"></p>
                    </div>
                    <div class="col s2">
                        <p id="dia_print" class="align_center margin_0"></p>
                    </div>
                    <div class="col s2">
                        <p id="porcentaje_2" class="align_center margin_0">Meta: 35%</p>
                    </div>

                    <div class="col s3">
                        <p class="align_center margin_0"></p>
                    </div>
                </div>
            </div>

            <!-- ------------------------------------------------------------------------------------------------------------------- -->

            <ul id="tabs-swipe-demo" class="tabs">
                <li class="tab col s2"><a class="active" href="#test-swipe-1" style="color:#db040e">Pagos Diarios</a></li>
                <li class="tab col s2"><a class="active" href="#test-swipe-2" style="color:#db040e">Recuperacion Diaria</a></li>
                <li class="tab col s2"><a class="active" href="#test-swipe-3" style="color:#db040e">Estadísitica</a></li>
                <li class="tab col s2"><a class="active" href="#test-swipe-4" style="color:#db040e">Estadísitica Diaria</a></li>
                <li class="tab col s2"><a class="active" href="#test-swipe-5" style="color:#db040e">Recuperacion por Gestor</a></li>
                <li class="tab col s2"><a class="active" href="#test-swipe-6" style="color:#db040e">extra</a></li>
            </ul>
            <!-- ------------------------------------------------------------------------------------------------------------------- -->
            <div id="test-swipe-1" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s12">
                        <div class="input-field col s2 offset-s1">
                            <select id="id_region" name="id_region"></select>
                            <label for="id_region">REGION</label>
                        </div>

                        <div class="input-field col s2">
                            <input id="desde" type="text" class="datepicker">
                            <label for="desde">DESDE</label>
                        </div>

                        <div class="input-field col s2">
                            <input id="hasta" type="text" class="datepicker">
                            <label for="hasta">HASTA</label>
                        </div>

                        <div class="input-field col s2">
                            <a id="enviar" class="waves-effect waves-light btn blue"><i class="material-icons">send</i></a>
                            <a onclick="tableToExcel('datos_tabla', 'PAGOS DIARIOS')" class="waves-effect waves-light btn green"><i class="material-icons">explicit</i></a>
                        </div>

                    </div>
                    <div id="datos_tabla" class="col s12 z-depth-2"></div>
                </div>
            </div>
            <!-- ------------------------------------------------------------------------------------------------------------------- -->
            <div id="test-swipe-2" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s12">
                        <div class="input-field col s2 offset-s1">
                            <select id="id_region2"></select>
                            <label for="id_region2">REGION</label>
                        </div>

                        <div class="input-field col s2">
                            <input id="desde2" type="text" class="datepicker">
                            <label for="desde2">FECHA</label>
                        </div>


                        <div class="input-field col s2">
                            <a id="enviar2" class="waves-effect waves-light btn blue"><i class="material-icons">send</i></a>
                            <a onclick="tableToExcel('datos_tabla2', 'RECUPERADO DIARIOS')" class="waves-effect waves-light btn green"><i class="material-icons">explicit</i></a>
                        </div>
                    </div>
                    <div id="datos_tabla2" class="col s10 offset-s1  z-depth-2" style="margin-top:10px;">

                    </div>
                </div>
            </div>
            <!-- ------------------------------------------------------------------------------------------------------------------- -->
            <div id="test-swipe-3" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s12">
                        <div class="input-field col s2 offset-s1">
                            <select id="id_region3" name="id_region3"></select>
                            <label for="id_region3">REGION</label>
                        </div>
                        <div class="input-field col s2">
                            <a id="enviar3" class="waves-effect waves-light btn blue"><i class="material-icons">send</i></a>
                            <a onclick="tableToExcel('datos_tabla3', 'ESTADISTICA')" class="waves-effect waves-light btn green"><i class="material-icons">explicit</i></a>
                        </div>
                    </div>
                    <div id="datos_tabla3" class="col s12 z-depth-2" style="margin-top:10px;">

                    </div>
                </div>
            </div>
            <!-- ------------------------------------------------------------------------------------------------------------------- -->
            <div id="test-swipe-4" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s12">
                        <div class="input-field col s2 offset-s1">
                            <select id="id_region4"></select>
                            <label>REGION</label>
                        </div>
                        <div class="input-field col s2">
                            <input id="hasta4" type="text" class="datepicker">
                            <label for="hasta4">FECHA</label>
                        </div>
                        <div class="input-field col s3">
                            <a id="enviar4" class="waves-effect waves-light btn blue"><i class="material-icons">send</i></a>
                            <a onclick="tableToExcel('datos_tabla4', 'ESTADISTICA DIARIA')" class="waves-effect waves-light btn green"><i class="material-icons">explicit</i></a>
                            <a id="print" class="waves-effect waves-light btn grey darken-3"><i class="material-icons">print</i></a>
                        </div>
                    </div>
                    <div id="datos_tabla4" class="col s12 z-depth-2" style="margin-top:10px; font-size:9px !important;font-weight: bold;">
                    </div>
                </div>
            </div>
            <!-- ------------------------------------------------------------------------------------------------------------------- -->
            <div id="test-swipe-5" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s12">
                        <div class="input-field col s2 offset-s1">
                            <select id="id_region5">

                            </select>
                            <label>REGION</label>
                        </div>

                        <div class="input-field col s2">
                            <select id="tipo_recuperacion">
                                <option>DIRECTA</option>
                                <option>INDIRECTA</option>
                            </select>
                            <label>TIPO DE RECUPERACION</label>
                        </div>

                        <div class="input-field col s2">
                            <input id="desde5" type="text" class="datepicker">
                            <label for="desde5">DESDE</label>
                        </div>

                        <div class="input-field col s2">
                            <input id="hasta5" type="text" class="datepicker">
                            <label for="hasta5">HASTA</label>
                        </div>

                        <div class="input-field col s2">
                            <a id="enviar5" class="waves-effect waves-light btn blue"><i class="material-icons">send</i></a>
                            <a onclick="tableToExcel('datos_tabla5', 'RECUPERACION POR GESTOR')"
                               class="waves-effect waves-light btn green"><i class="material-icons">explicit</i></a>
                            <a id="print" class="waves-effect waves-light btn grey darken-3"><i class="material-icons">print</i></a>
                        </div>
                    </div>
                    <div id="datos_recuperacion" class="col s10 z-depth-2 offset-s1" style="margin-top:10px; font-size: 13px; font-weight: bold;">
                        <table id="tb_datos_recuperacion">
                            <thead>
                                <tr>
                                    <th><i>swap_vert</i>ID USUARIO</th>
                                    <th onclick="sortTable(1, 'str');"><i class="tiny material-icons right">swap_vert</i>USUARIO</th>
                                    <th onclick="sortTable(2, 'int');"><i class="tiny material-icons right">swap_vert</i>CUENTAS</th>
                                    <th class="right-align" onclick="sortTable(3, 'int');"><i class="tiny material-icons right">swap_vert</i>PROMESADO</th>
                                    <th class="right-align" onclick="sortTable(4, 'int');"><i class="tiny material-icons right">swap_vert</i>RECUPERADO</th>
                                    <th class="right-align" onclick="sortTable(5, 'int');"><i class="tiny material-icons right">swap_vert</i>META</th>
                                    <th class="right-align" onclick="sortTable(6, 'int');"><i class="tiny material-icons right">swap_vert</i>SUMA</th>
                                    <th class="right-align" onclick="sortTable(7, 'int');"><i class="tiny material-icons right">swap_vert</i>PORCENTAJE</th>
                                </tr>
                            </thead>
                            <tbody id="tbody_tabla_recuperacion">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- ------------------------------------------------------------------------------------------------------------------- -->
            <div id="test-swipe-6" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s12">
                        <div class="input-field col s2 offset-s1">
                            <select id="id_region6" name="id_region3"></select>
                            <label>REGION</label>
                        </div>

                        <div class="input-field col s2">
                            <input id="hasta4" type="text" class="datepicker"></td>
                            <label for="hasta4">FECHA</label>
                        </div>

                        <div class="input-field col s5">

                            <a id="enviar4" class="waves-effect waves-light btn blue"><i class="material-icons">send</i></a>
                            <a onclick="tableToExcel('datos_tabla4', 'ESTADISTICA DIARIA')" class="waves-effect waves-light btn green"><i class="material-icons">explicit</i></a>
                            <a id="print" class="waves-effect waves-light btn grey darken-3"><i class="material-icons">print</i></a>
                        </div>
                    </div>
                    <div id="datos_tabla6" class="col s10 z-depth-2 offset-s1" style="margin-top:10px; font-size:9px !important;font-weight: bold;">
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>

        <script type="text/javascript">

                                $(document).ready(function () {
                                    $('.fixed-action-btn').floatingActionButton();
                                    $('select').formSelect();
                                    $('.modal').modal();
                                    $(".dropdown-trigger").dropdown({constrainWidth: false});
                                    $('.sidenav').sidenav();

                                    $('.collapsible').collapsible();
                                    $('.tooltipped').tooltip({margin: 20});

                                    $('.tabs').tabs();
                                    $('.datepicker').datepicker({
                                        container: "body",
                                        selectMonths: true,
                                        selectYears: 15,
                                        today: 'Today',
                                        clear: 'Clear',
                                        close: 'Ok',
                                        autoClose: true,
                                        closeOnSelect: true,
                                        format: "yyyy-mm-dd"
                                    });
                                    $('.timepicker').timepicker({
                                        default: 'now',
                                        twelveHour: false,
                                        container: 'body'
                                    });

                                    select_region_list_combo_materialize(1, ["id_region", "id_region2", "id_region3", "id_region4", "id_region5", "id_region6"], true)

                                });
                                //==================================================================
                                $(".help").on("click", function () {
                                    var src = location.href;
                                    var aux;
                                    var jsp;
                                    aux = src.split('/sistema/');
                                    jsp = aux[1];
                                    jsp = jsp.replace('.jsp', '');
                                    window.open("ayuda.jsp?tema=" + jsp, "_blank");
                                });
                                //==================================================================
                                $("#enviar").on("click", function () {
                                    select_pagos_diarios_tabla($("#id_region").val(), $("#desde").val(), $("#hasta").val(), "datos_tabla");
                                });
                                //=================================================================={
                                $("#enviar2").on("click", function () {
                                    select_reporte_recuperacion_previa($("#id_region2").val(), $("#desde2").val(), "datos_tabla2");
                                });
                                //==================================================================
                                $("#enviar3").on("click", function () {
                                    select_reporte_estadistica($("#id_region3").val(), "datos_tabla3");
                                });
                                $("#id_region4").change(function () {
                                    if ($("#id_region4").val() == "2") {
                                        $("#porcentaje_2").text("Meta: 30%");
                                    }
                                });
                                //==================================================================
                                $("#enviar4").on("click", function () {
                                    select_reporte_estadistica_diaria($("#id_region4").val(), $("#hasta4").val(), "datos_tabla4");
                                    $("#fecha_print").text($("#hasta4").val());
                                    var region = $("#id_region4").val();
                                    if (region == 1) {
                                        $("#region_titulo").text("Monterrey");
                                    }
                                    if (region == 2) {
                                        $("#region_titulo").text("Chihuahua");
                                    }
                                    if (region == 6) {
                                        $("#region_titulo").text("Puebla");
                                    }
                                    ;
                                    //fecha que se mand
                                    var d = new Date($("#hasta4").val());
                                    //resta de dias 
                                    //d.setDate(d.getDate() - 1 );

                                    var nom_dia = ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"];

                                    // se calcula el dia de la semana
                                    var n = d.getUTCDay();
                                    // se muestran los valores
                                    document.getElementById("dia_print").innerHTML = nom_dia[n];
                                });
                                //==================================================================
                                $("#enviar5").on("click", function () {

                                    let id_region = $("#id_region5").val();
                                    let tipo = $("#tipo_recuperacion").val();
                                    let desde = $("#desde5").val();
                                    let hasta = $("#hasta5").val();
                                    select_reporte_recuperacion(id_region, tipo, desde, hasta, "tbody_tabla_recuperacion");
                                });
                                //==================================================================
                                $("#print").on("click", function () {

                                    window.focus();
                                    window.print();

                                });
                                
                                
                                
                                /**
                                 * Funcion para ordenar una tabla... tiene que recibir el numero de columna a
                                 * ordenar y el tipo de orden
                                 * @param int n
                                 * @param str type - ['str'|'int']
                                 */
                                function sortTable(n, type) {
                                    let table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;

                                    table = document.getElementById("tb_datos_recuperacion");
//                                    console.log(table);
                                    switching = true;
                                    //Set the sorting direction to ascending:
                                    dir = "asc";

                                    /*Make a loop that will continue until no switching has been done:*/
                                    while (switching) {
                                        //start by saying: no switching is done:
                                        switching = false;
                                        rows = table.rows;
                                        /*Loop through all table rows (except the first, which contains table headers):*/
                                        for (i = 1; i < (rows.length - 1); i++) {
                                            //start by saying there should be no switching:
                                            shouldSwitch = false;
                                            /*Get the two elements you want to compare, one from current row and one from the next:*/
                                            x = rows[i].getElementsByTagName("td")[n];
                                            y = rows[i + 1].getElementsByTagName("td")[n];
                                            /*check if the two rows should switch place, based on the direction, asc or desc:*/
                                            if (dir === "asc") {
                                                if ((type === "str" && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) || (type === "int" && parseFloat(x.innerHTML) > parseFloat(y.innerHTML))) {
                                                    //if so, mark as a switch and break the loop:
                                                    shouldSwitch = true;
                                                    break;
                                                }
                                            } else if (dir === "desc") {
                                                if ((type === "str" && x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) || (type === "int" && parseFloat(x.innerHTML) < parseFloat(y.innerHTML))) {
                                                    //if so, mark as a switch and break the loop:
                                                    shouldSwitch = true;
                                                    break;
                                                }
                                            }
                                        }
                                        if (shouldSwitch) {
                                            /*If a switch has been marked, make the switch and mark that a switch has been done:*/
                                            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                                            switching = true;
                                            //Each time a switch is done, increase this count by 1:
                                            switchcount++;
                                        } else {
                                            /*If no switching has been done AND the direction is "asc", set the direction to "desc" and run the while loop again.*/
                                            if (switchcount === 0 && dir == "asc") {
                                                dir = "desc";
                                                switching = true;
                                            }
                                        }
                                    }
                                }
                                //==================================================================


        </script>

    </body>

</html>