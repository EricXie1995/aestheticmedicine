function loadPieChart() {
	$.ajax({
		url: '/beauty/chart/queCountByTypes',
		dataType: 'json',
		}).done(function (results) {
			var labels = [], colors = [], data = [];
			jQuery.each(results, function(key, val) {
				labels.push(key);
				data.push(val);
				var color = randomColor({luminosity: 'light'});
				colors.push(color);
			});
			
			var config = {
				type: 'pie',
				data: {
				    datasets:
					    	[{
					        data: data,
					        backgroundColor: colors,
					        label: 'Dataset 1'
				        	}],
				    labels: labels
				    },
				    
				    options: {
				        responsive: true
				    }
			};
			
			var pieChartContext = document.getElementById("pieChart").getContext("2d");
			var myPieChart = new Chart(pieChartContext, config);
		}
	);
}



loadPieChart();
