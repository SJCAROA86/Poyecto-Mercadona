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
<title>Detalles de los Productos</title>
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
				<h2>DETALLES DEL PRODUCTO</h2>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<div class="row col-sm-12">

			<%
				ResultSet productos = (ResultSet) request.getAttribute("productos");
				int id=productos.getInt("id");
			%>



			<h3><%=productos.getString("nombre")%></h3>
			<img alt="no load" src="<%=productos.getString("image")%>">
			<p><%=productos.getString("nombre_marca")%></p>
			<p><%=productos.getString("descripcion")%></p>
			<p>Peso: <%=productos.getString("peso")%></p>
			<p>Precio: <%=productos.getString("precio")%></p>
			

	<a href = "ControladorCesta?idp=<%=id%>&boton=ANADIR" id ="añadirproducto">
	<button>Añadir a cesta</button>
	</a>
	<a href = "ControladorCesta" id = "quitarproducto">
	<button  name = "productofueracesta" > Quitar de la cesta</button>
	</a>
	
		</div>

	</div>

</body>
</html>