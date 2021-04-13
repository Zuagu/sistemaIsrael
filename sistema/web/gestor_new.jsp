
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Gestor</title>
        <link rel="shortcut icon" href="image/logoSicsa/icon-sicsa.png">
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style.css">
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <div class="row" id="contenido">
            <div class="container-fluid">
                <div class="col s10 m10 l10 contenido-datos">
                    <input id="id_cuenta_deudor" type="hidden">
                    <input id="id_asignacion_deudor" type="hidden">
                    <input id="id_region_deudor" type="hidden">
                    <input id="id_cliente_deudor" type="hidden">
                    <input id="fecha_fin_deudor" type="hidden">
                    <input id="numero_marcado_deudor" type="hidden">
                    <div id="info_gestor" class=" col s12 m12 l12 div_input_gestor_info blue z-depth-1">
                        <div class="input-field col s6 m2 l2">
                            <input id="cuenta_deudor" type="text" class="validate" placeholder="" readonly="readonly" value="">
                            <label for="cuenta_deudor">Cuenta</label>
                        </div>
                        <div class="input-field col s12 m4 l4">
                            <input id="nombre_deudor" type="text" class="validate" placeholder="" readonly="readonly" value="">
                            <label for="nombre_deudor">Nombre</label>
                        </div>
                        <div class="input-field col s6 m2 l2">
                            <input id="expediente_deudor" type="text" class="validate" placeholder="" readonly="readonly" value="">
                            <label for="expediente_deudor">Expediente</label>
                        </div>
                        <div class="input-field col s6 m2 l2">
                            <input id="resto_deudor" type="text" class="validate" placeholder="" readonly="readonly" value="">
                            <label for="resto_deudor">Resto</label>
                        </div>
                        <div class="input-field col s6 m2 l2">
                            <input id="cancelacion_deudor" type="text" class="validate" placeholder="" readonly="readonly" value="">
                            <label for="cancelacion_deudor">Cancelacion</label>
                        </div>
                    </div>
                    <div id="info_gestor_secundario" class="col s12 m12 l12 div_input_gestor_tiempos z-depth-1 div_info_secundaria">

                        <div class="input-field col s3 m3 l3">
                            <input id="vencido_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="vencido_deudor">Vencido</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="pagado_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="pagado_deudor">Pagado</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="penafineq_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="penafineq_deudor">Pena Fineq</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="penakitbp_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="penakitbp_deudor">Pena Kit BP</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="ult_pago_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="ult_pago_deudor">Ultimo Pago</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="plazo_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="plazo_deudor">Plazo</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="cuentas_dobles_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="cuentas_dobles_deudor">Ctas. Dobles</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="total_cuentas_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="total_cuentas_deudor">Total Cuentas Dbls</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="inicio_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="inicio_deudor">Inicio</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="devolucion_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="devolucion_deudor">Devolucion</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="asignacion_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="asignacion_deudor">Asignacion</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="plan_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="plan_deudor">Plan</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="equipo_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="equipo_deudor">Equipo</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="baja_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="baja_deudor">M. Baja</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="f_act_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="direccion_deudor">F. Act Portal</label>
                        </div>
                        <div class="input-field col s3 m3 l3">
                            <input id="portal_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="portal_deudor">Saldo Portal</label>
                        </div>
                        <div class="input-field col s6 m6 l6">
                            <input id="direccion_deudor" type="text" class="validate" placeholder="" readonly="readonly"  value="">
                            <label for="direccion_deudor">Direccion</label>
                        </div>
                    </div>
                    <div class=" col s12 m12 l12 div_tabs">
                        <ul id="tabs-swipe-demo" class="tabs hide_print ul_tabs col s10">
                            <li class="tab col s1"><a id="tab_gestiones" class="active gestor_tab tooltipped" data-position="bottom" data-tooltip="Gestiones" href="#div_gestiones" style="color:#db040e"><i class="icon_gestor_tab material-icons">contact_phone</i></a></li>
                            <li class="tab col s1"><a class="gestor_tab tooltipped " data-position="bottom" data-tooltip="Ref. Bancarias" href="#test-swipe-2" style="color:#db040e"><i class="icon_gestor_tab  material-icons">credit_card</i></a></li>
                            <li class="tab col s1"><a id="tab_pagos" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Pagos" href="#div_pagos" style="color:#db040e"><i class="icon_gestor_tab  material-icons">monetization_on</i></a></li>
                            <li class="tab col s1"><a id="tab_pagos_diarios" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Pagos_diarios" href="#div_pagos_diarios" style="color:#db040e"><i class="icon_gestor_tab  material-icons">attach_money</i></a></li>
                            <li class="tab col s1"><a id="tab_agendas" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Agenda" href="#div_agendas" style="color:#db040e"><i class="icon_gestor_tab  material-icons">insert_invitation</i></a></li>
                            <li class="tab col s1"><a id="tab_visitas" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Visitas" href="#div_visitas" style="color:#db040e"><i class="icon_gestor_tab  material-icons">location_on</i></a></li>
                            <li class="tab col s1"><a id="tab_convenios" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Convenios" href="#div_convenios" style="color:#db040e"><i class="icon_gestor_tab  material-icons">stars</i></a></li>
                            <li class="tab col s1"><a id="tab_saldos" class="gestor_tab tooltipped"data-position="bottom" data-tooltip="Saldos" href="#div_saldos" style="color:#db040e"><i class="icon_gestor_tab  material-icons">pie_chart</i></a></li>
                            <li class="tab col s1"><a id="tab_estadisticas" class="gestor_tab tooltipped" data-position="bottom" data-tooltip="Estadisticas" href="#div_estadisticas" style="color:#db040e"><i class="icon_gestor_tab  material-icons">poll</i></a></li>
                        </ul>
                        <div id="grup_gestiones" class="col s2">
                            <a id="ordenar_contacto" class="waves-effect waves-light btn-small green margin_butt">Agrupar por Contacto</a>
                            <a id="ordenar_normal" class="waves-effect waves-light btn-small blue hide margin_butt">desagrupar</a>
                        </div>
                    </div>    
                    <div id="div_gestiones" class="col s12 z-depth-1 div_gestor_contenido" style="margin-top:10px;"> 
                        <!--                        <div class="col s12 m12 l12">
                        
                                                </div>-->
                        <div class="col s12 m12 l12">
                            <table class="highlight" id="tabla_gestiones">
                                <thead class="blue">
                                    <tr class="text-white">
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
                    </div>
                    <div id="test-swipe-2" class="col s12 z-depth-1 div_gestor_contenido" style="margin-top:10px;">
                        <ul class="collection">
                            <li class="collection-item avatar ref_banc">
                                <img src="image/logo-bancos/banamex.fw.png" alt="" class="circle">
                                <span class="title">Banamex</span>
                                <input id="ref_bancaria1" type="text" class="validate" placeholder="" readonly="readonly">
                            </li>
                            <li class="collection-item avatar ref_banc">
                                <img src="image/logo-bancos/bancomer.fw.png" alt="" class="circle">
                                <span class="title">Bancomer</span>
                                <h6 class="">182251</h6>
                                <input id="ref_bancaria2" type="text" class="validate" placeholder="" readonly="readonly">
                            </li>
                            <li class="collection-item avatar">
                                <img src="image/logo-bancos/hsbc.fw.png" alt="" class="circle">
                                <span class="title">HSBC</span>
                                <h6 class="">2904</h6>
                                <input id="ref_bancaria3" type="text" class="validate" placeholder="" readonly="readonly">
                            </li>
                            <li class="collection-item avatar ref_banc">
                                <img src="image/logo-bancos/banorte.fw.png" alt="" class="circle">
                                <span class="title">Banorte</span>
                                <h6 class="">37478</h6>
                                <input id="ref_bancaria4" type="text" class="validate" placeholder="" readonly="readonly">
                            </li>
                            <li class="collection-item avatar ref_banc">
                                <img src="image/logo-bancos/santander.fw.png" alt="" class="circle">
                                <span class="title">Santander</span>
                                <h6 class="">4565</h6>
                                <input id="ref_bancaria5" type="text" class="validate" placeholder="" readonly="readonly">
                            </li>
                        </ul>
                    </div>
                    <div id="div_pagos" class="col s12 z-depth-1 div_gestor_contenido center center-align" style="margin-top:10px;">
                        <table class="highlight" id="tabla_pagos">
                            <thead class="blue">
                                <tr class="text-white">
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
                    <div id="div_pagos_diarios" class="col s12 m12 l12 z-depth-1 div_gestor_contenido center center-align" style="margin-top:10px;">
                        <div class="col s4 m4 l4 offset-s4 offset-m4 offset-l4 rango_fechas_pagos_diarios hide">
                            <input id="desde_pagos_gestor" type="text" class="datepicker input_date center-align" placeholder="desde">
                            <input id="hasta_pagos_gestor" type="text" class="datepicker input_date center-align" placeholder="hasta">
                            <a id="mostrar_pagos_diarios" class="waves-effect waves-light btn btn_gestiones green center">enviar</a>
                        </div>
                        <div class="div_tabla_pagos_diarios hide">
                            <table class="highlight striped" id="tabla_pagos_diarios">
                                <thead class="blue">
                                    <tr class="text-white">
                                        <td><b>CUENTA</b></td>
                                        <td><b>FECHA PAGO</b></td>
                                        <td><b>ORIGEN</b></td>
                                        <td><b>IMPORTE</b></td>
                                        <td><b>FORMA</b></td>
                                        <td><b>ESTATUS</b></td>
                                        <td><b>FECHA APLICACION</b></td>
                                    </tr>
                                </thead>
                                <tbody id="tbody_tabla_pagos_diarios">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="div_agendas" class="col s12 z-depth-1 div_gestor_contenido center center-align" style="margin-top:10px;">
                        <input id="id_reg_agenda" type="hidden">
                        <div class="col s12 m9 l9">
                            <table>
                                <thead>
                                    <tr class="blue">
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
                        <div class="col s12 m3 l3 div_btn">
                            <a id="new_agenda" class="btn green waves-effect waves-light">Agregar</a>
                        </div>
                        <div class="col s12 m3 l3 div_btn">
                            <a id="delete_agenda" class="btn red waves-effect waves-light">Eliminar</a>
                        </div>
                        <div class="col s12 m3 l3 div_btn">
                            <a id="ver_modal_agendas" class="btn blue waves-effect">Ver Agendas</a>
                        </div>

                        <div id="tabla_agendas" class="col s12 m12 l12"></div>
                    </div>
                    <div id="div_visitas" class="col s12 z-depth-1 div_gestor_contenido center center-align" style="margin-top:10px;">
                        <div class="col s2 m2 l2 rango-fechas-visitas hide">
                            <input type="text" class="datepicker input_date center-align" placeholder="desde">
                            <input type="text" class="timepicker input_date center-align" placeholder="hasta">
                            <a id="mostrar_visitas" class="waves-effect waves-light btn btn_gestiones green center">enviar</a>
                        </div>
                        <div id="tabla_visitas" class="col s12 m12 l12">jkshaksjdhkasjh</div>
                    </div>
                    <div id="div_convenios" class="col s12 z-depth-1 div_gestor_contenido center center-align" style="margin-top:10px;">
                        <table class="highlight" id="tabla_convenios">
                            <thead class="blue">
                                <tr class="text-white">
                                    <td><b>CUENTA</b></td>
                                    <td><b>GESTOR</b></td>
                                    <td><b>CONVENIO</b></td>
                                    <td><b>FECHA GESTION</b></td>
                                    <td><b>PLAZO</b></td>
                                    <td><b>FECHA</b></td>
                                    <td><b>PAGOS</b></td>
                                    <td><b>FECHA PAGOS</b></td>
                                    <td><b>EFECTIVIDAD</b></td>
                                    <td><b>STATUS</b></td>
                                </tr>
                            </thead>
                            <tbody id="tbody_tabla_convenios">
                            </tbody>
                        </table>
                    </div>
                    <div id="div_saldos" class="col s12 z-depth-1 div_gestor_contenido center center-align" style="margin-top:10px;">
                        <table class="highlight" id="tabla_equipos_usuario">
                            <thead class="blue">
                                <tr class="text-white">
                                    <td><b>ASIGNACION</b></td>
                                    <td><b>EQUIPO</b></td>
                                    <td><b>CUENTAS</b></td>
                                    <td><b>ASIGNADO</b></td>
                                </tr>
                            </thead>
                            <tbody id="tbody_tabla_equipos_usuario">
                            </tbody>
                        </table>
                        <table class="highlight hide" id="tabla_saldos_status">
                            <thead class="blue">
                                <tr class="text-white">
                                    <td><b>REGION</b></td>
                                    <td><b>ESTATUS</b></td>
                                    <td><b>CUENTAS</b></td>
                                    <td><b>VALOR</b></td>
                                    <td><b>ULTIMO TOQUE</b></td>
                                    <td><b>GRUPO</b></td>
                                </tr>
                            </thead>
                            <tbody id="tbody_tabla_saldos_status">
                            </tbody>
                        </table>
                        <table class="highlight hide" id="tabla_cuentas_status">
                            <thead class="blue">
                                <tr class="text-white">
                                    <td><b>REGION</b></td>
                                    <td><b>CUENTA</b></td>
                                    <td><b>ESTATUS</b></td>
                                    <td><b>RESTO</b></td>
                                    <td><b>ULTIMO TOQUE</b></td>
                                </tr>
                            </thead>
                            <tbody id="tbody_tabla_cuentas_status">
                            </tbody>
                        </table>
                    </div>
                    <div id="div_estadisticas" class="col s12 z-depth-1 div_gestor_contenido center center-align" style="margin-top:10px;">
                        <div class="col s2 m2 l2 rango-fechas-estadisticas hide">
                            <input type="text" class="datepicker input_date center-align" placeholder="desde">
                            <input type="text" class="datepicker input_date center-align" placeholder="hasta">
                            <a id="mostrar_estadisticas" class="waves-effect waves-light btn btn_gestiones green center">enviar</a>
                        </div>
                        <div id="tabla_estadisticas" class="col s12 m12 l12">jkshaksjdhkasjh</div>
                    </div>
                    <div class=" col s12 m12 l12  div_gestor_gestion">
                        <div class=" col s6 m6 l6 z-depth-1 div_gestor_textarea grey lighten-5 input_gestion">
                            <textarea id="gestion" readonly="" class="materialize-textarea limpiar_texto" data-length="1000" placeholder="Gestion"></textarea>
                        </div>
                        <div class=" col s6 m6 l6">
                            <div class="input-field col s6 m6 l6">
                                <select id="estatus">
                                    <option value="0" selected>Selecciona Estatus</option>
                                </select>
                                <label>Estatus</label>
                            </div>
                            <div class="input-field col s6 m6 l6">
                                <select id="codigo_llamada"></select>
                                <label>Codigo</label>
                            </div>
                            <div class="col s12 m12 l12 center-align">
                                <a class="waves-effect waves-light btn hide btn_gestiones pulse"><i class="material-icons right">send</i>convenio</a>
                                <a id="guardar_gestion" class="waves-effect waves-light btn btn_guardar_gestiones"><i class="material-icons right">save</i>Ok.</a>
                                <a id="cuenta_siguiente" class="waves-effect waves-light btn btn_siguiente "><i class="material-icons right">send</i>Sig.</a>
                            </div>
                        </div>
                    </div>

                    <div class="col s12 m12 l12 div_input_gestor_tiempos z-depth-1">
                        <div class="input-field col s2 m2 l2">
                            <input id="primera_llamada" type="text" class="validate" placeholder="" readonly="readonly" value="00:00:00">
                            <label for="primera_llamada">P.llamada</label>
                        </div>
                        <div class="input-field col s2 m2 l2">
                            <input id="tiempo_actual" type="text" class="validate" placeholder="" readonly="readonly" value="00:00:00">
                            <label for="tiempo_actual">Actual</label>
                        </div>
                        <div class="input-field col s2 m2 l2">
                            <input id="retraso_actual" type="text" class="validate" placeholder="" readonly="readonly" value="00:00:00">
                            <label for="retraso_actual">R. Actual</label>
                        </div>
                        <div class="input-field col s2 m2 l2">
                            <input id="cuentas_tocadas" type="text" class="validate" placeholder="" readonly="readonly" value="0000">
                            <label for="cuentas_tocadas">Cuentas</label>
                        </div>
                        <div class="input-field col s1 m1 l1">
                            <input id="llamadas_realizadas" type="text" class="validate" placeholder="" readonly="readonly" value="0000">
                            <label for="llamadas_realizadas" class="centro">Llamadas</label>
                        </div>
                        <div class="input-field col s1 m1 l1">
                            <input id="convenios" type="text" class="validate" placeholder="" readonly="readonly" value="0000">
                            <label for="convenios">Convenios</label>
                        </div>
                        <div class="input-field col s2 m2 l2">
                            <input id="t_convenios" type="text" class="validate" placeholder="" readonly="readonly" value="0000">
                            <label for="convenios">Total Convenios</label>
                        </div>
                    </div>

                </div>
                <div class="col s2 m2 l2 z-depth-2 div_search_gestor inner">
                    <div class="col s12 m12 l12 blue center-align">
                        <h6 class="letra_blanca"><b>Telefonos</b></h6>
                    </div> 
                    <div id="div_telefonos_cuenta" class=" col s12 m12 l12 "></div>
                    <div>
                        <div class="input-field col s12">
                            <input id="t_adicional_1" placeholder="" type="text" >
                            <label for="t_adicional_1">Tel. Adicional 1</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="t_adicional_2" placeholder="" type="text" >
                            <label for="t_adicional_2">Tel. Adicional 2</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="t_adicional_3" placeholder="" type="text" >
                            <label for="t_adicional_3">Tel. Adicional 3</label>
                        </div>
                        <div class="input-field col s12">
                            <a id="actualizar_telefonos" class="waves-effect waves-light btn green"><i class="material-icons right">send</i>Actualizar</a>
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
                    </div>
                    <div class="col s12 center">
                        <br>
                        <a id="cancelar_convenio" class="waves-effect waves-light btn red modal-close btn_gestiones "><i class="material-icons right">cancel</i>Cancel</a>
                        <a id="insert_convenio" class="waves-effect waves-light btn green btn_gestiones"><i class="material-icons right">save</i>Ok</a>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
            <div id="modal_alerta" class="modal">
                <div class="modal-content">
                    <h3 class="center">Alerta</h3>
                    <h5 id="mensaje_alerta" class="mensaje_alerta">

                    </h5>
                </div>
            </div>

            <div id="modal_agregar_agenda" class="modal">
                <div class="modal-content">
                    <h3 class="center">Nuevo Recordatorio</h3>
                    <div class="col s12">
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
                        <div class="col s12 right-align input-field">
                            <a class="btn red waves-effect modal-close">Cancelar</a>
                            <a id="insertar_agenda" class="btn blue waves-effect">Aceptar</a>
                        </div>

                    </div>
                </div>
            </div>


            <div id="modal_ver_agenda" class="modal">
                <div class="modal-content">
                    <h3 class="center">Alerta de Agenda</h3>
                    <input id="folio_agenda_act" type="hidden" value="">
                    <div class="col s12">
                        <div class="col s12 div_btn right-align"><p id="mensaje_error_agenda" class="red-text"></p></div>
                        <div class="input-field col s6">
                            <input id="agenta_cliente_unico" type="text" placeholder=" " class="validate">
                            <label for="agenta_cliente_unico">Cuenta</label>
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
                        <div class="col s12 center-align input-field">
                            <a class="btn red waves-effect modal-close">Posponer</a>
                            <a id="cuenta_agenda_datos" class="btn blue waves-effect modal-close">Buscar datos Ceunta</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fixed-action-btn">
                <a class="btn-floating btn-large red">
                    <i class="large material-icons">mode_edit</i>
                </a>
                <ul>
                    <li><a id="dm1" class="btn-floating red tooltipped modal-trigger " href="#modal_dm1" data-position="left" data-tooltip="Mensaje en Casa, Familiar o Conocido"><i class="material-icons">insert_chart</i></a></li>
                    <li><a id="dm4" class="btn-floating yellow darken-1 tooltipped  modal-trigger" href="#modal_dm4" data-position="left" data-tooltip="Mensaje en Trabajo"><i class="material-icons">format_quote</i></a></li>
                    <li><a id="dm5" class="btn-floating green tooltipped  modal-trigger"  href="#modal_dm5" data-position="left" data-tooltip="Mensaje en Buzon"><i class="material-icons">publish</i></a></li>
                    <li><a id="neg"class="btn-floating blue tooltipped  modal-trigger"  href="#modal_neg" data-position="left" data-tooltip="Negociando con Titular"><i class="material-icons">attach_file</i></a></li>
                    <li><a id="pr"class="btn-floating blue tooltipped  modal-trigger"  href="#modal_pr" data-position="left" data-tooltip="Promesa pago"><i class="material-icons">attach_file</i></a></li>
                    <li><a id="pi"class="btn-floating blue tooltipped  modal-trigger"  href="#modal_pi" data-position="left" data-tooltip="Promesa Incumplida"><i class="material-icons">attach_file</i></a></li>
                </ul>
            </div>
            <div id="modal_dm1" class="modal">
                <div class="modal-content">
                    <h3 class="center">Mensaje en Casa, Familiar o Conocido</h3>
                    <div class="col s12 m12 l12">
                        <h6>•	APERTURA DE LLAMADA CON SALUDO E IDENTIFICACION DE GESTOR COMO CONSULTOR</h6>
                        <h6>•	PREGUNTAR POR TITULAR DE LA LINEA</h6>
                        <h6>•	DAR MOTIVO DE LLAMADA E INFORMAR ESTATUS DE CUENTA, ASI COMO PROCESO QUE SEGUIRÁ</h6>
                        <h6>•	SOLICITAR HORARIO DE LOCALIZACION</h6>
                        <h6>•	CONFIRMAR SI TRABAJA AHÍ Y PUESTO</h6>
                        <h6>•	DEJAR MENSAJE: QUE SE COMUNIQUE CON NOSOTROS PARA ASESORARLO EN SOLUCIONAR SITUACION Y SIGA CON BENEFICIOS DE SER CLIENTE TELCEL. SE PRORCIONA LADA SIN COSTO 01800..</h6>
                        <h6>•	SOLICITAR NOMBRE Y RELACION LABORAL DE QUIEN ATIENDE LLAMADA</h6>
                        <h6>•	CONFIRMAR NUMERO DE TELEFONO TOMADO</h6>
                        <h6>•	INVOLUCRA EN PAGO A FAMILIAR DIRECTO</h6>
                        <h6>•	EN CASO DE CR¨S MENCIONAR SUSPENSION DE LINEAS</h6>
                        <h6>•	CIERRE DE LLAMADA AGRADECE ATENCIÓN Y TIEMPO</h6>
                    </div>
                </div>
            </div>
            <div id="modal_dm4" class="modal">
                <div class="modal-content">
                    <h3 class="center">Mensaje en Trabajo</h3>
                    <div class="col s12 m12 l12">
                        <h6>•	APERTURA DE LLAMADA CON SALUDO E IDENTIFICACION DE GESTOR COMO CONSULTOR</h6>
                        <h6>•	PREGUNTAR POR TITULAR DE LA LINEA</h6>
                        <h6>•	DAR MOTIVO DE LLAMADA E INFORMAR ESTATUS DE CUENTA, ASI COMO PROCESO QUE SEGUIRÁ</h6>
                        <h6>•	SOLICITAR HORARIO DE LOCALIZACION</h6>
                        <h6>•	CONFIRMAR SI TRABAJA AHÍ Y PUESTO</h6>
                        <h6>•	DEJAR MENSAJE: QUE SE COMUNIQUE CON NOSOTROS PARA ASESORARLO EN SOLUCIONAR SITUACION Y SIGA CON BENEFICIOS DE SER CLIENTE TELCEL. SE PRORCIONA LADA SIN COSTO 01800..</h6>
                        <h6>•	SOLICITAR NOMBRE Y RELACION LABORAL DE QUIEN ATIENDE LLAMADA</h6>
                        <h6>•	CONFIRMAR NUMERO DE TELEFONO TOMADO</h6>
                        <h6>•	EN CASO DE CR¨S MENCIONAR SUSPENSION DE LINEAS</h6>
                        <h6>•	CIERRE DE LLAMADA AGRADECE ATENCIÓN Y TIEMPO</h6>
                    </div>
                </div>
            </div>
            <div id="modal_dm5" class="modal">
                <div class="modal-content">
                    <h3 class="center">Mensaje en Buzon</h3>
                    <div class="col s12 m12 l12">
                        <h6>•	APERTURA DE LLAMADA CON SALUDO E IDENTIFICACION DE GESTOR COMO LIC.</h6>
                        <h6>•	DEJAR MENSAJE CLARO Y CON FLUIDEZ</h6>
                        <h6>•	DAR MOTIVO DE LLAMADA E INFORMAR ESTATUS DE CUENTA, ASI COMO PROCESO QUE SEGUIRÁ</h6>
                        <h6>•	DAR INFORMACION DE SALDO, PENALIZACION</h6>
                        <h6>•	DEJAR MENSAJE: QUE SE COMUNIQUE CON NOSOTROS PARA ASESORARLO EN SOLUCIONAR SITUACION Y MENCIONAR CONSECUENCIAS. SE PRORCIONA LADA SIN COSTO 01800..</h6>
                        <h6>•	EN CASO DE CR¨S MENCIONAR SUSPENSION DE LINEAS</h6>
                        <h6>•	CIERRE DE LLAMADA</h6>
                    </div>
                </div>
            </div>
            <div id="modal_neg" class="modal">
                <div class="modal-content">
                    <h3 class="center">NEGOCIANDO CON TITULAR</h3>
                    <div class="col s12 m12 l12">
                        <h6>• APERTURA DE LLAMADA CON SALUDO E IDENTIFICACION DE GESTOR COMO CONSULTOR</h6>
                        <h6>• PREGUNTAR POR TITULAR DE LA LINEA</h6>
                        <h6>• DAR MOTIVO DE LLAMADA E INFORMAR ESTATUS DE CUENTA, MORA, SALDO VENCIDO, PENALIZACION</h6>
                        <h6>• PREGUNTAR MOTIVO DE NO PAGO</h6>
                        <h6>• MOSTRAR EMPATÍA CON SITUACION DEL CLIENTE</h6>
                        <h6>• RESPONDER CON ARGUMENTACION DE CONTRATO</h6>
                        <h6>• PREGUNTAR SI TIENE INTERES EN SOLUCIONAR SITUACION</h6>
                        <h6>• INFORMAR SITUACION DE PLAN TARIFARIO SE ENCUENTRA EN INSTANCIA EXTRAJUDICIAL. LO CUAL DA ORIGEN A …(MENCIONAR CONSECUENCIAS INFORMAR PROCESO QUE SEGUIRA) EN CASO DE CR´S MENCIONA SUSPENSION</h6>
                        <h6>• OFRECER ASESORIA PARA SOLUCIONAR SITUACION. SUGERIR PREVENIR O EVITAR ACCIONES LEGALES CON CONSECUENCIAS DE MAYOR COSTO QUE EL DE LA DEUDA.</h6>
                        <h6>• OFRECER CONVENIO COMO APOYO A SITUACION</h6>
                        <h6>• SOLICITAR PAGO DE INTENCION INMEDIATO (DAR OPCIONES DE CONSEGUIR DINERO)</h6>
                        <h6>• DEJAR QUE CLIENTE DIGA CUANTO PUEDE CONSEGUIR</h6>
                        <h6>• SOLITICITARLE HAGA ESFUERZO Y FIJAR MAYOR IMPORTE</h6>
                        <h6>• SOLICITA HORARIO DE LOCALIZACION Y TEL ALTERNO</h6>
                        <h6>• GRABAR AUTORIZACION DE LLAMARLE A TEL ALTERNO</h6>
                        <h6>• INVESTIGA FECHAS EN QUE RECIBE NOMINA O INGRESOS</h6>
                        <h6>• CONFIRMA DIRECCION DE CONTRATO</h6>
                        <h6>• CIERRE DE LLAMADA AGRADECE ATENCIÓN Y TIEMPO</h6>
                    </div>
                </div>
            </div>
            <div id="modal_pr" class="modal">
                <div class="modal-content">
                    <h3 class="center">Promesa de Pago</h3>
                    <div class="col s12 m12 l12">
                        <h6>• APERTURA DE LLAMADA+E24+E25:E32+E25:E33+E24+E25:E32+E24+E25:E32+E25:E34+E25:E35+E2+E25:E34 </h6>
                        <h6>• PREGUNTAR POR TITULAR DE LA LINEA </h6>
                        <h6>• DAR MOTIVO DE LLAMADA E INFORMAR ESTATUS DE CUENTA, MORA, SALDO VENCIDO, PENALIZACION </h6>
                        <h6>• cliente ya mostro intención de pago </h6>
                        <h6>• SOLICITAR PAGO DE INTENCION INMEDIATO (DAR OPCIONES DE CONSEGUIR DINERO) </h6>
                        <h6>• PRIMER PARCIALIDAD IGUAL O MAYOR AL 50% DE SALDO </h6>
                        <h6>• FECHAS DE CONVENIO SEMANALES </h6>
                        <h6>• MENCIONAR AL CLIENTE QUE CONVENIO QUEDARA GRABADO COMO RESPALDO DE COMPROMISO DE PAGO </h6>
                        <h6>• CONFIRMAR CONVENIO UTILIZANDO SCRIP </h6>
                        <h6>• ESPECIFICAR NOMBRE CLIENTE,No.CTA.,MONTO PAGO, FECHA PAGO, FORMA DE PAGO </h6>
                        <h6>• DAR 01800... PARA REPORTAR SU PAGO </h6>
                        <h6>• MENCIONAR A CLIENTE IMPORTANCIA DE REPORTAR PAGO </h6>
                        <h6>• CIERRE DE LLAMADA AGRADECE ATENCIÓN Y TIEMPO </h6>
                    </div>
                </div>
            </div>
            <div id="modal_pi" class="modal">
                <div class="modal-content">
                    <h3 class="center">Promesa Incumplida</h3>
                    <div class="col s12 m12 l12">
                        <h6>• APERTURA DE LLAMADA CON SALUDO E IDENTIFICACION DE GESTOR COMO LICENCIADO</h6>
                        <h6>• PREGUNTAR POR TITULAR DE LA LINEA</h6>
                        <h6>• PREGUNTAR MOTIVO DE INCUMPLIMIENTO</h6>
                        <h6>• MOSTRAR EMPATÍA CON SITUACION DEL CLIENTE</h6>
                        <h6>• MENCIONAR NUMERO DE VECES QUE HA INCUMPLIDO</h6>
                        <h6>• NÚMERO DE VECES QUE SE LE HA HABLADO</h6>
                        <h6>• SUGERIR CONGELAR SALDO CON PAGO DE INTENCION MISMO DIA O MENOS DE 48 HRS.</h6>
                        <h6>• EN CASO DE INCUMPLIR DE NUEVO LOS PAGOS QUE HAGA SERÁN TOMADOS COMO ABONO A PROCESO JURIDICO</h6>
                        <h6>• MENCIONAR CONSECUENCIAS DE CONTRATO</h6>
                        <h6>• BURO NACIONAL, CANCELACION DE CONTRATO CON EXIGENCIA DE PAGO TOTAL</h6>
                        <h6>• CIERRE DE LLAMADA AGRADECE ATENCIÓN Y TIEMPO</h6>
                    </div>
                </div>
            </div>
            <div id="modal_busqueda" class="modal">
                <div class="modal-content">
                    <h3 class="center">Resutado</h3>
                    <div class="input-field col s6 offset-s3">
                        <input id="buqueda_relacionada" type="text" class="validate">
                        <label for="buqueda_relacionada">Busqueda </label>
                    </div>
                    <div class="col s12 tabla_resultado_busqueda">
                        <table>
                            <thead>
                                <tr>
                                    <th>CUENTA</th>
                                    <th>DESCRIPCION</th>
                                    <th>ASIGNACION</th>
                                    <th>ESTATUS</th>
                                </tr>
                            </thead>
                            <tbody id="tb_cont_busqueda">

                            </tbody>
                            <div class="cargando">

                            </div>
                        </table>

                    </div>
                </div>
                <div class="col s12 input-field right-align">
                    <a href="#!" class="modal-close waves-effect waves-green btn">Cerrar</a>
                </div>
            </div>
        </div>

        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/highcharts-more.js"></script>
        <script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <script type="text/javascript" src="js/js/Script.js"></script>
    </body>
</html>