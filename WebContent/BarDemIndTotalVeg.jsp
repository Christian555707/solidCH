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
    ArrayList<Double> A = new ArrayList<Double>();
    ArrayList<Double> B = new ArrayList<Double>();
    Label.add("Jul2018");//////////// /*
    A.add(Double.valueOf(0));
    B.add(Double.valueOf(0));///////////////  */
    
    int i = 0;

    Reader in = new FileReader("/home/casa/Mem/AUT/Nuevo/2018/BarSisDemEta.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    for (CSVRecord record : records) {
    	
    	String mes=record.get("MesNom");
    	String año=record.get("A�oCld");
    	String MesCld=record.get("MesCld");
    	String IBlo=record.get("IBlo");
        String variable = record.get(request.getParameter("selectVarT"));
        String barnom = record.get("BarNom");
        String bardemfmt=record.get("BarDemFmt");
        
        
        if (barnom.equals(request.getParameter("selectBarT")) && bardemfmt.equals("BarDemVeg")){
        	//Label.add(mes+año); A.add(Double.valueOf(etanom)); 
        	if(!(mes+año).equals(Label.get(i))){
        		//System.out.println(" Label:"+Label.get(i)+" "+mes+año);
        		Label.add(mes+año);
        		A.add(Double.valueOf(variable));
        		B.add(Double.valueOf(0));
        		i++;    		
        	} else {
        		//System.out.println(" A:"+A.get(i) + " "+i);
        		A.set(i, A.get(i) + Double.valueOf(variable));
        	
        };
    }
         if (barnom.equals(request.getParameter("selectBar2T")) && bardemfmt.equals("BarDemVeg")	){
        	//B.add(Double.valueOf(etanom));
        	B.set(i, B.get(i) + Double.valueOf(variable));
        }
        
    }
    
    JSONObject json = new JSONObject();
    json.accumulate("List", Label);
    json.accumulate("A", A);
    json.accumulate("B", B);
    
    
    response.getWriter().write(json.toString()); 
    response.getWriter().flush(); 
    response.getWriter().close();

    
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