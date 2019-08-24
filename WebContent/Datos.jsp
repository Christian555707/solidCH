<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.Iterable"%>
<%@page import="org.apache.commons.csv.*"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.json.JSONObject"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Energia promedio GWh con los porcentajes</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js	"></script>

</head>
<body>


<script>
function loadDoc() {
	  //window.alert("hola");
  var xhttp = new XMLHttpRequest();
  //response.setContentType("application/x-json;charset=UTF-8"); //   para probar
  xhttp.onreadystatechange = function(){

    if (this.readyState == 4  && this.status == 200) {
    	//var myObj = JSON.parse(this.responseText);
    	//var jsonObj = JSON.parse(request.responseText);
    	var obj = JSON.parse(this.responseText);
    	document.getElementById('aqui').innerHTML ="len List:"+Object.keys( obj.List ).length +" len a:"+Object.keys( obj.A ).length+" len B:"+Object.keys( obj.B ).length;// Borrar

    	

    	
    	var canvas = document.getElementById("EnergiaTotal");
    	var ctx = canvas.getContext('2d');
    	if (window.grafica) {
    		window.grafica.clear();
    		window.grafica.destroy();
    	}
    	// Global Options:
    	Chart.defaults.global.defaultFontColor = 'black';
    	Chart.defaults.global.defaultFontSize = 16;

    	var data = {
    	  labels: obj.List,
    	  datasets: [{
    	      label: document.getElementById("selectBar").value,
    	      fill: false,
    	      backgroundColor: "DarkCyan",
    	      borderColor: "DarkCyan", // The main line color
    	      pointHoverRadius: 5,
    	      pointHoverBackgroundColor: "DarkCyan",
    	      pointRadius: 2,
    	      //
    	      data: obj.A,

    	      spanGaps: false,
    	    }, {
    	      label: document.getElementById("selectBar2").value,
    	      fill: false,
    	      backgroundColor: "RebeccaPurple",
    	      borderColor: "RebeccaPurple",
    	      pointHoverRadius: 5,
    	      pointHoverBackgroundColor: "RebeccaPurple",pointRadius: 2,
    	      //
    	      data: obj.B,

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
    	                     labelString: document.getElementById("selectVar").value,
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

    	};


    	
    	
    	// Chart declaration:
    	window.grafica = new Chart(ctx, {
    	  type: 'line',
    	  data: data,
    	  options: options
    	});
    	

    	
    }
  };
  
  xhttp.open('POST', 'http://localhost:8080/Intento2/Datos2.jsp', true);//"http://localhost:8080/Intento2/WebContent/Datos2.jsp"
  //xhttp.setRequestHeader("Content-type","application/json; charset=utf-8");
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("selectVar="+document.getElementById("selectVar").value+"&selectBar="+document.getElementById("selectBar").value+"&selectBar2="+document.getElementById("selectBar2").value); 

}
</script>

<div id="aqui"></div>







<h1>Demanda por barras</h1>

<form id="form1" method="POST" onsubmit="loadDoc(); return false;">
<table><tr>
  <!-- Lista de opciones -->
<select id="selectVar" name="selectVar">
<!--Variable: <select name = "selectVar"> -->
<option value ="BarDemPot [MW]"> BarDemPot [MW] </option>
<option value ="BarDemEne [GWh]" selected> BarDemEne [GWh] </option>
 </select>
<!-- </select><br>  -->
</tr><tr>
Barra:</tr><tr> <input type="text" id="selectBar" list="items" name="selectBar" value="Agua Santa 110">
<datalist id="items">

<option value ="Agua Santa 110" selected> Agua Santa 110 </option>
<option value ="Algarrobo 110"> Algarrobo 110 </option>
<option value ="Algorta 033"> Algorta 033 </option>
<option value ="Alto Jahuel 110"> Alto Jahuel 110 </option>
<option value =""> Text </option>


<option value ="Cardones 220"> Cardones 220 </option>
<option value ="Carrera Pinto 220"> Carrera Pinto 220 </option>
<option value ="Casas Viejas 110"> Casas Viejas 110 </option>
<option value ="Choapa 110"> Choapa 110 </option>
<option value ="Diego de Almagro 220"> Diego de Almagro 220 </option>
<option value ="Dos Amigos 110"> Dos Amigos 110 </option>
<option value ="Illapel 110"> Illapel 110 </option>
<option value ="Incahuasi 110"> Incahuasi 110 </option>
<option value ="Los Vilos 220"> Los Vilos 220 </option>
<option value ="Maitencillo 110"> Maitencillo 110 </option>
<option value ="Maitencillo 220"> Maitencillo 220 </option>
<option value ="Marbella 110"> Marbella 110 </option>
<option value ="Minera del Carmen 220"> Minera del Carmen 220 </option>
<option value ="Ovalle 110"> Ovalle 110 </option>
<option value ="Pajonales 110"> Pajonales 110 </option>
<option value ="Pan de Azucar 110"> Pan de Azucar 110 </option>
<option value ="Pan de Azucar 220"> Pan de Azucar 220 </option>
<option value ="Punta Colorada 220"> Punta Colorada 220 </option>
<option value ="Punta Toro 110"> Punta Toro 110 </option>
<option value ="Quinquimo A 110"> Quinquimo A 110 </option>
<option value ="Romeral 110"> Romeral 110 </option>
</datalist>
</tr>
<tr>
Barra: <input type="text" id="selectBar2" list="items" name="selectBar2" value="Algorta 033">
<datalist id="items">
<option value =""> Text </option>
<option value ="Agua Santa 110"> Agua Santa 110 </option>
<option value ="Algarrobo 110"> Algarrobo 110 </option>
<option value ="Algorta 033"> Algorta 033 </option>
<option value ="Alto Jahuel 110"> Alto Jahuel 110 </option>





<option value ="Cardones 110"> Cardones 110 </option>
<option value ="Cardones 220"> Cardones 220 </option>
<option value ="Carrera Pinto 220"> Carrera Pinto 220 </option>
<option value ="Casas Viejas 110"> Casas Viejas 110 </option>
<option value ="Choapa 110"> Choapa 110 </option>
<option value ="Diego de Almagro 220"> Diego de Almagro 220 </option>
<option value ="Dos Amigos 110"> Dos Amigos 110 </option>
<option value ="Illapel 110"> Illapel 110 </option>
<option value ="Incahuasi 110"> Incahuasi 110 </option>
<option value ="Los Vilos 220"> Los Vilos 220 </option>
<option value ="Maitencillo 110"> Maitencillo 110 </option>
<option value ="Maitencillo 220"> Maitencillo 220 </option>
<option value ="Marbella 110"> Marbella 110 </option>
<option value ="Minera del Carmen 220"> Minera del Carmen 220 </option>
<option value ="Ovalle 110"> Ovalle 110 </option>
<option value ="Pajonales 110"> Pajonales 110 </option>
<option value ="Pan de Azucar 110"> Pan de Azucar 110 </option>
<option value ="Pan de Azucar 220"> Pan de Azucar 220 </option>
<option value ="Punta Colorada 220"> Punta Colorada 220 </option>
<option value ="Punta Toro 110"> Punta Toro 110 </option>
<option value ="Quinquimo A 110"> Quinquimo A 110 </option>
<option value ="Romeral 110"> Romeral 110 </option>
</datalist>
</tr></tr>

<input type="submit" name="btn1" value="Enviar"></tr>
</table>
<%   
double [] Horas= {7.44,6.72,7.44,7.2,7.44,7.2,7.44,7.44,7.2,7.44,7.2,7.44};
double resultado[][] = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
double[][] Bloques = {{2.4, 5.9, 4.8, 11.8, 2.4, 5.9, 2.4, 5.9, 8.5, 20.7, 2.4, 5.9, 2.4, 5.9, 3.6, 8.9},
		{2.4, 6.0, 4.8, 11.9, 2.4, 6.0, 2.4, 6.0, 8.3, 20.8, 2.4, 6.0, 2.4, 6.0, 3.6, 8.9},
		{4.4,8.1,7.4,13.4,1.5,2.7,3.0,5.4,8.9,16.1,4.4,8.1,1.5,2.7,4.4,8.1},
		{4.4,12.2,4.4,12.2,2.2,6.1,4.4,12.2,4.4,12.2,2.2,6.1,2.2,6.1,2.2,6.1},
		{4.0,8.5,8.1,16.9,2.7,5.6,4.0,8.5,5.4,11.3,2.7,5.6,2.7,5.6,2.7,5.6},
		{4.2,8.3,8.3,16.7,2.8,5.6,5.6,11.1,4.2,8.3,1.4,2.8,1.4,2.8,5.6,11.1},
		{2.4,5.9,7.3,17.7,2.4,5.9,4.8,11.8,3.6,8.9,2.4,5.9,1.2,3.0,4.8,11.8},
		{4.0,8.5,8.1,16.9,2.7,5.6,5.4,11.3,4.0,8.5,2.7,5.6,1.3,2.8,4.0,8.5},
		{5.0,7.5,8.3,12.5,5.0,7.5,5.0,7.5,6.7,10.0,3.3,5.0,3.3,5.0,3.3,5.0},
		{3.6,8.9,6.0,14.8,3.6,8.9,3.6,8.9,4.8,11.8,2.4,5.9,2.4,5.9,2.4,5.9},
		{2.8,5.6,6.9,13.9,2.8,5.6,4.2,8.3,6.9,13.9,4.2,8.3,2.8,5.6,2.8,5.6},
		{4.4,8.1,5.9,10.8,3.0,5.4,4.4,8.1,7.4,13.4,4.4,8.1,3.0,5.4,3.0,5.4}};%>
		<div><% for (int x=0; x < Horas.length; x++) {
	        for (int y=0; y < 16; y++) {
	         System.out.print( resultado[x][y]=Bloques[x][y]/100);
	         System.out.print(" ");
	        }System.out.println();}%></div>
</form>

<div class="container"> <!-- Contenedor grafico Ind -->
  <br />
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
<!--       Chart.js Canvas Tag -->
      <canvas id="EnergiaTotal"  width="100%" height="20"></canvas>
    </div>
    <div class="col-md-1"></div>
  </div>
</div>

</body>
</html>