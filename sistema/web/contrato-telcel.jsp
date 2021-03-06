<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title>Politicas Telcel</title>

        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->

        <!--ARCADE CSS-->
        <!--        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
                <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">
       
                <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
                <link type="text/css" rel="stylesheet" href="styles/all.css">
                <link type="text/css" rel="stylesheet" href="styles/main.css">-->
        <!--ARCADE CSS-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>
        <!--    <script>
                    $(function () {
                        $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 1});
                    });
                </script>-->
        <!--TERMINA CALENDARIO -->

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!-- HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script> 
        <script type="text/javascript" src="highcharts/exporting.js"></script>
        <!-- HIGHCHARTS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-puesto.js"></script>
        <script type="text/javascript" src="js/arcade-vacante.js"></script>
        <script type="text/javascript" src="js/arcade-usuario.js"></script>


        <style>
            .size_button{
                transform: scale(.8, .8);
                width: 150px;
            }
            .size_button2{
                transform: scale(.7, .7);
                width: 80px;
            }
            .size_button3{
                transform: scale(.6, .6);
            }
            .tam{
                transform: scale(.9, .9);
                width: 300px;
            }
            @media print {
                .hide_print {
                    display: none!important;
                }
            }

            /*             label color
                        .input-field label {
                            color: #000;
                        }
                         label focus color
                        .input-field input[type=text]:focus + label {
                            color: #000;
                        }
                         label underline focus color
                        .input-field input[type=text]:focus {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         valid color
                        .input-field input[type=text].valid {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         invalid color
                        .input-field input[type=text].invalid {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         icon prefix focus color
                        .input-field .prefix.active {
                            color: #000;
                        }*/
        </style>

    </head>
    <body>
        <div class="row">
            <div class="col s10 offset-s1 input-field" style="text-align:justify;">
                <center>

                    <img src="images/tel_con.png" style="width: 176px;">
                </center>

                <p>
                    Estimado proveedor,   
                </p>
                <p>
                    Por medio del presente le informamos que a partir del mes de Abril, entra en vigor nuestros est??ndares de
                    seguridad, los cuales se enumeran a continuaci??n.
                </p>
                <p>
                    1. Objetivo   
                </p>
                <p>
                    Establecer los requerimientos de seguridad de la informaci??n que deben cumplir las empresas  
                    externas proveedoras de servicios que tengan acceso a la informaci??n, sistemas de informaci??n o 
                    recursos de RADIOMOVIL DIPSA S.A.  DE C.V. 
                </p>
                <p>
                    Las empresas externas proveedoras de servicios y todo su personal, que labore en asuntos
                    encomendados a y por RADIOMOVIL DIPSA S.A. DE C.V., est??n obligados a cumplir este est??ndar de 
                    seguridad y protecci??n de la informaci??n. En caso de incumplimiento de cualquiera de estas 
                    obligaciones RADIOMOVIL DIPSA S.A. DE C.V. se reserva el derecho de ejercer las acciones jur??dicas 
                    conducentes, a ejercer el derecho de  veto sobre el personal y/o proveedor que haya cometido la 
                    infracci??n, as?? como adoptar las medidas correctivas y la acciones judiciales que se consideren 
                    pertinentes en contra del proveedor y/o de los empleados del mismo.
                </p>
                <p>
                    La valoraci??n a las disposiciones contendidas en este est??ndar podr?? tener como consecuencia la  
                    terminaci??n anticipada del contrato y/o cancelaci??n de las relaciones comerciales entre las partes.
                </p>
                <p>
                    2. Lineamientos   
                </p>
                <p>
                    2.1.	La empresa externa proveedora del servicio debe tomar las acciones necesarias (t??cnicas, 
                    administrativas  o de cualquier ??ndole) que asegure que todo personal conoce y cumple el presente 
                    lineamiento de seguridad. Dichas acciones podr??n ser entre otras, el nombramiento de un
                    establecer un proceso disciplinario formal para el personal que haya cometido una violaci??n a dichos 
                    lineamientos.
                </p>
                <p>
                    2.2.	La empresa externa proveedora del servicio debe incluir en su proceso de contrataci??n de personal,  
                    los par??metros necesarios vertidos en este lineamiento de seguridad y obtener el compromiso por
                    escrito de los empleados de que conocen y se comprometen a cumplirlos. As?? mismos deber?? de 
                    establecer un proceso disciplinario formal para el personal que haya cometido una violaci??n a dichos 
                    lineamientos.
                </p>
                <p>
                    2.3.	La empresa proveedora del servicio contratado ser?? la responsable de verificar los antecedentes del 
                    personal asignado al servicio, y deber?? cerciorarse que los antecedentes de sus empleados no han 
                    sido sancionados o juzgados por malas pr??cticas profesionales, ni se han visto envuelto en  
                    incidentes relacionados con la confidencialidad de la informaci??n en alg??n  otro proveedor o que  
                    haya prestado servicios para RADIOMOVIL DIPSA S.A. DE C.V.
                </p>
                <p>
                    2.4. 	La informaci??n, sistemas de informaci??n o recursos proporcionados por RADIOMOVIL DIPSA S.A. DE 
                    C.V., solo deber??n ser empleaos para el desarrollo de las funciones y servicios que fueron 
                    contratados, por lo que NO deber??n emplearse para un uso distinto o para la obtenci??n de un 
                    beneficio personal.
                </p>
                <b><p class="center-align">
                        ______________________________<br>
                        Radiom??vil Dipsa, S.A. de C.V.<br>
                        Gerencia de Operaciones Regi??n 4<br>
                        Av. L??zaro C??rdenas 2260 Col. Villas de San Agust??n, Gza. Garc??a,N.L.<br>
                        Tel. (81) 81 55 80 00 Fax (81) 81 55  80 22
                    </p></b>
                <center>

                    <img src="images/tel_con.png" style="width: 176px;">
                </center>
                <p>
                    2.5.	La empresa proveedora NO debe recabar informaci??n adicional a lo establecido por RADIOMOVIL 
                    DIPSA S.A. DE C.V., de acuerdo a los servicios que fueron contratados.
                </p>
                <p>
                    2.6.	Se debe de hacer uso del aviso de privacidad autorizado por RADIOMOVIL DIPSA S.A. DE C.V., de 
                    acuerdo a los servicios que fueron contratados.
                </p>
                <p>
                    2.7.	No se debe extraer por ning??n medio f??sico o electr??nico hacia fuera de las instalaciones donde
                    desarrollan las funciones de los servicios contratados informaci??n de ning??n tipo, ya que esta es 
                    propiedad de RADIOMOVIL DIPSA S.A. DE C.V., cualquier mal uso ser?? perseguido y sancionado de
                    acuerdo a la legislaci??n aplicable.
                </p>
                <p>
                    2.8.	No se deben realizar pruebas para detectar y/o utilizar una supuesta debilidad de seguridad en la
                    informaci??n, sistemas de informaci??n o recursos proporcionados por RADIOMOVIL DIPSA S.A. DE C.V. 
                    sin previa autorizaci??n por escrito de RADIOM??VIL DIPSA S.A. DE C.V.
                </p>
                <p>
                    2.9.	La empresa externa proveedora del servicio se deber?? comprometer a instaurar los procedimientos 
                    operativos necesarios para llevar un control de los accesos a los sistemas de informaci??n utilizados, 
                    asegurando que el personal solo cuente con los accesos m??nimos necesarios para realizar sus
                    funciones.
                </p>
                <p>
                    2.10.	Se debe informar de inmediato cualquier modificaci??n (alta o baja de personal, o cambio de
                    funciones o responsabilidades) que se produzca en las cuentas de acceso del personal, solicitando 
                    dichos cambios por los medios que le sean indicados por RADIOMOVIL DIPSA S.A. DE C.V., as?? como
                    garantizar que los empleados no dispongan de informaci??n relacionada con RADIOMOVIL DIPSA, S.A. 
                    DE C.V. al momento de su baja de la operaci??n en los servicios contratados.
                </p>
                <p>
                    2.11.	Los equipos de c??mputo personal utilizados en el servicio contratado solo deben tener 
                    instalado el sistema operativo y las aplicaciones autorizadas por RADIOMOVIL DIPSA S.A. DE C.V., por 
                    lo que no deben tener instalado software de oficina como procesadores de texto, hojas de c??lculo, 
                    visores de im??genes o cualquier otro software que permita realizar la operaci??n de copiar y pegar.
                </p>
                <p>
                    2.12.	Los equipos de c??mputo personal utilizados en el servicio contratado no deben contar con 
                    salida a internet. El personal que por sus funciones requiera, deber?? de tener el servicio SOLO a los
                    sitios autorizados por RADIOMOVIL DIPSA S.A. DE C.V.
                </p>
                <p>
                    2.13.	Los equipos de  c??mputo personal utilizados en el servicio contratado deben contar con un 
                    antivirus instalado, activo y actualizado, el cual debe de ser autorizado por RADIOMOVIL DIPSA, S.A. DE C.V.
                </p>
                <p>
                    2.14.	Los equipos de c??mputo personal utilizados en el servicio contratado deben mantener los 
                    ??ltimos parches de seguridad de acuerdo a los sistemas de informaci??n utilizados.
                </p>
                <p>
                    2.15.	Los equipos de c??mputo personal utilizados en el servicio contratado deben restringir los 
                    privilegios de los usuarios finales para que no puedan modificar las opciones y configuraciones de 
                    seguridad de los equipos.
                </p>
                <b><p class="center-align">
                        ______________________________<br>
                        Radiom??vil Dipsa, S.A. de C.V.<br>
                        Gerencia de Operaciones Regi??n 4<br>
                        Av. L??zaro C??rdenas 2260 Col. Villas de San Agust??n, Gza. Garc??a,N.L.<br>
                        Tel. (81) 81 55 80 00 Fax (81) 81 55  80 22
                    </p></b>
                <center>

                    <img src="images/tel_con.png" style="width: 176px;">
                </center>
                <p>
                    2.16.	Los equipos de c??mputo personal utilizados en el servicio contratado deben de tener 
                    deshabilitados de forma permanente los puertos USB o cualquier otro puerto de comunicaci??n que 
                    permita la conexi??n de medios de almacenamiento externos de informaci??n.
                </p>
                <p>
                    2.17.	Se debe de utilizar un firewall perimetral que permita el acceso solo a las direcciones IP y 
                    puertos autorizados por RADIOMOVIL DIPSA S.A. DE C.V.
                </p>
                <p>
                    2.18.	Se debe mantener en la red local del proveedor una configuraci??n de direcciones IP fijas, que   
                    permita la clara identificaci??n de un equipo en caso necesario.
                </p>
                <p>
                    2.19.	Se debe de segmentar la red local del proveedor de tal forma que los recursos tecnol??gicos de  
                    cada campa??a que opere el proveedor, est??n separadas l??gicamente.
                </p>
                <p>
                    2.20.	Se debe de asegurar que en la red local del proveedor, los puertos de los switches de
                    distribuci??n que no se encuentren en uso, sean dados de baja o se encuentren bloqueados.
                </p>
                <p>
                    2.21.	Se deben de contar con herramientas y procedimientos que permitan identificar de manera 
                    preventiva cualquier acceso o cambio no autorizado, as?? como lo intentos a los servidores y equipos 
                    de comunicaciones de la red local del proveedor.
                </p>
                <p>
                    2.22.	La empresa proveedora del servicio contratado debe establecer peri??dicamente campa??as de  
                    informaci??n sobre protecci??n de datos de particulares para su personal, especialmente en las ??reas 
                    de trabajo de los asesores telef??nicos.
                </p>
                <p>
                    2.23.	El personal debe bloquear sus equipos de c??mputo cuando se ausenten de su lugar de trabajo,  
                    ya que los accesos a los sistemas de informaci??n son personales e intransferibles.
                </p>
                <p>
                    2.24.	El personal debe usar para accesar a los sistemas de informaci??n, passwords de al menos 8 
                    caracteres, utilizando valores alfa-num??ricos, combinando may??sculas y min??sculas, as?? como
                    cambiar por lo menos cada 30 d??as el password utilizado cuando el sistema no lo solicite 
                    autom??ticamente.
                </p>
                <p>
                    2.25.	Las cuentas de acceso a los sistemas de informaci??n (tambi??n conocidos como user, usuario, 
                    ID???s o identificador de usuario) son personales e intransferibles. Cada persona con acceso a 
                    informaci??n de RADIOMOVIL DIPSA S.A. DE C.V. es responsable de la actividad desarrollada por su 
                    identificador de usuario y todo lo que de ??l se derive.
                </p>
                <p>
                    2.26.	El personal no debe compartir su password o revelarlo a otras personas, ni anotarlos en
                    recordatorios a la vista o en archivos electr??nicos
                </p>
                <p>
                    2.27.	El personal no debe usar macros o procesos automatizados que causen o generen peticiones  
                    masivas a los sistemas de informaci??n propiedad de RADIOMOVIL DIPSA S.A. DE C.V.
                </p>
                <p>
                    2.28.	No se permite el uso de correo electr??nico. El personal que por sus funciones lo requiera para   
                    el intercambio de informaci??n de RADIOMOVIL DIPSA S.A. DE C.V., deber?? de utilizar solo cuentas
                    del dominio @mail.telcel.com.
                </p>
                <b><p class="center-align">
                        ______________________________<br>
                        Radiom??vil Dipsa, S.A. de C.V.<br>
                        Gerencia de Operaciones Regi??n 4<br>
                        Av. L??zaro C??rdenas 2260 Col. Villas de San Agust??n, Gza. Garc??a,N.L.<br>
                        Tel. (81) 81 55 80 00 Fax (81) 81 55  80 22
                    </p></b>
                <center>

                    <img src="images/tel_con.png" style="width: 176px;">
                </center>
                <p>
                    2.29.	No se permiten los servicios de impresi??n, esc??ner, fax y copiado. El personal que por sus 
                    funciones lo requiera deber?? de retirar inmediatamente cualquier informaci??n propiedad de
                    RADIOMOVIL DIPSA S.A. DE C.V. que se haya empleado en dichos medios. Los equipos de impresi??n, 
                    esc??ner, fax y copiado deber??n estar ubicados en espacios que permitan controlar su acceso f??sico.
                </p>
                <p>
                    2.30.	El personal no debe guardar informaci??n propiedad de RADIOMOVIL DIPSA S.A. DE C.V., en los 
                    discos duros de las computadoras. El personal que por sus funciones lo requiera y haya sido 
                    autorizado, no deber?? de almacenarla m??s del tiempo necesario determinado por RADIOMOVIL DIPSA 
                    S.A. DE C.V. de acuerdo a los servicios que fueron contratados.
                </p>
                <p>
                    2.31.	En caso de que por la operaci??n se requiera y as?? haya sido autorizado, el manejo de 
                    documentos en papel y/o de medios f??sicos que contengan informaci??n propiedad de RADIOMOVIL 
                    DIPSA S.A. DE C.V., se deben proteger en un lugar seguro, de forma que no sean expuestos a 
                    personas no autorizadas.
                </p>
                <p>
                    2.32.	La empresa externa proveedora del servicio se deber?? de asegurar que se borre de forma
                    segura, toda la informaci??n contenida en cada uno de los equipos que por cualquier motivo se vayan 
                    a dar de baja de la operaci??n, esto con la finalidad de proteger la informaci??n contenida de los 
                    mismos.
                </p>
                <p>
                    2.33.	Las instalaciones en donde se desarrollen las actividades de los servicios contratados deber??n 
                    de ser cerradas y contar con controles de acceso f??sico que garantice el ingreso de solo el personal 
                    autorizado.
                </p>
                <p>
                    2.34.	No se debe permitir el acceso a las instalaciones donde se realizan las actividades de los
                    servicios contratados con celulares, c??maras, Smartphone, equipos de c??mputo, medios electr??nicos 
                    de almacenamiento, elementos de escritura (cuadernos, plumas, hojas, etc.) o cualquier otro medio 
                    f??sico o electr??nico que pueda ser utilizado para extraer informaci??n propiedad de RADIOMOVIL 
                    DIPSA S.A. DE C.V., por lo que la empresa proveedora de servicio contratado debe establecer un 
                    filtro en el cual de manera supervisada se realice el dep??sito y custodia de objetos personales.
                </p>
                <p>
                    2.35.	Se debe asignar un espacio restringido y de uso exclusivo para el alojamiento de los equipos 
                    de comunicaciones y servidores, dicho espacio debe contar con medias de control de acceso f??sico y 
                    l??gico que permitan el ingreso solo de personal autorizado.
                </p>
                <p>
                    2.36.	En caso de que el proveedor desarrolle o adquiera una aplicaci??n para el desarrollo del 
                    servicio contratado, directamente o a trav??s de un tercero, deber?? contar con la previa autorizaci??n
                    de RADIOMOVIL DIPSA S.A. DE C.V., y dicha aplicaci??n debe cumplir con los requerimientos de 
                    seguridad que RADIOMOVIL DIPSA S.A. DE C.V. establezca (entre otros la deshabilitaci??n de puertos y 
                    servicios innecesarios, habilitaci??n de bit??coras, control de acceso, validaci??n de datos de entrada, 
                    manejo de errores, validaci??n de password, restricci??n en sesiones, etc.).
                </p>
                <p>
                    2.37.	Se debe mantener actualizado un inventario de los equipos de c??mputo o sistemas de   
                    informaci??n que procesen, almacenen o est??n conectados a informaci??n, sistemas de informaci??n o 
                    recursos de RADIOMOVIL DIPSA S.A. DE C.V., que sean empleados para el desarrollo de los servicios 
                    contratados. Se debe de considerar entre otros, estaciones de trabajo, servidores de correo, 
                    servidores de archivos, bases de datos, equipos de comunicaciones como router, switches, firewalls, 
                </p>
                <b><p class="center-align">
                        ______________________________<br>
                        Radiom??vil Dipsa, S.A. de C.V.<br>
                        Gerencia de Operaciones Regi??n 4<br>
                        Av. L??zaro C??rdenas 2260 Col. Villas de San Agust??n, Gza. Garc??a,N.L.<br>
                        Tel. (81) 81 55 80 00 Fax (81) 81 55  80 22
                    </p></b>
                <center>

                    <img src="images/tel_con.png" style="width: 176px;">
                </center>
                <p>
                    herramientas de seguridad como antivirus, filtros de contenido, etc., dicho inventario debe incluir la   
                    ficha t??cnica del hardware, topolog??a de red, direccionamiento IP, memoria t??cnica y base line de 
                    configuraci??n del software.
                </p>
                <p>
                    2.38.	RADIOMOVIL DIPSA S.A. D C.V. llevar?? a cabo auditorias de seguridad de la informaci??n de 
                    forma peri??dica, directamente o a trav??s de un tercero, por lo que la empresa proveedora del 
                    servicio contratado estar?? obligada en cualquier momento a permitirlas y debe colaborar con el 
                    equipo auditor y facilitar todas las evidencias y registros que le sean requeridos.
                </p>
                <p>
                    <b>Estoy de acuerdo en que ser?? sancionado en caso de no cumplir o faltar a cualquiera de  
                        los puntos estipulados en el presente documento, seg??n la pol??tica de faltas a los 
                        reglamentos y pol??ticas de la Empresa.</b>
                </p>
                </p>
                <p class="center-align">
                    <br>
                    <br>
                    <br>
                    ____________________________ <br>            
                <h6 id="usuario" class="center-align"></h6>
                </p>
                <div class="col s5 offset-s1">
                    </p>
                    <br>
                    <br>
                    <br>
                    _______________________________________
                    <br>            
                    <input id="jefe_inmediato"  style="text-align: center; width:60%;">
                    <br>
                    <input id="puesto_jefe"  style="text-align: center; width:60%;">
                    </p>
                </div>
                <div  class="col s5 center-align">
                    <p>
                        <br>
                        <br>
                        <br>
                        _____________________________<br>
                        Lic. Jorge Jim??nez
                        <br>   
                        <br>
                        COORDINACION DE OPERACIONES
                    </p>
                </div>
                <div class="col s10 offset-s1">
                    <b><p class="center-align">
                            _______________________________________<br>
                            Radiom??vil Dipsa, S.A. de C.V.<br>
                            Gerencia de Operaciones Regi??n 4<br>
                            Av. L??zaro C??rdenas 2260 Col. Villas de San Agust??n, Gza. Garc??a,N.L.<br>
                            Tel. (81) 81 55 80 00 Fax (81) 81 55  80 22
                        </p></b>
                </div>
                <div class="col s1">
                    <a id="print" class="waves-effect waves-light btn pulse  hide_print" style="border-radius: 14px;margin-top: 14px;margin-left: 33px;;margin-right: 0px; background:#c60516;"><i class="material-icons" style="margin: -10px;">print</i></a> 
                </div>
            </div>
        </div>
        <!---------------------------------- modales ------------------------------------------>
        <div id="modal1" class="modal tam">
            <div class="modal-content center-align">
                <h5>Desea Generar el Memorandum?</h5>
            </div>
            <div class="modal-footer">
                <a id='no_contrato' class="modal-action modal-close waves-effect red btn size_button2">No</a>
                <a id='si_contrato' class="modal-action modal-close waves-effect green btn size_button2" href="memorandum.jsp">Si</a>
            </div>
            <input class="hide" id="hide_input">
        </div>
        <!---------------------------------- Fin modales ------------------------------------------>
        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software??
            //==================================================================
            $(document).ready(function () {
                var nombre = window.location.search.substring(1);
                var campos = nombre.split("%20");
                var nombp = '';
                for (i = 0; i < campos.length; i++) {
                    var nomb = campos[i];
                    var nombp = nombp + " " + nomb;
                }
                $("#usuario").text(nombp);
                $('.modal').modal();
            });
            //==================================================================
            $("#print").on("click", function () {
                $('#modal1').modal('open');
                window.focus();
                window.print();
            });
            // ARCADE Software??

        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>