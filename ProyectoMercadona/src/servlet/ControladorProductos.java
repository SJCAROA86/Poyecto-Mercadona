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
 * Servlet implementation class ControladorPerfil
 */
@WebServlet("/ControladorProductos")
public class ControladorProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorProductos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MysqlConnect c = MysqlConnect.getDbCon();//conexión a la base de datos
		ResultSet rs = null;// la variable donde vamos a meter los datos de la
							// bbdd está vacia

		
		 if (request.getAttribute("boton") != null) {
			 response.sendRedirect("jsp/menu.jsp");
		 }else {

				try {

					rs = c.query("select * from producto");// la rellenamos con datos de
															// la bbdd
					if (rs.next()) {
						System.out.println("entra");
						request.setAttribute("productos", rs);//la cajita con datos rs
						request.getRequestDispatcher("jsp/tienda.jsp").forward(request, response);//a donde mandamos la cajita
					}else{
						response.sendRedirect("jsp/menu.jsp");
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
