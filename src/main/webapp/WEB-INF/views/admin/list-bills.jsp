<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="billAPI" value="/api/bill" />
<c:url var="billURL" value="/danh-sach-hoa-don"/>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Danh Sách Hóa Đơn</title>

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
								href='them-hoa-don'> <span>
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
					<h6 class="m-0 font-weight-bold text-primary">Danh Sách Hóa Đơn</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>IdBill</th>
									<th>IdCustomer</th>
									<th>Category</th>
									<th>Money</th>
									<th>Manipulationc</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>IdBill</th>
									<th>IdCustomer</th>
									<th>Category</th>
									<th>Money</th>
									<th>Manipulationc</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td>${item.id}</td>
										<td>${item.idCustomer}</td>
										<td>${item.categoryName}</td> 
										<td>${item.money}$</td> 
									<td>
									<button id="btnDelete_${item.id}" type="button" onclick="warningBeforeDelete(${item.id})" value="${item.id}"
														class="dt-button buttons-html5 btn btn-white  btn-bold" data-toggle="tooltip" title='Xóa hóa đơn'>
																<span>
																	<i class="fas fa-trash-alt" style="color: red;"></i>
																</span>
												</button>
									<c:url var="updateBillURL" value="/them-hoa-don">
										<c:param name="id" value="${item.id}"/>															
																</c:url>
																																
										<a class="btn btn-sm  btn-edit"  data-toggle="tooltip"
											title="Cập nhật hóa đơn" href='${updateBillURL}'><i class="fas fa-edit" style="color: green;"></i>
											</a>
											<c:url var="updateBillURL" value="/them-xuat-hoa-don">
										<c:param name="id" value="${item.id}"/>															
																</c:url>
											<a class="btn btn-sm  btn-edit"  data-toggle="tooltip"
											title="Xuất hóa đơn" href='${updateBillURL}'><i class="fas fa-file-export"></i>
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
			
		  deleteBill(id);
	  }
	});
} 
function deleteBill(data) {
$.ajax({
    url: '${billAPI}',
    type: 'DELETE',
    contentType: 'application/json',
    data: JSON.stringify(data),
    success: function (result) {
        window.location.href = "${billURL}?message=delete_success";
    },
    error: function (error) {
    	window.location.href = "${billURL}?message=error_system";
    }
});
}
</script>		

</body>

</html>