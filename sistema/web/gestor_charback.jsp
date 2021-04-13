
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Gestor Charback</title>
        <link rel="shortcut icon" href="image/logoSicsa/icon.png">                                                             
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
        <style>
            .cargando {
                background: linear-gradient(-45deg, #ffffff, #bdbdbd, #ffffff, #bdbdbd);
                background-size: 400% 400%;
                animation: gradient 5s ease infinite;
            }

            @keyframes gradient {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
        </style>
    </head>
    <body style="font-size: 12px; background-color: #bfbfbf;">
        <jsp:include page="header.jsp"/>
        <div class="row gestor_font" id="contenido">
            <div class="container-fluid">
                <div class="col s12 m12 l12 contenido-datos">
                    <input id="id_cuenta" type="hidden">
                    <input id="numero_marcado_deudor" type="hidden">
                    <input id="ID_EQUIPO" type="hidden">
                    <input id="ID_ASIGNACION" type="hidden">
                    <input id="ID_REGION" type="hidden">
                    <div class=" col s9 m9 l9">
                        <div id="info_gestor" class=" col s12 m12 l12 div_input_gestor_info  z-depth-1 grey lighten-4">
                            <div class="col s12 m12 l12">
                                <h6><b>Informacion del Cliente</b></h6>
                            </div>
                            <div class="input-field col s6 m6 l6">
                                <input id="NOMBRE_CTE" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="NOMBRE_CTE">Nombre</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="PLAN" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="PLAN">Plan</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="CLIENTE_UNICO" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="CLIENTE_UNICO">Cuenta</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="U_PAGO" type="text" class="validate" placeholder="" readonly="readonly"   value="">
                                <label for="U_PAGO">U.Pago</label>
                            </div>


                            <div class="input-field col s6 m6 l6">
                                <input id="DIRECCION" type="text" class="validate"  placeholder="" value="" readonly="readonly" >
                                <label for="DIRECCION">Direccion</label>
                                <!--<textarea id="DIRECCION" readonly="" class="materialize-textarea limpiar_texto" data-length="500" placeholder="Dirección"></textarea>-->
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="CONTACTACION" type="text" class="validate" placeholder="" value="" readonly="readonly" >
                                <label for="CONTACTACION">Contratacíon</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="EXPEDIENTE" type="text" class="validate" placeholder="" readonly="readonly"   value="">
                                <label for="EXPEDIENTE">Expediente</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="F_REA" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="F_REA">F.REA</label>
                            </div>


                            <div class="input-field col s6 m6 l6">
                                <input id="RFC" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="RFC">Rfc</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="EQUIPO" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="EQUIPO">Equipo</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="EST_PORTAL" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="EST_PORTAL">Estatus Portal</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="DEVOLUCION" type="text" class="validate"  placeholder="" value="" readonly="readonly" >
                                <label for="DEVOLUCION">Devolucíon</label>
                            </div>
                            <div class="input-field col s2 m2 l2 offset-l8 offset-m8 offset-s8">
                                <input id="PLAZO" type="text" class="validate" placeholder=""  value="" readonly="readonly" >
                                <label for="PLAZO">Plazo</label>
                            </div>
                            <div class="input-field col s2 m2 l2">
                                <input id="CICLO" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="CICLO">Ciclo</label>
                            </div>

                        </div>
                    </div>
                    <div class=" col s3 m3 l3">
                        <div id="info_gestor_secundario" class="col s12 m12 l12 z-depth-1 div_info_secundaria white">
                            <div class="col s12 m12 l12">
                                <h6><b>Informacion Economica</b></h6>
                            </div>
                            <div class="input-field col s12 m12 l12">
                                <input id="VENCIDO" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="VENCIDO">Saldo Actual</label>
                            </div>
                            <div class="input-field col s12 m12 l12">
                                <input id="PENA_FINEQ" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="PENA_FINEQ">Pena Fineq</label>
                            </div>
                            <div class="input-field col s12 m12 l12">
                                <input id="CANCELACION" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="CANCELACION">Cancelacion</label>
                            </div>
                            <div class="input-field col s6 m6 l6">
                                <input id="PAGADO" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="PAGADO">U. Pago</label>
                            </div>


                            <!--                            <div class="input-field col s6 m6 l6">
                                                            <input id="RESTO" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                                            <label for="RESTO">Resto</label>
                                                        </div>-->
                            <!--                            <div class="input-field col s6 m6 l6">
                                                            <input id="REGISTRAR" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                                            <label for="REGISTRAR">Registrar</label>
                                                        </div>-->
                            <div class="input-field col s6 m6 l6">
                                <input id="CTAS_DOBLES" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                <label for="CTAS_DOBLES">Ctas Dobles</label>
                            </div>
                            <!--                            <div class="input-field col s6 m6 l6">
                                                            <input id="TOTAL" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                                            <label for="TOTAL"> Total $</label>
                                                        </div>-->
                            <!--                            <div class="input-field col s12 m12 l12">
                                                            <input id="REFERENCIAS" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                                                            <label for="REFERENCIAS">Referencias</label>
                                                        </div>-->
                        </div>
                    </div>
                    <div class="col s7 m7 l7">
                        <!--componente de gestion-->
                        <div id="div_gestor_gestion" class=" col s12 m12 l12  div_gestor_gestion z-depth-1 grey lighten-4">
                            <div class="col s12 m12 l12">
                                <h6><b>Gestion</b></h6>
                            </div>
                            <div class=" col s7 m7 l7  div_gestor_gestion z-depth-1">
                                <textarea id="gestion" class="materialize-textarea limpiar_texto" data-length="1000" placeholder="Gestion"></textarea>
                            </div>
                            <div class=" col s5 m5 l5 div_gestor_gestion">
                                <div class=" input-field col s12 m12 l12">
                                    <select id="estatus">
                                        <option value="0" selected>Selecciona Estatus</option>
                                    </select>
                                </div> 
                                <div class=" input-field col s12 m12 l12">
                                    <select id="codigo_llamada"></select>
                                </div>
                                <div class=" input-field  col s6 m6 l6">
                                    <a id="guardar_gestion" class="waves-effect waves-light btn green btn_guardar_gestiones"><i class="material-icons right">save</i>Guar.</a>
                                </div> 
                                <div class=" input-field col s6 m6 l6">
                                    <a id="cuenta_siguiente" class="waves-effect waves-light btn red btn_siguiente"><i class="material-icons right">send</i>Sig.</a>
                                </div>
                            </div>
                        </div>
                        <!--componente de vista de tabs-->
                        <div class=" col s12 m12 l12 div_tabs z-depth-1 grey lighten-4">
                            <ul id="tabs-swipe-demo" class="tabs hide_print ul_tabs">
                                <li class="tab col s2"><a id="tab_gestiones" class="active gestor_tab tooltipped" data-position="bottom" data-tooltip="Gestiones" href="#div_gestiones" style="color:#db040e"><i class="icon_gestor_tab tiny material-icons">contact_phone</i></a></li>
                                <li class="tab col s2"><a id="tab_referencias_banco" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Referencias Bancarias" href="#div_referencias_banco" style="color:#db040e"><i class="icon_gestor_tab tiny material-icons">credit_card</i></a></li>
                                <li class="tab col s2"><a id="tab_pagos" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Pagos" href="#div_pagos" style="color:#db040e"><i class="icon_gestor_tab tiny material-icons">monetization_on</i></a></li>
                                <li class="tab col s2"><a id="tab_convenios" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Convenios" href="#div_convenios" style="color:#db040e"><i class="icon_gestor_tab tiny material-icons">stars</i></a></li>
                                <li class="tab col s2"><a id="tab_agendas" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Agenda" href="#div_agendas" style="color:#db040e"><i class="icon_gestor_tab tiny material-icons">insert_invitation</i></a></li>
                                <li class="tab col s1"><a id="tab_visitas" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Visitas" href="#div_visitas" style="color:#db040e"><i class="icon_gestor_tab tiny material-icons">location_on</i></a></li>
                                <li class="tab col s1"><a id="tab_saldos" class="gestor_tab tooltipped"data-position="bottom" data-tooltip="Saldos" href="#div_saldos" style="color:#db040e"><i class="icon_gestor_tab tiny material-icons">pie_chart</i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col s5 m5 l5">
                        <!--componente de datos de contactacion directa -->
                        <div class="col s12 l12 m12 marcacion_directa grey lighten-4 z-depth-1">
                            <table>
                                <thead class="blue-grey darken-4 white-text">
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Tipo</th>
                                        <th>Numero</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody_telefonos">
                                    <tr>
                                        <td>Fulano1</td>
                                        <td><i class="material-icons">phone_iphone</i></td>
                                        <td>111-000-0000</td>
                                    </tr>
                                    <tr>
                                        <td>Fulano</td>
                                        <td><i class="material-icons">phone_iphone</i></td>
                                        <td>111-000-0000</td>
                                    </tr>
                                    <tr>
                                        <td>Fulano2</td>
                                        <td><i class="material-icons">phone_iphone</i></td>
                                        <td>111-000-0000</td>
                                    </tr>
                                    <tr>
                                        <td>Fulano3</td>
                                        <td><i class="material-icons">phone_iphone</i></td>
                                        <td>111-000-0000</td>
                                    </tr>
                                    <tr>
                                        <td>Fulano4</td>
                                        <td><i class="material-icons">phone_iphone</i></td>
                                        <td>111-000-0000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="col s12 input-field center-align">
                                <a id="agregar_nuevo_numero" class="btn waves-effect waves-light blue-grey">Agrear numero adicional</a>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m9 l9 margin_top_7px">
                        <!--componente de secciones de las tabs de tabs-->
                        <div id="div_gestiones" class="col s12 z-depth-1 div_gestor_contenido grey lighten-4"> 
                            <table class="highlight" id="tabla_gestiones">
                                <thead class="blue">
                                    <tr class="text-white">
                                        <td> <b>ID</b></td>
                                        <td> <b>FECHA</b></td>
                                        <td> <b>HORA</b></td>
                                        <td> <b>NUMERO</b></td>
                                        <td> <b>AGENTE</b></td>
                                        <td> <b>ESTATUS</b></td>
                                        <td> <b>CODIGO</b></td>
                                        <td> <b>DISPOCISION</b></td>
                                        <td> <b>TIEMPO</b></td>
                                    </tr>
                                </thead>
                                <tbody id="tbody_tabla_gestiones">
                                </tbody>
                            </table>
                        </div>

                        <div id="div_referencias_banco" class="col s12 z-depth-1 div_gestor_contenido grey lighten-4">
                            <ul class="collection">
                                <li class="collection-item avatar">
                                    <img src="image/logo-bancos/banamex.fw.png" alt="" class="circle">
                                    <span class="title">Banamex</span>
                                    <h6><b class="num_de_ref_bancaria"></b></h6>
                                </li>
                                <li class="collection-item avatar">
                                    <img src="image/logo-bancos/bancomer.fw.png" alt="" class="circle">
                                    <span class="title">Bancomer</span>
                                    <h6 class=""><b>182251</b> <b class="num_de_ref_bancaria"></b></h6>
                                </li>
                                <li class="collection-item avatar">
                                    <img src="image/logo-bancos/hsbc.fw.png" alt="" class="circle">
                                    <span class="title">HSBC</span>
                                    <h6 class=""><b>2904</b> <b class="num_de_ref_bancaria"></b></h6>
                                </li>
                                <li class="collection-item avatar">
                                    <img src="image/logo-bancos/banorte.fw.png" alt="" class="circle">
                                    <span class="title">Banorte</span>
                                    <h6 class=""><b>37478</b> <b class="num_de_ref_bancaria"></b></h6>
                                </li>
                                <li class="collection-item avatar">
                                    <img src="image/logo-bancos/santander.fw.png" alt="" class="circle">
                                    <span class="title">Santander</span>
                                    <h6 class=""><b>4565</b> <b class="num_de_ref_bancaria"></b></h6>
                                </li>
                            </ul>
                        </div>

                        <div id="div_pagos" class="col s12 z-depth-1 div_gestor_contenido center center-align grey lighten-4">
                            <table class="highlight" id="tabla_pagos">
                                <thead class="blue">
                                    <tr class="text-white center-align">
                                        <td><b>NUM</b></td>
                                        <td><b>CUENTA</b></td>
                                        <td><b>FECHA PAGO</b></td>
                                        <td><b>ORIGEN</b></td>
                                        <td><b>IMPORTE</b></td>
                                        <td><b>FORMA</b></td>
                                        <td><b>ESTATUS</b></td>
                                        <td><b>FECHA APLICACION</b></td>
                                    </tr>
                                </thead>
                                <tbody id="tbody_tabla_pagos">
                                </tbody>
                            </table>
                        </div>
                        <div id="div_agendas" class="col s12 z-depth-1 div_gestor_contenido grey lighten-4">
                            <input id="id_reg_agenda" type="hidden">
                            <div id="div_lista_agendas" class="col s12 m9 l9 z-depth-1">
                                <table>
                                    <thead>
                                        <tr class="blue center-align">
                                            <th>ID</th>
                                            <th>CLIENTE_UNICO</th>
                                            <th>DESCRIPCION</th>
                                            <th>FECHA</th>
                                            <th>HORA</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tb_list_agenda">

                                    </tbody>
                                </table>
                            </div>
                            <div class="col s12 m3 l3 div_btn input-field">
                                <a id="new_agenda" class="btn green waves-effect waves-light">Agregar</a>
                            </div>
                            <div class="col s12 m3 l3 div_btn input-field">
                                <a id="delete_agenda" class="btn red waves-effect waves-light">Eliminar</a>
                            </div>
                            <div class="col s12 m3 l3 div_btn">
                                <a id="ver_modal_agendas" class="btn blue waves-effect">Ver Agendas</a>
                            </div>
                            <div id="tabla_agendas" class="col s12 m12 l12"></div>
                        </div>
                        <div id="div_visitas" class="col s12 z-depth-1 div_gestor_contenido center center-align white">
                        </div>
                        <div id="div_convenios" class="col s12 z-depth-1 div_gestor_contenido center center-align grey lighten-4">
                            <table class="highlight" id="tabla_convenios">
                                <thead class="blue">
                                    <tr class="text-white">
                                        <td><b>FOLIO</b></td>
                                        <td><b>CUENTA</b></td>
                                        <td><b>GESTOR</b></td>
                                        <td><b>CONVENIO</b></td>
                                        <td><b>FECHA GESTION</b></td>
                                        <td><b>PLAZO</b></td>
                                        <td><b>FECHA</b></td>
                                        <td><b>PAGOS</b></td>
                                        <td><b>FECHA PAGOS</b></td>
                                        <td><b>EFECTIVIDAD</b></td>
                                    </tr>
                                </thead>
                                <tbody id="tbody_tabla_convenios">
                                </tbody>
                            </table>
                        </div>
                        <div id="div_saldos" class="col s12 z-depth-1 div_gestor_contenido center center-align white">
                        </div>
                    </div>
                    <div class="col s12 m3 l3 margin_top_7px">
                        <!--componente de tiempos -->
                        <div id="div_input_gestor_tiempos" class="col s12 m12 l12 z-depth-1 div_input_gestor_tiempos grey lighten-4">
                            <div class="col s12 m12 l12">
                                <h6>Tiempos</h6>
                            </div>
                            <div class="input-field col s6">
                                <input id="primera_llamada" type="text" class="validate" placeholder="" readonly="readonly" value="00:00:00">
                                <label for="primera_llamada">P.llamada</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="tiempo_actual" type="text" class="validate" placeholder="" readonly="readonly" value="00:00:00">
                                <label for="tiempo_actual">Actual</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="retraso_actual" type="text" class="validate" placeholder="" readonly="readonly" value="00:00:00">
                                <label for="retraso_actual">R. Actual</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="cuentas_tocadas" type="text" class="validate" placeholder="" readonly="readonly" value="0000">
                                <label for="cuentas_tocadas">Cuentas</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="llamadas_realizadas" type="text" class="validate" placeholder="" readonly="readonly" value="0000">
                                <label for="llamadas_realizadas" class="centro">Llamadas</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="convenios" type="text" class="validate" placeholder="" readonly="readonly" value="0000">
                                <label for="convenios">Convenios</label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div id="modal_convenio" class="modal scale-transition">
                <div class="modal-content">
                    <h3 class="center">Generar Convenio</h3>
                    <h6 id="alerta_convenio" class="red-text center"></h6>
                    <div class="input-field col s12 m4 l4 offset-m2 offset-l2">
                        <input id="importe_convenio" type="text" class="validate limpiar_numero">
                        <label for="importe_convenio">Importe</label>
                    </div>
                    <div class="input-field col s12 m4 l4 offset-m1 offset-l1">
                        <input id="fecha_convenio" type="text" class="datepicker" placeholder="Fecha del convenio">
                        <label for="fecha_convenio">Fecha Convenio</label>
                    </div>
                    <div class="col s12 input-field center">
                        <a id="cancelar_convenio" class="waves-effect waves-light btn red modal-close btn_gestiones "><i class="material-icons right">cancel</i>Cancel</a>
                        <a id="insert_convenio" class="waves-effect waves-light btn green btn_gestiones"><i class="material-icons right">save</i>Ok</a>

                    </div>
                </div>
            </div>
            <div id="modal_nuevo_numero" class="modal scale-transition">
                <div class="modal-content">
                    <h3 class="center">Agregar Numero Adicional</h3>
                    <h6 id="alerta_convenio" class="red-text center"></h6>
                    <div class="input-field col s12 m8 l8 offset-m2 offset-l2">
                        <input id="nuevo_numero" type="text" class="validate limpiar_numero">
                        <label for="nuevo_numero">Nuevo Numero</label>
                    </div>
                    <div class="input-field col s12 m8 l8 offset-m2 offset-l2">
                        <input id="nombre_nuevo_numero" type="text" class="validate">
                        <label for="nombre_nuevo_numero">Nombre Nuevo Numero</label>
                    </div>
                    <div class="col s12 input-field center">
                        <a class="waves-effect waves-light btn red modal-close btn_gestiones "><i class="material-icons right">cancel</i>Cancel</a>
                        <a id="save_new_number" class="waves-effect waves-light btn green btn_gestiones"><i class="material-icons right">save</i>Ok</a>

                    </div>
                </div>
            </div>
            <div id="modal_alerta" class="modal">
                <div class="modal-content">
                    <h3 class="center">Alerta</h3>
                    <h5 id="mensaje_alerta" class="mensaje_alerta center-align">
                    </h5>
                </div>
            </div>

            <div id="modal_agregar_agenda" class="modal">
                <div class="modal-content">
                    <h3 class="center">Nuevo Recordatorio</h3>
                    <div class="col s12">
                        <div class="col s12 div_btn right-align"><p id="mensaje_error_agenda" class="red-text"></p></div>
                        <div class="input-field col s6">
                            <input id="cliente_unico_agenda" type="text" class="validate">
                            <label for="cliente_unico_agenda">Numero de Cuenta</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="descripcion_agenda" type="text" class="validate">
                            <label for="descripcion_agenda">Descripcion</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="fecha_agenda" type="text" class="datepicker">
                            <label for="fecha_agenda">Fecha</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="hora_agenda" type="text" class="timepicker">
                            <label for="hora_agenda">Hora</label>
                        </div>
                        <div class="col s12 div_btn right-align input-field">
                            <a class="btn red waves-effect modal-close">Cancelar</a>
                            <a id="insertar_agenda" class="btn blue waves-effect">Aceptar</a>
                        </div>

                    </div>
                </div>
            </div>

            <div id="modal_gestion" class="modal">
                <div class="modal-content">
                    <h3 class="center">Gestion</h3>
                    <div class="col s12 ">
                        <h6 id="mod_gestion">
                        </h6>
                    </div>
                </div>
            </div>

            <div id="modal_busqueda" class="modal">
                <div class="modal-content">
                    <h3 class="center">Resultado</h3>
                    <div class="input-field col s6 offset-s3">
                        <input id="buqueda_relacionada" type="text" class="validate">
                        <label for="buqueda_relacionada">Busqueda </label>
                    </div>
                    <div id="cargando_busqueda"></div>
                    <div class="col s12 tabla_resultado_busqueda">
                        <table>
                            <thead>
                                <tr>
                                    <th>CUENTA</th>
                                    <th>NOMBRE</th>
                                    <th>ASIGNACION</th>
                                    <th>ESTATUS</th>
                                </tr>
                            </thead>
                            <tbody id="tb_cont_busqueda">

                            </tbody>
                        </table>

                    </div>
                    <div class="input-field col s12 right-align">
                        <a href="#!" class="modal-close waves-effect waves-light red btn">Cerrar</a>
                    </div>
                </div>
            </div>


            <div class="fixed-action-btn">
                <a class="btn-floating btn-large red">
                    <i class="large material-icons">mode_edit</i>
                </a>
                <ul>
                    <li><a id="m_familiar" class="btn-floating red tooltipped modal-trigger " href="#modal_mensaje_familiar" data-position="left" data-tooltip="Mensaje con familiar"><i class="material-icons">insert_chart</i></a></li>
                    <li><a id="m_tercero" class="btn-floating yellow darken-1 tooltipped  modal-trigger" href="#modal_mensaje_tercero" data-position="left" data-tooltip="Mensaje a Tercero"><i class="material-icons">format_quote</i></a></li>
                    <li><a id="m_aval" class="btn-floating green tooltipped  modal-trigger"  href="#modal_mensaje_aval" data-position="left" data-tooltip="Mensaje a Aval"><i class="material-icons">publish</i></a></li>
                    <li><a id="m_tt"class="btn-floating blue tooltipped  modal-trigger"  href="#modal_mensaje_titular" data-position="left" data-tooltip="Mensaje a Cliente"><i class="material-icons">attach_file</i></a></li>
                </ul>
            </div>
            <div id="modal_mensaje_familiar" class="modal">
                <div class="modal-content">
                    <h3 class="center">Mensaje a Familiar</h3>
                    <div class="col s12 m12 l12">
                        <h6>•	¿Con quién tengo el gusto?</h6>
                        <h6>•	¿Que parentesco tiene con el titular?</h6>
                        <h6>•	¿A qué hora puedo localizarlo?</h6>
                        <h6>•	¿Algún teléfono para comunicarme directamente con  él?</h6>
                        <h6>•	¿Usted sabe cuál es el motivo  por el cuál ha incumplido en su contrato?</h6>
                        <h6>•	¿Se encuentra trabajando actualmente?</h6>
                        <h6>•	¿Usted sabe si actualmente vive en?</h6>
                    </div>
                </div>
            </div>
            <div id="modal_mensaje_tercero" class="modal">
                <div class="modal-content">
                    <h3 class="center">Mensaje Tercero</h3>
                    <div class="col s12 m12 l12">
                        <h6>•	¿Es usted familiar de el titular. o solamente es  conocido?</h6>
                        <h6>•	¿Hace cuánto  tiempo lo conoce ?</h6>
                        <h6>•	En que horario se le puede localizar</h6>
                        <h6>•	¿Tiene manera de comunicármelo más tarde?</h6>
                        <h6>•	¿Me podría proporcionar un teléfono para comunicarme directamente con él?</h6>
                        <h6>•	¿Usted sabe si actualmente vive en?</h6>
                    </div>
                </div>
            </div>
            <div id="modal_mensaje_aval" class="modal">
                <div class="modal-content">
                    <h3 class="center">Contacto con Aval / Aval No Define</h3>
                    <div class="col s12 m12 l12">
                        <h6>•	¿Qué parentesco tiene  con el titular?</h6>
                        <h6>•	Proporcióneme algún teléfono donde me pueda comunicar directamente con el titular.</h6>
                        <h6>•	¿Cuál fue el motivo por el cuál aceptó ser aval del Titular?</h6>
                    </div>
                </div>
            </div>
            <div id="modal_mensaje_titular" class="modal">
                <div class="modal-content">
                    <h3 class="center">Contacto con TT / Cliente No Define</h3>
                    <div class="col s12 m12 l12">
                        <h6>•	¿Cual fue el motivo por el cual dejo de pagar?</h6>
                        <h6>•	¿Algún teléfono adicional donde me pueda comunicar con usted?</h6>
                    </div>
                </div>
            </div>

            <div id="modal_ver_agenda" class="modal">
                <div class="modal-content">
                    <h3 class="center">Alerta de Agenda</h3>
                    <div class="col s12">
                        <input id="folio_agenda_act" value="0" type="hidden">
                        <div class="input-field col s6">
                            <input id="agenta_cliente_unico" type="text" placeholder=" " class="validate">
                            <label for="agenta_cliente_unico">Cliente unico </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="agenta_descripcion" type="text" placeholder=" " class="validate">
                            <label for="agenta_descripcion">Descripcion </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="agenta_fecha" type="text" placeholder=" " class="validate">
                            <label for="agenta_fecha">Fecha </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="agenta_hora" type="text" placeholder=" " class="validate">
                            <label for="agenta_hora">Hora </label>
                        </div>
                        <div class="col s12 div_btn center-align input-field">
                            <a class="btn red waves-effect modal-close">Posponer</a>
                            <a id="cuenta_agenda_datos" class="btn blue waves-effect modal-close">Buscar datos Cuenta</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>	
        <div id="modal_ver_filtros" class="modal">
            <div class="modal-content">
                <h3 class="center">Filtros</h3>
                <div class="col s12 m12 l12">
                    <div class="row">
                        <div class="input-field col s12 m4 l4">
                            <select id="filtro_ciclo">
                                <option value="" disabled selected>Choose your option</option>
                            </select>
                            <label>Ciclo</label>
                        </div>
                        <div class="input-field col s12 m4 l4">
                            <select id="filtro_estatus_original">
                                <option value="" disabled selected>Choose your option</option>
                            </select>
                            <label>Estatus Original</label>
                        </div>
                        <div class="input-field col s3 m4 l4">
                            <select id="filtro_estatus_gestion">
                                <option value="" disabled selected>Choose your option</option>
                            </select>
                            <label>Estatus Gestion</label>
                        </div>

                        <div class="input-field col s12 m12 l12 right-align">
                            <a class="btn waves-effect waves-light yellow modal-close black-text">Actualizar</a>
                        </div>
                    </div>


                </div>
            </div>

        </div>

        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <!--<script type="text/javascript" src="js/arcade-estatus-cuenta.js"></script>-->
        <!--<script type="text/javascript" src="js/arcade-estatus-llamada.js"></script>-->
        <!--<script type="text/javascript" src="js/arcade-call-operacion.js"></script>-->
        <!--<script type="text/javascript" src="js/arcade-asignacion.js"></script>-->
        <script type="text/javascript" src="js/js/Script_charback.js"></script>
    </body>
</html>