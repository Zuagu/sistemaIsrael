<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Memorandum</title>
        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <style>
            .paddi{
                padding-top: 15px;
            }
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
            .size{
                font-size: 13px;
            }
            .margi{
                margin-left: 10px !important;
            }
            body{
                border-style: solid;
            }
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
            }

            td, th {
                border: 2px solid #000;
                text-align: left;
                padding: 8px;
                font-size: 11px;
            }
            @media print {
                .hide_print {
                    display: none!important;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row paddi">
                <img src="images/SICSA.png" style="" class="col s3 offset-s1">
                <table class="col s3 offset-s1">
                    <tr>
                        <th>TITULO DOCUMENTO:</th>
                        <th>CALIDAD EN GESTION </th>
                    </tr>
                    <tr>
                        <td>PARA:</td>
                        <td>SUPERVISORES</td>
                    </tr>
                    <tr>
                        <td>ELABORO:</td>
                        <td>CONTROL Y CALIDAD</td>
                    </tr>
                    <tr>
                        <td>AUTORIZO:</td>
                        <td>DIRECCION GENERAL</td>
                    </tr>
                </table>
                <table class="col s3 margi">
                    <tr>
                        <th>No.CONTROL:</th>
                        <th>MSIC-03</th>
                    </tr>
                    <tr>
                        <td>FECHA ELABORACION:</td>
                        <td>23-Jan-15</td>
                    </tr>
                    <tr>
                        <td>FECHA MODIFICACION:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>No.MODIFICACION:</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="row" id="content">
                <div class="col s10 offset-s1 input-field" style="text-align:justify;">
                    <h4 class="center-align"><b>MEMORANDUM</b></h4>
                    <br>
                    <p>
                        Se les recuerda e indica que las gestiones de cobranza deben ser realizadas respetando los lineamientos de calidad establecidos 
                        y ce??irse a los est??ndares en materia de protecci??n de datos personales delimitados en la Ley Federal de Protecci??n de Datos Personales.
                    </p>
                    <p>
                        Los supervisores tienen la obligaci??n de cerciorarse que estos lineamientos son respetados durante el procedimiento de gesti??n
                        de cobranza, monitoreando frecuentemente a cada uno de sus gestores y dando seguimiento y retroalimentaci??n personal a los gestores 
                        a los que se detecten ??reas de oportunidad, dejando documentado en el formato correspondiente (FG-CAL-01). 
                    </p>
                    <p>
                        Los lineamientos principales de calidad que se deben cumplir son los siguientes:   
                    </p>
                    <p>
                        1. El gestor debe dirigirse con respeto a toda persona con la que tenga contacto, hablar de ???usted???, usar un volumen de voz adecuado
                        sin levantarlo en exceso, utilizar lenguaje formal, evitando decir frases coloquiales, muletillas, modismos o calificativos que puedan 
                        ofender a la persona con la que se habla, as?? como debe evitar el uso de sarcasmos.                </p>
                    <p>
                        2. Se debe respetar en todo momento el argumento autorizado seg??n la etapa de tiempo (semana) en el que se encuentra su asignaci??n 
                        seg??n el Manual de Argumentaci??n por Etapas (M-CAL-01). 
                    </p>
                    <p>
                        3. La informaci??n sobre montos de adeudo, s??lo pueden informarse al titular de la cuenta o la persona que ??ste autorice a trav??s de 
                        grabaci??n de llamada en donde exprese este consentimiento.             
                    </p>
                    <p>
                        4. La marcaci??n para localizar al titular de la cuenta s??lo puede hacerse a los n??meros autorizados y proporcionados por Telcel para 
                        este fin: tel??fono 1 y 2 y cuentas relacionadas. Por lo que queda prohibido recabar n??meros de localizaci??n adicionales que proporcionen 
                        terceras personas. 
                    </p>
                    <p>
                        5. S??lo se puede aceptar informaci??n de localizaci??n adicional por parte expresa del titular de la cuenta, dejando asentado en grabaci??n
                        su identificaci??n como tal y usando el script correspondiente (script tel??fono adicional de localizaci??n) mencionando al cliente aviso 
                        de privacidad y dejando asentado en la redacci??n de la gesti??n.    
                    </p>
                    <p>
                        6. Queda prohibido mencionar t??rminos que puedan tomarse como amenaza al cliente como: ???se usar?? fuerza p??blica??? ???rompimiento de cerraduras??? 
                        o mencionar el nombre de la Afianzadora (INBURSA). 
                    </p>
                    <p>
                        7. La gesti??n debe hacerse con firmeza y exigencia, de manera profesional, con educaci??n y mostrando empat??a al cliente, dando oportunidad 
                        de que el cliente explique las razones del no pago poniendo mucha atenci??n en la escucha de estas razones para responder con la argumentaci??n 
                        apegada a contrato firmado por parte del cliente y la argumentaci??n autorizada
                    </p>
                    <p>
                        8. Queda prohibido remarcar con mucha frecuencia en el mismo d??a a clientes molestos o terceros que no quieran proporcionar informaci??n, 
                        pues se tomar?? como hostigamiento y acoso, el cual ser?? sancionado.
                    </p>
                    <p>
                        9. Queda prohibido colgar la llamada al cliente ya que invariablemente cada una de las gestiones deber?? cerrarse con cortes??a por parte del gestor. 
                    </p>
                    <P>
                        10. Todas las gestiones que se realicen se deben hacer buscando crear un impacto y resultado efectivo que sume a la recuperaci??n del saldo 
                        vencido que presenta la cuenta. 
                    </P>
                    <p>
                        11. Toda gesti??n de cuenta en la que se detecte posible queja por parte del cliente deber?? informarse de inmediato al supervisor para ser 
                        atendida por ??l personalmente. 
                    </p>
                    <p class="size">
                        Los presentes lineamientos tienen el car??cter de Pol??tica, por lo que se sancionar?? el incumplimiento a cualquiera de los puntos mencionados en el presente.
                    </p>
                </div>    
            </div>
            <div class="row center-align">
                <a id="print" class="waves-effect waves-light btn pulse hide_print" style="border-radius: 14px;margin-top: 14px;margin-left: 33px;;margin-right: 0px; background:#c60516;"><i class="material-icons" style="margin: -10px;">print</i></a>
            </div>
        </div>    
        <!---------------------------------- modales ------------------------------------------>
        <div id="modal1" class="modal tam">
            <div class="modal-content center-align">
                <h5>Desea Generar el Reglamento Interno?</h5>
            </div>
            <div class="modal-footer">
                <a id='no_contrato' class="modal-action modal-close waves-effect red btn size_button2">No</a>
                <a id='si_contrato' class="modal-action modal-close waves-effect green btn size_button2" href="reglamento_interno.jsp">Si</a>
            </div>
            <input class="hide" id="hide_input">
        </div>
        <!---------------------------------- Fin modales ------------------------------------------>

        <script type="text/javascript">
            //==================================================================
            $(document).ready(function () {
                $('.modal').modal();
            });
            //==================================================================
             $("#print").on("click", function () {
                $('#modal1').modal('open');
                window.focus();
                window.print();

            });
        </script>
        <!--CORE JAVASCRIPT-->        
    </body>
</html>
