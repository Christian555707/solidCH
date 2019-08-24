<%@page language="java" contentType="text/html; charset=UTF-8; application/json"	pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.Iterable"%>
<%@page import="org.apache.commons.csv.*"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.lang.Object"%>
<%@page import="org.json.JSONObject"%>

    <%
    ArrayList<String> Label = new ArrayList<String>();
    ArrayList<Double> A = new ArrayList<Double>();
    ArrayList<Double> B = new ArrayList<Double>();
    ArrayList<String> ALPotMaxtA2B = new ArrayList<String>();
    ALPotMaxtA2B.add("");
    ArrayList<String> BLPotMaxtA2B = new ArrayList<String>();
    BLPotMaxtA2B.add("");
    
    Label.add("Jul2018");//////////// /*
    A.add(Double.valueOf(0));
    B.add(Double.valueOf(0));///////////////  */
    double [][] Bloques ={
    		{0.024,0.059000000000000004,0.048,0.11800000000000001,0.024,0.059000000000000004,0.024,0.059000000000000004,0.085,0.207,0.024,0.059000000000000004,0.024,0.059000000000000004,0.036000000000000004,0.08900000000000001},
    		{0.024,0.06,0.048,0.11900000000000001,0.024,0.06,0.024,0.06,0.083,0.20800000000000002,0.024,0.06,0.024,0.06,0.036000000000000004,0.08900000000000001},
    		{0.044000000000000004,0.081,0.07400000000000001,0.134,0.015,0.027000000000000003,0.03,0.054000000000000006,0.08900000000000001,0.161,0.044000000000000004,0.081,0.015,0.027000000000000003,0.044000000000000004,0.081},
    		{0.044000000000000004,0.122,0.044000000000000004,0.122,0.022000000000000002,0.061,0.044000000000000004,0.122,0.044000000000000004,0.122,0.022000000000000002,0.061,0.022000000000000002,0.061,0.022000000000000002,0.061},
    		{0.04,0.085,0.081,0.16899999999999998,0.027000000000000003,0.055999999999999994,0.04,0.085,0.054000000000000006,0.113,0.027000000000000003,0.055999999999999994,0.027000000000000003,0.055999999999999994,0.027000000000000003,0.055999999999999994},
    		{0.042,0.083,0.083,0.16699999999999998,0.027999999999999997,0.055999999999999994,0.055999999999999994,0.111,0.042,0.083,0.013999999999999999,0.027999999999999997,0.013999999999999999,0.027999999999999997,0.055999999999999994,0.111},
    		{0.024,0.059000000000000004,0.073,0.177,0.024,0.059000000000000004,0.048,0.11800000000000001,0.036000000000000004,0.08900000000000001,0.024,0.059000000000000004,0.012,0.03,0.048,0.11800000000000001},
    		{0.04,0.085,0.081,0.16899999999999998,0.027000000000000003,0.055999999999999994,0.054000000000000006,0.113,0.04,0.085,0.027000000000000003,0.055999999999999994,0.013000000000000001,0.027999999999999997,0.04,0.085},
    		{0.05,0.075,0.083,0.125,0.05,0.075,0.05,0.075,0.067,0.1,0.033,0.05,0.033,0.05,0.033,0.05},
    		{0.036000000000000004,0.08900000000000001,0.06,0.14800000000000002,0.036000000000000004,0.08900000000000001,0.036000000000000004,0.08900000000000001,0.048,0.11800000000000001,0.024,0.059000000000000004,0.024,0.059000000000000004,0.024,0.059000000000000004},
    		{0.027999999999999997,0.055999999999999994,0.069,0.139,0.027999999999999997,0.055999999999999994,0.042,0.083,0.069,0.139,0.042,0.083,0.027999999999999997,0.055999999999999994,0.027999999999999997,0.055999999999999994},
    		{0.044000000000000004,0.081,0.059000000000000004,0.10800000000000001,0.03,0.054000000000000006,0.044000000000000004,0.081,0.07400000000000001,0.134,0.044000000000000004,0.081,0.03,0.054000000000000006,0.03,0.054000000000000006},
    		};
   
    
    int i = 0;

    Reader in = new FileReader("/home/casa/Mem/AUT/Nuevo/2018/LinFluEtaBlo.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    for (CSVRecord record : records) {
    	
    	String mes=record.get("MesNom");
    	String año=record.get("A�oCld");
    	String MesCld=record.get("MesCld");
    	String IBlo=record.get("IBlo");
        String variable = record.get(request.getParameter("selectVarP"));
        String barnom = record.get("LinNom");
        String LinPotMaxAtoB = record.get("LinPotMaxA->B MW");
//        String bardemfmt=record.get("BarDemFmt");
        
if( año.equals("2023") ){break;}
        


        if (barnom.equals(request.getParameter("selectBarP")) ){
        	//Label.add(mes+año); A.add(Double.valueOf(etanom)); 
        	if(!(mes+año).equals(Label.get(i))){
        		//System.out.println(" Label:"+Label.get(i)+" "+mes+año);
        		Label.add(mes+año);
        		A.add(Double.valueOf(variable)*Bloques[Integer.parseInt(MesCld)-1][Integer.parseInt(IBlo)-1]);
        		B.add(Double.valueOf(0));
        		i++;    		
        	} else {
        		//System.out.println(" A:"+A.get(i) + " "+i);
        		A.set(i, A.get(i) + Double.valueOf(variable)*Bloques[Integer.parseInt(MesCld)-1][Integer.parseInt(IBlo)-1]); ALPotMaxtA2B.set(0, LinPotMaxAtoB);
        	
        };
    }
         if (barnom.equals(request.getParameter("selectBar2P"))	){
        	//B.add(Double.valueOf(etanom));
        	B.set(i, B.get(i) + Double.valueOf(variable)*Bloques[Integer.parseInt(MesCld)-1][Integer.parseInt(IBlo)-1]); BLPotMaxtA2B.set(0, LinPotMaxAtoB);
        }
        
    }
    
    System.out.println("size Label :"+Label.size());
    System.out.println("size A :"+A.size());
    System.out.println("size B :"+B.size());
    System.out.println("size ALPotMaxtA2B :"+ALPotMaxtA2B.size());
    
    System.out.println("Label :"+Label);
    System.out.println("A :"+A);
    System.out.println("B :"+B);
    
    JSONObject json = new JSONObject();
    json.accumulate("List", Label);
    json.accumulate("A", A);
    json.accumulate("B", B);
    json.accumulate("ALPotMaxtA2B", ALPotMaxtA2B);
    json.accumulate("BLPotMaxtA2B", BLPotMaxtA2B);
    
    
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