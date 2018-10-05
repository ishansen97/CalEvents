var LINE_GRAPH_SCALES = {
  barValueSpacing: 2,
  xAxes: [{
      type: "time",
      time: {
        unit: 'day',
        format: "YYYY-MM-DD",
        tooltipFormat: 'll',
      },
    }],
};
var LINE_GRAPH_ELEMENTS = {
  line: {
    tension: 0, // disables bezier curves
  },
};
var PIE_LEGEND = {
  display: true,
  position: 'bottom',
  labels: {
    boxWidth: 20
  },
}
var EXPENSES_PALLETE = "tol-rainbow"
function colorize(dataset) {
  var colors = palette(EXPENSES_PALLETE, dataset.length).map(function (hex) {
    var r = parseInt(hex.slice(0, 2), 16),
            g = parseInt(hex.slice(2, 4), 16),
            b = parseInt(hex.slice(4, 6), 16);
    return [r, g, b].join(", ");
  });
  var len = dataset.length;
  for (var i = 0; i < len; i++) {
    var data = dataset[i]["data"].length;
    dataset[i]["borderColor"] = "rgba(" + colors[i] + ", 1)";
    dataset[i]["backgroundColor"] = "rgba(" + colors[i] + ", 0.5)";
    dataset[i]["fillOpacity"] = 0.4;
  }
  return dataset;
}


function initPaymentsGraph(id, data) {
  new Chart(document.getElementById(id).getContext("2d"), {
    type: 'line',
    data: {
      datasets: [{
          data: data,
          borderColor: "rgb(120, 200, 40)",
          backgroundColor: "rgba(120, 200, 40, 0.2)",
        },
      ],
    },
    options: {
      title: {
        display: true,
        text: 'Income',
      },
      legend: {
        display: false,
      },
      scales: LINE_GRAPH_SCALES,
      elements: LINE_GRAPH_ELEMENTS,
      responsive: true,
    },
  });
}

function initEventsPie(id, labels, data) {
  new Chart(document.getElementById(id).getContext("2d"), {
    type: 'doughnut',
    data: {
      labels: labels,
      datasets: [{
          label: "Most popular events",
          data: data,
          backgroundColor: palette('cb-Pastel2', data.length).map(function (hex) {
            return '#' + hex;
          }),
        }],
    },
    options: {
      title: {
        display: true,
        text: 'Most popular events',
      },
      legend: PIE_LEGEND,
    },
  });
}

function initExpensesAllGraph(id, datasetArray) {
  new Chart(document.getElementById(id).getContext('2d'), {
    type: 'line',
    data: {
      datasets: colorize(datasetArray),
    },
    options: {
      title: {
        display: true,
        text: 'Expenses',
      },
      legend: {
        display: false,
      },
      scales: LINE_GRAPH_SCALES,
      elements: LINE_GRAPH_ELEMENTS,
      responsive: true,
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
      legend: PIE_LEGEND,
    }
  })
}