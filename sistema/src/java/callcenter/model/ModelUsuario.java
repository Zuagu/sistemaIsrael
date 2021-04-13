package callcenter.model;

import java.sql.SQLException;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

/**
 *
 * @author zuagu
 */
public class ModelUsuario {

    //==========================================================================
    public static int iniciar_sesion(int id_perfil, String id_usuario, String password, String ip) {
        try {
            long inicio = System.currentTimeMillis();

            StartConexion inicioConexion = new StartConexion();
            int resultado = 0;
            String sql = "call sic_iniciar_sesion_con_ip('" + id_perfil + "','" + id_usuario + "', '" + password + "', '" + ip + "');";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = Integer.parseInt(inicioConexion.rs.getString("resultado"));
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();

            long fin = System.currentTimeMillis();
            double tiempo = (double) ((fin - inicio) / 1000);
            System.out.println(tiempo + " segundos");

            return resultado;
        } catch (SQLException ex) {
            System.out.println(ex);
            return 0;
        }
    }

    //==========================================================================
    public static void cerrar_sesion(int id_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            int resultado = 0;
            String sql = "call sic_cerrar_sesion(" + id_usuario + ");";
            System.out.println(sql);
            inicioConexion.st.executeQuery(sql);

            inicioConexion.conn.close();
            inicioConexion.st.close();
//            return resultado;
        } catch (SQLException ex) {
            System.out.println(ex);
//            return 0;
        }
    }

    //==========================================================================
    public static String real_id(String id_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String resultado = "";
            String sql = "select id from arcade_usuarios where alias = '" + id_usuario + "' or id = '" + id_usuario + "';";
//            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = inicioConexion.rs.getString(1);
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return resultado;
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }
    //==========================================================================

    public static String jsp_puesto(String id_empleado) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String sql = "call sic_jsp_puesto('" + id_empleado + "');";
            String resultado = "";
//            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            if (inicioConexion.rs.next()) {
                resultado = inicioConexion.rs.getString("resultado");
            }

            inicioConexion.rs.close();
            inicioConexion.st.close();
            inicioConexion.conn.close();
//            System.out.println(resultado);
            return resultado;
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

    /* ====================================================================== */
    public static String cargar_menu( String id_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String resultado = "";
            String sql = "call cargar_menu('" + id_usuario + "');";
//            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = inicioConexion.rs.getString("resultado");
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return resultado;
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

    //==========================================================================
    public static String id_puesto(String id_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String resultado = "";
            String sql = "select id_puesto_usuario('" + id_usuario + "');";
//            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = inicioConexion.rs.getString(1);
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return resultado;
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }
    //==========================================================================
    public static String select_nombre_alias(String id_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String resultado = "";
            String sql = "select nombre, alias from arcade_usuarios where id = '" + id_usuario + "';";
//            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = inicioConexion.rs.getString("alias");
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return resultado;
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

    //==========================================================================
    public static String id_puesto2(String id_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String resultado = "";
            String sql = "select id_puesto2 from arcade_usuarios where alias = '" + id_usuario + "' or id = '" + id_usuario + "';";
//            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = inicioConexion.rs.getString(1);
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return resultado;
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

    //==========================================================================
    public static String id_puesto3(String id_usuario) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String resultado = "";
            String sql = "select id_puesto3 from arcade_usuarios where alias = '" + id_usuario + "' or id = '" + id_usuario + "';";
//            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = inicioConexion.rs.getString(1);
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return resultado;
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

    //==========================================================================
    public static String select_usuarios_cargo(int puesto, int puesto2, int puesto3) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String cadena_puesto = puesto + "," + puesto2 + "," + puesto3;

            String sql = "select u.id, u.nombre from arcade_usuarios u\n"
                    + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                    + "where p.id_padre in (" + cadena_puesto + ") and p.id_padre != 0;";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONArray gestores = new JSONArray();
            while (inicioConexion.rs.next()) {
                JSONObject gestor = new JSONObject();
                gestor.put("id", inicioConexion.rs.getInt("id"));
                gestor.put("nombre", inicioConexion.rs.getString("nombre"));
                gestores.add(gestor);
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return gestores.toJSONString();
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

    //==========================================================================
    public static String select_gestores_estrategia(int puesto, int puesto2, int puesto3) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String cadena_puesto = puesto + "," + puesto2 + "," + puesto3;

            String sql = "select\n"
                    + "	u.id,\n"
                    + "    u.alias,\n"
                    + "    u.f_cr,\n"
                    + "    u.cadena_estatus,\n"
                    + "    u.estatus,\n"
                    + "    u.id_equipo1,\n"
                    + "    u.id_equipo2,\n"
                    + "    u.id_equipo3,\n"
                    + "    u.id_equipo4,\n"
                    + "    u.id_equipo5,\n"
                    + "    u.orden,\n"
                    + "    if(u.f_logged = 1,'SI','NO') as f_logged,\n"
                    + "    u.orden_estatus,\n"
                    + "    u.orden_importe,\n"
                    + "    u.meta_mensual\n"
                    + "from arcade_usuarios u\n"
                    + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                    + "where p.id_padre in (" + cadena_puesto + ") \n"
                    + "and p.id_padre != 0;";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONArray gestores = new JSONArray();
            while (inicioConexion.rs.next()) {
                JSONObject gestor = new JSONObject();
                gestor.put("id", inicioConexion.rs.getInt("id"));
                gestor.put("alias", inicioConexion.rs.getString("alias"));
                gestor.put("orden", inicioConexion.rs.getString("orden"));
                gestor.put("f_cr", inicioConexion.rs.getString("f_cr"));
                gestor.put("estatus", inicioConexion.rs.getString("estatus"));
                gestor.put("orden_estatus", inicioConexion.rs.getString("orden_estatus"));
                gestor.put("orden_importe", inicioConexion.rs.getString("orden_importe"));
                gestor.put("meta_mensual", inicioConexion.rs.getString("meta_mensual"));
                gestor.put("f_logged", inicioConexion.rs.getString("f_logged"));
                gestores.add(gestor);
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return gestores.toJSONString();
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

    //==========================================================================
    //==========================================================================
    public static String select_usuarios_cargo_filtro(int puesto, int puesto2, int puesto3, String filtro) {
        try {
            StartConexion inicioConexion = new StartConexion();
            String cadena_puesto = puesto + "," + puesto2 + "," + puesto3;

            String sql = "select u.id, u.nombre from arcade_usuarios u\n"
                    + "left join sic_puestos p on (u.id_puesto = p.id_puesto or u.id_puesto2 = p.id_puesto or u.id_puesto3 = p.id_puesto)\n"
                    + "where p.id_padre in (" + cadena_puesto + ") and p.id_padre != 0 and (u.id like '%" + filtro + "%' or u.nombre like '%" + filtro + "%');";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONArray gestores = new JSONArray();
            while (inicioConexion.rs.next()) {
                JSONObject gestor = new JSONObject();
                gestor.put("id", inicioConexion.rs.getInt("id"));
                gestor.put("nombre", inicioConexion.rs.getString("nombre"));
                gestores.add(gestor);
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return gestores.toJSONString();
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }
    //==========================================================================
     public static String update_f_logged_user(int id) {
        try {
            StartConexion inicioConexion = new StartConexion();
            
            String sql = "UPDATE arcade_usuarios SET f_logged = if(f_logged = 1, 0, 1) WHERE id = "+id+";";
            System.out.println(sql);
            inicioConexion.st.executeUpdate(sql);
            JSONObject gestor = new JSONObject();
            gestor.put("resultado", "Actualizacion Correcta");
            inicioConexion.conn.close();
            inicioConexion.st.close();
            return gestor.toJSONString();
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }
    //==========================================================================
     public static String select_estaus_posibles() {
        try {
            StartConexion inicioConexion = new StartConexion();
            
            String sql = "call arcade_select_estatus_cuenta_cliente(1);";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            JSONArray estatus = new JSONArray();
            while (inicioConexion.rs.next()) {
                JSONObject estatu = new JSONObject();
                estatu.put("id_estatus_cuenta", inicioConexion.rs.getInt("id_estatus_cuenta"));
                estatu.put("estatus_cuenta", inicioConexion.rs.getString("estatus_cuenta"));
                estatu.put("descripcion", inicioConexion.rs.getString("descripcion"));
                estatus.add(estatu);
            }
            inicioConexion.conn.close();
            inicioConexion.st.close();
            return estatus.toJSONString();
        } catch (SQLException ex) {
            return "SQL Code: " + ex;
        }
    }

}
