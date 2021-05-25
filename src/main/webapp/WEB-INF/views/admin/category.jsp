<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

</head>

<body>


<div class="container-fluid">

<div style="text-align: right ; padding-top: 20px;" class="widget-box table-filter">
				<div style="position:"class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm bài viết'
								href='them-the-loai'> <span>
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
					<h6 class="m-0 font-weight-bold text-primary">Danh Sách Thể Loại</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>Tên</th>
									<th>Trạng Thái</th>
									<th>Thao Tác</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="" items="">
								<tr>
									<td>${item.name}</td>
									<td>${item.status}</td> 
									<td></td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<a href="<c:url value='/editCard/'/>" ><i class="fas fa-edit" style="color: green;"></i></a>
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