<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerListURL" value="/danh-sach" />
<c:url var="editCustomerURL" value="/them-khach-hang" />
<c:url var="customerAPI" value="/api/customer" />
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

</head>
<body>
	<div class="container" style="background: #304c4445;">
		<!-- edit form column -->
		<div class="col-lg-12 text-lg-center">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">${message}</div>
			</c:if>
			<br>
			<c:if test="${not empty model.id}">
				<h2>Cập Nhật Khách Hàng</h2>

			</c:if>
			<c:if test="${empty model.id}">
				<h2>Thêm Khách Hàng</h2>
			</c:if>
			<br>
		</div>
		<div class="col-lg-8 push-lg-4 personal-info">
			<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
				
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Họ và tên:</label>
					<div class="col-lg-9">
					<form:input path="fullName" cssClass="col-xs-10 col-sm-5"  />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Số điện thoại:</label>
					<div class="col-lg-9">
					<form:input path="numberPhone" cssClass="col-xs-10 col-sm-5"  />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label">Giới tính:</label>
					<div class="col-lg-9">
						<label class="w3-validate">Nam</label>
						<form:radiobutton path = "sex" value = "Nam" />
						<label class="w3-validate">Nữ</label>
						<form:radiobutton path = "sex" value = "Nữ" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Ngày sinh:</label>
					<div class="col-lg-9">
					<form:input path="birthday" cssClass="col-xs-10 col-sm-5"  />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Ghi chú:</label>
					<div class="col-lg-9">
					<form:input path="note" cssClass="col-xs-10 col-sm-5"  />
					</div>
				</div>
				<form:hidden path="id" id="customerId"/>
				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<c:if test="${not empty model.id}">
							<button class="btn btn-info" type="button" id="btnAddOrUpdateCustomer">
								<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật khách
								hàng
							</button>
						</c:if>
						<c:if test="${empty model.id}">
							<button class="btn btn-info" type="button" id="btnAddOrUpdateCustomer">
								<i class="ace-icon fa fa-check bigger-110"></i> Thêm khách hàng
							</button>
						</c:if>

						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-danger" type="reset">
							<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
						</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>

<script>
	$('#btnAddOrUpdateCustomer').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		var id = $('#customerId').val();
		if (id == "") {
			addCustomer(data);
		} else {
			updateCustomer(data);
		}
	});

	function addCustomer(data) {
		$
				.ajax({
					url : '${customerAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						window.location.href = "${editCustomerURL}?id=" + result.id
								+ "&message=insert_success";
					},
					error : function(error) {
						window.location.href = "${customerListURL}?page=1&limit=2&message=error_system";
					}
				});
	}

	function updateCustomer(data) {
		$.ajax({
			url : '${customerAPI}',
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${editCustomerURL}?id=" + result.id
						+ "&message=update_success";
			},
			error : function(error) {
				window.location.href = "${editCustomerURL}?id=" + result.id
						+ "&message=error_system";
			}
		});
	}
</script>
</body>

</html>