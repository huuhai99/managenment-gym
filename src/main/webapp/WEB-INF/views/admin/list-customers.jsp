<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerAPI" value="/api/customer" />
<c:url var="customerURL" value="/danh-sach"/>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Danh Sách</title>

</head>


<body>


<div id="content-wrapper" class="d-flex flex-column">
<div class="col-lg-12">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">${message}</div>
			</c:if>
		</div>
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
									<th>Mã</th>
									<th>Họ và tên</th>
									<th>Giới tính</th>
									<th>Số điện thoại</th>
									<th>Ngày sinh</th>
									<th>Ghi chú</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Mã</th>
									<th>Họ và tên</th>
									<th>Giới tính</th>
									<th>Số điện thoại</th>
									<th>Ngày sinh</th>
									<th>Ghi chú</th>
									<th>Thao tác</th>
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
									<button id="btnDelete_${item.id}" type="button" onclick="warningBeforeDelete(${item.id})" value="${item.id}"
														class="dt-button buttons-html5 btn btn-white  btn-bold" data-toggle="tooltip" title='Xóa khách hàng'>
																<span>
																	<i class="fas fa-trash-alt" style="color: red;"></i>
																</span>
												</button>
									<c:url var="updateCustomerURL" value="/them-khach-hang">
										<c:param name="id" value="${item.id}"/>															
																</c:url>																
										<a class="btn btn-sm  btn-edit"  data-toggle="tooltip"
											title="Cập nhật khách hàng" href='${updateCustomerURL}'><i class="fas fa-edit" style="color: green;"></i>
											</a>
									<c:url var="infoCustomerURL" value="/thong-tin-khach-hang">
										<c:param name="id" value="${item.id}"/>															
																</c:url>																
										<a class="btn btn-sm  btn-edit"  data-toggle="tooltip"
											title="thông tin khách hàng" href='${infoCustomerURL}'><i class="fas fa-info" style="color: blue;"></i>
											</a>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
			<!-- End of Main Content -->

		</div>
		
<script>
function warningBeforeDelete(id) {
	swal({
	  title: "Xác nhận xóa",
	  text: "Bạn có chắc chắn muốn xóa hay không",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonClass: "btn-success",
	  cancelButtonClass: "btn-danger",
	  confirmButtonText: "Xác nhận",
	  cancelButtonText: "Hủy bỏ",
	}).then(function(isConfirm) {
	  if (isConfirm) {
			
			deleteCustomer(id);
	  }
	});
} 
function deleteCustomer(data) {
$.ajax({
    url: '${customerAPI}',
    type: 'DELETE',
    contentType: 'application/json',
    data: JSON.stringify(data),
    success: function (result) {
        window.location.href = "${customerURL}?message=delete_success";
    },
    error: function (error) {
    	window.location.href = "${customerURL}?message=error_system";
    }
});
}
</script>
</body>

</html>