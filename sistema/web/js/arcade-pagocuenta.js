//==============================================================================
function select_pagos_asignacion_tabla(_id_asignacion, _id_caja) {
    $("#" + _id_caja).css("cursor", "progress");
    var params = {
        accion: "select_pagos_asignacion_tabla",
        id_asignacion: _id_asignacion
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagocuenta",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).css("cursor", "default");
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append(dataRes);
        }
    });
}
;
//==============================================================================
function select_pagos_asignacion_tabla_fecha(_id_asignacion, _fecha, _id_caja) {
    $("#" + _id_caja).css("cursor", "progress");
    var params = {
        accion: "select_pagos_asignacion_tabla_fecha",
        id_asignacion: _id_asignacion,
        fecha: _fecha
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagocuenta",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).css("cursor", "default");
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append(dataRes);
        }
    });
}
;
//==============================================================================
function select_pagocuenta_combo(_id_caja) {
    var params = {
        accion: "select_pagocuenta_combo"
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagocuenta",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append('<option value="0">SELECCIONE...</option>');
            $("#" + _id_caja).append(dataRes);
        }
    });
}
;
//==============================================================================
function insert_pagos_asignacion(_id_usuario, _id_cliente, _id_region, _id_asignacion, _desde, _hasta, _id_caja) {
    $("#cargando").show();
    $("#" + _id_caja).hide();
    var params = {
        accion: "insert_pagos_asignacion",
        id_usuario: _id_usuario,
        id_cliente: _id_cliente,
        id_region: _id_region,
        id_asignacion: _id_asignacion,
        desde: _desde,
        hasta: _hasta
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagos",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#cargando").hide();
            $("#" + _id_caja).show();
            alert(dataRes);
//            location.href = "pagos.jsp";
            $("#paso_siguiente").hide();
            $("#form_cargar_pagos").show();
            select_pagos_asignacion_tabla($("#id_asignacion").val(), "div_pagos");

        }
    });
}
;
//==============================================================================
function update_pagocuenta(_id_pagocuenta, _pagocuenta) {
    var params = {
        accion: "update_pagocuenta",
        id_pagocuenta: _id_pagocuenta,
        pagocuenta: _pagocuenta
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagocuenta",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
        }
    });
}
;
//==============================================================================
function delete_pagocuenta(_id_pagocuenta, _id_caja) {
    var params = {
        accion: "delete_pagocuenta",
        id_pagocuenta: _id_pagocuenta
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagocuenta",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
            select_pagocuenta_tabla(_id_caja);
            select_pagocuenta_combo(_id_caja);

        }
    });
}
;
//==============================================================================
function select_pagos_diarios_tabla(_id_region, _desde, _hasta, id_caja) {
    $("#" + id_caja).empty();
    $("#" + id_caja).append("<div style='text-align:center;'><br><img src='images/lg.wave-ball-preloader.gif'><br></div>");
    var params = {
        accion: "select_pagos_diarios_tabla",
        id_region: _id_region,
        desde: _desde,
        hasta: _hasta

    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagosDiarios",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + id_caja).empty();
            $("#" + id_caja).append(dataRes);

        }
    });
}
;

//==============================================================================
function select_pagos_diarios_gestor(_usuario_sistema, _desde, _hasta, id_caja) {
    var params = {
        accion: "select_pagos_diarios_gestor",
        usuario_sistema: _usuario_sistema,
        desde: _desde,
        hasta: _hasta


    };
    $.ajax(
            {
                type: "POST",
                url: "/sistema/ManagePagosDiarios",
                data: params,
                dataType: "html",
                success: function (dataRes) {
                    $("#" + id_caja).empty();
                    $("#" + id_caja).append(dataRes);
                }
            });
}
;
//==============================================================================
function select_reporte_recuperacion_previa(_id_region2, _desde2, id_caja) {
    $("#" + id_caja).empty();
    $("#" + id_caja).append("<div style='text-align:center;'><br><img src='images/lg.wave-ball-preloader.gif'><br></div>");
    var params = {
        accion: "select_reporte_recuperacion_previa",
        id_region: _id_region2,
        desde: _desde2
    };
    $.ajax(
            {
                type: "POST",
                url: "/sistema/ManagePagosDiarios",
                data: params,
                dataType: "html",
                success: function (dataRes) {
                    $("#" + id_caja).empty();
                    $("#" + id_caja).append(dataRes);
                }
            });
}
;
//==============================================================================
function select_reporte_estadistica(_id_region3, id_caja) {
    $("#" + id_caja).empty();
    $("#" + id_caja).append("<div style='text-align:center;'><br><img src='images/lg.wave-ball-preloader.gif'><br></div>");
    var params = {
        accion: "select_reporte_estadistica",
        id_region: _id_region3

    };
    console.log(params);
    $.ajax(
            {
                type: "POST",
                url: "/sistema/ManagePagosDiarios",
                data: params,
                dataType: "html",
                success: function (dataRes) {
                    $("#" + id_caja).empty();
                    $("#" + id_caja).append(dataRes);
                }
            });
}
;
//==============================================================================
function select_reporte_estadistica_diaria(_id_region4, _hasta4, id_caja) {
    $("#" + id_caja).empty();
    $("#" + id_caja).append("<div style='text-align:center;'><br><img src='images/lg.wave-ball-preloader.gif'><br></div>");
    var params = {
        accion: "select_reporte_estadistica_diaria",
        id_region: _id_region4,
        hasta: _hasta4
    };
    $.ajax(
            {
                type: "POST",
                url: "/sistema/ManagePagosDiarios",
                data: params,
                dataType: "html",
                success: function (dataRes) {
                    $("#" + id_caja).empty();
                    $("#" + id_caja).append(dataRes);
                }
            });
}
;

//==============================================================================
function select_reporte_recuperacion(_id_region, _tipo, _desde, _hasta, id_caja) {
    $("#" + id_caja).empty();
    $("#" + id_caja).append("<div style='text-align:center;'><br><img src='images/lg.wave-ball-preloader.gif'><br></div>");
    var params = {
        accion: "select_reporte_recuperacion",
        id_region: _id_region,
        tipo: _tipo,
        desde: _desde,
        hasta: _hasta
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ManagePagosDiarios",
        data: params,
        dataType: "json",
        success: function (response) {
//            console.log(response);
            let colores = ["#00e676","#69f0ae","#ffff00","#ffff8d","#ff6e40","#ff3d00"];
            let color = "";
            $("#tbody_tabla_recuperacion").empty();
            for (let row of response) {
                let porcent = (row.recuperado / row.meta_mensual) * 100;
                
                if (porcent >= 90) {
                    color = colores[0];
                } else if(porcent >= 80) {
                    color = colores[1];
                }else if(porcent >= 70) {
                    color = colores[2];
                }else if(porcent >= 60) {
                    color = colores[3];
                }else if(porcent >= 50) {
                    color = colores[4];
                }else if(porcent >= 40) {
                    color = colores[5];
                }
                
                $("#tbody_tabla_recuperacion").append(`<tr style="cursor:pointer">
                    <td>${row.id_usuario}</td>
                    <td>${row.nombre}</td>
                    <td>${row.cuentas}</td>
                    <td class="right-align">${row.promesado.toFixed(2)}</td>
                    <td class="right-align">${row.recuperado.toFixed(2)}</td>
                    <td class="right-align">${row.meta_mensual.toFixed(2)}</td>
                    <td class="right-align">${row.suma.toFixed(2)}</td>
                    <td class="right-align" style="background-color:${color}">${porcent.toFixed(2)}</td>
                </tr>`);
            }     
        },
        error: function (error) {
            console.log(error);
        }
    });
}
;