document.addEventListener("DOMContentLoaded", function() {
    var chartEl = document.getElementById('chart-visitors-profile');
    var maleVisitors = parseInt(chartEl.dataset.male) || 0;
    var femaleVisitors = parseInt(chartEl.dataset.female) || 0;

    let optionsVisitorsProfile = {
        series: [maleVisitors, femaleVisitors],
        labels: ['Male', 'Female'],
        colors: ['#435ebe','#55c6e8'],
        chart: { type: 'donut', width: '100%', height:'350px' },
        legend: { position: 'bottom' },
        plotOptions: {
            pie: {
                donut: { size: '30%' }
            }
        },
        dataLabels: {
            enabled: true,
            formatter: function (val, opts) {
                return opts.w.globals.labels[opts.seriesIndex] + ": " + val.toFixed(2) +"%";
            }
        }
    };

    var chartVisitorsProfile = new ApexCharts(chartEl, optionsVisitorsProfile);
    chartVisitorsProfile.render();














	// Controller
    var el = document.getElementById('chart-profile-visit');
    var monthlySales = JSON.parse(el.dataset.sales);

    var optionsProfileVisit = {
        chart: { type: 'bar', height: 300 },
        series: [{ name: 'Sales', data: monthlySales }],
        xaxis: { categories: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"] },
        colors: '#435ebe',
        tooltip: {
            y: {
                formatter: function(val) { return '৳ ' + val.toLocaleString(); }
            }
        }
    };

    var chartProfileVisit = new ApexCharts(document.querySelector("#chart-profile-visit"), optionsProfileVisit);
    chartProfileVisit.render();








var optionsEurope = {
	series: [{
		name: 'series1',
		data: [310, 800, 600, 430, 540, 340, 605, 805,430, 540, 340, 605]
	}],
	chart: {
		height: 80,
		type: 'area',
		toolbar: {
			show:false,
		},
	},
	colors: ['#5350e9'],
	stroke: {
		width: 2,
	},
	grid: {
		show:false,
	},
	dataLabels: {
		enabled: false
	},
	xaxis: {
		type: 'datetime',
		categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z","2018-09-19T07:30:00.000Z","2018-09-19T08:30:00.000Z","2018-09-19T09:30:00.000Z","2018-09-19T10:30:00.000Z","2018-09-19T11:30:00.000Z"],
		axisBorder: {
			show:false
		},
		axisTicks: {
			show:false
		},
		labels: {
			show:false,
		}
	},
	show:false,
	yaxis: {
		labels: {
			show:false,
		},
	},
	tooltip: {
		x: {
			format: 'dd/MM/yy HH:mm'
		},
	},
};

let optionsAmerica = {
	...optionsEurope,
	colors: ['#008b75'],
}
let optionsIndonesia = {
	...optionsEurope,
	colors: ['#dc3545'],
}

var chartEurope = new ApexCharts(document.querySelector("#chart-europe"), optionsEurope);
var chartAmerica = new ApexCharts(document.querySelector("#chart-america"), optionsAmerica);
var chartIndonesia = new ApexCharts(document.querySelector("#chart-indonesia"), optionsIndonesia);

chartIndonesia.render();
chartAmerica.render();
chartEurope.render();
});