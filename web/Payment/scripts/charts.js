var EXPENSES_PALLETE = "tol-rainbow"
function colorize(dataset) {
  var colors = palette(EXPENSES_PALLETE, dataset.length).map(function (hex) {
    var r = parseInt(hex.slice(0, 2), 16),
            g = parseInt(hex.slice(2, 4), 16),
            b = parseInt(hex.slice(4, 6), 16);
    return [r, g, b].join(", ");
  });
  console.log(colors);

  var len = dataset.length;
  for (var i = 0; i < len; i++) {
    var data = dataset[i]["data"].length;
    dataset[i]["borderColor"] = "rgba(" + colors[i] + ", 1)";
    dataset[i]["backgroundColor"] = "rgba(" + colors[i] + ", 0.5)";
    dataset[i]["fillOpacity"] = 0.4;
  }
  console.log(dataset);
  return dataset;
}

function initExpensesAllGraph(id, datasetArray) {
  new Chart(document.getElementById(id).getContext('2d'), {
    type: 'line',
    data: {
      datasets: colorize(datasetArray),
    },
    options: {
      responsive: true,
      scales: {
        barValueSpacing: 2,
        xAxes: [{
            type: "time",
            time: {
              unit: 'day',
              format: "DD/MM/YYYY",
              tooltipFormat: 'll',
            },
          }],
      },
      elements: {
        line: {
          tension: 0,
        },
      },
    },
  });
}

function initExpensesPie(id, data, labels) {
  new Chart(document.getElementById(id).getContext("2d"), {
    type: 'doughnut',
    data: {
      labels: labels,
      datasets: [{
          label: "Most popular events",
          data: data,
          backgroundColor: palette(EXPENSES_PALLETE, data.length).map(function (hex) {
            return '#' + hex;
          }),
        }],
    },
    options: {
      title: {
        display: true,
        text: 'Total Spending per Department',
      },
      legend: {
        display: true,
        position: 'bottom',
        labels: {
          boxWidth: 20
        },
      },
    }
  })
}