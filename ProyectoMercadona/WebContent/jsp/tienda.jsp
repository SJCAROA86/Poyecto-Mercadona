<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/estilos.css">

<script src="https://code.jquery.com/jquery-3.1.1.js"
	integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/miscript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Productos y Pedidos</title>
</head>
<body>

<h4><%= session.getAttribute("nombre_user") %> ha iniciado sesión</h4>

	<div class="container text-center">
		<div class="row text-center">
			<div class="col-md-6">
				<img
					src="https://www.mercadona.es/imagenes/1415435237___esp/logomercavertical.gif"
					width=300 height=200>
			</div>
			<div class="col-md-6">
				<h2>TIENDA</h2>
			</div>
		</div>
	</div>
	<div class="container text-center">
	 
		<div class="row" id = "imagenes">

			<%
				ResultSet productos = (ResultSet) request.getAttribute("productos");

				while (productos.next()) {
				int id=productos.getInt("id");
			%>

			<div class="col-sm-4">

				<h3><%=productos.getString("nombre")%></h3>
				<a href ="DetalleProducto?idp=<%=id%>"><img class="imgProd"  alt="no load" src="<%=productos.getString("image")%>"></a>				

			</div>

			<%
				}
			%>


		</div>
		
		
	</div>
	<div class = "row text-right">
		
		<a id = "volvermenu" href="ControladorProductos?boton=VOLVER">
				<button name = "gottamenu">VOLVER A MENÚ</button>
			</a>
		
		</div>


</body>
</html>