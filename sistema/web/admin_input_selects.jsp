<%-- 
    Document   : admin_input_selects
    Created on : 26/01/2021, 09:26:55 PM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Selects</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
        <style>
            .tabla_opciones {
                overflow: auto;
                height: 65vh;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col s12 m12 l12 center-align">
                <h4>Administrador de selects</h4>
            </div>

            <div id="cont1" class="col s12 m10 l10 offset-m1 offset-l1">

                <div class="col s12 m4 l4 input-field hide">
                    <select id="tipo_pregunta">
                    </select>
                    <label>Tipo de Pregunta</label>
                </div>
                <div class="col s12 m4 l4 input-field">
                    <select id="pregunta">
                    </select>
                    <label>Pregunta</label>
                </div>

                <div class="col s12 m8 l8 input-field right-align">
                    <a id="btn_nuevo_valor" class="btn waves-effect blue">agregar nuevo valor</a>
                    <a id="btn_editar_pregunta" class="btn waves-effect blue">editar pregunta</a>
                </div>

                <div id="cont_nuevo_valor" class="col s12 m6 l6 grey lighten-3 hide">
                    <h4>Nueva valor</h4>
                    <div class="col s12 input-field">
                        <input placeholder="valor" id="new_valor" type="text" class="validate">
                        <label for="new_valor">VALOR</label>
                    </div>
                    <div class="col s12 input-field">
                        <a id="cancelar_new_option" class="btn waves-effect red">Cancelar</a>
                        <a id="add_new_option" class="btn waves-effect blue">Agregar</a>
                    </div>
                </div>




                <div id="editar_pregunta" class="col s12 m12 l12 grey lighten-3 hide">
                    <div class="input-field col s12 m12 l12">
                        <input id="redac_pregunta" type="text" placeholder="Redacion de la pregunta">
                        <label for="redac_pregunta">Redacion de la pregunta</label>
                    </div>
                    <div class="input-field col s12 m12 l12 right-align">
                        <a id="act_pregunta" class="btn blue">actualizar</a>
                    </div>
                    <input id="id_selector" type="hidden">
                </div>




                <div class="row"></div>

                <div class="col s12 m12 l12 grey lighten-3 tabla_opciones">
                    <table>
                        <thead>
                            <tr>
                                <th>Opciones</th>
                                <th class="center">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody id="tb_body_selects">
                        </tbody>
                    </table>
                </div>

                <div class="col s12 m12 l12 input-field right-align hide">
                    <a id="btn_nueva_opcion" class="btn waves-effect blue">agregar nueva opcion</a>
                </div>
            </div>

            <div id="cont2" class="col s12 m10 l10 offset-m1 offset-l1 hide">
                <div class="col s12 m6 l6 offset-m3 offset-l3 grey lighten-3">

                    <h4>Nueva opcion</h4>
                    <div class="col s12 input-field">
                        <select id="add_tipo">
                            <option value="" disabled selected>selecciona una opcion</option>
                            <option value="OPCION">OPCION</option>
                            <option value="PREGUNTA">PREGUNTA</option>
                        </select>
                        <label>TIPO</label>
                    </div>
                    <div class="col s12 input-field">
                        <input placeholder="" id="add_id_selector" type="text" class="validate">
                        <label for="add_id_selector">id selector</label>
                    </div>
                    <div class="col s12 input-field">
                        <input placeholder="" id="add_value" type="text" class="validate">
                        <label for="add_value">valor</label>
                    </div>
                    <div class="col s12 input-field">
                        <input placeholder="" id="add_pregunta" type="text" class="validate">
                        <label for="add_pregunta">pregunta</label>
                    </div>

                    <div class="col s12 input-field right-align">
                        <a id="cancel_new_pregunta" class="btn waves-effect red">Cancelar</a>
                        <a id="add_new_pregunta" class="btn waves-effect blue">Agregar</a>
                    </div>
                </div>
            </div>

        </div>

        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <!--<script type="text/javascript" src="js/js/menu.js"></script>-->
        <script>
            $(document).ready(function () {
                $('select').formSelect();
                select_preguntas('OPCION');
//                select_tipo_pregunta();
            });

            $('#tipo_pregunta').change(function () {
                console.log($(this).val());
                select_preguntas($(this).val());
            });
            $('#pregunta').change(function () {
                console.log($(this).val());
                select_data_inputselect($(this).val().split("&-&")[0]);
            });
            $('#add_new_option').click(function () {
                let tipo = $("#tipo_pregunta").val();
                let id_selector = $("#pregunta").val().split("&-&")[0];
                let pregunta = $("#pregunta").val().split("&-&")[1];
                let value = $("#new_valor").val();
                insert_new_option(id_selector, pregunta, tipo, value);
            });
            $('#add_new_pregunta').click(function () {
                insert_pregunta();
            });

            $('#btn_nueva_opcion').click(function () {
                $('#cont2').removeClass('hide');
                $('#cont1').addClass('hide');
            });
            $('#cancel_new_pregunta').click(function () {
                $('#cont1').removeClass('hide');
                $('#cont2').addClass('hide');
            });

            $('#btn_nuevo_valor').click(function () {
                $('#cont_nuevo_valor').removeClass('hide');
            });
            $('#cancelar_new_option').click(function () {
                $('#cont_nuevo_valor').addClass('hide');
            });

            $("#btn_editar_pregunta").click(function () {
                let valor_de_input = $("#pregunta").val().split("&-&");
                $("#id_selector").val(valor_de_input[0]);
                $("#redac_pregunta").val(valor_de_input[1]);
                $("#editar_pregunta").removeClass('hide');
                
            });
            $("#act_pregunta").click(function () {
                update_redaccion_pregunta();
                $("#editar_pregunta").addClass('hide');
            });


            function select_values_inputselect() {
                $.ajax({
                    type: "POST",
                    url: "ControllerSolicitud",
                    data: {action: 'select_values_inputselect'},
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $('#tipo_pregunta').empty();
                        $('#tipo_pregunta').append('<option value="" disabled selected>Choose your option</option>');
                        for (let row of response) {
                            $('#tipo_pregunta').append('<option>' + row.tipo + '</option>');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }
            function select_tipo_pregunta() {
                $.ajax({
                    type: "POST",
                    url: "ControllerSolicitud",
                    data: {action: 'select_tipo_pregunta'},
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $('#tipo_pregunta').empty();
                        $('#tipo_pregunta').append('<option value="" disabled selected>Seleciona una Opcion</option>');
                        for (let row of response) {
                            $('#tipo_pregunta').append('<option>' + row.tipo + '</option>');
                        }
                        $('select').formSelect();
                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }
            function select_preguntas(_tipo) {
                $.ajax({
                    type: "POST",
                    url: "ControllerSolicitud",
                    data: {action: 'select_preguntas', tipo: _tipo},
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $('#pregunta').empty();
                        $('#pregunta').append('<option value="" disabled selected>Seleciona una Opcion</option>');
                        for (let row of response) {
                            $('#pregunta').append('<option value="' + row.id_selector + '&-&' + row.pregunta + '">' + row.pregunta + '</option>');
                        }
                        $('select').formSelect();
                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }
            function select_data_inputselect(_id_selector) {
                $.ajax({
                    type: "POST",
                    url: "ControllerSolicitud",
                    data: {action: 'select_data_inputselect', id_selector: _id_selector},
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $('#tb_body_selects').empty();
                        for (let row of response) {
                            $('#tb_body_selects').append('<tr id="' + row.id_registro + '">' +
                                    '<td>' + row.value + '</td>' +
                                    '<td class="center"><a class="btn red lighten-1 waves-effect">eliminar</a></td>' +
                                    '</tr');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }
            function insert_new_option(_id_selector, _pregunta, _tipo, _value) {

                $.ajax({
                    type: "POST",
                    url: "ControllerSolicitud",
                    data: {
                        action: 'insert_new_option',
                        id_selector: _id_selector,
                        pregunta: _pregunta,
                        tipo: _tipo,
                        value: _value
                    },
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $('#cont_nuevo_valor').addClass('hide');
//                        $('#pregunta').empty();
                        $('#tb_body_selects').empty();
                        let preg = $("#pregunta").val();
                        select_data_inputselect(preg.split("&-&")[0]);

//                        select_tipo_pregunta();

                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }
            function insert_pregunta() {

                $.ajax({
                    type: "POST",
                    url: "ControllerSolicitud",
                    data: {
                        action: 'insert_new_option',
                        id_selector: $('#add_id_selector').val(),
                        pregunta: $('#add_pregunta').val(),
                        tipo: $('#add_tipo').val(),
                        value: $('#add_value').val()
                    },
                    dataType: "json",
                    success: function (response) {
                        console.log(response);

                        $('#cont1').removeClass('hide');
                        $('#cont2').addClass('hide');

                        $('#pregunta').empty();
                        $('#tb_body_selects').empty();
                        select_tipo_pregunta();

                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }

            function update_redaccion_pregunta() {
                let params = {
                    action: 'update_redaccion_pregunta',
                    id_selector: $('#id_selector').val(),
                    new_redac: $('#redac_pregunta').val()
                };
                console.log(params);

                $.ajax({
                    type: "POST",
                    url: "ControllerSolicitud",
                    data: {
                        action: 'update_redaccion_pregunta',
                        id_selector: $('#id_selector').val(),
                        new_redac: $('#redac_pregunta').val()
                    },
                    dataType: "json",
                    success: function (response) {
                        select_preguntas('OPCION');
                        $('#tb_body_selects').empty();
                        console.log(response);

                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }


//            for (let row of data) {
//                $('#' + row.id_selector).append('<option>' + row.value + '</option>');
//            }
//            for (let row of data) {
//                $('#tb_body_selects').append('<tr>' +
//                        '<td>' + row.id_selector + '</td>' +
//                        '<td>' + row.value + '</td>' +
//                        '<td><a class="btn red lighten-1 waves-effect">eliminar</a></td>' +
//                        '</tr');
//            }
//            $('select').formSelect();
        </script>
    </body>
</html>
