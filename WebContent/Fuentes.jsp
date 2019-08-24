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
  <li><a href="IndexLineas.html">Lineas</a></li>
</ul>


<!-- i Promedio -->


<script>
function loadDocPromedio() {
	  //window.alert("hola");
  var xhttp = new XMLHttpRequest();
  //response.setContentType("application/x-json;charset=UTF-8"); //   para probar
  xhttp.onreadystatechange = function(){

    if (this.readyState == 4  && this.status == 200) {
    	//var myObj = JSON.parse(this.responseText);
    	//var jsonObj = JSON.parse(request.responseText);
    	var obj = JSON.parse(this.responseText);
 //   	document.getElementById('aqui').innerHTML ="len List:"+Object.keys( obj.List ).length +" len a:"+Object.keys( obj.A ).length+" len B:"+Object.keys( obj.B ).length;// Borrar

    	

    	
    	var canvasPromedio = document.getElementById("EnergiaTotalPromedio");
    	var ctxPromedio = canvasPromedio.getContext('2d');
    	if (window.graficaPromedio) {
    		window.graficaPromedio.clear();
    		window.graficaPromedio.destroy();
    	}
    	// Global Options:
    	Chart.defaults.global.defaultFontColor = 'black';
    	Chart.defaults.global.defaultFontSize = 16;

    	var dataP = {
    	  labels: obj.List,
    	  datasets: [{
    	      label: document.getElementById("selectBarP").value,
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
    	      label: document.getElementById("selectBar2P").value,
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
    	var optionsP = {
    	  scales: {
    	            yAxes: [{
    	                ticks: {
    	                    beginAtZero:true
    	                },
    	                scaleLabel: {
    	                     display: true,
    	                     labelString: document.getElementById("selectVarP").value,
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
    	window.graficaPromedio = new Chart(ctxPromedio, {
    	  type: 'line',
    	  data: dataP,
    	  options: optionsP
    	});
    	

    	
    }
  };
  
  xhttp.open('POST', 'http://localhost:8080/Intento2/CenPromedio.jsp', true);//"http://localhost:8080/Intento2/WebContent/Datos2.jsp"
  //xhttp.setRequestHeader("Content-type","application/json; charset=utf-8");
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("selectVarP="+document.getElementById("selectVarP").value+"&selectBarP="+document.getElementById("selectBarP").value+"&selectBar2P="+document.getElementById("selectBar2P").value); 

}
</script>

<div id="aqui"></div>







<h1>Potencia Promedio por barras</h1>

<form id="form1" method="POST" onsubmit="loadDocPromedio(); return false;">
<table><tr>
  <!-- Lista de opciones -->
<select id="selectVarP" name="selectVarP">
<!--Variable: <select name = "selectVar"> -->
<option value ="CenPotOpeMed MW" selected> CenPotOpeMed [MW] </option>
<option value ="CenPotOpeMax MW"> CenPotOpeMax [GWh] </option>
<option value ="CenPotOpeMin MW"> CenPotOpeMin [GWh] </option>
 </select>
<!-- </select><br>  -->
</tr><tr>
Barra:</tr><tr> <input type="text" id="selectBarP" list="itemsP" name="selectBarP" value="Guacolda 01">
<datalist id="itemsP">

<option value ="Guacolda 01" selected> Guacolda 01 </option>
<option value ="Campiche"> Campiche </option>
<option value ="Las Pampas"> Las Pampas </option>
<option value ="Coelemu"> Coelemu </option>
<option value ="Chiburgo"> Chiburgo </option>



</datalist>
</tr>
<tr>
Barra: <input type="text" id="selectBar2P" list="itemsP" name="selectBar2P" value="Chiburgo">
<datalist id="itemsP">
<option value ="Guacolda 01"> Guacolda 01 </option>
<option value ="Campiche"> Campiche </option>
<option value ="Las Pampas"> Las Pampas </option>
<option value ="Coelemu"> Coelemu </option>
<option value ="Chiburgo"> Chiburgo </option>




</datalist>
</tr></tr>

<input type="submit" name="btn1P" value="Enviar"></tr>
</table>

</form>

<div class="container"> <!-- Contenedor grafico Ind -->
  <br />
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
<!--       Chart.js Canvas Tag -->
      <canvas id="EnergiaTotalPromedio"  width="100%" height="20" style="background:white;border-radius: 25px;"></canvas>
    </div>
    <div class="col-md-1"></div>
  </div>
</div>


<!--  f Promedio -->

<!-- i Total -->


<script>
function loadDocTotal() {
	  //window.alert("hola");
  var xhttp = new XMLHttpRequest();
  //response.setContentType("application/x-json;charset=UTF-8"); //   para probar
  xhttp.onreadystatechange = function(){

    if (this.readyState == 4  && this.status == 200) {
    	//var myObj = JSON.parse(this.responseText);
    	//var jsonObj = JSON.parse(request.responseText);
    	var obj = JSON.parse(this.responseText);
 //   	document.getElementById('aqui').innerHTML ="len List:"+Object.keys( obj.List ).length +" len a:"+Object.keys( obj.A ).length+" len B:"+Object.keys( obj.B ).length;// Borrar

    	

    	
    	var canvasTotal = document.getElementById("EnergiaTotal");
    	var ctxTotal = canvasTotal.getContext('2d');
    	if (window.graficaTotal) {
    		window.graficaTotal.clear();
    		window.graficaTotal.destroy();
    	}
    	// Global Options:
    	Chart.defaults.global.defaultFontColor = 'black';
    	Chart.defaults.global.defaultFontSize = 16;

    	var dataT = {
    	  labels: obj.List,
    	  datasets: [{
    	      label: document.getElementById("selectBarT").value,
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
    	      label: document.getElementById("selectBar2T").value,
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
    	var optionsT = {
    	  scales: {
    	            yAxes: [{
    	                ticks: {
    	                    beginAtZero:true
    	                },
    	                scaleLabel: {
    	                     display: true,
    	                     labelString: document.getElementById("selectVarT").value,
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
    	window.graficaTotal = new Chart(ctxTotal, {
    	  type: 'line',
    	  data: dataT,
    	  options: optionsT
    	});
    	

    	
    }
  };
  
  xhttp.open('POST', 'http://localhost:8080/Intento2/CenTotal.jsp', true);//"http://localhost:8080/Intento2/WebContent/Datos2.jsp"
  //xhttp.setRequestHeader("Content-type","application/json; charset=utf-8");
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("selectVarT="+document.getElementById("selectVarT").value+"&selectBarT="+document.getElementById("selectBarT").value+"&selectBar2T="+document.getElementById("selectBar2T").value); 

}
</script>

<div id="aqui"></div>







<h1>Potencia Total por barras</h1>

<form id="form1T" method="POST" onsubmit="loadDocTotal(); return false;">
<table><tr>
  <!-- Lista de opciones -->
<select id="selectVarT" name="selectVarT">
<!--Variable: <select name = "selectVar"> -->
<option value ="CenPotOpeMed MW" selected> CenPotOpeMed [MW] </option>
<option value ="CenPotOpeMax MW"> CenPotOpeMax [GWh] </option>
<option value ="CenPotOpeMin MW"> CenPotOpeMin [GWh] </option>
 </select>
<!-- </select><br>  -->
</tr><tr>
Barra:</tr><tr> <input type="text" id="selectBarT" list="itemsT" name="selectBarT" value="Guacolda 01">
<datalist id="itemsT">

<option value ="Guacolda 01"> Guacolda 01 </option>
<option value ="Campiche"> Campiche </option>
<option value ="Las Pampas"> Las Pampas </option>
<option value ="Coelemu"> Coelemu </option>
<option value ="Chiburgo"> Chiburgo </option>


</datalist>
</tr>
<tr>
Barra: <input type="text" id="selectBar2T" list="itemsT" name="selectBar2T" value="Chiburgo">
<datalist id="itemsT">
<option value ="Guacolda 01"> Guacolda 01 </option>
<option value ="Campiche"> Campiche </option>
<option value ="Las Pampas"> Las Pampas </option>
<option value ="Coelemu"> Coelemu </option>
<option value ="Chiburgo"> Chiburgo </option>



</datalist>
</tr></tr>

<input type="submit" name="btn1T" value="Enviar"></tr>
</table>

</form>

<div class="container"> <!-- Contenedor grafico Ind -->
  <br />
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
<!--       Chart.js Canvas Tag -->
      <canvas id="EnergiaTotal"  width="100%" height="20" style="background:white;border-radius: 25px;"></canvas>
    </div>
    <div class="col-md-1"></div>
  </div>
</div>




<!-- f Total -->

<!-- Horas  -->
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
    	//document.getElementById('aqui').innerHTML ="len List:"+Object.keys( obj.List ).length +" len a:"+Object.keys( obj.A ).length+" len B:"+Object.keys( obj.B ).length;// Borrar

    	

    	
    	var canvas = document.getElementById("EnergiaHoras");
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
    	      label: "Hábil", //document.getElementById("selectBar").value,
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
    	      label: "No-Hábil",//document.getElementById("selectBar2").value,
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
  
  xhttp.open('POST', 'http://localhost:8080/Intento2/CenHoras.jsp', true);//"http://localhost:8080/Intento2/WebContent/Datos2.jsp"
  //xhttp.setRequestHeader("Content-type","application/json; charset=utf-8");
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("selectVar="+document.getElementById("selectVar").value+"&selectBar="+document.getElementById("selectBar").value+"&selectBar2="+document.getElementById("selectBar2").value+"&MesIni="+document.getElementById("MesIni").value+"&MesFin="+document.getElementById("MesFin").value); 

}
</script>

<!--<div id="aqui"></div>-->







<h1>Potencia por horas</h1>

<form id="form1" method="POST" onsubmit="loadDoc(); return false;">
<table><tr>
  <!-- Lista de opciones -->
<select id="selectVar" name="selectVar">
<!--Variable: <select name = "selectVar"> -->
<option value ="CenPotOpeMed MW" selected> CenPotOpeMed [MW] </option>
<option value ="CenPotOpeMax MW"> CenPotOpeMax [GWh] </option>
<option value ="CenPotOpeMin MW"> CenPotOpeMin [GWh] </option>
 </select>
<!-- </select><br>  -->
</tr><tr>
Barra:</tr><tr> <input type="text" id="selectBar" list="items" name="selectBar" value="Guacolda 01">
<datalist id="items">

<option value ="Guacolda 01"> Guacolda 01 </option>
<option value ="Campiche"> Campiche </option>
<option value ="Las Pampas"> Las Pampas </option>
<option value ="Coelemu"> Coelemu </option>
<option value ="Chiburgo"> Chiburgo </option>



</datalist>
</tr>
<tr>
Barra: <input type="text" id="selectBar2" list="items" name="selectBar2" value="">
<datalist id="items">

<option value ="Guacolda 01"> Guacolda 01 </option>
<option value ="Campiche"> Campiche </option>
<option value ="Las Pampas"> Las Pampas </option>
<option value ="Coelemu"> Coelemu </option>
<option value ="Chiburgo"> Chiburgo </option>






</datalist>
</tr></tr>
<tr><select id="MesIni" name="MesIni">
<!--Variable: <select name = "selectVar"> -->
<option value ="07"> Julio </option>
<option value ="08"> Agosto </option>
<option value ="09"> Septiembre </option>
<option value ="10" > Octubre </option>
<option value ="11"> Noviembre </option>
<option value ="12"> Diciembre </option>
<option value ="01"> Enero </option>
<option value ="02"> Febrero </option>
<option value ="03"> Marzo </option>
<option value ="04"> Abril </option>
<option value ="05"> Mayo </option>
<option value ="06"> Junio </option>
 </select></tr>
 <tr><select id="MesFin" name="MesFin">
<!--Variable: <select name = "selectVar"> -->
<option value ="07"> Julio </option>
<option value ="08"> Agosto </option>
<option value ="09"> Septiembre </option>
<option value ="10"> Octubre </option>
<option value ="11"> Noviembre </option>
<option value ="12"> Diciembre </option>
<option value ="01"> Enero </option>
<option value ="02"> Febrero </option>
<option value ="03"> Marzo </option>
<option value ="04"> Abril </option>
<option value ="05"> Mayo </option>
<option value ="06"> Junio </option>
 </select></tr>

<input type="submit" name="btn1" value="Enviar"></tr>
</table>
<% /*  
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
		{4.4,8.1,5.9,10.8,3.0,5.4,4.4,8.1,7.4,13.4,4.4,8.1,3.0,5.4,3.0,5.4}};*/%>
		<div><%/* for (int x=0; x < Horas.length; x++) {
	        for (int y=0; y < 16; y++) {
	         System.out.print( resultado[x][y]=Bloques[x][y]/100);
	         System.out.print(" ");
	        }System.out.println();}*/%></div>
</form>

<div class="container"> <!-- Contenedor grafico Ind -->
  <br />
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
<!--       Chart.js Canvas Tag -->
      <canvas id="EnergiaHoras"  width="100%" height="20" style="background:white;border-radius: 25px"></canvas>
    </div>
    <div class="col-md-1"></div>
  </div>
</div>

<!-- f Horas ------------------------------------------------>


<div class="footer">
  <p>&#169; 2019 Christian Espinoza &#9921;</p>
</div>
</body>
</html>