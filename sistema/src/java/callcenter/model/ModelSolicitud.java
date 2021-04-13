/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author zuagu
 */
public class ModelSolicitud {

    public static String select_values_inputselect() {
        try {

            StartConexion ic = new StartConexion();
            String sql = "SELECT * FROM admin_opciones_solicitud;";
            ic.rs = ic.st.executeQuery(sql);

            JSONArray dataSelects = new JSONArray();
            // id_registro, id_selector, value, modulo, jsp, f_delete, pregunta, f_padre, dependencia, tipo
            while (ic.rs.next()) {
                JSONObject select = new JSONObject();
//                select.put("id_registro", ic.rs.getInt("id_registro"));
                select.put("id_selector", ic.rs.getString("id_selector"));
                select.put("value", ic.rs.getString("value"));
//                select.put("modulo", ic.rs.getString("modulo"));
//                select.put("jsp", ic.rs.getString("jsp"));
//                select.put("f_delete", ic.rs.getString("f_delete"));
//                select.put("pregunta", ic.rs.getString("pregunta"));
//                select.put("f_padre", ic.rs.getString("f_padre"));
//                select.put("dependencia", ic.rs.getString("dependencia"));
//                select.put("tipo", ic.rs.getString("tipo"));
                dataSelects.add(select);
            }

            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return dataSelects.toJSONString();
        } catch (SQLException e) {
            return "Falla en en el select Error: " + e;
        }
    }

    public static String select_tipo_pregunta() {
        try {

            StartConexion ic = new StartConexion();
            String sql = "SELECT tipo FROM admin_opciones_solicitud GROUP BY tipo;";
            ic.rs = ic.st.executeQuery(sql);

            JSONArray dataSelects = new JSONArray();
            // id_registro, id_selector, value, modulo, jsp, f_delete, pregunta, f_padre, dependencia, tipo
            while (ic.rs.next()) {
                JSONObject select = new JSONObject();
                select.put("tipo", ic.rs.getString("tipo"));
                dataSelects.add(select);
            }

            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return dataSelects.toJSONString();
        } catch (SQLException e) {
            return "Falla en en el select Error: " + e;
        }
    }

    public static String select_preguntas(String tipo) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "SELECT id_selector, pregunta FROM admin_opciones_solicitud WHERE tipo = '" + tipo + "' GROUP BY id_selector;";
            ic.rs = ic.st.executeQuery(sql);

            JSONArray dataSelects = new JSONArray();
            // id_registro, id_selector, value, modulo, jsp, f_delete, pregunta, f_padre, dependencia, tipo
            while (ic.rs.next()) {
                JSONObject select = new JSONObject();
                select.put("id_selector", ic.rs.getString("id_selector"));
                select.put("pregunta", ic.rs.getString("pregunta"));
                dataSelects.add(select);
            }

            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return dataSelects.toJSONString();
        } catch (SQLException e) {
            return "Falla en en el select Error: " + e;
        }
    }

    public static String select_data_inputselect(String id_selector) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "SELECT * FROM admin_opciones_solicitud WHERE id_selector = '" + id_selector + "' ;";
            ic.rs = ic.st.executeQuery(sql);

            JSONArray dataSelects = new JSONArray();
            // id_registro, id_selector, value, modulo, jsp, f_delete, pregunta, f_padre, dependencia, tipo
            while (ic.rs.next()) {
                JSONObject select = new JSONObject();
                select.put("id_registro", ic.rs.getInt("id_registro"));
                select.put("id_selector", ic.rs.getString("id_selector"));
                select.put("value", ic.rs.getString("value"));
                select.put("modulo", ic.rs.getString("modulo"));
                select.put("jsp", ic.rs.getString("jsp"));
                select.put("f_delete", ic.rs.getString("f_delete"));
                select.put("pregunta", ic.rs.getString("pregunta"));
                select.put("f_padre", ic.rs.getString("f_padre"));
                select.put("dependencia", ic.rs.getString("dependencia"));
                select.put("tipo", ic.rs.getString("tipo"));
                dataSelects.add(select);
            }

            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return dataSelects.toJSONString();
        } catch (SQLException e) {
            return "Falla en en el select Error: " + e;
        }
    }

    public static String insert_new_option(String id_selector, String pregunta, String tipo, String value) {
        try {

            StartConexion ic = new StartConexion();
            // id_registro, id_selector, value, modulo, jsp, f_delete, pregunta, f_padre, dependencia, tipo
            String sql = "INSERT INTO admin_opciones_solicitud(id_selector, value, pregunta, tipo) VALUES ('" + id_selector + "','" + value + "','" + pregunta + "','" + tipo + "');";
            System.out.println(sql);

            ic.st.executeUpdate(sql);

            JSONObject select = new JSONObject();
            select.put("response", "corect");

            ic.st.close();
            ic.conn.close();

            return select.toJSONString();
        } catch (SQLException e) {
            return "Falla en en el select Error: " + e;
        }
    }

    public static String update_redaccion_pregunta(String id_selector, String pregunta) {
        try {

            StartConexion ic = new StartConexion();
            // id_registro, id_selector, value, modulo, jsp, f_delete, pregunta, f_padre, dependencia, tipo
            String sql = "UPDATE admin_opciones_solicitud SET pregunta = '"+ pregunta +"' \nWHERE id_selector = '"+ id_selector +"';";
            System.out.println(sql);

            ic.st.executeUpdate(sql);

            JSONObject select = new JSONObject();
            select.put("response", "corect");

            ic.st.close();
            ic.conn.close();

            return select.toJSONString();
        } catch (SQLException e) {
            return "Falla en en el update Error: " + e;
        }
    }

    public static String guardar_gestion(String datos) {
        try {
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(datos);
//            System.out.println(jsonObject);

            Object nombre_solicitante = jsonObject.get("nombre_solicitante");
            Object puesto_solicitado = jsonObject.get("puesto_solicitado");
            Object tipo_callcenter = jsonObject.get("tipo_callcenter");
            Object mora_manejada = jsonObject.get("mora_manejada");
            Object sucursal = jsonObject.get("sucursal");
            Object reclutador = jsonObject.get("reclutador");
            Object medio_contacto = jsonObject.get("medio_contacto");
            Object medio_especifico = jsonObject.get("medio_especifico");
            Object calle_solicitante = jsonObject.get("calle_solicitante");
            Object colonia_solicitante = jsonObject.get("colonia_solicitante");
            Object ciudad_solicitante = jsonObject.get("ciudad_solicitante");
            Object estado_solicitante = jsonObject.get("estado_solicitante");
            Object numero_casa = jsonObject.get("numero_casa");
            Object numero_celular = jsonObject.get("numero_celular");
            Object email = jsonObject.get("email");
            Object fecha_nacimiento = jsonObject.get("fecha_nacimiento");
            Object ciudad_nacimiento = jsonObject.get("ciudad_nacimiento");
            Object estado_nacimiento = jsonObject.get("estado_nacimiento");
            Object sexo_solicitante = jsonObject.get("sexo_solicitante");
            Object edad_solicitante = jsonObject.get("edad_solicitante");
            Object imss = jsonObject.get("imss");
            Object clinica_solicitante = jsonObject.get("clinica_solicitante");
            Object estado_civil = jsonObject.get("estado_civil");
            Object rfc_solicitante = jsonObject.get("rfc_solicitante");
            Object dep_eco = jsonObject.get("dep_eco");
            Object infonavit_solicitante = jsonObject.get("infonavit_solicitante");
            Object turno_solicitante = jsonObject.get("turno_solicitante");
            Object disp_residencia = jsonObject.get("disp_residencia");
            Object disp_viajar = jsonObject.get("disp_viajar");
            Object auto_propio = jsonObject.get("auto_propio");
            Object lic_vigente = jsonObject.get("lic_vigente");
            Object trab_actual = jsonObject.get("trab_actual");
            Object hor_otro_trabajo_1 = jsonObject.get("hor_otro_trabajo_1");
            Object hor_otro_trabajo_2 = jsonObject.get("hor_otro_trabajo_2");
            Object act_estudias = jsonObject.get("act_estudias");
            Object hor_escuela_1 = jsonObject.get("hor_escuela_1");
            Object hor_escuela_2 = jsonObject.get("hor_escuela_2");
            Object curp = jsonObject.get("curp");
            Object virtud_cualidad = jsonObject.get("virtud_cualidad");
            Object nivel_estudios = jsonObject.get("nivel_estudios");
            Object nombre_institucion_academica = jsonObject.get("nombre_institucion_academica");
            Object porcentaje_ingles = jsonObject.get("porcentaje_ingles");
            Object software = jsonObject.get("software");
            Object nombre_padre_solicitante = jsonObject.get("nombre_padre_solicitante");
            Object domicilio_padre = jsonObject.get("domicilio_padre");
            Object edad_padre = jsonObject.get("edad_padre");
            Object ocupacion_padre = jsonObject.get("ocupacion_padre");
            Object nombre_madre_solicitante = jsonObject.get("nombre_madre_solicitante");
            Object domicilio_madre = jsonObject.get("domicilio_madre");
            Object edad_madre = jsonObject.get("edad_madre");
            Object ocupacion_madre = jsonObject.get("ocupacion_madre");
            Object nombre_otro_solicitante = jsonObject.get("nombre_otro_solicitante");
            Object domicilio_otro = jsonObject.get("domicilio_otro");
            Object edad_otro = jsonObject.get("edad_otro");
            Object ocupacion_otro = jsonObject.get("ocupacion_otro");
            Object nombre_otro_solicitante_2 = jsonObject.get("nombre_otro_solicitante_2");
            Object domicilio_otro_2 = jsonObject.get("domicilio_otro_2");
            Object edad_otro_2 = jsonObject.get("edad_otro_2");
            Object ocupacion_otro_2 = jsonObject.get("ocupacion_otro_2");
            Object nombre_ultima_empresa = jsonObject.get("nombre_ultima_empresa");
            Object domicilio_ultima_empresa = jsonObject.get("domicilio_ultima_empresa");
            Object giro_ultima_empresa = jsonObject.get("giro_ultima_empresa");
            Object dep_ultima_empresa = jsonObject.get("dep_ultima_empresa");
            Object puesto_ultima_empresa = jsonObject.get("puesto_ultima_empresa");
            Object mora_ultima_empresa = jsonObject.get("mora_ultima_empresa");
            Object telefono_ultimo_trabajo = jsonObject.get("telefono_ultimo_trabajo");
            Object fecha_inicio_ultimo = jsonObject.get("fecha_inicio_ultimo");
            Object fecha_fin_ultimo = jsonObject.get("fecha_fin_ultimo");
            Object sueldo_ultimo = jsonObject.get("sueldo_ultimo");
            Object comision_ultimo = jsonObject.get("comision_ultimo");
            Object producto_ultimo = jsonObject.get("producto_ultimo");
            Object motivo_ultimo = jsonObject.get("motivo_ultimo");
            Object funciones_ultimo = jsonObject.get("funciones_ultimo");
            Object herramienta_ultimo = jsonObject.get("herramienta_ultimo");
            Object nombre_penultima_empresa = jsonObject.get("nombre_penultima_empresa");
            Object domicilio_penultima_empresa = jsonObject.get("domicilio_penultima_empresa");
            Object giro_penultima_empresa = jsonObject.get("giro_penultima_empresa");
            Object dep_penultima_empresa = jsonObject.get("dep_penultima_empresa");
            Object puesto_penultima_empresa = jsonObject.get("puesto_penultima_empresa");
            Object mora_penultima_empresa = jsonObject.get("mora_penultima_empresa");
            Object telefono_penultimo_trabajo = jsonObject.get("telefono_penultimo_trabajo");
            Object fecha_inicio_penultimo = jsonObject.get("fecha_inicio_penultimo");
            Object fecha_fin_penultimo = jsonObject.get("fecha_fin_penultimo");
            Object sueldo_penultimo = jsonObject.get("sueldo_penultimo");
            Object comision_penultimo = jsonObject.get("comision_penultimo");
            Object producto_penultimo = jsonObject.get("producto_penultimo");
            Object motivo_penultimo = jsonObject.get("motivo_penultimo");
            Object funciones_penultimo = jsonObject.get("funciones_penultimo");
            Object herramienta_penultimo = jsonObject.get("herramienta_penultimo");
            Object nombre_antepenultima_empresa = jsonObject.get("nombre_antepenultima_empresa");
            Object domicilio_antepenultima_empresa = jsonObject.get("domicilio_antepenultima_empresa");
            Object giro_antepenultima_empresa = jsonObject.get("giro_antepenultima_empresa");
            Object dep_antepenultima_empresa = jsonObject.get("dep_antepenultima_empresa");
            Object puesto_antepenultima_empresa = jsonObject.get("puesto_antepenultima_empresa");
            Object mora_antepenultima_empresa = jsonObject.get("mora_antepenultima_empresa");
            Object telefono_antepenultimo_trabajo = jsonObject.get("telefono_antepenultimo_trabajo");
            Object fecha_inicio_antepenultimo = jsonObject.get("fecha_inicio_antepenultimo");
            Object fecha_fin_antepenultimo = jsonObject.get("fecha_fin_antepenultimo");
            Object sueldo_antepenultimo = jsonObject.get("sueldo_antepenultimo");
            Object comision_antepenultimo = jsonObject.get("comision_antepenultimo");
            Object producto_antepenultimo = jsonObject.get("producto_antepenultimo");
            Object motivo_antepenultimo = jsonObject.get("motivo_antepenultimo");
            Object funciones_antepenultimo = jsonObject.get("funciones_antepenultimo");
            Object herramienta_antepenultimo = jsonObject.get("herramienta_antepenultimo");

            StartConexion inicioConexion = new StartConexion();
            String sql = "println(sql);";
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONObject dato = new JSONObject();
            while (inicioConexion.rs.next()) {
                dato.put("resultado", inicioConexion.rs.getString("resultado"));
            }
//            System.out.println(dato);

            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return dato.toJSONString();
        } catch (SQLException e) {
            return "sql code" + e.getMessage();
        } catch (org.json.simple.parser.ParseException ex) {
            Logger.getLogger(ModelGestor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
