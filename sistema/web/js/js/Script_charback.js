
window.onload = function () {
    $("#tiempo_actual").val("00:00:00");
    $("#retraso_actual").val("00:00:00");
    limpiar_inputs();
//    elect_llamadas_gestor_chbk(id_usuario);
    select_estatus_puesto_combo(id_usuario, "estatus");
    select_estatus_llamada_combo("codigo_llamada", true);
    select_cuenta_siguiente_chbk(id_usuario, 0, 0, 0);

    select_ciclos_chbk_usuario(id_usuario, "filtro_ciclo");
    select_estatus_chbk_usuario(id_usuario, 0, "filtro_estatus_original"); // CICLO 0, SÓLO EN FN READY
    select_estatus_gestion_chbk_usuario(id_usuario, 0, 0, "filtro_estatus_gestion"); // ESTATUS ORIGINAL = 0, SÓLO EN FN READY Y TAMBIEN CICLO

    select_agendas();
};


$("#cuenta_siguiente").click(function () {
    limpiar_inputs();
    let filtro_ciclo = $("#filtro_ciclo").val() || 0;
    let filtro_estatus_original = $("#filtro_estatus_original").val() || 0;
    let filtro_estatus_gestion = $("#filtro_estatus_gestion").val() || 0;
    console.log("Datos Cuenta Sig: ", id_usuario, JSON.stringify(filtro_ciclo).replace(/"| |\]|\[/giu, ""), JSON.stringify(filtro_estatus_original).replace(/"| |\]|\[/giu, ""), JSON.stringify(filtro_estatus_gestion).replace(/"| |\]|\[/giu, ""));
    select_cuenta_siguiente_chbk(id_usuario, filtro_ciclo, filtro_estatus_original, filtro_estatus_gestion);
});

$("#filtro_ciclo").change(function () {
    select_estatus_chbk_usuario(id_usuario, $("#filtro_ciclo").val(), "filtro_estatus_original");
});

$("#filtro_estatus_original").change(function () {
    select_estatus_gestion_chbk_usuario(id_usuario, $("#filtro_ciclo").val(), $("#filtro_estatus_original").val(), "filtro_estatus_gestion");
});

$("#tbody_telefonos").on("click", ".number_call", function () {
//    alert(`Hola ${ $(this).text() }`);
    $("#gestion").val($(this).text());
    $("#numero_marcado_deudor").val($(this).text());
});

$("#guardar_gestion").click(function () {
    let estatus = $("#estatus").val();
    let codigo = $("#codigo_llamada").val();
    let gestion = $("#gestion").val().replace(/"|,|'|-/gi, "") || "0";
    let num_marc = $("#numero_marcado_deudor").val().replace(/"|,|'|-/gi, "") || "0";
//    console.log(estatus, codigo, gestion, num_marc);
    if (estatus !== "0" && codigo !== "0" && gestion !== "0" && num_marc !== "0") {
        insert_gestion_charback($("#CLIENTE_UNICO").val(), num_marc, estatus, codigo, id_usuario, gestion,
                $("#tiempo_actual").val(),
                $("#retraso_actual").val(),
                $("#EXPEDIENTE").val(),
                false,
                0,
                id_puesto_usuario
                );
    } else {
        $("#modal_alerta").modal("open");
        $("#mensaje_alerta").empty();
        $("#mensaje_alerta").append(`Verificar los campos de: <br>> Estatus 
        <br>> Codigo de la Llamada 
        <br>> Dictaminacion de la Cuenta 
        <br>> Numero Marcado 
        `);
//        alert(`Algunos datos no son validos`);
    }
});

$(".limpiar_texto").keyup(function () {
    var cadena = $(this).val().replace(/[&\/\#,+()$~%'":*?<>{}|]/g, '');
    cadena = cadena.toUpperCase();
    $(this).val(cadena);

});

$("#buqueda_relacionada").keyup(function (e) {

    if (e.keyCode === 13) {
        if ($(this).val().length >= 6) {
            buscar_cuentas_gestor($(this).val(), id_puesto_usuario, "tb_cont_busqueda");
        } else {
            alert('El criterio de busqueda es muy corto');
        }
    }
});

$("#tb_cont_busqueda").on("click", "tr", function () {
//    alert($(".cuenta_busqueda", this).text());
    $("#tb_cont_busqueda").empty();
    $("#cargando_busqueda").empty();
    $("#cargando_busqueda").append('<div class="progress"><div class="indeterminate blue"></div></div>');
    select_datos_cuenta_charback($(".cuenta_busqueda", this).text());

});

$("#filtro").keyup(function (e) {
    if (e.keyCode === 13) {
        let data_input = $(this).val().replace(/"|,|'|-/gi, "");
        select_datos_cuenta_charback(parseInt(data_input));
    }
});

$("#tab_pagos").click(function () {
    select_pagos_cuenta_tabla($("#CLIENTE_UNICO").val(), "tbody_tabla_pagos");
});
$("#tab_convenios").click(function () {
//    select_pagos_cuenta_tabla( $("#CLIENTE_UNICO").val(), "tbody_tabla_pagos");
    select_convenio_cuenta_tabla($("#CLIENTE_UNICO").val(), "tbody_tabla_convenios");
});

$("#codigo_llamada").change(function () {
    let codigo_llamda = $("#codigo_llamada").val();

    if (codigo_llamda === "1") {

        // se hace los pasos para ingraser convenio
        let estatus = $("#estatus").val();
        let gestion = $("#gestion").val().replace(/"|,|'|-/gi, "") || "0";
        let num_marc = $("#numero_marcado_deudor").val().replace(/"|,|'|-/gi, "") || "0";

        let op_estatus = $("#codigo_llamada").html();

        if (codigo_llamda === "1" && estatus !== "0" && gestion !== "0" && num_marc !== "0") {
            $("#modal_convenio").modal("open");
        } else {
            $("#modal_alerta").modal("open");
            $("#mensaje_alerta").empty();
            $("#mensaje_alerta").append(`Verificar los campos de: <br>> Estatus 
                <br>> Codigo de la Llamada 
                <br>> Dictaminacion de la Cuenta 
                <br>> Numero Marcado 
            `);
            $("#codigo_llamada").empty();
            $("#codigo_llamada").append(op_estatus);
            $('select').formSelect();
        }
        $("#cancelar_convenio").click(function () {
            $("#importe_convenio").val("");
            $("#fecha_convenio").val("");
            $("#codigo_llamada").empty();
            $("#codigo_llamada").append(op_estatus);
            $('select').formSelect();
        });
    }

//    console.log(op_estatus);
});

$("#insert_convenio").click(function () {
    let importe_convenio = $("#importe_convenio").val() || "0";
    let fecha_convenio = $("#fecha_convenio").val() || "0";

    if (importe_convenio !== "0" && fecha_convenio !== "0") {

        let cuenta = $("#CLIENTE_UNICO").val();
        let id_asignacion = $("#CLIENTE_UNICO").val();
        let _id_region = $("#CLIENTE_UNICO").val();
        let codigo_llamda = $("#codigo_llamada").val();
        let estatus = $("#estatus").val();
        let gestion = $("#gestion").val().replace(/"|,|'|-/gi, "") || "0";
        let num_marc = $("#numero_marcado_deudor").val().replace(/"|,|'|-/gi, "") || "0";

        let myObjConvenio = {
            convenio: importe_convenio,
            fecha: fecha_convenio,
            id_usuario: id_usuario,
            cuenta: cuenta,
            id_asignacion: id_asignacion,
            id_region: _id_region
        };

        let myObjGestion = {
            _cuenta: cuenta,
            _num_marc: num_marc,
            _estatus: estatus,
            _codigo: codigo_llamda,
            _id_usuario: id_usuario,
            _gestion: gestion,
            _tiempo: $("#tiempo_actual").val(),
            _retraso: $("#retraso_actual").val(),
            _expediente: $("#EXPEDIENTE").val(),
            _f_pre: false,
            _pre: 0,
            _id_puesto: id_puesto_usuario
        };
        insertar_convenio(myObjConvenio, myObjGestion);
    } else {
        $("#alerta_convenio").empty();
        $("#alerta_convenio").append(`Falta llenar los campos de <b>Importe y Fecha del convenio</b>`);
        $("#importe_convenio, #fecha_convenio").click(function () {
            $("#alerta_convenio").empty();
        });
    }


});

// Agendas
$("#new_agenda").click(function () {
    $('#modal_agregar_agenda').modal('open');
});

$('#insertar_agenda').click(function () {
    insertar_agenda();
});


$('#tab_agendas').click(function () {
    select_agendas();
});

$('#cuenta_agenda_datos').click(function () {
    select_datos_cuenta_charback($("#agenta_cliente_unico").val());
    update_estatus_agenda($("#folio_agenda_act").val());
});


$('#agregar_nuevo_numero').click(function () {
    $("#modal_nuevo_numero").modal("open");
});


$('#save_new_number').click(function () {
    let numero = $("#nuevo_numero").val().replace(/"|,|'|-/gi, "") || 0;
    let nombre = $("#nombre_nuevo_numero").val().replace(/"|,|'|-/gi, "") || 0;
    let cuenta = $("#CLIENTE_UNICO").val() || 0;
    let _id_usuario = id_usuario;
    save_new_number(numero, nombre, cuenta, _id_usuario);
});


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function limpiar_inputs() {
    $("#info_gestor_secundario input").val("");
    $("#info_gestor input").val("");
    $("#tbody_telefonos").empty();
    $("#tbody_tabla_gestiones").empty();
    $("#numero_marcado_deudor").val("");
    $("#tbody_tabla_pagos").empty();
    $("#tbody_tabla_convenios").empty();

    select_estatus_puesto_combo(id_usuario, "estatus");
    select_estatus_llamada_combo("codigo_llamada", true);
    $("#gestion").val("");
    $('.tabs').tabs();
}

//==============================================================================
function insert_gestion_charback(
        _cuenta, _numero_marcado, _id_estatus_cuenta, _id_estatus_llamada,
        _id_usuario, _gestion, _duracion, _retraso, _expediente, _predictivo, _f_predictivo, _id_puesto) {

    var params = {
        accion: "insert_gestion",
        cuenta: _cuenta,
        numero_marcado: _numero_marcado,
        id_estatus_cuenta: _id_estatus_cuenta,
        id_estatus_llamada: _id_estatus_llamada,
        id_usuario: _id_usuario,
        gestion: _gestion,
        duracion: _duracion,
        retraso_llamada: _retraso,
        expediente: _expediente,
        f_predictivo: _f_predictivo,
        id_puesto: _id_puesto
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ManageGestion",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            console.log(dataRes);
            $("#gestion").val("");
            $("#numero_marcado_deudor").val("");
            alert(dataRes);
            select_gestiones_cuenta_todas($("#CLIENTE_UNICO").val(), "tbody_tabla_gestiones");
//                select_llamadas_gestor($('#usuario_sistema', parent.document).val());
        }
    });
}

function telefonos_relacionados(_cuenta) {
    var params = {
        action: "select_telefonos_cr",
        cuenta: _cuenta
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerGestor",
        data: params,
        dataType: "json",
        success: function (tels_cr) {
//            console.log("Telefono cr", tels_cr);
            for (let item of tels_cr) {
//                console.log(item.nombre);
                $('#tbody_telefonos').append(`<tr><td>${item.nombre}</td><td><i class="material-icons">phone_iphone</i></td>
                <td><a class="font_number_monospace number_call" ref="zoiper://${item.telefono}">${item.telefono}</a></td></tr>`);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}

//funcion de buscador
function buscar_cuentas_gestor(_busqueda, _id_puesto, _div) {
    $("#cargando_busqueda").empty();
    $("#cargando_busqueda").append('<div class="progress"><div class="indeterminate"></div></div>');
    var params = {
        action: "select_buscar_cuentas",
        busqueda: _busqueda,
        id_puesto: _id_puesto
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerGestor",
        data: params,
        dataType: "json",
        success: function (cuentas) {
//            console.log(cuentas);
            $("#cargando_busqueda").empty();
            $("#" + _div).empty();
            for (let row of cuentas) {
                $("#" + _div).append(`<tr><td class="cuenta_busqueda">${row["cuenta"]}</td><td>${row["nombre"]}</td><td>${row["asignacion"]}</td><td>${row["ultimo_estatus_cuenta"]}</td></tr>`);
            }
        }
    });
}


function select_datos_cuenta_charback(_cuenta) {
    limpiar_inputs();
    $("body").addClass("cargando");
    $("#info_gestor").addClass("cargando");
    $("#info_gestor_secundario").addClass("cargando");
    var params = {
        accion: "select_datos_cuenta_chbk",
        cuenta: _cuenta
    };
//    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ManageCuentas",
        data: params,
        dataType: "json",
        success: function (dataRes) {
            console.log(dataRes);
            if (dataRes["CLIENTE_UNICO"] === "0") {
                $("body").removeClass("cargando");
                $("#info_gestor").removeClass("cargando");
                $("#info_gestor_secundario").removeClass("cargando");
                $("#modal_alerta").modal("open");
                $("#mensaje_alerta").empty();
                $("#mensaje_alerta").append(`No se encontro la cuenta 
                <br><br> Verifica que la cuenta este bien escrita
                `);
            } else {

                $('#tbody_telefonos').empty();
                for (let item in dataRes) {
//                console.log(item, dataRes[item]);
                    $('#' + item).val(dataRes[item]);
//                console.log( item.toLowerCase().indexOf('telefono'.toLowerCase()) ) ;
                    if (item.toLowerCase().indexOf('telefono'.toLowerCase()) === 0) {
//                    console.log(item);
                        $('#tbody_telefonos').append(`<tr><td>${item}</td><td><i class="material-icons">phone_iphone</i></td>
                        <td><a class="font_number_monospace number_call" ref="zoiper://${dataRes[item]}">${dataRes[item]}</a></td></tr>`);
                    }
                }
                $("#DIRECCION").val(`${ dataRes["direccion"] } ${ dataRes["colonia"] } ${ dataRes["ciudad"] }`);

                $(".num_de_ref_bancaria").empty();
                $(".num_de_ref_bancaria").append(`${ dataRes["ref_bancaria"] }`);

                telefonos_relacionados($("#CLIENTE_UNICO").val());
//            pasar_datos_a_pantalla_chbk(dataRes);
                select_gestiones_cuenta_todas($("#CLIENTE_UNICO").val(), "tbody_tabla_gestiones");
                $("#cargando_busqueda").empty();
                try {
                    $("#modal_busqueda").modal('close');
                } catch (e) {
                    console.log("La Biblioteca de Materialize no esta importada");
                }
            }

        },
        error: function (error) {
            console.log(error);
            $("body").removeClass("cargando");
            $("#info_gestor").removeClass("cargando");
            $("#info_gestor_secundario").removeClass("cargando");
        }
    });
}

function myFunction_buscar() {
    console.log("Nada");
}

//==============================================================================
function select_convenio_cuenta_tabla(_cuenta, _id_caja) {
    $("#" + _id_caja).empty();
    $("#" + _id_caja).append("<div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>");
    var params = {
        accion: "select_convenio_cuenta_tabla",
        cuenta: _cuenta
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageConvenio",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append(dataRes);
        }
    });
}

//pantalla = document.getElementById("screen");
//var isMarch = false;
//var acumularTime = 0;
//function start() {
//    if (isMarch == false) {
//        timeInicial = new Date();
//        control = setInterval(cronometro, 10);
//        isMarch = true;
//    }
//}
//function cronometro() {
//    timeActual = new Date();
//    acumularTime = timeActual - timeInicial;
//    acumularTime2 = new Date();
//    acumularTime2.setTime(acumularTime);
//    cc = Math.round(acumularTime2.getMilliseconds() / 10);
//    ss = acumularTime2.getSeconds();
//    mm = acumularTime2.getMinutes();
//    hh = acumularTime2.getHours() - 18;
//    if (cc < 10) {
//        cc = "0" + cc;
//    }
//    if (ss < 10) {
//        ss = "0" + ss;
//    }
//    if (mm < 10) {
//        mm = "0" + mm;
//    }
//    if (hh < 10) {
//        hh = "0" + hh;
//    }
//    pantalla.innerHTML = hh + " : " + mm + " : " + ss + " : " + cc;
//}



///  funciones para eliminar las de mas archivos
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function select_estatus_puesto_combo(_id_usuario, _id_caja) {
    var params = {
        accion: "select_estatus_puesto_combo",
        id_usuario: _id_usuario
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageEstatusCuenta",
        data: params,
        dataType: "html",
        success: function (dataRes) {
//            console.log('select_estatus_puesto_combo',dataRes);
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append('<option value="0">Estatus de Gestion</option>');
            $("#" + _id_caja).append(dataRes);
            try {
                $('select').formSelect();
            } catch (e) {
                console.log('No se encontro la libreria de js Materialize');
            }

        }
    });
}

function select_estatus_llamada_combo(_id_caja, _seleccione) {
    var params = {
        accion: "select_estatus_llamada_combo"
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageEstatusLlamada",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            if (_seleccione) {
                $("#" + _id_caja).append('<option value="0">Codigo de Gestion</option>');
            }
            $("#" + _id_caja).append(dataRes);
            try {
                $('select').formSelect();
            } catch (e) {
                console.log('No se encontro la libreria de js Materialize');
            }
        }
    });
}

function select_cuenta_siguiente_chbk(_id_usuario, _ciclo, _estatus_original, _estatus) {
    $("body").addClass("cargando");
    $("#info_gestor").addClass("cargando");
    $("#info_gestor_secundario").addClass("cargando");
    var params = {
        accion: "select_cuenta_siguiente_chbk",
        id_usuario: _id_usuario,
        ciclo: _ciclo,
        estatus_original: _estatus_original,
        estatus: _estatus
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageCuentas",
        data: params,
        dataType: "json",
        success: function (dataRes) {

            console.log(dataRes);
            $('#tbody_telefonos').empty();
            for (let item in dataRes) {
//                console.log(item, dataRes[item]);
                $('#' + item).val(dataRes[item]);
//                console.log( item.toLowerCase().indexOf('telefono'.toLowerCase()) ) ;
                if (item.toLowerCase().indexOf('telefono'.toLowerCase()) === 0) {
//                    console.log(item);
                    $('#tbody_telefonos').append(`<tr><td>${item}</td><td><i class="material-icons">phone_iphone</i></td>
                        <td><a class="font_number_monospace number_call" ref="zoiper://${dataRes[item]}">${dataRes[item]}</a></td></tr>`);

                }
            }
            $("#DIRECCION").val(`${ dataRes["direccion"] } ${ dataRes["colonia"] } ${ dataRes["ciudad"] }`);
            $(".num_de_ref_bancaria").empty();
            $(".num_de_ref_bancaria").append(`${ dataRes["ref_bancaria"] }`);

            telefonos_relacionados($("#CLIENTE_UNICO").val());
//            pasar_datos_a_pantalla_chbk(dataRes);
            select_gestiones_cuenta_todas($("#CLIENTE_UNICO").val(), "tbody_tabla_gestiones");
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function select_ciclos_chbk_usuario(_id_usuario, _id_caja) {
    var params = {
        accion: "select_ciclos_chbk_usuario",
        id_usuario: _id_usuario
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAsignacion",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append('<option value="0">TODOS...</option>');
            $("#" + _id_caja).append(dataRes);
            try {
                $('select').formSelect();
            } catch (e) {
                console.log('No se encontro la libreria de js Materialize');
            }
        }
    });
}

function select_estatus_chbk_usuario(_id_usuario, _ciclo, _id_caja) {
    var params = {
        accion: "select_estatus_chbk_usuario",
        id_usuario: _id_usuario,
        ciclo: _ciclo
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAsignacion",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append('<option value="0">TODOS...</option>');
            $("#" + _id_caja).append(dataRes);
            try {
                $('select').formSelect();
            } catch (e) {
                console.log('No se encontro la libreria de js Materialize');
            }
        }
    });
}

function select_estatus_gestion_chbk_usuario(_id_usuario, _ciclo, _estatus_original, _id_caja) {
    var params = {
        accion: "select_estatus_gestion_chbk_usuario",
        id_usuario: _id_usuario,
        ciclo: _ciclo,
        estatus_original: _estatus_original
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAsignacion",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append('<option value="0">TODOS...</option>');
            $("#" + _id_caja).append(dataRes);
            try {
                $('select').formSelect();
            } catch (e) {
                console.log('No se encontro la libreria de js Materialize');
            }

        }
    });
}

function select_pagos_cuenta_tabla(_cuenta, _id_caja) {
    $("#" + _id_caja).empty();
    $("#" + _id_caja).append("<div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>");
    var params = {
        accion: "select_pagos_cuenta_tabla",
        cuenta: _cuenta
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagocuenta",
        data: params,
        dataType: "html",
        success: function (dataRes) {
//            console.log(dataRes);
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append(dataRes);
        }
    });
}

function select_gestiones_cuenta_todas(_cuenta, _id_caja) {
    $("#" + _id_caja).empty();
    $("#" + _id_caja).append("<div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>");
    var params = {
        accion: "select_gestiones_cuenta_todas",
        cuenta: _cuenta
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageGestion",
        data: params,
        dataType: "html",
        success: function (dataRes) {
//            console.log(dataRes.split('</thead>'));
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append(dataRes.split('</thead>')[1]);

            $("body").removeClass("cargando");
            $("#info_gestor").removeClass("cargando");
            $("#info_gestor_secundario").removeClass("cargando");
        }
    });
}

function insertar_convenio(_myObjConvenio, _ObjG) {
    console.log(_myObjConvenio);
    var params = {
        action: "insertar_convenio",
        datos: JSON.stringify(_myObjConvenio)
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerGestor",
        data: params,
        dataType: "json",
        success: function (respuesta) {
            console.log(respuesta);
            $("#alerta_convenio").empty();
            $("#alerta_convenio").append(respuesta.resultado);
            $("#importe_convenio").val("");
            $("#fecha_convenio").val("");

            if (respuesta.resultado !== "NO PERMITIDO" && respuesta.resultado !== "VERIFICA FECHA" && respuesta.resultado !== "VERIFIQUE IMPORTE Y LA FECHA DEL CONVENIO") {

                insert_gestion_charback(
                        _ObjG._cuenta,
                        _ObjG._num_marc,
                        _ObjG._estatus,
                        _ObjG._codigo,
                        _ObjG._id_usuario,
                        _ObjG._gestion,
                        _ObjG._tiempo,
                        _ObjG._retraso,
                        _ObjG._expediente,
                        _ObjG._f_pre,
                        _ObjG._pre,
                        _ObjG._id_puesto
                        );
                $("#modal_convenio").modal("close");

                let op_estatus = $("#codigo_llamada").html();

                $("#codigo_llamada").empty();
                $("#codigo_llamada").append(op_estatus);
                $('select').formSelect();

                $("#alerta_convenio").empty();

            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}


function select_agendas() {
    $.ajax({
        type: "POST",
        url: "ControllerGestor",
        data: {action: 'select_agendas', id_gestor: id_usuario},
        dataType: "json",
        success: function (result) {
//            console.log("Agendas del gestor: ",result);
            $('#tb_list_agenda').empty();
            for (let item of result) {
                $('#tb_list_agenda').append(`<tr id='row_agenda_${item.ID_REGISTRO}' class='row_reg_agenda ${item.F_ACTIVE}'>
                <td>${item.ID_REGISTRO}</td>
                <td>${item.CUENTA}</td>
                <td>${item.DESCRIPCION}</td>
                <td>${item.FECHA}</td>
                <td>${item.HORA}</td>
                </tr>`);
                if (parseInt(item.H_EJECUTAR) > 0 && item.EST_F_ACTIVE !== "0") {
//                    console.log(parseInt(item.H_EJECUTAR));
                    setTimeout(() => {
                        select_list_agendas_modal(item.CUENTA, item.DESCRIPCION, item.FECHA, item.HORA, item.ID_REGISTRO);
                        $('#modal_ver_agenda').modal('open');
                    }, parseInt(item.H_EJECUTAR) * 1000);
                }

            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function insertar_agenda() {
    let params = {
        action: 'insertar_agenda',
        cuenta: $('#cliente_unico_agenda').val(),
        id_usuario: id_usuario,
        descripcion: $('#descripcion_agenda').val(),
        fecha: $('#fecha_agenda').val(),
        hora: $('#hora_agenda').val()
    };
//    console.log("Parametros de insert agenda: ",params);
    $.ajax({
        type: "POST",
        url: "ControllerGestor",
        data: params,
        dataType: "json",
        success: function (result) {
//            console.log("Resulset insert Agenda:",result);
            if (result.response === 'OK') {
                $('#cliente_unico_agenda').val('');
                $('#descripcion_agenda').val('');
                $('#fecha_agenda').val('');
                $('#hora_agenda').val('');
                $('#modal_agregar_agenda').modal('close');
                select_agendas();
            } else {
                $('#mensaje_error_agenda').empty();
                $('#mensaje_error_agenda').append(result.response);

            }
        },
        error: function (err) {
            console.log(err);
        }
    });

}

function select_list_agendas_modal(_cuenta, _descripcion, _fecha, _hora, _folio) {
    $("#agenta_cliente_unico").val(_cuenta);
    $("#agenta_descripcion").val(_descripcion);
    $("#agenta_fecha").val(_fecha);
    $("#agenta_hora").val(_hora);
    $("#folio_agenda_act").val(_folio);
}

function update_estatus_agenda(_folio) {
    $.ajax({
        type: "POST",
        url: "ControllerGestor",
        data: {action: 'update_estatus_agenda', folio: _folio},
        dataType: "json",
        success: function (result) {
//            console.log("Resulset de descartar agenda: ",result);
            select_agendas();
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function save_new_number(_numero, _nombre, _cuenta, _id_usuario) {
    $.ajax({
        type: "POST",
        url: "ControllerGestor",
        data: {action: 'save_new_number', numero: _numero, nombre: _nombre, cuenta: _cuenta, id_usuario: _id_usuario},
        dataType: "json",
        success: function (result) {
            console.log("Resulset de save_new_number: ", result);
            $("#modal_nuevo_numero").modal("close");
            $("#modal_alerta").modal("open");
            $("#mensaje_alerta").empty();
            $("#mensaje_alerta").append(`${result.mensaje}`);
        },
        error: function (error) {
            console.log(error);
        }
    });
}
