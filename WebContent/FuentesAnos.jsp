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
    Label.add("2018");Label.add("2019");Label.add("2020");Label.add("2021");Label.add("2022");Label.add("2023");Label.add("2024");Label.add("2025");Label.add("2026");Label.add("2027");Label.add("2028");Label.add("2029");
    
    ArrayList<Double> Hidricos = new ArrayList<Double>();
    ArrayList<Double> OtrosTermicos = new ArrayList<Double>();
    ArrayList<Double> Carbon = new ArrayList<Double>();
    ArrayList<Double> Gas = new ArrayList<Double>();
    ArrayList<Double> DerPetroleo = new ArrayList<Double>();
    ArrayList<Double> Eolica = new ArrayList<Double>();
    ArrayList<Double> Solar = new ArrayList<Double>();
    ArrayList<Double> Geotermia = new ArrayList<Double>();
    
    
    
    Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));Hidricos.add(Double.valueOf(0));
    OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));OtrosTermicos.add(Double.valueOf(0));
    Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));Carbon.add(Double.valueOf(0));
    Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));Gas.add(Double.valueOf(0));
    DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));DerPetroleo.add(Double.valueOf(0));
    Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));Eolica.add(Double.valueOf(0));
    Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));Solar.add(Double.valueOf(0));
    Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));Geotermia.add(Double.valueOf(0));
    
        
    int i=0;

    Reader in = new FileReader("/home/casa/Mem/AUT/Nuevo/2018/CenSisEtaBlo.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    
    for (CSVRecord record : records) {
//    	String mes = record.get("MesNom");
    	String año= record.get("A�oCld");
        String energia = record.get("CenPotOpeMed MW");
        String Fuente = record.get("CenAux");
        String EtaHrs = record.get("EtaHrs");
        
        double EtaHrsIn=Double.parseDouble(EtaHrs)/1000;
       
        

        if (!año.equals(Label.get(i))){i++;}

        if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Embalse") || Fuente.equals("Pasada") || Fuente.equals("Serie")  )  ){Hidricos.set(i, Hidricos.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
        else if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Otro") || Fuente.equals("Desechos Forestales") || Fuente.equals("Biomasa") ) ){OtrosTermicos.set(i, OtrosTermicos.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
        else if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Carb�n")  )  ){Carbon.set(i, Carbon.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
        else if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Gas Natural") || Fuente.equals("GNL") ) ){Gas.set(i, Gas.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
        else if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Biomasa-Licor Negro-Petr�leo N�6") || Fuente.equals("Biomasa-Petr�leo N�6")  || Fuente.equals("Petr�leo Diesel") || Fuente.equals("Petr�leo IFO-180") || Fuente.equals("Licor Negro-Petr�leo N�6") ) ){DerPetroleo.set(i, DerPetroleo.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
        else if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Eolica") ) ){Eolica.set(i, Eolica.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
        else if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Solar") || Fuente.equals("TermoSolar")  )  ){Solar.set(i, Solar.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
        else if (Integer.parseInt(año)>=2019 && Integer.parseInt(año)<=2028 && (Fuente.equals("Geotermia") ) ) {Geotermia.set(i, Geotermia.get(i) + Double.valueOf(energia)*EtaHrsIn);}
        
      
        
    };
/*    
    for (int k=0; k<12; k++){
    	
    	double total;  
    	
    	total=Hidricos.get(k)  + OtrosTermicos.get(k) + Carbon.get(k) + Gas.get(k) + DerPetroleo.get(k) + Eolica.get(k) + Solar.get(k) + Geotermia.get(k); 
    	System.out.println("Total: "+total);
    	
    	Hidricos.set(k, Hidricos.get(k)/total);
    	OtrosTermicos.set(k, OtrosTermicos.get(k)/total);
    	Carbon.set(k, Carbon.get(k)/total);
    	Gas.set(k, Gas.get(k)/total);
    	DerPetroleo.set(k, DerPetroleo.get(k)/total);
    	Eolica.set(k, Eolica.get(k)/total);
    	Solar.set(k, Solar.get(k)/total);
    	Geotermia.set(k, Geotermia.get(k)/total);
    	
    };
    
    
*/    

/*
    System.out.print("lengthBio : "+DerPetroleo.size()+" ");
    System.out.print("lengthCar : "+Carbon.size()+" ");
    System.out.print("lengthLabel : "+Label.size()+" ");
    
    System.out.print("Biomasa: "+DerPetroleo);
    System.out.print("Carbón: "+Carbon);
    System.out.print(Label);
*/

%>
 
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fuentes</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js	"></script>
<style>
body {
    height: 100%;
    width:100%;
    background-color: #1fc8db; /* For browsers that do not support gradients */        
    background-image: linear-gradient(141deg, #9fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
    color:white;
    opacity:0.95;
}
</style>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  border-radius: 25px;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
.footer {
position: -webkit-sticky;
  position: sticky;
  
  bottom: 0;
  width: 100%;
  background-color: #555;
  color: white;
  text-align: center;
  border-radius: 25px;
  }
  
</style>
    
</head>
<body>

<ul>
  <li><a class="active" href="Index.html">Inicio</a></li>
  <li><a href="IndexCentrales.html">Centrales</a></li>
  <li><a href="IndexBarras.html">Barras</a></li>
  <li><a href="Lineas.jsp">Lineas</a></li>
</ul>

<div class="container"> <!-- Contenedor grafico Ind -->
  <br />
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
<!--       Chart.js Canvas Tag -->
      <canvas id="EnergiaTotal"  width="100%" height="35%" style="background:white;border-radius: 25px"></canvas>
    </div>
    <div class="col-md-1"></div>
  </div>
</div>

<script>

var canvas = document.getElementById("EnergiaTotal");
var ctx = canvas.getContext('2d');

// Global Options:
Chart.defaults.global.defaultFontColor = 'black';
Chart.defaults.global.defaultFontSize = 16;



var data = {
  labels: <%=Label%>,

  datasets: [{
      label: "Hídricos",
      backgroundColor: "DarkCyan",
      borderColor: "DarkCyan", // The main line color
      HoverBackgroundColor: "DarkCyan",
      pointHoverBackgroundColor: "DarkCyan",
      data: <%=Hidricos%>,
      spanGaps: true,
    },
    
    {label: "Otros Térmicos",
        backgroundColor: "Red",
        borderColor: "Red",
        hoverBackgroundColor:"Red", 
        pointHoverBackgroundColor: "Red",
        data: <%=OtrosTermicos%>,
        spanGaps: true,
        },
    
    {label: "Carbón",
      backgroundColor: "RebeccaPurple",
      borderColor: "RebeccaPurple",
      hoverBackgroundColor:"RebeccaPurple", 
      pointHoverBackgroundColor: "RebeccaPurple",
      data: <%=Carbon%>,
      spanGaps: true,
      },
      
      {label: "Gas",
          backgroundColor: "Green",
          borderColor: "Green",
          hoverBackgroundColor:"Green", 
          pointHoverBackgroundColor: "Green",
          data: <%=Gas%>,
          spanGaps: true,
          }, 

          
          {label: "Der. Petróleo",
              backgroundColor: "Gray",
              borderColor: "Gray",
              hoverBackgroundColor:"Gray", 
              pointHoverBackgroundColor: "Gray",
              data: <%=DerPetroleo%>,
              spanGaps: true,
              },
          
      
          
          
          
      
      {label: "Eólica",
        backgroundColor: "Blue",
        borderColor: "Blue",
        hoverBackgroundColor:"Blue", 
        pointHoverBackgroundColor: "Blue",
        data: <%=Eolica%>,
        spanGaps: true,
       },
       
       {label: "Solar",
           backgroundColor: "Yellow",
           borderColor: "Yellow",
           hoverBackgroundColor:"Yellow", 
           pointHoverBackgroundColor: "Yellow",
           data: <%=Solar%>,
           spanGaps: true,
          },

          {label: "Geotermia",
              backgroundColor: "Orange",
              borderColor: "Orange",
              hoverBackgroundColor:"Orange", 
              pointHoverBackgroundColor: "Orange",
              data: <%=Geotermia%>,
              spanGaps: true,
             },
          
          
          
  ]
};

// 
var options = {
  scales: { xAxes: [{
      stacked: true
  }],
            yAxes: [{
            	stacked: true,
/*
                ticks: {
                    beginAtZero:true
                },
*/                
                
                
                scaleLabel: {
                     display: true,
                     labelString: "Energía  [GWh]",
                     fontSize: 20 
                  }

            }]            
        },/*
  elements: {
            line: {
                tension: 0 // disables bezier curves
            }
        },*/
 /*tooltips: {
			mode: 'index',
			intersect: false,
			position: 'nearest',
		},  */
		
 /* hover: {
			mode: 'nearest',
			intersect: true
		}*/
};

// Chart declaration:
var myBarChart = new Chart(ctx, {
  type: 'bar',
  data: data,
  options: options
});
</script>

 

<div class="footer">
  <p>&#169; 2019 Christian Espinoza &#9921;</p>
</div>
</body>
</html>