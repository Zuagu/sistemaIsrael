<%@page contentType="text/html" pageEncoding="UTF-8"%>                                                                                                                                                                                 
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SICSA CALLCENTER</title>

        <!--icono de la pestaña del explorador-->
        <link rel="shortcut icon" href="image/logoSicsa/icon-sicsa.png">
        <link rel="apple-touch-icon" href="">

        <link href="css/css/icons-material.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/login.css">


    </head>

    <body id="loginjsp" class="style">
        <div id="preloader" class="preload col s10 m10 l10">
            <div class="bar">
                <div class="circle"></div>
                <p class="load">Cargando</p>
            </div>
        </div>
        <div class="container" style="display:none">
            <div class="row margin_bot_0"  >
                <div class="outer">
                    <div class="middle">
                        <div class="inner">
                            <div id="box_image" class="col s12 m6 l6 padding_40">
                                <img class="width_100" src="image/logoSicsa/logo_sicsa2.png">
                            </div>
                            <form id="login" class="" style="" name="login" action="/sistema/main.jsp" method="post">
                                <div class="col s12 m6 l6 padding_40">
                                    <input id="ip" type="hidden">
                                    <div class="input-field width_100">
                                        <i class="material-icons prefix icon-white ">account_circle</i>
                                        <input id="id_usuario" type="text" name="id_usuario" class="validate input_color">
                                        <label class="width_50" for="id_usuario">ID</label>
                                    </div>
                                    <div class="input-field width_100">
                                        <i class="material-icons prefix icon-white ">fingerprint</i>
                                        <input id="password" type="password" name="password" class="validate input_color">
                                        <label class="width_50" for="password">Contraseña</label>
                                    </div>
                                    <a id="iniciar_sesion" class="waves-effect  waves-light btn width_100"><i class="material-icons right">send</i>Ingresar</a>
                                    <div id="cargando" class="preloader-wrapper big active" style="display: none;">
                                        <div class="spinner-layer spinner-blue-only">
                                            <div class="circle-clipper left">
                                                <div class="circle"></div>
                                            </div><div class="gap-patch">
                                                <div class="circle"></div>
                                            </div><div class="circle-clipper right">
                                                <div class="circle"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="align_center white-text">Volver al menu principal</p>
                                </div>
                                <div>                
                                    <div style=" left: 10px; width: auto; font-size: 10px; color:#2a010180;display:none;">
                                        <input id="id_perfil" value="2" type="hidden" name="id_perfil" tabindex="3">
                                        <div class="input-field ">
                                            <select id="marcacion" class="icons estilo center-align" style=";background-color: #2a010180;">
                                                <option value="/sistema/main.jsp" data-icon="images/manual.png" class="left circle">     MANUAL</option>
                                                <option value="/sistema/marcador.jsp" data-icon="images/pre.png" class="left circle">     PREDIC</option>
                                            </select>
                                        </div>
                                    </div>
                                </div> 
                            </form>                                          
                        </div>
                    </div>      
                </div>
            </div>    
        </div>
        <%
            //System.out.println(request.getSession().getAttribute("id_usuario"));

            if (request.getSession().getAttribute("id_usuario") != null) {
                System.out.println(request.getSession().getAttribute("puesto"));
                out.write("<script> location.replace('" + request.getSession().getAttribute("puesto") + ".jsp'); </script>");
            } else if (request.getParameter("cerrar") != null) {
                HttpSession sesion = request.getSession();
                sesion.invalidate();
            }
        %>
        <script src="js/js/jquery-2.2.4.min.js"></script>
        <script src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/login.js"></script>
    </body>
</html>
