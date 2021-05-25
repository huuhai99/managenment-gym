<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
	<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

</head>

<body>


<div class="container-fluid">
		
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
			<c:if test=""></c:if>
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Danh Sách Học Viên</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>Tên</th>
									<th>Giới Tính</th>
									<th>Số Điện Thoại</th>
									<th>Thao Tác</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="item" items="${customers}">
								<tr>
									<td>${item.fullName}</td>
									 <td>${item.sex}</td>
									<td>${item.numberPhone}</td> 
									<td>
									
										<a href="<c:url value='/attendance'/>" ><i class="fas fa-user-tag" style="color: red;"></i></a>
									<%-- <a href="<c:url value='/danh-sach-diem-danh/${item.id}'/>" ><i class="fas fa-eye" style="color: green;"></i></a> --%>
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