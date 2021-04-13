<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Gestiones Asignacion</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <link rel="shortcut icon" href="image/logoSicsa/icon-sicsa.png">
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <script type="text/javascript" src="js/arcade-excel.js"></script>

        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-gestion.js"></script>

        <style>
            td, th {
                padding: 5px 5px;
            }
        </style>

    </head>
    <body>

        <div class="row">
            <div class="col s12 m12 l12 blue-grey white-text">
                <div class="col s12 m6 l6">
                    <h5>Reporte de Gestiones</h5>
                </div>
            </div>
            <div class="col s12">

                <div class="input-field col s2">
                    <select id="id_region" name="id_region"></select>
                    <label>Region:</label>
                </div>

                <div class="input-field col s2">
                    <input id="desde" name="desde" type="text" class="datepicker" readonly="">
                    <label for="desde">Desde:</label>
                </div>

                <div class="input-field col s2">
                    <input id="hasta" name="desde" type="text" class="datepicker" readonly="">
                    <label for="hasta">Hasta:</label>
                </div>

                <div class="input-field col s4">
                    <a id="enviar" class="waves-effect waves-light btn blue"><i class="material-icons right">send</i>Consultar</a>
                    <a onclick="tableToExcel('div_reporte', 'GESTIONES POR ASIGNACION')" class="waves-effect waves-light btn green"><i class="material-icons right">explicit</i>Exportar</a>
                </div>

            </div>
            <div class="col s12 m12 l12">
                <div id="div_reporte" class="col s12 z-depth-1" style="max-height: 60vh;overflow: auto;"></div>
            </div>


        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript">


                        $(document).ready(function () {
                            $('.tabs').tabs();
                            $('select').formSelect();
                            $(".dropdown-trigger").dropdown({constrainWidth: false});
                            $('.collapsible').collapsible();
                            $('.tooltipped').tooltip();
                            $('.datepicker').datepicker({
                                container: "body",
                                selectMonths: true, // Creates a dropdown to control month
                                selectYears: 15, // Creates a dropdown of 15 years to control year,
                                today: 'Today',
                                clear: 'Clear',
                                close: 'Ok',
                                autoClose: true,
                                closeOnSelect: true, // Close upon selecting a date,
                                format: "yyyy-mm-dd"
                            });
                            $('.timepicker').timepicker({
                                default: 'now', // Set default time: 'now', '1:30AM', '16:30'
                                fromnow: 0, // set default time to * milliseconds from now (using with default = 'now')
                                twelvehour: false, // Use AM/PM or 24-hour format
                                donetext: 'OK', // text for done-button
                                cleartext: 'Clear', // text for clear-button
                                canceltext: 'Cancel', // Text for cancel-button,
                                container: "body", // ex. 'body' will append picker to body
                                autoclose: false, // automatic close timepicker
                                ampmclickable: true, // make AM PM clickable
                                aftershow: function () {} //Function for after opening timepicker
                            });
                            select_region_combo_materialize(1, "id_region", true);
                            fecha_hoy("fecha");

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
                        $("#insert_xxyyzz").live("click", function () {
                            insert_xxyyzz($("#xxyyzz_insert").val());
                        });
                        //==================================================================
                        $(".delete_xxyyzz").live("click", function () {
                            var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                            if (confirma) {
                                delete_xxyyzz($(this).closest("tr").attr("id"));
                            }
                        });
                        //==================================================================
                        $("#enviar").on("click", function () {
                            select_reporte_gestiones_region($("#id_region").val(), $("#desde").val(), $("#hasta").val(), "div_reporte");
                        });
                        //==================================================================
                        // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>