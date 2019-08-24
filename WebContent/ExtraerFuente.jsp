<%@page language="java" contentType="text/html; charset=UTF-8; application/json"	pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.Iterable"%>
<%@page import="org.apache.commons.csv.*"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.lang.Object"%>
<%@page import="org.json.JSONObject"%>

    <%// Calcula el costo promedio y proviene de Datos.jsp hay que separar por Ind y Veg
    ArrayList<String> Label = new ArrayList<String>();
    Label.add("Jul2018");//////////// /*
 
    
    int i = 0;

    Reader in = new FileReader("/home/casa/Mem/AUT/2018-02/Fuentes.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    for (CSVRecord record : records) {
    	
 
        String Fuente=record.get("CenAux");
        
        if(!(Fuente).equals(Label.get(i))){
        	Label.add(Fuente);
        	i++;    		
        	};
        };
    
    System.out.println(" Label:"+Label);


    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>