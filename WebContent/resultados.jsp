<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultados de venta</title>
</head>
<body>
<h1>Resultados de las ventas</h1>
<%
String pro=request.getParameter("selectPro");
double pre=Double.parseDouble
(request.getParameter("txtPre"));
int can=Integer.parseInt(request.getParameter("txtCan"));
double subtotal=pre*can;
double iva=subtotal*0.2;
double total=subtotal+iva;
%>
Producto: <%=pro%><br>
Precio: <%=pre%><br>
Cantidad: <%=can%><br>
Subtotal: <%=subtotal%><br>
Iva: <%=iva%><br>
Total: <%=total%><br>
<a href="Index.jsp">Volver a página principal</a>
</body>
</html>