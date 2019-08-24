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
    String[] meses ={"Dic","Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov"};   
    
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
    /*
    double[][] Bloques = {{17.856,43.89600000000001,35.712,87.79200000000002,17.856,43.89600000000001,17.856,43.89600000000001,63.24,154.008,17.856,43.89600000000001,17.856,43.89600000000001,26.784000000000002,66.21600000000001,},
    		{16.128,40.32,32.256,79.968,16.128,40.32,16.128,40.32,55.776,139.776,16.128,40.32,16.128,40.32,24.192,59.808},
    		{32.736000000000004,60.264,55.056000000000004,99.69600000000001,11.16,20.088,22.32,40.176,66.21600000000001,119.78400000000002,32.736000000000004,60.264,11.16,20.088,32.736000000000004,60.264},
    		{31.680000000000003,87.84,31.680000000000003,87.84,15.840000000000002,43.92,31.680000000000003,87.84,31.680000000000003,87.84,15.840000000000002,43.92,15.840000000000002,43.92,15.840000000000002,43.92},
    		{29.76,63.24,60.264,125.73599999999999,20.088,41.664,29.76,63.24,40.176,84.072,20.088,41.664,20.088,41.664,20.088,41.664},
    		{30.240000000000002,59.760000000000005,59.760000000000005,120.24,20.16,40.32,40.32,79.92,30.240000000000002,59.760000000000005,10.08,20.16,10.08,20.16,40.32,79.92},
    		{17.856,43.89600000000001,54.312000000000005,131.688,17.856,43.89600000000001,35.712,87.79200000000002,26.784000000000002,66.21600000000001,17.856,43.89600000000001,8.928,22.32,35.712,87.79200000000002},
    		{29.76,63.24,60.264,125.73599999999999,20.088,41.664,40.176,84.072,29.76,63.24,20.088,41.664,9.672,20.832,29.76,63.24},
    		{36.0,54.0,59.760000000000005,90.0,36.0,54.0,36.0,54.0,48.24,72.0,23.759999999999998,36.0,23.759999999999998,36.0,23.759999999999998,36},
    		{26.784000000000002,66.21600000000001,44.64,110.11200000000001,26.784000000000002,66.21600000000001,26.784000000000002,66.21600000000001,35.712,87.79200000000002,17.856,43.89600000000001,17.856,43.89600000000001,17.856,43.89600000000001},
    		{20.16,40.32,49.68000000000001,100.08,20.16,40.32,30.240000000000002,59.760000000000005,49.68000000000001,100.08,30.240000000000002,59.760000000000005,20.16,40.32,20.16,40.32},
    		{32.736000000000004,60.264,43.89600000000001,80.352,22.32,40.176,32.736000000000004,60.264,55.056000000000004,99.69600000000001,32.736000000000004,60.264,22.32,40.176,22.32,40.176}};
 */   
    
    int i = 0;
 int j = 0;
 int k=0;

    Reader in = new FileReader("/home/casa/Mem/AUT/Nuevo/2018/CMg/BarSisCMgEtaBlo.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    for (CSVRecord record : records) {
    	
//    	String mes=record.get("MesNom");
    	String año=record.get("A�oCld");
    	String MesCld=record.get("MesCld");
    	String IBlo=record.get("IBlo");
        String variable = record.get(request.getParameter("selectVarT"));
        String barnom = record.get("BarNom");
     
       String mes =  meses[(Integer.parseInt(MesCld))%12];
        
        if (barnom.equals(request.getParameter("selectBarT")) ){
        	//Label.add(mes+año); A.add(Double.valueOf(etanom)); 
        	if(!(mes+año).equals(Label.get(i))){
        		//System.out.println(" Label:"+Label.get(i)+" "+mes+año);
        		Label.add(mes+año);
        		A.add(Double.valueOf(variable)*Bloques[Integer.parseInt(MesCld)-1][Integer.parseInt(IBlo)-1]);
        		B.add(Double.valueOf(0));
        		i++;    		
        	} else {
        		//System.out.println(" A:"+A.get(i) + " "+i);
        		A.set(i, A.get(i) + Double.valueOf(variable)*Bloques[Integer.parseInt(MesCld)-1][Integer.parseInt(IBlo)-1]);
        	
        };
    }
         if (barnom.equals(request.getParameter("selectBar2T"))	){
        	 k++;
        	 System.out.println(" B:"+B.get(j));
        	//B.add(Double.valueOf(etanom));
        	B.set(j, B.get(j) + Double.valueOf(variable)*Bloques[Integer.parseInt(MesCld)-1][Integer.parseInt(IBlo)-1]);
        	if(k % 16 == 0){j++;};
        }
        
    }

System.out.println(" Label:"+Label);
System.out.println(" A:"+A);
System.out.println(" B:"+B);
    
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