
window.onload = function () {
    select_valores_usuarios();
    select_regiones();
    select_usuarios_cargo("tbody_listado_gestores");
    select_resumen_dashboard_supervisor();
};
//funcion cerrar sesion con boton
$("#cerrar").click(function () {
    Cerrar(id_usuario);
});
//actualizar el estatus de f_logeado al cerar pestaña
function Cerrar(id) {
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerUsuario",
        data: {action: "cerrar_sesion", id_usuario: id}
    });
}

// funcion que lanza el menu lateral
$(".img_log").click(function () {
    $('.sidenav').sidenav('open');
});


//==================================================================
document.querySelector("#filtro_gestor").onkeyup = function () {
    if (this.value === "") {
        hide_inactives();
    } else {
        $TableFilter("#tb_listado_gestores", this.value);
    }
};
$TableFilter = function (id, value) {
    var rows = document.querySelectorAll(id + ' tbody tr');
    for (var i = 0; i < rows.length; i++) {
        var showRow = false;
        var row = rows[i];
        row.style.display = 'none';
        for (var x = 0; x < row.childElementCount; x++) {
            if (row.children[x].textContent.toLowerCase().indexOf(value.toLowerCase().trim()) > -1) {
                showRow = true;
                break;
            }
        }
        if (showRow) {
            row.style.display = null;
        }
    }
};

//==================================================================
//$("#filtro_gestor").on("keyup", function () {
//    select_gestor_tabla(id_usuario, id_puesto_usuario, $('#filtro_gestor').val(), "tbody_listado_gestores");
//});
//==================================================================
$("#listado_gestores").delegate(".gestores", "click", function () {
    $(".datos_gestor").empty();
    $(".datos_gestor").append($("._id_gestor", this).text() + " " + $("._nombre_gestor", this).text());
});
//==================================================================
$("#boton_usuarios_tabla").on("click", function () {
    select_regitro_usuarios_entrada("tbody_tabla_usuarios");
});
//=================================================================
$("#select_region").change(function () {
    $("#select_asignacion").empty();
    var id_region = "";
    if ($("#select_region").val().length >= 2) {
        id_region = $("#select_region").val().substr(0, $("#select_region").val().length - 1);
    } else {
        id_region = $("#select_region").val();
    }

    let params = {
        action: "select_asignaciones_region",
        id_region: id_region

    };
    console.log(params);
    select_asignaciones_region(params);


    if ($("#select_region").val() === "") {
        $("#div_asignacion").addClass("hide");
    } else {
        $("#div_asignacion").removeClass("hide");
    }
});

//=================================================================
$('#listado_gestores').on('click', '.agregar_gestor', function () {
    let fecha_desde = document.getElementById("desde_dash_super").value;
    let fecha_hasta = document.getElementById("hasta_dash_super").value;

    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();

    $('.datos_gestor').empty();
    $('.datos_gestor').append(`${$('.tb_lg_id', this).text()}  ${$('.tb_lg_nombre', this).text()}`);
    $('#id_gestor_selecionado').val($('.tb_lg_id', this).text());

    if (fecha_desde.length !== 0 && fecha_hasta.length !== 0) {
        // se hace las consultas para un rango de fechas
        if (_region !== "" && _asignacion !== "") {
            let params = {
                action: "select_resumen_gestor_rango_fechas",
                id_gestor: $(this).attr('id'),
                desde: fecha_desde,
                hasta: fecha_hasta,
                region: _region,
                asignacion: _asignacion
            };
            select_resumen_gestor_rango_fechas(params);
        } else {
            alert("Favor de validar si hay el campo de region y asignacion esta selecionado");
        }


    } else {
        // se hace la consulta de un reporte diario

        let params = {
            action: "select_resumen_gestor",
            id_gestor: $(this).attr('id')
        };
        select_resumen_gestor(params);
    }
});

$('#boton_gestiones_tabla').click(function () {

    let _desde = $('#desde_dash_super').val();
    let _hasta = $('#hasta_dash_super').val();
    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();

    let data = {
        action: "select_gestiones_en_dashboard",
        id1: id_puesto_usuario,
        id2: id_puesto2_usuario,
        id3: id_puesto3_usuario,
        desde: "0",
        hasta: "0",
        region: "0",
        asignacion: "0"
    };
    if (_desde !== "" && _hasta !== "") {
        if (_region !== "") {
            if (_asignacion !== "") {
                console.log("consulta con fechas , region , y asginacion");
                data["desde"] = _desde;
                data["hasta"] = _hasta;
                data["region"] = _region;
                data["asignacion"] = _asignacion;
            } else {
                console.log("consulta con fechas y region");
                data["desde"] = _desde;
                data["hasta"] = _hasta;
                data["region"] = _region;
            }
        } else {
            console.log("consulta con fechas nada mas");
            data["desde"] = _desde;
            data["hasta"] = _hasta;
        }
    } else {
        console.log("consulta con fecha actual");
    }
    select_gestiones_en_dashboard(data);
});




$('#boton_convenios_tabla').click(function () {

    let _desde = $('#desde_dash_super').val();
    let _hasta = $('#hasta_dash_super').val();
    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();

    let data = {
        action: "select_convenios_en_dashboard",
        id1: id_puesto_usuario,
        id2: id_puesto2_usuario,
        id3: id_puesto3_usuario,
        desde: "0",
        hasta: "0",
        region: "0",
        asignacion: "0"
    };
    if (_desde !== "" && _hasta !== "") {
        if (_region !== "") {
            if (_asignacion !== "") {
                console.log("consulta con fechas , region , y asginacion");
                data["desde"] = _desde;
                data["hasta"] = _hasta;
                data["region"] = _region;
                data["asignacion"] = _asignacion;
            } else {
                console.log("consulta con fechas y region");
                data["desde"] = _desde;
                data["hasta"] = _hasta;
                data["region"] = _region;
            }
        } else {
            console.log("consulta con fechas nada mas");
            data["desde"] = _desde;
            data["hasta"] = _hasta;
        }
    } else {
        console.log("consulta con fecha actual");
    }
    select_convenios_en_dashboard(data);
});

$("#boton_recuperacion_tabla").click(function () {

    let _desde = $('#desde_dash_super').val();
    let _hasta = $('#hasta_dash_super').val();
    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();

    let data = {
        action: "select_recuperacion_en_dashboard",
        id1: id_puesto_usuario,
        id2: id_puesto2_usuario,
        id3: id_puesto3_usuario,
        desde: "0",
        hasta: "0",
        region: "0",
        asignacion: "0"
    };
    if (_desde !== "" && _hasta !== "") {
        if (_region !== "") {
            if (_asignacion !== "") {
                console.log("consulta con fechas , region , y asginacion");
                data["desde"] = _desde;
                data["hasta"] = _hasta;
                data["region"] = _region;
                data["asignacion"] = _asignacion;
            } else {
                console.log("consulta con fechas y region");
                data["desde"] = _desde;
                data["hasta"] = _hasta;
                data["region"] = _region;
            }
        } else {
            console.log("consulta con fechas nada mas");
            data["desde"] = _desde;
            data["hasta"] = _hasta;
        }
    } else {
        console.log("consulta con fecha actual");
    }
    select_recuperacion_en_dashboard(data);

});



$('#cargar_datos_rango_fechas').click(function () {
    let desde = $('#desde_dash_super').val();
    let hasta = $('#hasta_dash_super').val();
    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();

    console.log(_region);
    console.log(_asignacion);

    if (desde !== "" && hasta !== "" && _region !== "" && _asignacion !== "") {
        sic_resumen_dashboard_supervisor_rango_fechas(desde, hasta, _region, _asignacion);
    } else {
        alert('No se ha selecionado ningun rago de fecha');
    }

});

// Consutas de gestores individuales Gestiones
$('#consultar_gestiones_gestor_selected').click(function () {
    let fecha_desde = document.getElementById("desde_dash_super").value;
    let fecha_hasta = document.getElementById("hasta_dash_super").value;
    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();

    if (fecha_desde.length !== 0 && fecha_hasta.length !== 0) {

        let params = {
            action: "consultar_gestiones_gestor_selected",
            id_gestor: $('#id_gestor_selecionado').val(),
            desde: fecha_desde,
            hasta: fecha_hasta,
            region: _region,
            asignacion: _asignacion
        };
        consultar_gestiones_gestor_selected(params);
    } else {

        let params = {
            action: "consultar_gestiones_gestor_selected",
            id_gestor: $('#id_gestor_selecionado').val(),
            desde: '0',
            hasta: '0',
            region: '0',
            asignacion: '0'
        };
        consultar_gestiones_gestor_selected(params);

    }
});
// Consutas de gestores individuales Convenios
$('#consultar_convenios_gestor_selected').click(function () {
    let fecha_desde = document.getElementById("desde_dash_super").value;
    let fecha_hasta = document.getElementById("hasta_dash_super").value;
    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();
    if (fecha_desde.length !== 0 && fecha_hasta.length !== 0) {

        let params = {
            action: "consultar_convenios_gestor_selected",
            id_gestor: $('#id_gestor_selecionado').val(),
            desde: fecha_desde,
            hasta: fecha_hasta,
            region: _region,
            asignacion: _asignacion
        };
        consultar_convenios_gestor_selected(params);
    } else {

        let params = {
            action: "consultar_convenios_gestor_selected",
            id_gestor: $('#id_gestor_selecionado').val(),
            desde: '0',
            hasta: '0',
            region: '0',
            asignacion: '0'
        };
        consultar_convenios_gestor_selected(params);

    }
});
// Consutas de gestores individuales Recuperacion
$('#consultar_recuperacion_gestor_selected').click(function () {
    let fecha_desde = document.getElementById("desde_dash_super").value;
    let fecha_hasta = document.getElementById("hasta_dash_super").value;
    let _region = $('#select_region').val();
    let _asignacion = $('#select_asignacion').val();
    if (fecha_desde.length !== 0 && fecha_hasta.length !== 0) {

        let params = {
            action: "consultar_recuperacion_gestor_selected",
            id_gestor: $('#id_gestor_selecionado').val(),
            desde: fecha_desde,
            hasta: fecha_hasta,
            region: _region,
            asignacion: _asignacion
        };
        consultar_recuperacion_gestor_selected(params);
    } else {

        let params = {
            action: "consultar_recuperacion_gestor_selected",
            id_gestor: $('#id_gestor_selecionado').val(),
            desde: '0',
            hasta: '0',
            region: '0',
            asignacion: '0'
        };
        consultar_recuperacion_gestor_selected(params);

    }
});


$('#ver_estategia_gestores').click(function () {
    select_estrategia_gesstores();
});


$('#tabla_estrategia_total').on('click', '.up_logged', function () {

    let id = $(this).parent().parent().attr('id');
    let texto = $(this).text();
    if (texto === 'SI') {
        $(this).removeClass('green');
        $(this).addClass('red');
        $(this).text('NO');
    } else {
        $(this).removeClass('red');
        $(this).addClass('green');
        $(this).text('SI');
    }

    console.log(id.replace('gest', ''));
    update_f_logged_user(id.replace('gest', ''));
});
//
//$('#tabla_estrategia_total').on('click', '.definir_estatus', function () {
//
//    let id = $(this).parent().parent().attr('id');
//    let texto = $(this).text();
//    alert(id);
//    select_estaus_posibles();
//});

$('#definir_estatus_gestor').click(function () {
    _data = $("#tabla_selecion_de_estatus");
});    


//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
function select_gestor_tabla(_id_usuario, _id_puesto, _busqueda, _div) {
    $("#" + _div).empty();
    $("#" + _div).append("<img src='image/preloader_lineal.gif' width='40%'>");
    var params = {
        action: "select_gestor_tabla",
        id_usuario: _id_usuario,
        id_puesto: _id_puesto,
        busqueda: _busqueda
    };
//    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: params,
        dataType: "json",
        success: function (gestores) {
            console.log(gestores);
            $("#" + _div).empty();
            for (var i in gestores) {
                $("#" + _div).append(
                        '<tr id="' + gestores[i].id + '" class="gestores" style="cursor:pointer;" >' +
//                        '<td style="width:15%; text-align: center;"><img class="img_gestores" src="images/yuna.jpg" ></td>' +
                        '<td style="width:15%; text-align: center;"><img class="img_gestores" src="http://gruposicsa.com/fotos/' + gestores[i].id + '.jpg"></td>' +
                        '<td class="_id_gestor">' + gestores[i].id + '</td>' +
                        '<td class="_nombre_gestor">' + gestores[i].nombre + '</td>' +
                        '</tr>'
                        );
            }
            $(".gestores").click(function () {
                $(".gestores").removeClass("gestores_selected");
                $(this).addClass("gestores_selected");
            });
        }
    });
}
//==============================================================================
function select_gestor_tabla_filtro(_filtro, _div) {
    $("#" + _div).empty();
    $("#" + _div).append("<img src='image/preloader_lineal.gif' width='40%'>");
    var params = {
        action: "select_gestor_tabla_filtro",
        filtro: _filtro
    };
//    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: params,
        dataType: "json",
        success: function (gestores) {
            $("#" + _div).empty();
            for (var i in equipos) {
                $("#" + _div).append(
                        '<tr id="' + gestores[i].id + '" class="gestores" style="cursor:pointer;" >' +
//                        '<td style="width:15%; text-align: center;"><img class="img_gestores" src="images/yuna.jpg" ></td>' +
                        '<td style="width:15%; text-align: center;"><img class="img_gestores" src="http://gruposicsa.com/fotos/' + gestores[i].id + '.jpg"></td>' +
                        '<td class="_id_gestor">' + gestores[i].id + '</td>' +
                        '<td class="_nombre_gestor">' + gestores[i].nombre + '</td>' +
                        '</tr>'
                        );
            }
            $(".gestores").click(function () {
                $(".gestores").removeClass("gestores_selected");
                $(this).addClass("gestores_selected");
            });
        }
    });
}

//==============================================================================
function select_valores_usuarios() {

    var params = {
        action: "select_valores_usuarios",
        id_puesto_usuario: id_puesto_usuario,
        id_puesto2_usuario: id_puesto2_usuario,
        id_puesto3_usuario: id_puesto3_usuario

    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: params,
        dataType: "json",
        success: function (usuarios) {
            console.log(usuarios);
            $("#valores_usuario").empty();
            $("#valores_usuario").append(usuarios.total_activos + '/' + usuarios.total_usuarios);
            $("#porcentaje_usuario").empty();
            $("#porcentaje_usuario").append((usuarios.total_activos * 100) / usuarios.total_usuarios + '%');
        }
    });
}
//==============================================================================
function select_regitro_usuarios_entrada(_div) {

    var params = {
        action: "select_regitro_usuarios_entrada",
        id_puesto_usuario: id_puesto_usuario,
        id_puesto2_usuario: id_puesto2_usuario,
        id_puesto3_usuario: id_puesto3_usuario

    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: params,
        dataType: "json",
        success: function (usuarios) {
            $("#" + _div).empty();
            for (var i in usuarios) {
                $("#" + _div).append(
                        '<tr id="' + usuarios[i].id + '" class="estatus_entrada' + usuarios[i].estatus_entrada + '" style="cursor:pointer;" >' +
                        '<td style="width:15%; text-align: center;"><img class="img_gestores" src="http://gruposicsa.com/fotos/' + usuarios[i].id + '.jpg"  onerror="this.src=\'image/icon-user.png\'"></td>' +
                        '<td >' + usuarios[i].id + '</td>' +
                        '<td >' + usuarios[i].nombre + '</td>' +
                        '<td >' + usuarios[i].entrada + '</td>' +
                        '<td >' + usuarios[i].hora_entrada + '</td>' +
                        '<td class="center"><i class="material-icons f_llegada' + usuarios[i].f_llegada + '">fingerprint</i></td>' +
                        '</tr>'
                        );
            }
        }
    });
}

//=================================================================
function select_usuarios_cargo(_div) {
    $("#" + _div).empty();
    $("#" + _div).append("<img src='image/preloader_lineal.gif' width='40%'>");
    var params = {
        action: "select_usuarios_cargo",
        puesto: id_puesto_usuario,
        puesto2: id_puesto2_usuario,
        puesto3: id_puesto3_usuario,
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerUsuario",
        data: params,
        dataType: "json",
        success: function (equipos) {
            $("#" + _div).empty();
            for (var i in equipos) {
                $("#" + _div).css("cursor", "default");
                $("#" + _div).append(
                        '<tr id="' + equipos[i].id + '"  class="agregar_gestor" style="cursor:pointer;">' +
                        '<td></td>' +
                        '<td class="tb_lg_id">' + equipos[i].id + '</td>' +
                        '<td class="tb_lg_nombre">' + equipos[i].nombre + '</td>' +
                        '</tr>'
                        );
            }
        }
    });
}

//=================================================================
function select_regiones() {

    var params = {
        action: "select_regiones",
        puesto: id_puesto_usuario,
        puesto2: id_puesto2_usuario,
        puesto3: id_puesto3_usuario
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: params,
        dataType: "json",
        success: function (regiones) {
            $("#select_region").empty();
            $("#select_region").append('<option value="">Selecciona</option>');
            for (let i in regiones) {
                $("#select_region").append('<option value="' + regiones[i].id_region + '">' + regiones[i].region + '</option>');
            }
            $("#select_region").append('<option value="0">Todos</option>');
            $('select').formSelect();
        }
    });
}

//==============================================================================
function select_asignaciones_region(_params) {

    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (asignaciones) {
            $("#select_asignacion").empty();
            $("#select_asignacion").append('<option value="">Selecciona</option>');
            for (let i in asignaciones) {
                $("#select_asignacion").append('<option value="' + asignaciones[i].id_asignacion + '">' + asignaciones[i].asignacion + '</option>');
            }
            $("#select_asignacion").append('<option value="0">Todos</option>');
            $('select').formSelect();
        }
    });
}
//==============================================================================
function select_regitro_usuarios_entrada_rango(_desde, _hasta, _region, asignacion) {

    var params = {
        action: "select_regitro_usuarios_entrada_rango",
        desde: _desde,
        hasta: _hasta,
        region: _region,
        asignacion: _asignacion,
        id_puesto_usuario: id_puesto_usuario,
        id_puesto2_usuario: id_puesto2_usuario,
        id_puesto3_usuario: id_puesto3_usuario

    };
    console.log(params);


    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: params,
        dataType: "json",
        success: function (usuarios) {
            console.log(usuarios);
            $("#valores_usuario").empty();
            $("#valores_usuario").append(usuarios.total_activos + -+usuarios.total_usuarios);
            $("#porcentaje_usuario").empty();
            $("#porcentaje_usuario").append((usuarios.total_activos * 100) / usuarios.total_usuarios + '%');
        }
    });
}
//==============================================================================
function select_resumen_gestor(_params) {
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
            console.log(_data);
            for (let x in _data) {
                $('#' + x).empty();
                $('#' + x).append(_data[x]);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}
//==============================================================================
function select_resumen_gestor_rango_fechas(_params) {
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
            console.log(_data);
            for (let x in _data) {
                $('#' + x).empty();
                $('#' + x).append(_data[x]);
            }
        }
    });
}
//==============================================================================
function select_resumen_dashboard_supervisor() {
    let _params = {
        action: "select_resumen_dashboard_supervisor"
    };
    console.log("Request de datos generales");
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
            console.log(_data);
            for (let x in _data) {
                $('#' + x).empty();
                $('#' + x).append(_data[x]);
            }
        }
    });
}
//==============================================================================
function select_gestiones_en_dashboard(_params) {
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
//            console.log(_data);
            $('#tbody_tabla_gestiones').empty();
            let num = 0;
            for (let item of _data) {
                $('#tbody_tabla_gestiones').append(`<tr>
                <td>${item.id_gestion}</td>
                <td>${item.id_gestor}</td>
                <td>${item.numero_marcado}</td>
                <td>117</td>
                <td>${item.hora}</td>
                <td>${item.duracion}</td>
                <td>${item.costo}</td>
                </tr>`);
                num += 1;
            }
            $("#num_llamdas_gral").empty();
            $("#num_llamdas_gral").append(num);

        },
        error: function (error) {
            console.log(error);
        }
    });
}
//==============================================================================
function select_convenios_en_dashboard(_params) {
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
//            console.log(_data);
            $('#tbody_tabla_convenios').empty();
            let num = 0;
            for (let item of _data) {
                $('#tbody_tabla_convenios').append(`<tr>
                <td>${item.id_convenio}</td>
                <td>${item.cuenta}</td>
                <td>${item.id_usuario}</td>
                <td>${item.convenio}</td>
                <td>${item.fecha_insert}</td>
                <td>${item.plazo}</td>
                <td>${item.fecha}</td>
                <td>${item.pagado}</td>
                <td>${item.fecha_pago}</td>
                <td>${item.efectividad}</td>
                </tr>`);
                num += 1;
            }
            $("#num_convenios_gral").empty();
            $("#num_convenios_gral").append(num);
        },
        error: function (error) {
            console.log(error);
        }
    });
}
//==============================================================================
function select_recuperacion_en_dashboard(_params) {
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
//            console.log(_data);
            $('#tbody_tabla_recuperacion').empty();
            let num = 0;
            for (let item of _data) {
                $('#tbody_tabla_recuperacion').append(`<tr>
                <td>${item.id_convenio}</td>
                <td>${item.cuenta}</td>
                <td>${item.id_usuario}</td>
                <td>${item.convenio}</td>
                <td>${item.fecha_insert}</td>
                <td>${item.plazo}</td>
                <td>${item.fecha}</td>
                <td>${item.pagado}</td>
                <td>${item.fecha_pago}</td>
                <td>${item.efectividad}</td>
                </tr>`);
                num += 1;
            }
            $("#num_recuperacion_gral").empty();
            $("#num_recuperacion_gral").append(num);
        },
        error: function (error) {
            console.log(error);
        }
    });
}
//==============================================================================
function sic_resumen_dashboard_supervisor_rango_fechas(_desde, _hasta, _region, _asignacion) {
    let _params = {
        action: "sic_resumen_dashboard_supervisor_rango_fechas",
        id1: id_puesto_usuario,
        id2: id_puesto2_usuario,
        id3: id_puesto3_usuario,
        desde: _desde,
        hasta: _hasta,
        region: _region,
        asignacion: _asignacion
    };
    console.log(_params);

    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
            console.log(_data);
            for (let x in _data) {
                $('#' + x).empty();
                $('#' + x).append(_data[x]);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}
//==============================================================================
function consultar_gestiones_gestor_selected(_params) {
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
//            console.log(_data);
            $('#tbody_tabla_gestiones_gestor').empty();
            let num = 0;
            for (let item of _data) {
                $('#tbody_tabla_gestiones_gestor').append(`<tr>
                <td>${item.fecha}</td>
                <td>${item.hora}</td>
                <td>${item.numero_marcado}</td>
                <td>${item.id_gestor}</td>
                <td>${item.estatus_cuenta}</td>
                <td>${item.estatus_llamada}</td>
                <td>${item.gestion}</td>
                <td>${item.duracion}</td>
                </tr>`);
                num += 1;
            }
            $("#num_gestiones_gestor").empty();
            $("#num_gestiones_gestor").append(num);

        },
        error: function (error) {
            console.log(error);
        }
    });
}

function consultar_convenios_gestor_selected(_params) {
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
//            console.log(_data);
            $('#tbody_tabla_convenios_gestor').empty();
            for (let item of _data) {
                $('#tbody_tabla_convenios_gestor').append(`<tr>
                <td>${item.id_convenio}</td>
                <td>${item.cuenta}</td>
                <td>${item.id_usuario}</td>
                <td>${item.convenio}</td>
                <td>${item.fecha_insert}</td>
                <td>${item.plazo}</td>
                <td>${item.fecha}</td>
                <td>${item.pagado}</td>
                <td>${item.fecha_pago}</td>
                <td>${item.efectividad}</td>
                </tr>`);
            }

        },
        error: function (error) {
            console.log(error);
        }
    });
}

function consultar_recuperacion_gestor_selected(_params) {
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerDashboardSupervisor",
        data: _params,
        dataType: "json",
        success: function (_data) {
//            console.log(_data);
            $('#tbody_tabla_recuperacion_gestor').empty();
            for (let item of _data) {
                $('#tbody_tabla_recuperacion_gestor').append(`<tr>
                <td>${item.id_convenio}</td>
                <td>${item.cuenta}</td>
                <td>${item.id_usuario}</td>
                <td>${item.convenio}</td>
                <td>${item.fecha_insert}</td>
                <td>${item.plazo}</td>
                <td>${item.fecha}</td>
                <td>${item.pagado}</td>
                <td>${item.fecha_pago}</td>
                <td>${item.efectividad}</td>
                </tr>`);
            }

        },
        error: function (error) {
            console.log(error);
        }
    });
}

function select_estrategia_gesstores() {
    let _params = {
        action: 'select_gestores_estrategia',
        puesto: id_puesto_usuario,
        puesto2: id_puesto2_usuario,
        puesto3: id_puesto3_usuario
    };
    console.log(_params);
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerUsuario",
        data: _params,
        dataType: "json",
        success: function (_data) {
            console.log(_data);
            let color_logged = '';
            $('#tabla_estrategia_total').empty();
            for (let item of _data) {
                if (item.f_logged === 'SI') {
                    color_logged = 'green';
                } else {
                    color_logged = 'red';
                }
                $('#tabla_estrategia_total').append(`<tr id='gest${item.id}'>
                <td>${item.id}</td>
                <td>${item.alias}</td>
                <td><b class='up_logged ${color_logged}'>${item.f_logged}</b></td>
                <td>${item.f_cr}</td>
                <td>${item.orden_importe}</td>
                <td>${item.orden_estatus}</td>
                <td>${item.orden}</td>
                <td><a class='blue modal-trigger definir_estatus' href='#modal_selecion_de_estatus'>definir</a></td>
                <td>${item.meta_mensual}</td>
                <td></td>
                </tr>`);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function update_f_logged_user(_id) {
    let _params = {
        action: 'update_f_logged_user',
        id: _id
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerUsuario",
        data: _params,
        dataType: "json",
        success: function (_data) {
            console.log(_data);
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function select_estaus_posibles() {
    let _params = {
        action: 'select_estaus_posibles'
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ControllerUsuario",
        data: _params,
        dataType: "json",
        success: function (_data) {
//            console.log(_data);
            $('#tabla_selecion_de_estatus').empty();
            for (let row of _data) {
                $('#tabla_selecion_de_estatus').append(`
<p><label><input id="${row.id_estatus_cuenta}" class="check_estatus" type="checkbox" /><span>${row.estatus_cuenta} - ${row.descripcion}</span></label></p>`)
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}