package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.MysqlConnect;

/**
 * Servlet implementation class ControladorCesta
 */
@WebServlet("/ControladorCesta")
public class ControladorCesta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorCesta() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MysqlConnect c = MysqlConnect.getDbCon();
		ResultSet rs = null;
		String cliente_id = (String) request.getSession().getAttribute("cliente_id");

		if (request.getParameter("boton").equals("ANADIR")) {

			try {

				rs = c.query("SELECT * FROM pedido WHERE confirmado = 0 AND cliente_id =" + cliente_id);

				if (rs.next()) {// TENGO PEDIDO Y A�ADO PRODUCTO

					int ped = rs.getInt("id");
					String prod = request.getParameter("idp");

					c.insert("INSERT INTO pedido_producto (pedido_id, producto_id)VALUES (" + ped + "," + prod + ")");

				} else {// NO TE NGO PEDIDO,LO CREO Y A�ADO LOS PRODUCTO

					// CREAMOS CESTA

					c.insert("INSERT INTO pedido(`fecha_pedido`, `confirmado`, `cliente_id`) VALUES(" + "CURRENT_DATE()"
							+ ", 0 ," + cliente_id + ")");

					rs = c.query("SELECT * FROM pedido WHERE confirmado = 0 AND cliente_id =" + cliente_id);

					if (rs.next()) {

						// A�ADIMOS PRODUCTOS A LA NUEVA CESTA

						int ped = rs.getInt("id");
						String prod = request.getParameter("idp");

						c.insert("INSERT INTO pedido_producto (pedido_id, producto_id)VALUES (" + ped + "," + prod
								+ ")");
					}

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// Tengo que mandar al usuario a una vista

			request.getRequestDispatcher("ControladorProductos").forward(request, response);

		} else if (request.getParameter("boton").equals("VERPEDIDOS")) {

			try {
				String consulta = "SELECT p.id,pr.nombre, pr.peso, pr.precio from cliente c inner join pedido p on p.cliente_id=c.id "
						+ "inner join pedido_producto pp on pp.pedido_id=p.id "
						+ "INNER join producto pr on pp.producto_id=pr.id " + "where c.id=" + cliente_id;
				System.out.println (consulta);
				rs = c.query(consulta);

				// Tengo que mandar al usuario a una vista
				if(rs.next()){
					
					request.setAttribute("productosquepaso", rs);
					request.getRequestDispatcher("jsp/carrocompra.jsp").forward(request, response);	
				}
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
