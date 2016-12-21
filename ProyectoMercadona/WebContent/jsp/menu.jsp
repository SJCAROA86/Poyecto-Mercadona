<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<title>Menu</title>
</head>
<body>

	<h4><%= session.getAttribute("nombre_user") %> ha iniciado sesión</h4>

	<div class="row text-center">
		<div class="col-md-6">
			<img
				src="https://www.mercadona.es/imagenes/1415435237___esp/logomercavertical.gif"
				width=300 height=200>
		</div>
		<div class="col-md-6">
			<h2>MENÚ</h2>
		</div>
	</div>

	<div class="row text-center">

		<div class="col-md-6">
			<a id = "productos" href="/ProyectoMercadona/ControladorProductos">
				<button name = "producto">PRODUCTOS</button>
			</a>
		</div>

		<div class="col-md-6">
			<a id = "pedidos" href="ControladorCesta?boton=VERPEDIDOS">
				<button name = "pedido">PEDIDOS</button>
			</a>
		</div>
		

	</div>
	<div></div>

</body>
</html>