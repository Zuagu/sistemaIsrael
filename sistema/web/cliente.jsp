
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Asignacion Equipos</title>
        <link rel="shortcut icon" href="image/logoSicsa/icon-sicsa.png">
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style.css">

        <style>



            .btnaction, .btnaction:hover{
                float: right;
                height: 30px;
                font-size: 1.5rem;
                padding: 0px;
                margin-right: 10px;
            }

            .equipo_gestores{
            }
            .equipo_gestores_selected{
                box-sizing: border-box;
                background: rgb(137, 222, 255) !important;
            }
            .modal.bottom-sheet {
                top: auto;
                bottom: -100%;
                margin: 0;
                width: 100%;
                max-height: 86%;
                border-radius: 0;
                will-change: bottom, opacity;
            }
            .div_chek {
                height: 35vh;
                /*border: 1px solid;*/
                overflow: auto;
                border-radius: 3px;
                border:1px solid rgba(0,0,0,0.2);
                margin: 3px;
                margin-bottom: 1rem;
            }
            .div_chek2 {
                width: 15%;
            }
            .estatico {
                overflow: unset;
            }
            .div_cuentas_asignar {
                height: 50vh;
                overflow: auto;
            }
            .div_cuentas_asignar {
                height: 50vh;
                overflow: auto;
                margin-bottom: 2rem;
                border: 1px solid rgba(0,0,0,0.2);
                border-radius: 2px;
            }
            td, th {
                padding: 8px 3px;
                display: table-cell;
                text-align: left;
                vertical-align: middle;
                border-radius: 2px;
            }
            .margen {
                margin-bottom: 1rem;
            }
            .modal {
                max-height: 85%;
            }
            .div_cuentas_asignar p {
                display: inline-block;
                padding: 3px 12px;
                background-color: rgb(137, 222, 255);
                border: 1px solid rgb(15, 137, 185);
                margin-left: 8px;
            }

            *::-webkit-scrollbar {
                width: 8px;
            }

            *::-webkit-scrollbar-track {
                box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
            }

            *::-webkit-scrollbar-thumb {
                background-color: darkgrey;
                outline: 1px solid slategrey;
                border-radius: 5px;
            }
            .input-field > label {
                color:black;                    
            }

            .div_datos{
                background-color:#eceff1;
            }
            .input_datos{
                background-color:rgba(0,0,0,0.05) !important;
            }
            .boton_nuevo{
                width:90% !important;
                margin:10px 0px 10px 0px !important;
                border-radius: 4px;
                text-align:center;
            }

            .boton_editar{
                margin:10px 0px 10px 0px !important;
                border-radius: 4px;
                text-align:center;
            }
            .boton_crear{
                margin:10px 0px 10px 0px !important;
                border-radius: 4px;
                text-align:center;
                display:none;
            }


        </style>
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <div class="row" id="contenido"></div>
        <div class="contenedor-responsive">

            <!--BEGIN CONTENT-->
            <div class="row">
                <div class="col s12 m12 l12">
                    <div  class="col s12 m4 l3 ">
                        <h6>Clientes</h6>
                        <div class="col s12 m12 l12 z-depth-2" style="background-color:white;">
                            <div class="datagrid sombra" style="border:none;"><input id="filtro_gestor" class="filtro_gestor  "placeholder="Buscar" type="text" size="80"/></div>
                            <div class="tabla_gestores_selec_asig">
                                <table class="striped highlight">
                                    <thead>
                                        <tr>
                                            <td>Id</td>
                                            <td>Nombre</td>
                                        </tr>
                                    </thead>
                                    <tbody id="listado_gestores" class="datagrid sombra" style="overflow: auto;"></tbody>
                                </table>
                            </div>
                            <div class="center-align "><a class="waves-effect waves-light btn blue boton_nuevo"><i class="material-icons right">cloud</i>Nueva Asignacion</a></div>
                        </div>
                    </div>
                    <div  class="col s12 m8 l9 ">
                        <h6>Datos</h6>
                        <div class="col s12 m12 l12 z-depth-2">
                            <div class="input-field col s12 m6 l6">
                                <input id="razon_social" type="text" class="validate input_datos">
                                <label for="razon_social">Razon Social</label>
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <input id="rfc" type="text" class="validate input_datos">
                                <label for="rfc">R.F.C</label>
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <input id="colonia" type="text" class="validate input_datos">
                                <label for="colonia">Colonia</label>
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <input id="calle" type="text" class="validate input_datos">
                                <label for="calle">Calle</label>
                            </div>
                            <div class="input-field col s6 m1 l1">
                                <input id="num_ext" type="text" class="validate input_datos">
                                <label for="num_ext">N. Ext</label>
                            </div>
                            <div class="input-field col s12 m1 l1">
                                <input id="num_int" type="text" class="validate input_datos">
                                <label for="num_int">N. Int</label>
                            </div>
                            <div class="input-field col s6 m3 l3">
                                <input id="municipio" type="text" class="validate input_datos">
                                <label for="municipio">Municipio</label>
                            </div>
                            <div class="input-field col s12 m3 l3">
                                <input id="estado" type="text" class="validate input_datos">
                                <label for="estado">Estado</label>
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <input id="pais" type="text" class="validate input_datos">
                                <label for="pais">Pais</label>
                            </div>
                            <div class="input-field col s12 m2 l2">
                                <input id="codigo_postal" type="text" class="validate input_datos">
                                <label for="codigo_postal">C.P.</label>
                            </div>

                            <div class="input-field col s12 m6 l6">
                                <input id="telefono" type="text" class="validate input_datos">
                                <label for="telefono">Telefono</label>
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <input id="correo" type="text" class="validate input_datos">
                                <label for="correo">Email</label>
                            </div>
                            <div class="input-field col s12 m12 l12">
                                <input id="contacto" type="text" class="validate input_datos">
                                <label for="contacto">Contacto</label>
                            </div>
                            <div class="input-field col s12 m12 l12">
                                <div class="right-align "><a class="waves-effect waves-light btn green boton_editar"><i class="material-icons left">cloud</i>Editar</a></div>
                                <div class="right-align "><a class="waves-effect waves-light btn blue boton_crear"><i class="material-icons left">cloud</i>Crear</a></div>
                            </div>
                        </div>
                    </div>

                </div>






            </div> 

            <!--END CONTENT-->
            <input id="nuevo_equipo" type="hidden" value="">
            <!--END PAGE WRAPPER-->
        </div>
        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/asignacion_equipos.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <!--<script type="text/javascript" src="js/js/script.js"></script>-->

    </body>
</html>