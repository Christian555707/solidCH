<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.Iterable"%>
<%@page import="org.apache.commons.csv.*"%>
<%@page import="java.util.Arrays"%>

    <%

    ArrayList<String> Label = new ArrayList<String>();
    ArrayList<Double> A = new ArrayList<Double>();
    ArrayList<Double> B = new ArrayList<Double>();
    Label.add('"'+"Jul2018"+'"');
    A.add(Double.valueOf(0));
    B.add(Double.valueOf(0));
    int i = 0;

    Reader in = new FileReader("/home/casa/Mem/AUT/Nuevo/2018/BarSisDemEta.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    
    for (CSVRecord record : records) {
    	String mes = record.get("MesNom");
    	String año= record.get("A�oCld");
    	String BarraDemFmt = record.get("BarDemFmt");
        String energia = record.get("BarDemEne [GWh]");

        if (BarraDemFmt.equals("BarDemInd")){       	
        	if(!('"'+mes+año+'"').equals(Label.get(i))){
        		//System.out.println(" Label:"+Label.get(i)+" "+mes+año);
        		Label.add('"'+mes+año+'"');
        		A.add(Double.valueOf(energia));
        		B.add(Double.valueOf(0));
        		i++;    		
        	} else {
        		//System.out.println(" A:"+A.get(i) + " "+i);
        		A.set(i, A.get(i) + Double.valueOf(energia));
        	}
       }
        else {
        	if(!('"'+mes+año+'"').equals(Label.get(i))){
        		Label.add('"'+mes+año+'"');
        		B.add(Double.valueOf(energia));
        		A.add(Double.valueOf(0));
        		i++;    		
        	} else {
        		//System.out.println(" B:"+B.get(i) + " "+i);
        		B.set(i, B.get(i) + Double.valueOf(energia));
        	}
        }    
    }
    
//    System.out.print("A: "+A);
//    System.out.print("B: "+B);
//    System.out.print(Label);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demanda sistema Ind Veg</title>
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
      <canvas id="EnergiaTotal"  width="100%" height="20" style="background:white;border-radius: 25px"></canvas>
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
  //labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
  datasets: [{
      label: "Vegetal",
      fill: "start",
     // lineTension: 0.1,
      backgroundColor: "DarkCyan",
      borderColor: "DarkCyan", // The main line color
      /*	borderCapStyle: 'square',
      borderDash: [], // try [5, 15] for instance
      borderDashOffset: 0.0,
      borderJoinStyle: 'miter',
      pointBorderColor: "black",
      pointBackgroundColor: "white",
      pointBorderWidth: 1,
      */pointHoverRadius: 5,
      pointHoverBackgroundColor: "DarkCyan",/*
      pointHoverBorderColor: "brown",
      pointHoverBorderWidth: 2,
      */pointRadius: 2,/*
      pointHitRadius: 10,	*/
      //
      data: <%=B%>,
      //data: [65, 59, 80, 81, 56, 55, 40, 60,55,30,78],
      spanGaps: false,
    }, {
      label: "Industrial",
      fill: "start",
      //lineTension: 0.1,
      backgroundColor: "RebeccaPurple",
      borderColor: "RebeccaPurple",
      /*borderCapStyle: 'butt',
      borderDash: [],
      borderDashOffset: 0.0,
      borderJoinStyle: 'miter',
      pointBorderColor: "white",
      pointBackgroundColor: "black",
      pointBorderWidth: 1,
      */pointHoverRadius: 5,
      pointHoverBackgroundColor: "RebeccaPurple",/*
      pointHoverBorderColor: "yellow",
      pointHoverBorderWidth: 2,
      */pointRadius: 2,/*
      pointHitRadius: 10,	*/
      //
      data: <%=A%>,
      //data: [10, 20, 60, 95, 64, 78, 90, 70,40,70,89],
      spanGaps: false,
      
    }

  ]
};

// 
var options = {
  scales: {
            yAxes: [{
            	stacked: true,
                ticks: {
                    beginAtZero:true
                },
                scaleLabel: {
                     display: true,
                     labelString: "BarDemEne [GWh]",
                     fontSize: 20 
                  }
            }],
            
            xAxes: [{
                stacked: true
            }],
            
        },
  elements: {
            line: {
                tension: 0 // disables bezier curves
            }
        },
 tooltips: {
			mode: 'index',
			intersect: false,
			position: 'nearest',
		},        
 /* hover: {
			mode: 'nearest',
			intersect: true
		}*/
};

// Chart declaration:
var myBarChart = new Chart(ctx, {
  type: 'line',
  data: data,
  options: options
});
</script>

<!--  <p style="color:black;">En los siguientes enlaces podrá encontrar las barras según si son industrial o vegetativa</p>

<div><table align="center"  style="background-color: white; color: white;text-align: center;border-radius: 25px;padding: 15px; padding-top:10px;padding-bottom:10px;border-spacing: 15px;"><tr><td><a class="three" href="BarrasIndustrial.jsp" style="text-decoration:none;">Industrial</a></td><td><a href="BarrasVeg.jsp" style="text-decoration:none;">Vegetativo</a></td></tr></table></div>

  -->

<p style="color:black;">En el siguiente enlace podrá encontrar la demanda por barras </p>

<div><table align="center"  style="background-color: white; color: white;text-align: center;border-radius: 25px;padding: 15px; padding-top:10px;padding-bottom:10px;border-spacing: 15px;"><tr><td><a class="three" href="BarrasIndustrial.jsp" style="text-decoration:none;">Demanda</a></td></tr></table></div>


 

<div class="footer">
  <p>&#169; 2019 Christian Espinoza &#9921;</p>
</div>
</body>
</html>