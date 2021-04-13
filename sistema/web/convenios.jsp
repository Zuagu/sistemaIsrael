<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Convenios</title>
        <link rel="shortcut icon" href="image/logoSicsa/icon-sicsa.png">
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <!-- TERMINA CALENDARIO -->

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-convenio.js"></script>
        <script type="text/javascript" src="js/arcade-pesos.js"></script>

        <style>
            .barra{
                cursor: pointer;
                height: 28px;
                display:none;
                color: #FFFFFF;
                text-align: left;
                font-weight: bold;
                font-size: 1.2rem;
                padding: 1px 0 0 4px;
            }
            .tb_select td, .tb_select th {
                padding: 2px 3px;
            }
            #listado_convenios td, #listado_convenios th {
                padding: 2px 3px;
            }
        </style>

    </head>
    <body>

        <div class="row">
            <div class="col s12 m12 l12 blue-grey white-text">
                <div class="col s12 m6 l6">
                    <h5>
                        Reporte de Convenios
                    </h5>
                </div>
                
            </div>

            <div class="col s12 m12 l12">
                <div class="col s12 m12 l12">
                    <div class="col s12 m4 l4 tb_select z-depth-1">
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="3">FILTROS</th>
                                </tr>
                            </thead>
                            </tbody>
                            <tr>
                                <td style="text-align: right;">DESDE:</td>
                                <td><input id="desde" type="text" class="datepicker"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">HASTA:</td>
                                <td><input id="hasta" type="text" class="datepicker"></td>
                            </tr>
                            <tr>

                                <td colspan="3">

                                    <div class="input-field col s9">
                                        <select id="id_reporte">
                                            <option value="1">PRODUCCION DE PROMESAS</option>
                                            <option value="2">ESTIMADO A COBRAR</option>
                                        </select>
                                    </div>
                                    <div class="input-field col s3">
                                        <a id='select_reporte_gral' class="btn waves-effect blue">OK</a>
                                    </div>



                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="div_info_regiones" class="col s12 m8 l8"></div>
                    
                </div>
                
                <div id="listado_convenios" class="col s12 m12 l12" style="height: 252px; overflow: auto; margin-top: 1.5rem;"></div>
                
                <div class="input-field col s12 m4 l4">
                    <a id="select_convenio_agrupado_tabla" class="btn waves-effect blue">AGRUPAR POR GESTOR</a>
                    <a onclick="tableToExcel('tabla_convenios', 'LISTADO DE CONVENIOS')"  class="btn waves-effect green">XLSX</a>
                </div>
                
                <div id="resumen_convenios" class="col s12 m8 l8 right-align">
                    
                </div>
                
            </div>

        </div>


        <!--BEGIN CONTENT-->
        <div class="contenedor-responsive">



            

            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->

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
                            fecha_hoy("desde");
                            fecha_hoy("hasta");
                            $(".barra").show("slow");

                            select_reporte_gral(
                                    1,
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(),
                                    "div_info_regiones"
                                    );

                            select_convenio_tabla(
                                    1,
                                    1, // TELCEL por default
                                    0, // TODAS LAS REGIONES
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                    "listado_convenios"
                                    );

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
                        $("#select_convenio_agrupado_tabla").click(function () {
                            // TRAER TODOS LOS CONVENIOS BAJO LAS CARACTERISTICAS SOLICITADAS
                            select_convenio_agrupado_tabla(
                                    1,
                                    1, // TELCEL por default
                                    0, // TODAS LAS REGIONES
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                    "listado_convenios"
                                    );
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
                        $("#select_reporte_gral").click(function () {
                            select_reporte_gral(
                                    1,
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(),
                                    "div_info_regiones"
                                    );

                            select_convenio_tabla(
                                    1,
                                    1, // TELCEL por default
                                    0, // TODAS LAS REGIONES
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                    "listado_convenios"
                                    );
                        });
                        //==================================================================
                        $("#desde").change(function () {
                            select_reporte_gral(
                                    1,
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(),
                                    "div_info_regiones"
                                    );

                            select_convenio_tabla(
                                    1,
                                    1, // TELCEL por default
                                    0, // TODAS LAS REGIONES
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                    "listado_convenios"
                                    );
                        });
                        //==================================================================
                        $("#hasta").change(function () {
                            select_reporte_gral(
                                    1,
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(),
                                    "div_info_regiones"
                                    );

                            select_convenio_tabla(
                                    1,
                                    1, // TELCEL por default
                                    0, // TODAS LAS REGIONES
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                    "listado_convenios"
                                    );
                        });
                        //==================================================================
                        $("#id_reporte").change(function () {
                            select_reporte_gral(
                                    1,
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(),
                                    "div_info_regiones"
                                    );

                            select_convenio_tabla(
                                    1,
                                    1, // TELCEL por default
                                    0, // TODAS LAS REGIONES
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                                    "listado_convenios"
                                    );
                        });
                        //==================================================================
                        // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>