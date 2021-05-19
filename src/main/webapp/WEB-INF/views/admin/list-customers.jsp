<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Danh Sách</title>

</head>


<body>


<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div class="container-fluid">

			<div style="text-align: right" class="widget-box table-filter">
				<div style="position:"class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm bài viết'
								href='them-khach-hang'> <span>
									<i class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<!-- <button style ="margin-left: 1px" id="btnDelete" type="button"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa bài viết'>
								<span> <i class="fa fa-trash bigger-110 pink"></i>
								</span>
							</button> -->
						</div>
					</div>
				</div>
			</div>

			<!-- DataTales Example -->
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
								<tr>
									<td>5</td>
									<td>Garrett Winters</td>
									<td>Male</td>
									<td>0123456789</td>
									<td>2011/04/25</td>
									<td></td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>Garrett Winters</td>
									<td>Male</td>
									<td>0123456789</td>
									<td>2011/04/25</td>
									<td></td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td>Garrett Winters</td>
									<td>Male</td>
									<td>0123456789</td>
									<td>2011/04/25</td>
									<td></td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>8</td>
									<td>Garrett Winters</td>
									<td>Male</td>
									<td>0123456789</td>
									<td>2011/04/25</td>
									<td></td>
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
			<!-- End of Main Content -->

		</div>
		

</body>

</html>