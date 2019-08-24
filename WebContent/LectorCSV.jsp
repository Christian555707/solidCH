<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.Iterable"%>
<%@page import="org.apache.commons.csv.*"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lector CSV</title>
</head>
<body>
<%
Reader in = new FileReader("/home/casa/Mem/Bar/CMg/100.csv");
Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
%>Lista 0  Lista 1 <br><%
for (CSVRecord record : records) {
    String inum = record.get("INum");%>
    
<%=inum + " "%>
    <%
    String etanom = record.get("BarCMgMed [US$/MWh]");%>
<%=etanom%><br><%
}
%>

</body>
</html>