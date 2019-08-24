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

    Reader in = new FileReader("/home/casa/Mem/AUT/Nuevo/2019/BarSisDemEta.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    
    for (CSVRecord record : records) {

    	//String inum = record.get("INum");
    	String mes = record.get("MesNom");
    	String año= record.get("A�oCld");
    	String BarraDemFmt = record.get("BarDemFmt");
        String etanom = record.get(request.getParameter("selectVar"));
        String barnom = record.get("BarNom");

        if (barnom.equals(request.getParameter("selectBar")) & BarraDemFmt.equals("BarDemInd")){
        	Label.add('"'+mes+año+'"'); A.add(Double.valueOf(etanom));
       }
        if (barnom.equals(request.getParameter("selectBar2")) & BarraDemFmt.equals("BarDemInd")){
        	B.add(Double.valueOf(etanom));
        }    
    }
%>
     
    <!DOCTYPE HTML>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titulo</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js	"></script>

    </head>
    <body>

<form action="BarDem.jsp" method = "post">
<table><tr>
  <!-- Lista de opciones -->
<select  name = "selectVar">
<!--Variable: <select name = "selectVar"> -->
<option value ="BarDemPot [MW]"> BarDemPot [MW] </option>
<option value ="BarDemEne [GWh]"> BarDemEne [GWh] </option>
 </select>
<!-- </select><br>  -->
</tr><tr>
Barra:</tr><tr> <input type="text" list="items" name = "selectBar">
<datalist id="items">

<option value =""> Text </option>
<option value ="Agua Santa 110"> Agua Santa 110 </option>
<option value ="Algarrobo 110"> Algarrobo 110 </option>
<option value ="Algorta 033"> Algorta 033 </option>
<option value ="Alto Jahuel 110"> Alto Jahuel 110 </option>



</datalist>
</tr>
<tr>
Barra: <input type="text" list="items" name = "selectBar2">
<datalist id="items">
<option value =""> Text </option>
<option value ="Agua Santa 110"> Agua Santa 110 </option>
<option value ="Algarrobo 110"> Algarrobo 110 </option>
<option value ="Algorta 033"> Algorta 033 </option>
<option value ="Alto Jahuel 110"> Alto Jahuel 110 </option>



</datalist>
</tr></tr>

<input type="submit" name="btn1" value="Enviar"></tr>
</table>
</form>  



<div class="container"> <!-- Contenedor grafico Ind -->
  <br />
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
<!--       Chart.js Canvas Tag -->
      <canvas id="barChart"  width="100%" height="20"></canvas>
    </div>
    <div class="col-md-1"></div>
  </div>
</div>

<script>

var canvas = document.getElementById("barChart");
var ctx = canvas.getContext('2d');

// Global Options:
Chart.defaults.global.defaultFontColor = 'black';
Chart.defaults.global.defaultFontSize = 16;

var data = {
  labels: <%=Label%>, //["Ene2019", "Feb2019", "Mar2019", "Abr2019"],
  //labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
  datasets: [{
      label: <%='"'+request.getParameter("selectBar")+'"'%>,
      fill: false,
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
      data: <%=A%>,
      //data: [65, 59, 80, 81, 56, 55, 40, 60,55,30,78],
      spanGaps: false,
    }, {
      label: <%='"'+request.getParameter("selectBar2")+'"'%>,
      fill: false,
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
      data: <%=B%>,
      //data: [10, 20, 60, 95, 64, 78, 90, 70,40,70,89],
      spanGaps: false,
      
    }, {
        label: <%='"'+request.getParameter("selectBar3")+'"'%>,
        fill: false,
        //lineTension: 0.1,
        backgroundColor: "YellowGreen",
        borderColor: "YellowGreen",
        /*borderCapStyle: 'butt',
        borderDash: [],
        borderDashOffset: 0.0,
        borderJoinStyle: 'miter',
        pointBorderColor: "white",
        pointBackgroundColor: "black",
        pointBorderWidth: 1,
        */pointHoverRadius: 5,
        pointHoverBackgroundColor: "YellowGreen",/*
        pointHoverBorderColor: "yellow",
        pointHoverBorderWidth: 2,
        */pointRadius: 2,/*
        pointHitRadius: 10,	*/
        //
       // data: [7, 35, 15, 13, 21, 18, 3, 7, 26, 41, 63],
        //data: [7, 35, 15, 13, 21, 18, 3, 7, 26, 41, 63],
        spanGaps: false,
        
      }

  ]
};

// 
var options = {
  scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                },
                scaleLabel: {
                     display: true,
                     labelString: <%='"'+request.getParameter("selectVar")+'"'%>,
                     fontSize: 20 
                  }
            }]            
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


</body>
</html>                              