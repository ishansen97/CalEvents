<div class="col-md-4 mt-5 mb-5">
                            <p class="text-center pb-3">Yearly Employment Attendance Count </p>
                            <canvas id="myChart" width="200" height="100"></canvas>
                        </div>


<script>
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Event", "Facility", "Gallery", "HR", "Kitchen", "Menu", "Payment"],
            datasets: [{
                    <% 
                        ArrayList<Integer> currentYearlist = new ArrayList<Integer>();
                        rs = Analysis.getYearlyAttendanceCount("YEAR(CURDATE())");
                            while(rs.next()){
                                currentYearlist.add(rs.getInt("Attendance_Count"));
                            }
                        out.print("data : "+currentYearlist); 
                    %>,
                    backgroundColor: [
                        'rgb(102, 0, 204, 0.4)',
                        'rgb(204, 0, 204, 0.4)',
                        'rgb(255, 0, 0, 0.4)',
                        'rgb(255, 204, 0, 0.4)',
                        'rgba(51, 153, 255, 0.4)',
                        'rgba(255, 102, 0, 0.4)',
                        'rgba(0, 204, 0, 0.4)'
                    ],
                    borderColor: [
                        'rgba(102, 0, 204, 255, 0.6)',
                        'rgba(204, 0, 204, 0.6)',
                        'rgba(255, 0, 0, 0.6)',
                        'rgba(255, 204, 0, 0.6)',
                        'rgba(51, 153, 255, 0.6)',
                        'rgba(255, 102, 0, 0.6)',
                        'rgba(0, 204, 0, 0.6)'
                    ],
                    hoverBackgroundColor: [
                        'rgb(102, 0, 204, 0.8)',
                        'rgb(204, 0, 204, 0.8)',
                        'rgb(255, 0, 0, 0.8)',
                        'rgb(255, 204, 0, 0.8)',
                        'rgba(51, 153, 255, 0.8)',
                        'rgba(255, 102, 0, 0.8)',
                        'rgba(0, 204, 0, 0.8)'
                    ],
                    hoverBorderColor: [
                        'rgba(102, 0, 204, 255, 1)',
                        'rgba(204, 0, 204, 1)',
                        'rgba(255, 0, 0, 1)',
                        'rgba(255, 204, 0, 1)',
                        'rgba(51, 153, 255, 1)',
                        'rgba(255, 102, 0, 1)',
                        'rgba(0, 204, 0, 1)'
                    ],
                    hoverBorderWidth: 3,
                    borderWidth: 2
                },
                {
                    <% 
                        ArrayList<Integer> pastYearList = new ArrayList<Integer>();
                        rs = Analysis.getYearlyAttendanceCount("YEAR(CURDATE())-1");
                            while(rs.next()){
                                pastYearList.add(rs.getInt("Attendance_Count"));
                            }
                        out.print("data : "+pastYearList); 
                    %>,
                    backgroundColor: [
                        'rgb(102, 0, 204, 0.4)',
                        'rgb(204, 0, 204, 0.4)',
                        'rgb(255, 0, 0, 0.4)',
                        'rgb(255, 204, 0, 0.4)',
                        'rgba(51, 153, 255, 0.4)',
                        'rgba(255, 102, 0, 0.4)',
                        'rgba(0, 204, 0, 0.4)'
                    ],
                    borderColor: [
                        'rgba(102, 0, 204, 0.6)',
                        'rgba(204, 0, 204, 0.6)',
                        'rgba(255, 0, 0, 0.6)',
                        'rgba(255, 204, 0, 0.6)',
                        'rgba(51, 153, 255, 0.6)',
                        'rgba(255, 102, 0, 0.6)',
                        'rgba(0, 204, 0, 0.6)'
                    ],
                    hoverBackgroundColor: [
                        'rgb(102, 0, 204, 0.8)',
                        'rgb(204, 0, 204, 0.8)',
                        'rgb(255, 0, 0, 0.8)',
                        'rgb(255, 204, 0, 0.8)',
                        'rgba(51, 153, 255, 0.8)',
                        'rgba(255, 102, 0, 0.8)',
                        'rgba(0, 204, 0, 0.8)'
                    ],
                    hoverBorderColor: [
                        'rgba(102, 0, 204, 1)',
                        'rgba(204, 0, 204, 1)',
                        'rgba(255, 0, 0, 1)',
                        'rgba(255, 204, 0, 1)',
                        'rgba(51, 153, 255, 1)',
                        'rgba(255, 102, 0, 1)',
                        'rgba(0, 204, 0, 1)'
                    ],
                    hoverBorderWidth: 3,
                    borderWidth: 2
                }
            ]
        },
        options: {
            legend: {
                display: false,
                position: 'right',
            }
        }
    });
</script>