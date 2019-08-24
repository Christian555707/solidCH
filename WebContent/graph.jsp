<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
    
<%@page import="org.apache.commons.csv.CSVRecord"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.Iterable"%>
<%@page import="org.apache.commons.csv.*"%>
<%@page import="java.util.Arrays"%>
     
    <%
    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
    List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
    
    ArrayList<String> Label = new ArrayList<String>();
    ArrayList<Double> A = new ArrayList<Double>();
    ArrayList<Double> B = new ArrayList<Double>();

    Reader in = new FileReader("/home/casa/Mem/Bar/CMg/Egne.csv");
    Iterable<CSVRecord> records = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
    for (CSVRecord record : records) {
    	
    	String inum = record.get("INum");
    	String mes = record.get("MesNom");
    	String año= record.get("A�oCld");
        String etanom = record.get(request.getParameter("selectVar"));
        String barnom = record.get("BarNom");
        //String etanom2;
        //String etanom2 = record.get("BarCMgSig [US$/MWh]");
        
        
        if (barnom.equals(request.getParameter("selectBar"))){
        	Label.add('"'+mes+año+'"'); A.add(Double.valueOf(etanom));
         	map = new HashMap<Object,Object>(); map.put("label", mes+año); map.put("y", Double.valueOf(etanom)); list.add(map);
        	//map = new HashMap<Object,Object>(); map.put("label", mes+año); map.put("y", Double.valueOf(etanom2)); list2.add(map);
        	
        }
        if (barnom.equals(request.getParameter("selectBar2"))){
        	B.add(Double.valueOf(etanom));
        map = new HashMap<Object,Object>(); map.put("label", mes+año); map.put("y", Double.valueOf(etanom)); list2.add(map);
        }
        
    }
     
    String dataPoints = gsonObj.toJson(list);
    String dataPoints2 = gsonObj.toJson(list2);
    
/*list = new ArrayList<Map<Object,Object>>();
for (CSVRecord record : records) {
    	
    	String inum = record.get("INum");
    	String mes = record.get("MesNom");
    	String año= record.get("AñoCld");
        String etanom = record.get("BarCMgSig [US$/MWh]");
        String barnom = record.get("BarNom");
        
        if (barnom.equals(request.getParameter("selectBar"))){
        	map = new HashMap<Object,Object>(); map.put("label", mes+año); map.put("y", Double.valueOf(etanom)); list.add(map);
        }
    }

String dataPoints2 = gsonObj.toJson(list);*/
%>
     
    <!DOCTYPE HTML>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titulo</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js	"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>-->
    
    <!--  <script src="/opt/tomcat/webapps/Intento2/WebContent/WEB-INF/lib/utils.js"></script>
    <script src="/opt/tomcat/webapps/Intento2/WebContent/WEB-INF/lib/moment.js"></script>
    -->
    <script type="text/javascript">
    window.onload = function() { 
     
    var chart = new CanvasJS.Chart("chartContainer", {
    	animationEnabled: true,
    	colorSet: "colorSet2",
    	theme: "light2",
    	title: {
    		text: "<%=request.getParameter("selectVar")%> en <%=request.getParameter("selectBar")%>"
    	},
    	axisX: {
    		title: ""
    	},
    	axisY: {
    		title: "Costo [US$/MWh]"
    	},
    	legend: {
    		cursor: "pointer",
    		//itemclick: toggleDataSeries,
    		verticalAlign: "top"
    	},
    	toolTip: {
    		shared: true
    	},
    	
    	data: [{
    		type: "line",
    		showInLegend: true,
    		name: "<%=request.getParameter("selectBar")%>",
    		//yValueFormatString: "###,####0",
    		dataPoints : <%out.print(dataPoints);%>
    	},
    	{
    		type: "line",
    		showInLegend: true,
    		name: "<%=request.getParameter("selectBar2")%>",
    		//yValueFormatString: "###,####0",
    		dataPoints: <%out.print(dataPoints2);%>
    	}]
    });
    chart.render();
     
    }
   </script>
    <!-- 	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
	-->
    </head>
    <body>
    
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    
    <!--  <div style="width:75%;">
	<canvas id="canvas"></canvas>
	</div>

	<script>
		var lineChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				label: 'My First dataset',
				borderColor: window.chartColors.red,
				backgroundColor: window.chartColors.red,
				fill: false,
				data: [
					4,
					7,
					8,
					1,
					10,
					2,
					14
				],
				yAxisID: 'y-axis-1',
			}, {
				label: 'My Second dataset',
				borderColor: window.chartColors.blue,
				backgroundColor: window.chartColors.blue,
				fill: false,
				data: [
					5,
					3,
					1,
					8,
					2,
					8,
					2
				],
				yAxisID: 'y-axis-2'
			}]
		};
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myLine = Chart.Line(ctx, {
				data: lineChartData,
				options: {
					responsive: true,
					hoverMode: 'index',
					stacked: false,
					title: {
						display: true,
						text: 'Chart.js Line Chart - Multi Axis'
					},
					scales: {
						yAxes: [{
							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
							display: true,
							position: 'left',
							id: 'y-axis-1',
						}, {
							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
							display: true,
							position: 'right',
							id: 'y-axis-2',
							// grid line settings
							gridLines: {
								drawOnChartArea: false, // only want the grid lines for one axis to show up
							},
						}],
					}
				}
			});
		};
	<!--	document.getElementById('randomizeData').addEventListener('click', function() {
			lineChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});
			window.myLine.update();
		});
	
	</script>
    -->
      
   
    <canvas id="myChart" width="100%" height="20"></canvas>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            datasets:[{ data: [12, 19, 3, 5, 2, 3]} ,{ data: [2, 8, 7, 1, 3, 6]}],
            fill: false,
            borderColor: "blue",
           /* borderWidth: 1 */
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }, elements: {
            line: {
                tension: 0 // disables bezier curves
            }
        }
    }
});
</script>

<div class="container">
  <br />
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
<!--       Chart.js Canvas Tag -->
      <canvas id="barChart"></canvas>
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
    

    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>
    </html>                              