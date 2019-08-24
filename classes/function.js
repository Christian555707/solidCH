function grafico(ID, selectBar, selectVar) {
	var canvas = document.getElementById(ID);
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
}