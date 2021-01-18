$(document).ready(function () {
    Chart.defaults.global.defaultFontColor = '#d4d4d4';
    var tempPlot = new Chart($("#temperature-plot"), {
        type: 'line',
        data: chartdata= {
            labels: 0,
            datasets: [
                {
                    label: 'Temperature',
                    backgroundColor: '#7B7979',
                    borderColor: '#46d5f1',
                    //hoverBackgroundColor: '#CCCCCC',
                    //hoverBorderColor: '#666666',
                    data: 0,
                    fill: false
    
                }
            ]
        },
        options: options = {
            responsive: false,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: "Temperature plot"
    
            },
    
            legend: {
                display: false
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        //labelString: "Datetime"
                    },
                    ticks: {
                        fontSize: 10
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: "Temperature, \xB0C",
                    },
                    ticks: {
                        //beginAtZero: true
                        min: 18,
                        max: 26,
                        stepSize: 1
                    }
                }]
            }
        }
    });


    var gasPlot = new Chart($("#gas-plot"), {
        type: 'line',
        data: chartdata= {
            labels: 0,
            datasets: [
                {
                    label: 'Gas',
                    backgroundColor: '#7B7979',
                    borderColor: '#46d5f1',
                    //hoverBackgroundColor: '#CCCCCC',
                    //hoverBorderColor: '#666666',
                    data: 0,
                    fill: false
    
                }
            ]
        },
        options: options = {
            responsive: false,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: "Gas level plot"
    
            },
    
            legend: {
                display: false
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                    },
                    ticks: {
                        fontSize: 10
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: "Gas, ppm"
                    },
                    ticks: {
                        min: 0,
                        max: 20,
                        stepSize: 4
                        //beginAtZero: true
                    }
                }]
            }
        }
    });

    function addData(data) {
        if(data){
            console.log(data);
            var plotData = data;
            console.log(plotData['Temperature']);

            var dateTime = [];
            var gas = [];
            var temperature = [];

            if (plotData.length <= 30) {

                for (var i = 0; i < plotData.length; i++) {
                    dateTime.push(plotData[i].Reading_time);
                    console.log(dateTime[i]);
                    gas.push(plotData[i].Gas_Level);
                    temperature.push(plotData[i].Temperature);
                }
            }
            else {
                for (var i = plotData.length - 30; i < plotData.length; i++) {
                    //console.log(dateTime[i]);
                    dateTime.push(plotData[i].Reading_time);
                    gas.push(plotData[i].Gas_Level);
                    temperature.push(plotData[i].Temperature);
                }
            }
            console.log(dateTime);
            tempPlot.data.labels=dateTime;
            tempPlot.data.datasets[0].data=temperature;
            gasPlot.data.labels=dateTime;
            gasPlot.data.datasets[0].data=gas;

            tempPlot.update();
            gasPlot.update();
        }
      };
    function updateData() {
        //console.log("Updating");
        $.getJSON("graphdata.php", addData);
        setTimeout(updateData, 1000);
      }
      updateData();
});

