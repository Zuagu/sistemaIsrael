<%-- 
    Document   : reporte-convenios
    Created on : Sep 7, 2017, 5:20:21 PM
    Author     : LuiS Cortez

    SE VAN A RESPETAR LOS PAGOS A LAS CUENTAS 2 DIAS MAS DESPUES DE QUE SE INCUMPLA.
    UN PAGO SE VA A CONSIDIRAR COMO PAGADO SI SE CUBRE EL 90% DEL IMPORTE ESTABLECIDO EN EL CONVENIO.
    REGION, NO. PROMESAS, TOTAL, RECUPERADO, PORCENTAJE, 2 SEMANAS SIGUIENTES...

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Gestor</title>
        <link rel="shortcut icon" href="image/logoSicsa/icon-sicsa.png">
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>        


        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <script type="text/javascript" src="js/arcade-convenio.js"></script>
        <script type="text/javascript" src="js/arcade-pesos.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-marcacion.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <style>
            td, th {
                padding: 2px 3px;
            }
            </style>

        </head>
        <body>

            <div class="row">

                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div class="col s12 m12 l12 blue-grey white-text">
                    <div class="col s12 m6 l6">
                        <h5>
                            Reporte de Convenios
                        </h5>
                    </div>
                    
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->

                <div class="col s12 m12 l12">

                    <div class="input-field col s2">
                        <select id="id_cliente"></select>
                        <label>Cliente:</label>
                    </div>

                    <div class="input-field col s2">
                        <select id="id_region"></select>
                        <label>Cliente:</label>
                    </div>

                    <div class="input-field col s2">
                        <input id="desde" type="text" class="datepicker" readonly>
                        <label>Desde:</label>
                    </div>

                    <div class="input-field col s2">
                        <input id="hasta" type="text" class="datepicker" readonly>
                        <label>Hasta:</label>
                    </div>

                    <div class="input-field col s3">
                        <select id="id_reporte">
                            <option value="1">PRODUCCION DE PROMESAS</option>
                            <option value="2">ESTIMADO A COBRAR</option>
                        </select>
                        <label>Ver:</label>
                    </div>

                    <div class="input-field col s1">
                        <a id="select_convenio_tabla" class="btn waves-effect blue" style="display: none;">Enviar</a>
                    </div>



                    <!--<input id='select_convenio_tabla' type="button" value="OK" style="width: 46px;display: none;">-->



                    <!--BEGIN CONTENT-->
                    <br>
                    <div id="listado_convenios" class="col s12 m12 l12 z-depth-1" style="height: 50vh; overflow: auto; margin-bottom: 1rem;"></div>

                    <br>

                    <div id="select_convenio_agrupado_tabla" style="margin: 0 0 0 3%;text-align: left;float: left;">
                        <a class="btn waves-effect">AGRUPAR POR GESTOR</a>
                        <!--<input type="button" value="AGRUPAR POR GESTOR">-->
                    </div>
                    <div style="margin: 0 0 0 1%;width: 4%;text-align: left;float: left;">
                        <!--<input onclick="tableToExcel('tabla_convenios', 'LISTADO DE CONVENIOS')" type="button" value="XLSX" class="sombra" style="width: 100%;background:#1F804D;color:#FFF;border-radius:3px;padding: 5px 10px;border:none;">-->
                        <a onclick="tableToExcel('tabla_convenios', 'LISTADO DE CONVENIOS')" class="btn waves-effect">XLSX</a>
                    </div>

                    <div id="resumen_convenios" style="margin: 0px auto;width: 74%;text-align: right;float: right;margin-right: 3%;"></div>
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



                                select_clientes_combo("id_cliente", true);
                                fecha_hoy("desde");
                                fecha_hoy("hasta");
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
                            $("#id_region").change(function () {
                                select_convenio_tabla(
                                        1,
                                        $("#id_cliente").val(),
                                        $("#id_region").val(),
                                        $("#desde").val(),
                                        $("#hasta").val(),
                                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                        "listado_convenios"
                                        );
                            });
                            //==================================================================
                            $("#id_cliente").change(function () {
                                select_region_combo($("#id_cliente").val(), "id_region", true);
                                $("#select_convenio_tabla").show();
                            });

                            //==================================================================
                            $("#id_cliente").change(function () {
                                select_region_combo($("#id_cliente").val(), "id_region", true);
                                $("#select_convenio_tabla").show();
                            });
                            //==================================================================
                            $("#select_convenio_tabla").click(function () {
                                if ($("#id_region").val() == null) {
                                    alert("SELECCIONE UN CLIENTE...");
                                } else {
                                    // TRAER TODOS LOS CONVENIOS BAJO LAS CARACTERISTICAS SOLICITADAS
                                    select_convenio_tabla(
                                            1,
                                            $("#id_cliente").val(),
                                            $("#id_region").val(),
                                            $("#desde").val(),
                                            $("#hasta").val(),
                                            $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                            "listado_convenios"
                                            );
                                }
                            });
                            //==================================================================
                            $("#select_convenio_agrupado_tabla").click(function () {
                                if ($("#id_region").val() == null) {
                                    alert("SELECCIONE UN CLIENTE...");
                                } else {
                                    // TRAER TODOS LOS CONVENIOS BAJO LAS CARACTERISTICAS SOLICITADAS
                                    select_convenio_agrupado_tabla(
                                            1,
                                            $("#id_cliente").val(),
                                            $("#id_region").val(),
                                            $("#desde").val(),
                                            $("#hasta").val(),
                                            $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                            "listado_convenios"
                                            );
                                }
                            });
                            //==================================================================
                            $("#number").on({
                                "focus": function (event) {
                                    $(event.target).select();
                                },
                                "keyup": function (event) {
                                    $(event.target).val(function (index, value) {
                                        return value.replace(/\D/g, "")
                                                .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                                                .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
                                    });
                                }
                            });
                            //==================================================================
                            // ARCADE Software®
            </script>
            <!--CORE JAVASCRIPT-->
        </body>
    </html>