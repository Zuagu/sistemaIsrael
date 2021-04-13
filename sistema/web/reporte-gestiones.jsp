<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Reporte de Gestiones</title>
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

        <script type="text/javascript" src="js/arcade-gestion.js"></script>
        <script type="text/javascript" src="js/arcade-sucursal.js"></script>
        <script type="text/javascript" src="js/arcade-pesos.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>

        <style>
            #tabla_promesado > thead > tr {
                background-color: #000;
                color: white;
            }
        </style>

    </head>
    <body>

        <div class="row">
            <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div class="col s12 m12 l12 blue-grey white-text">
                <div class="col s12 m6 l6">
                    <h5>Reporte de Gestiones</h5>
                </div>
                
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->

            <div class="col s12 m12 l12">
                <input id="columna" type='hidden' value="cuentas">
                <input id="orden" type='hidden' value="asc">

                <div class="input-field col s2">
                    <input id="fecha_inicio" type="text" class="datepicker" readonly>
                    <label>Desde:</label>
                </div>
                <div class="input-field col s2">
                    <input id="fecha_fin" type="text" class="datepicker" readonly>
                    <label>Hasta:</label>
                </div>

                <div class="input-field col s2">
                    <select id="id_sucursal"></select>
                    <label>Sucursal</label>
                </div>
                
                <div class="input-field col s4">
                    <a id="select_reporte_gestiones" class="btn waves-effect blue">OBTENER/ACTUALIZAR REPORTE</a>
                    <a id="select_reporte_gestiones"  onclick="tableToExcel('tabla_promesado', 'REPORTE DE GESTIONES')" class="btn waves-effect green">EXPORTAR</a>
                </div>
                
                

                <br>
                <div id="listado_indicador" class="col s12 m12 l12 z-depth-1" style="max-height: 50vh;overflow: auto;"></div>

                <br>
                <!--<input type="button" value="EXPORTAR A EXCEL" class="sombra" style="margin-left: 3%;background:#1F804D;color:#FFF;font-weight: bold;">-->
                <div id="resumen_convenios" style="width: 74%;text-align: right;float: right;margin-right: 3%;font-size:1.8rem;font-weight: bold;"></div>
                <!--END CONTENT-->

                <!--END PAGE WRAPPER-->
            </div>

        </div>


        <!--CORE JAVASCRIPT-->
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript">
                    // ARCADE Software®
                    //==================================================================
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
                        fecha_hoy('fecha_inicio');
                        fecha_hoy('fecha_fin');

                        select_sucursal_combo_reporte_gestiones("id_sucursal");
                    }
                    );
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
                    $("#select_reporte_gestiones").click(function () {
                        select_reporte_gestiones(
                                $("#id_sucursal").val(),
                                $("#fecha_inicio").val(),
                                $("#fecha_fin").val(),
                                $("#columna").val(),
                                $("#orden").val(),
                                "listado_indicador"
                                );
                    });
                    //==================================================================
                    $(".delete_indicador").live("click", function () {
                        var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                        if (confirma) {
                            delete_indicador($(this).closest("tr").attr("id"));
                        }
                    });
                    //==================================================================
                    $(".th_orden").live("click", function () {
                        var _text = $(this).text();
                        _text = _text.toLowerCase();
                        $("#columna").val(_text);

                        if ($("#orden").val() == "desc") {
                            $("#orden").val('asc');
                        } else {
                            $("#orden").val('desc');
                        }

                        select_reporte_gestiones2(
                                $("#id_sucursal").val(),
                                $("#fecha_inicio").val(),
                                $("#fecha_fin").val(),
                                $("#columna").val(),
                                $("#orden").val(),
                                "listado_indicador"
                                );

                    });
                    //==================================================================
                    // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>