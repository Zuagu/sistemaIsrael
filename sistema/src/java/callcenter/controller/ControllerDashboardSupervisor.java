/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.controller;

import callcenter.model.ModelDashboardSupervisor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zuagu
 */
public class ControllerDashboardSupervisor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("select_gestor_tabla")) {
            String Respuesta = ModelDashboardSupervisor.select_gestor_tabla(
                    Integer.parseInt(request.getParameter("id_usuario")),
                    Integer.parseInt(request.getParameter("id_puesto"))
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        if (action.equals("select_valores_usuarios")) {
            String Respuesta = ModelDashboardSupervisor.select_valores_usuarios(
                    Integer.parseInt(request.getParameter("id_puesto_usuario")),
                    Integer.parseInt(request.getParameter("id_puesto2_usuario")),
                    Integer.parseInt(request.getParameter("id_puesto3_usuario"))
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        if (action.equals("select_regitro_usuarios_entrada")) {
            String Respuesta = ModelDashboardSupervisor.select_regitro_usuarios_entrada(
                    Integer.parseInt(request.getParameter("id_puesto_usuario")),
                    Integer.parseInt(request.getParameter("id_puesto2_usuario")),
                    Integer.parseInt(request.getParameter("id_puesto3_usuario"))
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }

        if (action.equals("select_regiones")) {
            String Respuesta = ModelDashboardSupervisor.select_regiones(
                    Integer.parseInt(request.getParameter("puesto")),
                    Integer.parseInt(request.getParameter("puesto2")),
                    Integer.parseInt(request.getParameter("puesto3")));
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        if (action.equals("select_asignaciones_region")) {
            String Respuesta = ModelDashboardSupervisor.select_asignaciones_region(
                    request.getParameter("id_region"));
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();

        }
        if (action.equals("select_regitro_usuarios_entrada_rango")) {
            String Respuesta = ModelDashboardSupervisor.select_regitro_usuarios_entrada_rango(
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion"),
                    Integer.parseInt(request.getParameter("id_puesto_usuario")),
                    Integer.parseInt(request.getParameter("id_puesto2_usuario")),
                    Integer.parseInt(request.getParameter("id_puesto3_usuario"))
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        } else if ("select_resumen_gestor".equals(action)) {
            String renglones = ModelDashboardSupervisor.select_resumen_gestor(
                    Integer.parseInt(request.getParameter("id_gestor"))
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("select_resumen_gestor_rango_fechas".equals(action)) {
            String renglones = ModelDashboardSupervisor.select_resumen_gestor_rango_fechas(
                    Integer.parseInt(request.getParameter("id_gestor")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("select_resumen_dashboard_supervisor".equals(action)) {
            String renglones = ModelDashboardSupervisor.select_resumen_dashboard_supervisor();
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("select_gestiones_en_dashboard".equals(action)) {
            String renglones = ModelDashboardSupervisor.select_gestiones_en_dashboard(
                    Integer.parseInt(request.getParameter("id1")),
                    Integer.parseInt(request.getParameter("id2")),
                    Integer.parseInt(request.getParameter("id3")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("select_convenios_en_dashboard".equals(action)) {
            String renglones = ModelDashboardSupervisor.select_convenios_en_dashboard(
                    Integer.parseInt(request.getParameter("id1")),
                    Integer.parseInt(request.getParameter("id2")),
                    Integer.parseInt(request.getParameter("id3")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("select_recuperacion_en_dashboard".equals(action)) {
            String renglones = ModelDashboardSupervisor.select_recuperacion_en_dashboard(
                    Integer.parseInt(request.getParameter("id1")),
                    Integer.parseInt(request.getParameter("id2")),
                    Integer.parseInt(request.getParameter("id3")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("sic_resumen_dashboard_supervisor_rango_fechas".equals(action)) {
            String renglones = ModelDashboardSupervisor.sic_resumen_dashboard_supervisor_rango_fechas(
                    Integer.parseInt(request.getParameter("id1")),
                    Integer.parseInt(request.getParameter("id2")),
                    Integer.parseInt(request.getParameter("id3")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("consultar_gestiones_gestor_selected".equals(action)) {
            String renglones = ModelDashboardSupervisor.consultar_gestiones_gestor_selected(
                    Integer.parseInt(request.getParameter("id_gestor")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("consultar_convenios_gestor_selected".equals(action)) {
            String renglones = ModelDashboardSupervisor.consultar_convenios_gestor_selected(
                    Integer.parseInt(request.getParameter("id_gestor")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        } else if ("consultar_recuperacion_gestor_selected".equals(action)) {
            String renglones = ModelDashboardSupervisor.consultar_recuperacion_gestor_selected(
                    Integer.parseInt(request.getParameter("id_gestor")),
                    request.getParameter("desde"),
                    request.getParameter("hasta"),
                    request.getParameter("region"),
                    request.getParameter("asignacion")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(renglones);
            writer.flush();
            writer.close();
        }
    } // select_resumen_gestor_rango_fechas

}
