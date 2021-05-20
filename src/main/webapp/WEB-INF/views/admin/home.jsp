<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
var today = new Date();
var day = today.getDate();
var month = today.getMonth()+1;
var year = today.getFullYear();
</script>
</head>

<body>


<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<%-- <div><h1 class="h3 mb-0 text-gray-800">Thống kê</h1>
						<label for="">Thống kê theo:</label> <select id="thongkeSelect">
							<option value="1"selected><a href="<c:url value='/danh-sach'/>">Tháng</a></option>
							<option value="2" >Năm</option>
							<option value="3">Quý</option>
							<option value="4" >Ngày</option>
							 
						</select> 
						<input type="text" id="txtTest"/>
						</div> --%>
						<ul class="navbar-nav">
				<li class="nav-item dropdown"><a style="color:black;font-size:25px"
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i ></i> <span>Thống kê theo</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a  class="dropdown-item" href="<c:url value='/home?time=ngay&year=2021&month=5&day=28'/>">Ngày</a> 
					<a class="dropdown-item" href="<c:url value='/home?time=thang&year=2021&month=5'/>">Tháng</a> 
					<a class="dropdown-item" href="<c:url value='/home?time=nam&year=2021'/>">Năm</a> 
						
				</div>
				</li>
		
		</ul>
						
					<!-- 	<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Export Excel</a> -->
							
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Tổng số khách hàng</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${thongke.totalCustomer}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user-friends fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Khách hàng Nam</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${thongke.maleCustomer}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-male fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Khách
												hàng Nữ</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${thongke.femaleCustomer}</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-female fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				                   <!-- Content Row -->

                    <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Biểu Đồ</h1>
                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Doanh Thu</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Lớp Học</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                    <!-- End of chart Content -->
                    <div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Danh Sách Khách Hàng</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>Id</th>
									<th>FullName</th>
									<th>Sex</th>
									<th>PhoneNumber</th>
									<th>Birthday</th>
									<th>Note</th>
									<th>Manipulationc</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Id</th>
									<th>FullName</th>
									<th>Sex</th>
									<th>PhoneNumber</th>
									<th>Birthday</th>
									<th>Note</th>
									<th>Manipulationc</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td>${item.id}</td>
										<td>${item.fullName}</td>
										<td>${item.sex}</td> 
										<td>${item.numberPhone}</td> 
										<td>${item.birthday}</td> 
										<td>${item.note}</td> 
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
                    
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	<!-- End of Page Wrapper -->
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
		

		</div>
		<!-- /.content-wrapper -->
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
<!-- 	<script>
		$( "#thongkeSelect" )
  		.change(function() {
   		 var str = "";
    		$( "#thongkeSelect option:selected" ).each(function() {
    			str = $( "#thongkeSelect").text();
    		  console.log($( "#thongkeSelect option:selected" ).text());
   			 $("#txtTest").val( $( "#thongkeSelect option:selected" ).text() );
    		});
		  })
  		.trigger( "change" );
</script> -->
	 <script>
  var ctx = document.getElementById("myPieChart");
  var myPieChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ["Yoga", "Gym", "Aerobic"],
      datasets: [{
        data: [300,50,100],
        backgroundColor: ['#007bff', '#dc3545', '#ffc107'],
      }],
    },
  });
  </script>
  <script>
    var myChart = document.getElementById('myBarChart').getContext('2d');
    // Global Options
    Chart.defaults.global.defaultFontFamily = 'Lato';
    Chart.defaults.global.defaultFontSize = 18;
    Chart.defaults.global.defaultFontColor = '#777';

    var massPopChart = new Chart(myChart, {
      type:'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
      data:{
        labels:['1', '2', '3', '4', '5', '6'],
        datasets:[{
          label:'Doanh thu',
          data:[
            100,
            200,
            300,
            250,
            150,
            200
          ],
          //backgroundColor:'green',
          backgroundColor:[
            'rgba(54, 162, 235, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(54, 162, 235, 0.6)',
          ],
          borderWidth:1,
          borderColor:'#777',
          hoverBorderWidth:3,
          hoverBorderColor:'#000'
        }]
      },
      options:{
        title:{
          display:true,
          text:'Doanh Thu Theo Tháng',
          fontSize:25
        },
        legend:{
          display:true,
          position:'right',
          labels:{
            fontColor:'#000'
          }
        },
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        },
        tooltips:{
          enabled:true
        },
        scales: {
        	yAxes: [{
                display: true,
                ticks: {
                    beginAtZero: true,
                    min: 0
                }
            }]
        }   
      }
    });
  </script>
</body>

</html>