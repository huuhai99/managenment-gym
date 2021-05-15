<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

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
						<div><h1 class="h3 mb-0 text-gray-800">Thống kê</h1>
						<label for="">Choose a year:</label> <select id="">
							<option value=""selected>Tất cả</option>
							<option value="" >2021</option>
							<option value="">2022</option>
							<option value="" >2019</option>
						</select> </div>
						
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Export Excel</a>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Tổng số khách hàng</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">10</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user-friends fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Khách hàng Nam</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">7</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-male fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Khách
												hàng Nữ</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">3</div>
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

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Tổng Thu</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">1800$</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				                   <!-- Content Row -->

                    <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Charts</h1>
                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the bar chart can be found in the
                                    <code>/js/demo/chart-bar-demo.js</code> file.
                                </div>
                            </div>

                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the donut chart can be found in the
                                    <code>/js/demo/chart-pie-demo.js</code> file.
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
									<th>IdBill</th>
									<th>IdCustomer</th>
									<th>Content</th>
									<th>Money</th>
									<th>CreateDate</th>
									<th>CreateBy</th>
									<th>ModifiledDate</th>
									<th>ModifiledBy</th>
									<th>Manipulationc</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>IdBill</th>
									<th>IdCustomer</th>
									<th>Content</th>
									<th>Money</th>
									<th>CreateDate</th>
									<th>CreateBy</th>
									<th>ModifiledDate</th>
									<th>ModifiledBy</th>
									<th>Manipulationc</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td>${item.id}</td>
										<td>${item.idCustomer}</td>
										<td>${item.content}</td> 
										<td>${item.money}</td> 
										<td>${item.createdDate}</td> 
										<td>${item.createdBy}</td> 
										<td>${item.modifiedDate}</td> 
										<td>${item.modifiedBy}</td> 
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								</c:forEach>
								<tr>
									<td>5</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								
								<tr>
									<td>12</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>						
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

</body>

</html>