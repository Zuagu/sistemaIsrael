<%-- 
    Document   : formatoConstanciaLaboral
    Created on : 12/04/2019, 02:49:47 PM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Carta de Recomendacion</title>
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <style type="text/css">
            .row {
                font-family: Arial;
            }
            input[type=text]:not(.browser-default) {
                height: 2rem;
                margin: 0 0 0 0;
                display: inline-block;
                font-weight: bold;
            }
            .fecha input[type=text]:not(.browser-default) {
                height: 2rem;
                margin: 0 0 0 0;
                text-align: right;
                border-bottom: 0px solid #000;
            }
            .text2 {
                margin-top: 2rem;
            }
            .text1, .text3, .text4 {
                margin-top: 1rem;
            }
            .firmas {
                margin-top: 4rem;
            }
            .firmas input[type=text]:not(.browser-default) {
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="row">
            <div class="col s12">
                <br><br>
                <div class="col s3 offset-s1">
                    <img src="image/logo.png" width="100%">
                </div>
            </div>
            <div class="col s11 fecha">
                <input type="text" name="" id="fecha" value="Monterrey, N.L. a 24 de Marzo 2017">
            </div>
            <br><br>
            <div class="col s10 offset-s1 text2">
                <p>A QUIEN CORRESPONDA: <br>PRESENTE</p>
            </div>
            <br><br><br>

            <div class="col s10 offset-s1 text2" style="text-align: justify;">
                Por medio de la presente, hacemos constar que 
                <input type="text" name="" id="nombre" style="width: 300px;"><b id="nombre1"></b>, 
                comenzó a laborar desde el 
                <input type="text" name="" id="fecha2" value="" style="width: 200px;"><b id="fecha21"></b> 
                cumpliendo un horario de 
                <input type="text" name="" id="hora" value="DE LUNES A VIERNES DE 07:00:00 A 16:00:00 HRS Y SABADOS ROTATIVOS DE 6 HRS"><b id="hora1"></b> 
                desempeñando el cargo de 
                <input type="text" name="" id="cargo" style="width: 300px;"><b id="cargo1"></b>
            </div>

            <div class="col s10 offset-s1 text3">
                <p>Se extiende la presente carta de recomendacion para los fines que el interesado estime convenientes </p>
            </div>

            <div class="col s10 offset-s1 text4">
                <p>
                    Quedo a sus órdenes para cualquier duda o aclaracion al respecto
                </p>
            </div>
            
            <div class="col s10 offset-s1 firmas center-align">
                <p>Atentamente</p>
                <input type="text" name="" style="width: 300px;">
                <p>Coord. Recursos Humanos</p>
            </div>
            
            <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
            <script type="text/javascript" src="js/js/materialize.min.js"></script>
            <script type="text/javascript">
                var MyDate = new Date();
                MyDate.setDate(MyDate.getDate());
                var MyDateString = ('0' + MyDate.getDate()).slice(-2) + '-' + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '-' + MyDate.getFullYear();
//                document.getElementById("fecha").value = MyDateString;
                $("#fecha").val('Monterrey, N.L. a '+ ('0' + MyDate.getDate()).slice(-2) +' de Marzo ' + MyDate.getFullYear());
                $("#fecha2").val( ('0' + MyDate.getDate()).slice(-2) +' de Marzo ' + MyDate.getFullYear());
                
                $("img").click(function (){
                    $("#nombre1").text( $("#nombre").val() );
                    $("#fecha21").text( $("#fecha2").val() );
                    $("#hora1").text( $("#hora").val() );
                    $("#cargo1").text( $("#cargo").val() );
                    
                    $("#nombre").addClass("hide");
                    $("#fecha2").addClass("hide");
                    $("#hora").addClass("hide");
                    $("#cargo").addClass("hide");
                    
                    
                    window.print();
                });
            </script>
    </body>
</html>