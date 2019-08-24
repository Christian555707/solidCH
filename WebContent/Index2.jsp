<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Titulo</title>
</head>
<body>
<h1>Formulario</h1>
<form action="resultados.jsp" method = "post">

Producto: <select name = "selectPro">
<option value ="Televisor"> Televisor </option>
<option value ="Radio"> Radio </option>
<option value ="Cocina"> Cocina </option>
</select><br>

Precio: <input type="text" name="txtPre"><br>

Cantidad: <input type="text" name="txtCan"><br>
<input type="submit" name="btn1" value="Enviar">
</form>

</body>
</html>