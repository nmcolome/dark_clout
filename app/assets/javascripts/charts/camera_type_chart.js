$.ajax({
     url : ("/api/v1/file/camera_type"),
     type : 'GET',
     success : function(data) {
        var json_data = data;
        var keys = Object.keys(json_data);
        var values = Object.values(json_data);
          var ctx = document.getElementById('camera_type_chart').getContext('2d');
          var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
              labels: keys,
              datasets: [{
                backgroundColor: [
                  "#2ecc71",
                  "#3498db",
                  "#95a5a6",
                  "#9b59b6",
                  "#f1c40f",
                  "#e74c3c",
                  "#34495e"
                ],
                data: values
              }]
            },
            options: {
              title: {
                display: true,
                text: 'Camera Type'
                }
              }
          });

    }
});
