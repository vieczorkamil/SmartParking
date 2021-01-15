$(document).ready(function () {
    showTemperatureGraph();
    showGasGraph();
});

Chart.defaults.global.defaultFontColor = '#d4d4d4';

function showGasGraph() {
    {
        $.post("graphdata.php",
            function (data) {
                console.log(data);

                dataGas = JSON.parse(data);
                var dateTime = [];
                var gas = [];

                for (var i = 0; i < dataGas.length; i++) {
                    dateTime.push(dataGas[i].Reading_time);
                    gas.push(dataGas[i].Gas_Level);
                }

                console.log(dateTime);
                console.log(gas);

                var options = {
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
                                max: 200,
                                stepSize: 40
                                //beginAtZero: true
                            }
                        }]
                    }
                };

                var chartdata = {
                    labels: dateTime,
                    datasets: [
                        {
                            label: 'Gas',
                            backgroundColor: '#7B7979',
                            borderColor: '#46d5f1',
                            //hoverBackgroundColor: '#CCCCCC',
                            //hoverBorderColor: '#666666',
                            data: gas,
                            fill: false

                        }
                    ]
                };

                var target = $("#gas-plot");

                var linePlot = new Chart(target, {
                    type: 'line',
                    data: chartdata,
                    options: options
                });
            });
    }
}
function showTemperatureGraph() {
    {
        $.post("graphdata.php",
            function (data) {
                console.log(data);

                data = JSON.parse(data);
                var dateTime = [];
                var temperature = [];

                for (var i = 0; i < data.length; i++) {
                    dateTime.push(data[i].Reading_time);
                    temperature.push(data[i].Temperature);
                }

                console.log(dateTime);
                console.log(temperature);

                var options = {
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
                                beginAtZero: true
                            }
                        }]
                    }
                };

                var chartdata = {
                    labels: dateTime,
                    datasets: [
                        {
                            label: 'Temperature',
                            backgroundColor: '#7B7979',
                            borderColor: '#46d5f1',
                            //hoverBackgroundColor: '#CCCCCC',
                            //hoverBorderColor: '#666666',
                            data: temperature,
                            fill: false

                        }
                    ]
                };

                var target = $("#temperature-plot");

                var linePlot = new Chart(target, {
                    type: 'line',
                    data: chartdata,
                    options: options
                });
            });
    }
}