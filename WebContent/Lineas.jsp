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
<title>Lineas</title>
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
    	      label: document.getElementById("selectBarP").value+obj.ALPotMaxtA2B+"[MW]",
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
    	      label: document.getElementById("selectBar2P").value+obj.BLPotMaxtA2B+"[MW]",
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
    	                     labelString: "MW",
    	                     fontSize: 15 
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
  
  xhttp.open('POST', 'http://localhost:8080/Intento2/LinPromedio.jsp', true);//"http://localhost:8080/Intento2/WebContent/Datos2.jsp"
  //xhttp.setRequestHeader("Content-type","application/json; charset=utf-8");
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("selectVarP="+document.getElementById("selectVarP").value+"&selectBarP="+document.getElementById("selectBarP").value+"&selectBar2P="+document.getElementById("selectBar2P").value); 

}
</script>

<div id="aqui"></div>







<h1>Potencia Promedio por linea</h1>

<form id="form1" method="POST" onsubmit="loadDocPromedio(); return false;">
<table><tr>
  <!-- Lista de opciones -->
<select id="selectVarP" name="selectVarP">
<!--Variable: <select name = "selectVar"> -->
<option value ="LinPotOpeMed MW" selected> Media [MW]  </option>
<option value ="LinPotOpeMax MW"> Máxima [MW]  </option>
<option value ="LinPotOpeMin MW"> Mínima [MW]  </option>
<option value ="LinFacCrgMed P.U."> Factor Carga Media [P.U.]</option>

 </select>
<!-- </select><br>  -->
</tr><tr>
Linea:</tr><tr> <input type="text" id="selectBarP" list="itemsP" name="selectBarP" value="Los Changos 500->Cumbre 500">
<datalist id="itemsP">

<option value ="Los Changos 500->Cumbre 500" selected> Los Changos 500->Cumbre 500 </option>
<option value ="Choapa 110->Illapel 110"> Choapa 110->Illapel 110 </option>
<option value ="Dos Amigos 110->Pajonales 110"> Dos Amigos 110->Pajonales 110 </option>
<option value ="San Luis 220->Quillota 220 I"> San Luis 220->Quillota 220 I </option>
<option value ="La Ermita 220->Los Almendros 220 II"> La Ermita 220->Los Almendros 220 II </option>
<option value ="Los Maquis 220->Los Maquis 110"> Los Maquis 220->Los Maquis 110 </option>
<option value ="Chena 110->Lo Espejo 110 I"> Chena 110->Lo Espejo 110 I </option>

</datalist>
</tr>
<tr>
Linea: <input type="text" id="selectBar2P" list="itemsP" name="selectBar2P" value="Choapa 110->Illapel 110">
<datalist id="itemsP">
<option value ="Los Changos 500->Cumbre 500"> Los Changos 500->Cumbre 500 </option>
<option value ="Choapa 110->Illapel 110" selected> Choapa 110->Illapel 110 </option>
<option value ="Dos Amigos 110->Pajonales 110"> Dos Amigos 110->Pajonales 110 </option>
<option value ="San Luis 220->Quillota 220 I"> San Luis 220->Quillota 220 I </option>
<option value ="La Ermita 220->Los Almendros 220 II"> La Ermita 220->Los Almendros 220 II </option>
<option value ="Los Maquis 220->Los Maquis 110"> Los Maquis 220->Los Maquis 110 </option>
<option value ="Chena 110->Lo Espejo 110 I"> Chena 110->Lo Espejo 110 I </option>

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
    	                     labelString: "MWh",
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
  
  xhttp.open('POST', 'http://localhost:8080/Intento2/LinEnePromedio.jsp', true);//"http://localhost:8080/Intento2/WebContent/Datos2.jsp"
  //xhttp.setRequestHeader("Content-type","application/json; charset=utf-8");
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("selectVarT="+document.getElementById("selectVarT").value+"&selectBarT="+document.getElementById("selectBarT").value+"&selectBar2T="+document.getElementById("selectBar2T").value); 

}
</script>

<div id="aqui"></div>




<h1>Energía Total por linea</h1>

<form id="form1T" method="POST" onsubmit="loadDocTotal(); return false;">
<table><tr>
  <!-- Lista de opciones -->
<select id="selectVarT" name="selectVarT">
<!--Variable: <select name = "selectVar"> -->
<option value ="LinPotOpeMed MW" selected> Media [MWh]  </option>
<option value ="LinPotOpeMax MW"> Máxima [MWh]  </option>
<option value ="LinPotOpeMin MW"> Mínima [MWh]  </option>

 </select>
<!-- </select><br>  -->
</tr><tr>
Linea:</tr><tr> <input type="text" id="selectBarT" list="itemsT" name="selectBarT" value="Los Changos 500->Cumbre 500">
<datalist id="itemsT">

<option value ="Los Changos 500->Cumbre 500"selected> Los Changos 500->Cumbre 500 </option>
<option value ="Choapa 110->Illapel 110"> Choapa 110->Illapel 110 </option>
<option value ="Dos Amigos 110->Pajonales 110"> Dos Amigos 110->Pajonales 110 </option>
<option value ="San Luis 220->Quillota 220 I"> San Luis 220->Quillota 220 I </option>
<option value ="La Ermita 220->Los Almendros 220 II"> La Ermita 220->Los Almendros 220 II </option>
<option value ="Los Maquis 220->Los Maquis 110"> Los Maquis 220->Los Maquis 110 </option>
<option value ="Chena 110->Lo Espejo 110 I"> Chena 110->Lo Espejo 110 I </option>


</datalist>
</tr>
<tr>
Linea: <input type="text" id="selectBar2T" list="itemsT" name="selectBar2T" value="Choapa 110->Illapel 110">
<datalist id="itemsT">
<option value ="Los Changos 500->Cumbre 500"> Los Changos 500->Cumbre 500 </option>
<option value ="Choapa 110->Illapel 110" selected> Choapa 110->Illapel 110 </option>
<option value ="Dos Amigos 110->Pajonales 110"> Dos Amigos 110->Pajonales 110 </option>
<option value ="San Luis 220->Quillota 220 I"> San Luis 220->Quillota 220 I </option>
<option value ="La Ermita 220->Los Almendros 220 II"> La Ermita 220->Los Almendros 220 II </option>
<option value ="Los Maquis 220->Los Maquis 110"> Los Maquis 220->Los Maquis 110 </option>
<option value ="Chena 110->Lo Espejo 110 I"> Chena 110->Lo Espejo 110 I </option>


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
    	                     labelString: "MW",
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
  
  xhttp.open('POST', 'http://localhost:8080/Intento2/LinHoras.jsp', true);//"http://localhost:8080/Intento2/WebContent/Datos2.jsp"
  //xhttp.setRequestHeader("Content-type","application/json; charset=utf-8");
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("selectVar="+document.getElementById("selectVar").value+"&selectBar="+document.getElementById("selectBar").value+"&MesIni="+document.getElementById("MesIni").value+"&MesFin="+document.getElementById("MesFin").value); 

}
</script>

<!--<div id="aqui"></div>-->







<h1>Potencia por horas</h1>

<form id="form1" method="POST" onsubmit="loadDoc(); return false;">
<table><tr>
  <!-- Lista de opciones -->
<select id="selectVar" name="selectVar">
<!--Variable: <select name = "selectVar"> -->
<option value ="LinPotOpeMed MW" selected> Media [MW]  </option>
<option value ="LinPotOpeMax MW"> Máxima [MW]  </option>
<option value ="LinPotOpeMin MW"> Mínima [MW]  </option>
<option value ="LinFacCrgMed P.U."> Factor Carga Media [P.U.]</option>

 </select>
<!-- </select><br>  -->
</tr><tr>
Linea:</tr><tr> <input type="text" id="selectBar" list="items" name="selectBar" value="Los Changos 500->Cumbre 500">
<datalist id="items">

<option value ="Los Changos 500->Cumbre 500" selected> Los Changos 500->Cumbre 500 </option>
<option value ="Choapa 110->Illapel 110"> Choapa 110->Illapel 110 </option>
<option value ="Dos Amigos 110->Pajonales 110"> Dos Amigos 110->Pajonales 110 </option>
<option value ="San Luis 220->Quillota 220 I"> San Luis 220->Quillota 220 I </option>
<option value ="La Ermita 220->Los Almendros 220 II"> La Ermita 220->Los Almendros 220 II </option>
<option value ="Los Maquis 220->Los Maquis 110"> Los Maquis 220->Los Maquis 110 </option>
<option value ="Chena 110->Lo Espejo 110 I"> Chena 110->Lo Espejo 110 I </option>




</datalist>
</tr>
<tr>

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