/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author zuagu
 */
public class ModelDashboardSupervisor {

    public static String select_gestor_tabla(int id_usuario, int id_puesto) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_select_gestores(" + id_usuario + ", " + id_puesto + ");";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONArray gestores = new JSONArray();
            // id, nombre, id_usuario, id_equipo, id_asignacion
            while (inicioConexion.rs.next()) {
                JSONObject gestor = new JSONObject();
                gestor.put("id", inicioConexion.rs.getInt("id"));
                gestor.put("nombre", inicioConexion.rs.getString("nombre"));
                gestores.add(gestor);

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return gestores.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    public static String select_valores_usuarios(int id_puesto_usuario, int id_puesto2_usuario, int id_puesto3_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_select_valores_usuarios(" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ");";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONObject usuario = new JSONObject();
            // id, nombre, id_usuario, id_equipo, id_asignacion
            while (inicioConexion.rs.next()) {

                usuario.put("total_usuarios", inicioConexion.rs.getInt("total_usuarios"));
                usuario.put("total_activos", inicioConexion.rs.getInt("total_activos"));

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return usuario.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    public static String select_regitro_usuarios_entrada(int id_puesto_usuario, int id_puesto2_usuario, int id_puesto3_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_select_regitro_usuarios_entrada(" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ");";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONArray usuarios = new JSONArray();
            // id, nombre, id_usuario, id_equipo, id_asignacion
            while (inicioConexion.rs.next()) {
                JSONObject dato = new JSONObject();
                dato.put("id", inicioConexion.rs.getInt("id"));
                dato.put("nombre", inicioConexion.rs.getString("nombre"));
                dato.put("entrada", inicioConexion.rs.getString("entrada"));
                dato.put("hora_entrada", inicioConexion.rs.getString("hora_entrada"));
                dato.put("f_llegada", inicioConexion.rs.getInt("f_llegada"));
                dato.put("estatus_entrada", inicioConexion.rs.getInt("estatus_entrada"));
                usuarios.add(dato);
            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return usuarios.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    public static String select_regiones(int id_puesto_usuario, int id_puesto2_usuario, int id_puesto3_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_select_regiones_x_puestos(" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ");";
            System.out.println(sql);
            JSONArray regiones = new JSONArray();
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                JSONObject region = new JSONObject();
                region.put("id_region", inicioConexion.rs.getInt("id_region"));
                region.put("region", inicioConexion.rs.getString("region"));
                regiones.add(region);
            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();
            System.out.println(regiones);
            return regiones.toJSONString();
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    public static String select_asignaciones_region(String id_region) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "select id_asignacion, asignacion from arcade_asignaciones where f_active = 1 and id_region in(" + id_region + ");";
            System.out.println(sql);
            JSONArray asignaciones = new JSONArray();
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                JSONObject asignacion = new JSONObject();
                asignacion.put("id_asignacion", inicioConexion.rs.getInt("id_asignacion"));
                asignacion.put("asignacion", inicioConexion.rs.getString("asignacion"));
                asignaciones.add(asignacion);
            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();
            return asignaciones.toJSONString();
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    public static String select_regitro_usuarios_entrada_rango(String desde, String hasta, String region, String asignacion, int id_puesto_usuario, int id_puesto2_usuario, int id_puesto3_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_select_valores_usuarios_rango(" + desde + "," + hasta + "," + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ");";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONObject usuario = new JSONObject();
            // id, nombre, id_usuario, id_equipo, id_asignacion
            while (inicioConexion.rs.next()) {

                usuario.put("total_usuarios", inicioConexion.rs.getInt("total_usuarios"));
                usuario.put("total_activos", inicioConexion.rs.getInt("total_activos"));

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return usuario.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    public static String select_resumen_gestor(int id_gestor) {
        try {
            StartConexion inicioConexion = new StartConexion();
            System.out.println("si estoy llegando");
            String sql = "select\n"
                    + "	'numero_llamadas' as descripcion,\n"
                    + "	count(id_gestion) as num,\n"
                    + "    'coste_llamdas' as descripcion2,\n"
                    + "	ifnull(sum( time_to_sec(duracion) ),0) as num2\n"
                    + "from arcade_gestiones where id_gestor = " + id_gestor + " and date(fecha_larga) = curdate() \n"
                    + "union all\n"
                    + "select \n"
                    + "	'numero_convenios' as descripcion, \n"
                    + "	count(id_convenio) as num,\n"
                    + "    'importe_total_convenios' as descripcion2,\n"
                    + "    ifnull(format(sum(convenio),2),0) as num2\n"
                    + "from arcade_convenios where id_usuario = " + id_gestor + " and date(fecha_insert) = curdate() \n"
                    + "union all\n"
                    + "select \n"
                    + "	'numero_cuentas' as descripcion,\n"
                    + "    count(id_convenio) as num,\n"
                    + "	'importe_recuperado' as descricion2,\n"
                    + "	ifnull(format(sum(if(pagos < convenio, pagos, convenio)),2),0) as num2\n"
                    + "from arcade_convenios where id_usuario = " + id_gestor + " and date(fecha_pago) = curdate() \n"
                    + " union all \n"
                    + "select\n"
                    + "	'hora_entrada' as descripcion,\n"
                    + "	hora_entrada as num, \n"
                    + "    'estatus_entrada' as descripcion2,\n"
                    + "    if(estatus_entrada = 1,'Temprano',if(estatus_entrada = 2,'Retardo','Falta')) as num2 \n"
                    + "from sic_registro_usuario_diario where id_usuario = " + id_gestor + " and fecha =  curdate() ";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONObject objGestor = new JSONObject();
            while (inicioConexion.rs.next()) {
                objGestor.put(inicioConexion.rs.getString("descripcion"), inicioConexion.rs.getString("num"));
                objGestor.put(inicioConexion.rs.getString("descripcion2"), inicioConexion.rs.getString("num2"));
            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();
            return objGestor.toJSONString();
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    public static String select_resumen_gestor_rango_fechas(int id_gestor, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            System.out.println("si estoy llegando select_resumen_gestor_rango_fechas");
            String sql = "";
            if (region.equals("0")) {

                sql = "select\n"
                        + "	'numero_llamadas' as descripcion,\n"
                        + "	count(id_gestion) as num,\n"
                        + "    'coste_llamdas' as descripcion2,\n"
                        + "	sum( time_to_sec(duracion) ) as num2\n"
                        + "from arcade_gestiones where id_gestor =  " + id_gestor + "  and date(fecha_larga) between '" + desde + "' and '" + hasta + "' \n"
                        + "union all\n"
                        + "select \n"
                        + "	'numero_convenios' as descripcion, \n"
                        + "	count(id_convenio) as num,\n"
                        + "    'importe_total_convenios' as descripcion2,\n"
                        + "    format(sum(convenio),2) as num2\n"
                        + "from arcade_convenios where id_usuario =  " + id_gestor + "  and date(fecha_insert) between '" + desde + "' and '" + hasta + "' \n"
                        + "union all\n"
                        + "select \n"
                        + "	'numero_cuentas' as descripcion,\n"
                        + "    count(id_convenio) as num,\n"
                        + "	'importe_recuperado' as descricion2,\n"
                        + "	format(sum(if(pagos < convenio, pagos, convenio)),2) as num2\n"
                        + "from arcade_convenios where id_usuario =  " + id_gestor + "  and date(fecha_pago)  between '" + desde + "' and '" + hasta + "' \n"
                        + "union all\n"
                        + "select\n"
                        + "	'hora_entrada' as descripcion,\n"
                        + "	'Historial de' as num, \n"
                        + "    'estatus_entrada' as descripcion2,\n"
                        + "    'Entradas' as num2;";
            } else {
                if (asignacion.equals("0")) {

                    sql = "select\n"
                            + "	'numero_llamadas' as descripcion,\n"
                            + "	count(id_gestion) as num,\n"
                            + "    'coste_llamdas' as descripcion2,\n"
                            + "	sum( time_to_sec(duracion) ) as num2\n"
                            + "from arcade_gestiones where id_gestor =  " + id_gestor + "  and date(fecha_larga) between '" + desde + "' and '" + hasta + "' and id_region = " + region + " \n"
                            + "union all\n"
                            + "select \n"
                            + "	'numero_convenios' as descripcion, \n"
                            + "	count(id_convenio) as num,\n"
                            + "    'importe_total_convenios' as descripcion2,\n"
                            + "    format(sum(convenio),2) as num2\n"
                            + "from arcade_convenios where id_usuario =  " + id_gestor + "  and date(fecha_insert) between '" + desde + "' and '" + hasta + "'  and id_region = " + region + " \n"
                            + "union all\n"
                            + "select \n"
                            + "	'numero_cuentas' as descripcion,\n"
                            + "    count(id_convenio) as num,\n"
                            + "	'importe_recuperado' as descricion2,\n"
                            + "	format(sum(if(pagos < convenio, pagos, convenio)),2) as num2\n"
                            + "from arcade_convenios where id_usuario =  " + id_gestor + "  and date(fecha_pago)  between '" + desde + "' and '" + hasta + "'  and id_region = " + region + " \n"
                            + "union all\n"
                            + "select\n"
                            + "	'hora_entrada' as descripcion,\n"
                            + "	'Historial de' as num, \n"
                            + "    'estatus_entrada' as descripcion2,\n"
                            + "    'Entradas' as num2;";

                } else {
                    sql = "select\n"
                            + "	'numero_llamadas' as descripcion,\n"
                            + "	count(id_gestion) as num,\n"
                            + "    'coste_llamdas' as descripcion2,\n"
                            + "	sum( time_to_sec(duracion) ) as num2\n"
                            + "from arcade_gestiones where id_gestor =  " + id_gestor + "  and date(fecha_larga) between '" + desde + "' and '" + hasta + "' and id_region = " + region + " and id_asignacion = " + asignacion + " \n"
                            + "union all\n"
                            + "select \n"
                            + "	'numero_convenios' as descripcion, \n"
                            + "	count(id_convenio) as num,\n"
                            + "    'importe_total_convenios' as descripcion2,\n"
                            + "    format(sum(convenio),2) as num2\n"
                            + "from arcade_convenios where id_usuario =  " + id_gestor + "  and date(fecha_insert) between '" + desde + "' and '" + hasta + "'  and id_region = " + region + " and id_asignacion = " + asignacion + " \n"
                            + "union all\n"
                            + "select \n"
                            + "	'numero_cuentas' as descripcion,\n"
                            + "    count(id_convenio) as num,\n"
                            + "	'importe_recuperado' as descricion2,\n"
                            + "	format(sum(if(pagos < convenio, pagos, convenio)),2) as num2\n"
                            + "from arcade_convenios where id_usuario =  " + id_gestor + "  and date(fecha_pago)  between '" + desde + "' and '" + hasta + "'  and id_region = " + region + " and id_asignacion = " + asignacion + " \n"
                            + "union all\n"
                            + "select\n"
                            + "	'hora_entrada' as descripcion,\n"
                            + "	'Historial de' as num, \n"
                            + "    'estatus_entrada' as descripcion2,\n"
                            + "    'Entradas' as num2;";

                }

            }

            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONObject objGestor = new JSONObject();
            while (inicioConexion.rs.next()) {
                objGestor.put(inicioConexion.rs.getString("descripcion"), inicioConexion.rs.getString("num"));
                objGestor.put(inicioConexion.rs.getString("descripcion2"), inicioConexion.rs.getString("num2"));
            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();
            return objGestor.toJSONString();
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    public static String select_resumen_dashboard_supervisor() {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_resumen_dashboard_supervisor();";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONObject objGestor = new JSONObject();
            while (inicioConexion.rs.next()) {
                objGestor.put(inicioConexion.rs.getString("propiedad"), inicioConexion.rs.getString("valor"));
                objGestor.put(inicioConexion.rs.getString("propiedad2"), inicioConexion.rs.getString("valor2"));
            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();
            return objGestor.toJSONString();
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    public static String sic_resumen_dashboard_supervisor_rango_fechas(int id_p1, int id_p2, int id_p3, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_resumen_dashboard_supervisor_rango_fechas('" + desde + "','" + hasta + "'," + id_p1 + "," + id_p2 + "," + id_p3 + ", '" + region + "', '" + asignacion + "');";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONObject objGestor = new JSONObject();
            while (inicioConexion.rs.next()) {
                objGestor.put(inicioConexion.rs.getString("propiedad"), inicioConexion.rs.getString("valor"));
                objGestor.put(inicioConexion.rs.getString("propiedad2"), inicioConexion.rs.getString("valor2"));
            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();
            return objGestor.toJSONString();
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    public static String select_gestiones_en_dashboard(int id_puesto_usuario, int id_puesto2_usuario, int id_puesto3_usuario, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "";
            if (!desde.equals("0") && !hasta.equals("0")) {
                if (!region.equals("0")) {
                    if (asignacion.equals("0")) {
                        sql = "select \n"
                                + "	g.id_gestion,\n"
                                + "    g.id_gestor,\n"
                                + "    g.numero_marcado,\n"
                                + "    TIME(g.fecha_larga) as hora,\n"
                                + "    g.duracion,\n"
                                + "    0.00 as costo\n"
                                + "from arcade_usuarios u\n"
                                + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                                + "left join arcade_gestiones g on u.id = g.id_gestor\n"
                                + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                                + "and p.id_padre != 0 and date(g.fecha_larga) between '" + desde + "' and  '" + hasta + "' and g.id_region = '" + region + "';";
                    } else {
                        sql = "select \n"
                                + "	g.id_gestion,\n"
                                + "    g.id_gestor,\n"
                                + "    g.numero_marcado,\n"
                                + "    TIME(g.fecha_larga) as hora,\n"
                                + "    g.duracion,\n"
                                + "    0.00 as costo\n"
                                + "from arcade_usuarios u\n"
                                + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                                + "left join arcade_gestiones g on u.id = g.id_gestor\n"
                                + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                                + "and p.id_padre != 0 and date(g.fecha_larga) between '" + desde + "' and  '" + hasta + "'  and g.id_region = '" + region + "'  and g.id_asignacion = '" + asignacion + "' ;";
                    }
                } else {
                    sql = "select \n"
                            + "	g.id_gestion,\n"
                            + "    g.id_gestor,\n"
                            + "    g.numero_marcado,\n"
                            + "    TIME(g.fecha_larga) as hora,\n"
                            + "    g.duracion,\n"
                            + "    0.00 as costo\n"
                            + "from arcade_usuarios u\n"
                            + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                            + "left join arcade_gestiones g on u.id = g.id_gestor\n"
                            + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                            + "and p.id_padre != 0 and date(g.fecha_larga) between '" + desde + "' and  '" + hasta + "';";
                }
            } else {
                sql = "select \n"
                        + "	g.id_gestion,\n"
                        + "    g.id_gestor,\n"
                        + "    g.numero_marcado,\n"
                        + "    TIME(g.fecha_larga) as hora,\n"
                        + "    g.duracion,\n"
                        + "    0.00 as costo\n"
                        + "from arcade_usuarios u\n"
                        + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                        + "left join arcade_gestiones g on u.id = g.id_gestor\n"
                        + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") and p.id_padre != 0 and date(g.fecha_larga) = curdate();";
            }
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONArray gestiones = new JSONArray();
            // id, nombre, id_usuario, id_equipo, id_asignacion
            while (inicioConexion.rs.next()) {
                JSONObject gestion = new JSONObject();
                gestion.put("id_gestion", inicioConexion.rs.getInt("id_gestion"));
                gestion.put("id_gestor", inicioConexion.rs.getString("id_gestor"));
                gestion.put("numero_marcado", inicioConexion.rs.getString("numero_marcado"));
                gestion.put("hora", inicioConexion.rs.getString("hora"));
                gestion.put("duracion", inicioConexion.rs.getString("duracion"));
                gestion.put("costo", inicioConexion.rs.getString("costo"));
                gestiones.add(gestion);

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return gestiones.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    public static String select_convenios_en_dashboard(int id_puesto_usuario, int id_puesto2_usuario, int id_puesto3_usuario, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql;
            if (!desde.equals("0") && !hasta.equals("0")) {
                if (!region.equals("0")) {
                    if (asignacion.equals("0")) {
                        sql = "select \n"
                                + "	c.id_convenio,\n"
                                + "    c.cuenta,\n"
                                + "    c.id_usuario,\n"
                                + "    c.convenio,\n"
                                + "    c.fecha_insert,\n"
                                + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                                + "    c.fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    c.fecha_pago,\n"
                                + "    c.efectividad\n"
                                + "from arcade_usuarios u\n"
                                + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                                + "left join arcade_convenios c on u.id = c.id_usuario\n"
                                + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                                + "and p.id_padre != 0 and date(c.fecha_insert) between '" + desde + "' and '" + hasta + "' and c.id_region = '" + region + "';";

                    } else {
                        sql = "select \n"
                                + "	c.id_convenio,\n"
                                + "    c.cuenta,\n"
                                + "    c.id_usuario,\n"
                                + "    c.convenio,\n"
                                + "    c.fecha_insert,\n"
                                + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                                + "    c.fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    c.fecha_pago,\n"
                                + "    c.efectividad\n"
                                + "from arcade_usuarios u\n"
                                + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                                + "left join arcade_convenios c on u.id = c.id_usuario\n"
                                + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                                + "and p.id_padre != 0 and date(c.fecha_insert) between '" + desde + "' and '" + hasta + "' and c.id_region = '" + region + "' and  c.id_asignacion = '" + asignacion + "' ;";

                    }
                } else {
                    sql = "select \n"
                            + "	c.id_convenio,\n"
                            + "    c.cuenta,\n"
                            + "    c.id_usuario,\n"
                            + "    c.convenio,\n"
                            + "    c.fecha_insert,\n"
                            + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                            + "    c.fecha,\n"
                            + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                            + "    c.fecha_pago,\n"
                            + "    c.efectividad\n"
                            + "from arcade_usuarios u\n"
                            + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                            + "left join arcade_convenios c on u.id = c.id_usuario\n"
                            + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                            + "and p.id_padre != 0 and date(c.fecha_insert) between '" + desde + "' and '" + hasta + "';";

                }
            } else {
                sql = "select \n"
                        + "	c.id_convenio,\n"
                        + "    c.cuenta,\n"
                        + "    c.id_usuario,\n"
                        + "    c.convenio,\n"
                        + "    c.fecha_insert,\n"
                        + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                        + "    c.fecha,\n"
                        + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                        + "    c.fecha_pago,\n"
                        + "    c.efectividad\n"
                        + "from arcade_usuarios u\n"
                        + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                        + "left join arcade_convenios c on u.id = c.id_usuario\n"
                        + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") and p.id_padre != 0 and date(c.fecha_insert) = curdate();";

            }

            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONArray convenios = new JSONArray();
            // id_convenio, cuenta, id_usuario, convenio, fecha_insert, plazo, fecha, pagado, fecha_pago, efectividad
            while (inicioConexion.rs.next()) {
                JSONObject convenio = new JSONObject();
                convenio.put("id_convenio", inicioConexion.rs.getInt("id_convenio"));
                convenio.put("cuenta", inicioConexion.rs.getString("cuenta"));
                convenio.put("id_usuario", inicioConexion.rs.getString("id_usuario"));
                convenio.put("convenio", inicioConexion.rs.getString("convenio"));
                convenio.put("fecha_insert", inicioConexion.rs.getString("fecha_insert"));
                convenio.put("plazo", inicioConexion.rs.getString("plazo"));
                convenio.put("fecha", inicioConexion.rs.getString("fecha"));
                convenio.put("pagado", inicioConexion.rs.getString("pagado"));
                convenio.put("fecha_pago", inicioConexion.rs.getString("fecha_pago"));
                convenio.put("efectividad", inicioConexion.rs.getString("efectividad"));
                convenios.add(convenio);

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return convenios.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    
    public static String select_recuperacion_en_dashboard(int id_puesto_usuario, int id_puesto2_usuario, int id_puesto3_usuario, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql;
            if (!desde.equals("0") && !hasta.equals("0")) {
                if (!region.equals("0")) {
                    if (asignacion.equals("0")) {
                        sql = "select \n"
                                + "	c.id_convenio,\n"
                                + "    c.cuenta,\n"
                                + "    c.id_usuario,\n"
                                + "    c.convenio,\n"
                                + "    c.fecha_insert,\n"
                                + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                                + "    c.fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    c.fecha_pago,\n"
                                + "    c.efectividad\n"
                                + "from arcade_usuarios u\n"
                                + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                                + "left join arcade_convenios c on u.id = c.id_usuario\n"
                                + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                                + "and p.id_padre != 0 and date(c.fecha_insert) between '" + desde + "' and '" + hasta + "' and c.id_region = '" + region + "' and id_estatus = 2;";

                    } else {
                        sql = "select \n"
                                + "	c.id_convenio,\n"
                                + "    c.cuenta,\n"
                                + "    c.id_usuario,\n"
                                + "    c.convenio,\n"
                                + "    c.fecha_insert,\n"
                                + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                                + "    c.fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    c.fecha_pago,\n"
                                + "    c.efectividad\n"
                                + "from arcade_usuarios u\n"
                                + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                                + "left join arcade_convenios c on u.id = c.id_usuario\n"
                                + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                                + "and p.id_padre != 0 and date(c.fecha_insert) between '" + desde + "' and '" + hasta + "' and c.id_region = '" + region + "' and  c.id_asignacion = '" + asignacion + "' and id_estatus = 2;";

                    }
                } else {
                    sql = "select \n"
                            + "	c.id_convenio,\n"
                            + "    c.cuenta,\n"
                            + "    c.id_usuario,\n"
                            + "    c.convenio,\n"
                            + "    c.fecha_insert,\n"
                            + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                            + "    c.fecha,\n"
                            + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                            + "    c.fecha_pago,\n"
                            + "    c.efectividad\n"
                            + "from arcade_usuarios u\n"
                            + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                            + "left join arcade_convenios c on u.id = c.id_usuario\n"
                            + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") "
                            + "and p.id_padre != 0 and date(c.fecha_insert) between '" + desde + "' and '" + hasta + "' and id_estatus = 2;";

                }
            } else {
                sql = "select \n"
                        + "	c.id_convenio,\n"
                        + "    c.cuenta,\n"
                        + "    c.id_usuario,\n"
                        + "    c.convenio,\n"
                        + "    c.fecha_insert,\n"
                        + "    datediff(c.fecha, date(c.fecha_insert)) as plazo,\n"
                        + "    c.fecha,\n"
                        + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                        + "    c.fecha_pago,\n"
                        + "    c.efectividad\n"
                        + "from arcade_usuarios u\n"
                        + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                        + "left join arcade_convenios c on u.id = c.id_usuario\n"
                        + "where p.id_padre in (" + id_puesto_usuario + ", " + id_puesto2_usuario + "," + id_puesto3_usuario + ") and p.id_padre != 0 and date(c.fecha_insert) = curdate() and id_estatus = 2;";

            }

            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONArray convenios = new JSONArray();
            // id_convenio, cuenta, id_usuario, convenio, fecha_insert, plazo, fecha, pagado, fecha_pago, efectividad
            while (inicioConexion.rs.next()) {
                JSONObject convenio = new JSONObject();
                convenio.put("id_convenio", inicioConexion.rs.getInt("id_convenio"));
                convenio.put("cuenta", inicioConexion.rs.getString("cuenta"));
                convenio.put("id_usuario", inicioConexion.rs.getString("id_usuario"));
                convenio.put("convenio", inicioConexion.rs.getString("convenio"));
                convenio.put("fecha_insert", inicioConexion.rs.getString("fecha_insert"));
                convenio.put("plazo", inicioConexion.rs.getString("plazo"));
                convenio.put("fecha", inicioConexion.rs.getString("fecha"));
                convenio.put("pagado", inicioConexion.rs.getString("pagado"));
                convenio.put("fecha_pago", inicioConexion.rs.getString("fecha_pago"));
                convenio.put("efectividad", inicioConexion.rs.getString("efectividad"));
                convenios.add(convenio);

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return convenios.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }
    
    
    public static String consultar_gestiones_gestor_selected(int id_gestor, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "";
            if (desde.equals("0") && desde.equals("0")) {
                sql = "SELECT id_gestion, \n"
                        + "    DATE(fecha_larga) AS fecha,\n"
                        + "    TIME(fecha_larga) AS hora,\n"
                        + "    numero_marcado,\n"
                        + "    id_gestor,\n"
                        + "    nombre_estatus_cuenta(id_estatus_cuenta) as estatus_cuenta,\n"
                        + "    nombre_estatus_llamada(id_estatus_llamada) as estatus_llamada,\n"
                        + "    gestion,\n"
                        + "    duracion\n"
                        + "FROM arcade_gestiones  \n"
                        + "WHERE id_gestor = '" + id_gestor + "' AND DATE(fecha_larga) = curdate();";
            } else {
                if (region.equals("0")) {
                    sql = "SELECT id_gestion, \n"
                            + "    DATE(fecha_larga) AS fecha,\n"
                            + "    TIME(fecha_larga) AS hora,\n"
                            + "    numero_marcado,\n"
                            + "    id_gestor,\n"
                            + "    nombre_estatus_cuenta(id_estatus_cuenta) as estatus_cuenta,\n"
                            + "    nombre_estatus_llamada(id_estatus_llamada) as estatus_llamada,\n"
                            + "    gestion,\n"
                            + "    duracion\n"
                            + "FROM arcade_gestiones  \n"
                            + "WHERE id_gestor = '" + id_gestor + "' AND DATE(fecha_larga) between '" + desde + "' and '" + hasta + "';";
                } else {
                    if (asignacion.equals("0")) {
                        sql = "SELECT id_gestion, \n"
                                + "    DATE(fecha_larga) AS fecha,\n"
                                + "    TIME(fecha_larga) AS hora,\n"
                                + "    numero_marcado,\n"
                                + "    id_gestor,\n"
                                + "    nombre_estatus_cuenta(id_estatus_cuenta) as estatus_cuenta,\n"
                                + "    nombre_estatus_llamada(id_estatus_llamada) as estatus_llamada,\n"
                                + "    gestion,\n"
                                + "    duracion\n"
                                + "FROM arcade_gestiones  \n"
                                + "WHERE id_gestor = '" + id_gestor + "' AND DATE(fecha_larga) between '" + desde + "' and '" + hasta + "' and id_region = " + region + ";";
                    } else {
                        sql = "SELECT id_gestion, \n"
                                + "    DATE(fecha_larga) AS fecha,\n"
                                + "    TIME(fecha_larga) AS hora,\n"
                                + "    numero_marcado,\n"
                                + "    id_gestor,\n"
                                + "    nombre_estatus_cuenta(id_estatus_cuenta) as estatus_cuenta,\n"
                                + "    nombre_estatus_llamada(id_estatus_llamada) as estatus_llamada,\n"
                                + "    gestion,\n"
                                + "    duracion\n"
                                + "FROM arcade_gestiones  \n"
                                + "WHERE id_gestor = '" + id_gestor + "' AND DATE(fecha_larga) between '" + desde + "' and '" + hasta + "' and id_region = " + region + " and id_asignacion = " + asignacion + ";";
                    }

                }

            }

            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONArray gestiones = new JSONArray();
            // id_convenio, cuenta, id_usuario, convenio, fecha_insert, plazo, fecha, pagado, fecha_pago, efectividad
            while (inicioConexion.rs.next()) {
                JSONObject gestion = new JSONObject();
                gestion.put("id_gestion", inicioConexion.rs.getInt("id_gestion"));
                gestion.put("fecha", inicioConexion.rs.getString("fecha"));
                gestion.put("hora", inicioConexion.rs.getString("hora"));
                gestion.put("numero_marcado", inicioConexion.rs.getString("numero_marcado"));
                gestion.put("id_gestor", inicioConexion.rs.getString("id_gestor"));
                gestion.put("estatus_cuenta", inicioConexion.rs.getString("estatus_cuenta"));
                gestion.put("estatus_llamada", inicioConexion.rs.getString("estatus_llamada"));
                gestion.put("gestion", inicioConexion.rs.getString("gestion"));
                gestion.put("duracion", inicioConexion.rs.getString("duracion"));
                gestiones.add(gestion);

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return gestiones.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    public static String consultar_convenios_gestor_selected(int id_gestor, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "";
            if (desde.equals("0") && hasta.equals("0")) {
                sql = "SELECT \n"
                        + "	id_convenio,\n"
                        + "    cuenta,\n"
                        + "    id_usuario,\n"
                        + "    convenio,\n"
                        + "    fecha_insert,\n"
                        + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                        + "    fecha,\n"
                        + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                        + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                        + "    efectividad\n"
                        + "FROM arcade_convenios\n"
                        + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) = curdate();";
            } else {
                if (region.equals("0")) {
                    sql = "SELECT \n"
                            + "	id_convenio,\n"
                            + "    cuenta,\n"
                            + "    id_usuario,\n"
                            + "    convenio,\n"
                            + "    fecha_insert,\n"
                            + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                            + "    fecha,\n"
                            + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                            + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                            + "    efectividad\n"
                            + "FROM arcade_convenios\n"
                            + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) between '" + desde + "' and '" + hasta + "';";
                } else {
                    if (asignacion.equals("0")) {
                        sql = "SELECT \n"
                                + "	id_convenio,\n"
                                + "    cuenta,\n"
                                + "    id_usuario,\n"
                                + "    convenio,\n"
                                + "    fecha_insert,\n"
                                + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                                + "    fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                                + "    efectividad\n"
                                + "FROM arcade_convenios\n"
                                + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) between '" + desde + "' and '" + hasta + "'  and id_region = " + region + ";";

                    } else {
                        sql = "SELECT \n"
                                + "	id_convenio,\n"
                                + "    cuenta,\n"
                                + "    id_usuario,\n"
                                + "    convenio,\n"
                                + "    fecha_insert,\n"
                                + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                                + "    fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                                + "    efectividad\n"
                                + "FROM arcade_convenios\n"
                                + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) between '" + desde + "' and '" + hasta + "'  and id_region = " + region + " and id_asignacion = " + asignacion + ";";

                    }
                }

            }

            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONArray gestiones = new JSONArray();
            // id_convenio, cuenta, id_usuario, convenio, fecha_insert, plazo, fecha, pagado, fecha_pago, efectividad
            while (inicioConexion.rs.next()) {
                JSONObject gestion = new JSONObject();
                gestion.put("id_convenio", inicioConexion.rs.getInt("id_convenio"));
                gestion.put("cuenta", inicioConexion.rs.getString("cuenta"));
                gestion.put("id_usuario", inicioConexion.rs.getString("id_usuario"));
                gestion.put("convenio", inicioConexion.rs.getString("convenio"));
                gestion.put("fecha_insert", inicioConexion.rs.getString("fecha_insert"));
                gestion.put("plazo", inicioConexion.rs.getString("plazo"));
                gestion.put("fecha", inicioConexion.rs.getString("fecha"));
                gestion.put("pagado", inicioConexion.rs.getString("pagado"));
                gestion.put("fecha_pago", inicioConexion.rs.getString("fecha_pago"));
                gestion.put("efectividad", inicioConexion.rs.getString("efectividad"));
                gestiones.add(gestion);

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return gestiones.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

    public static String consultar_recuperacion_gestor_selected(int id_gestor, String desde, String hasta, String region, String asignacion) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "";
            if (desde.equals("0") && hasta.equals("0")) {
                sql = "SELECT \n"
                        + "	id_convenio,\n"
                        + "    cuenta,\n"
                        + "    id_usuario,\n"
                        + "    convenio,\n"
                        + "    fecha_insert,\n"
                        + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                        + "    fecha,\n"
                        + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                        + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                        + "    efectividad\n"
                        + "FROM arcade_convenios\n"
                        + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) = curdate() and id_estatus = 2;";
            } else {
                if (region.equals("0")) {
                    sql = "SELECT \n"
                            + "	id_convenio,\n"
                            + "    cuenta,\n"
                            + "    id_usuario,\n"
                            + "    convenio,\n"
                            + "    fecha_insert,\n"
                            + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                            + "    fecha,\n"
                            + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                            + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                            + "    efectividad\n"
                            + "FROM arcade_convenios\n"
                            + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) between '" + desde + "' and '" + hasta + "' and id_estatus = 2;";
                } else {
                    if (asignacion.equals("0")) {
                        sql = "SELECT \n"
                                + "	id_convenio,\n"
                                + "    cuenta,\n"
                                + "    id_usuario,\n"
                                + "    convenio,\n"
                                + "    fecha_insert,\n"
                                + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                                + "    fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                                + "    efectividad\n"
                                + "FROM arcade_convenios\n"
                                + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) between '" + desde + "' and '" + hasta + "' and id_estatus = 2  and id_region = " + region + ";";
                    } else {
                        sql = "SELECT \n"
                                + "	id_convenio,\n"
                                + "    cuenta,\n"
                                + "    id_usuario,\n"
                                + "    convenio,\n"
                                + "    fecha_insert,\n"
                                + "    datediff(fecha, date(fecha_insert)) as plazo,\n"
                                + "    fecha,\n"
                                + "    if(id_estatus = 2, 'SI','NO') as pagado,\n"
                                + "    ifnull(fecha_pago,'No Pagado') as fecha_pago,\n"
                                + "    efectividad\n"
                                + "FROM arcade_convenios\n"
                                + "WHERE id_usuario = '" + id_gestor + "' AND DATE(fecha_insert) between '" + desde + "' and '" + hasta + "' and id_estatus = 2  and id_region = " + region + " and id_asignacion = " + asignacion + ";";
                    }
                }

            }

            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);

            JSONArray gestiones = new JSONArray();
            // id_convenio, cuenta, id_usuario, convenio, fecha_insert, plazo, fecha, pagado, fecha_pago, efectividad
            while (inicioConexion.rs.next()) {
                JSONObject gestion = new JSONObject();
                gestion.put("id_convenio", inicioConexion.rs.getInt("id_convenio"));
                gestion.put("cuenta", inicioConexion.rs.getString("cuenta"));
                gestion.put("id_usuario", inicioConexion.rs.getString("id_usuario"));
                gestion.put("convenio", inicioConexion.rs.getString("convenio"));
                gestion.put("fecha_insert", inicioConexion.rs.getString("fecha_insert"));
                gestion.put("plazo", inicioConexion.rs.getString("plazo"));
                gestion.put("fecha", inicioConexion.rs.getString("fecha"));
                gestion.put("pagado", inicioConexion.rs.getString("pagado"));
                gestion.put("fecha_pago", inicioConexion.rs.getString("fecha_pago"));
                gestion.put("efectividad", inicioConexion.rs.getString("efectividad"));
                gestiones.add(gestion);

            }
            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();

            return gestiones.toString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }
    
    
    public static String select_pagos_diarios_tabla(int id_region, String desde, String hasta) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call arcade_select_pagos_diarios('" + id_region + "','" + desde + "','" + hasta + "');";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONArray pagos = new JSONArray();
            while (inicioConexion.rs.next()) {
                JSONObject pago = new JSONObject();
                pago.put("color", inicioConexion.rs.getString("color"));
                pago.put("fecha", inicioConexion.rs.getString("fecha"));
                pago.put("asignacion", inicioConexion.rs.getString("asignacion"));
                pago.put("cuenta", inicioConexion.rs.getString("cuenta"));
                pago.put("id_equipo", inicioConexion.rs.getString("id_equipo"));
                pago.put("nombre_equipo", inicioConexion.rs.getString("nombre_equipo"));
                pago.put("vencido", inicioConexion.rs.getString("vencido"));
                pago.put("resto", inicioConexion.rs.getString("resto"));
                pago.put("pago", inicioConexion.rs.getString("pago"));
                pago.put("aplica", inicioConexion.rs.getString("aplica"));
                pago.put("resto_actual", inicioConexion.rs.getString("resto_actual"));
            }
            return pagos.toJSONString();
        } catch (SQLException e) {

            return "sql code" + e;
        }
    }

}
