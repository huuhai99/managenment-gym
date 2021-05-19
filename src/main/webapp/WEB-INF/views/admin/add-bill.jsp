<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="billListURL" value="/danh-sach-hoa-don" />
<c:url var="editBillURL" value="/them-hoa-don" />
<c:url var="billAPI" value="/api/bill" />
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
			<h2>Thêm Hóa đơn</h2>
			<br>
		</div>
		<div class="col-lg-8 push-lg-4 personal-info">
			<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
				
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">ID Customer</label>
					<div class="col-lg-9">
					<form:input path="idCustomer" cssClass="col-xs-10 col-sm-5"  />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Category</label>
					<div class="col-lg-9">
					<form:select path="categoryId" id="categoryId">
							  	 	<form:option value="" label="-- Chọn thể loại --"/>
							  	 	<form:options items="${categories}"/>
							  	 </form:select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Money</label>
					<div class="col-lg-9">
					<form:input path="money" cssClass="col-xs-10 col-sm-5"  />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Note</label>
					<div class="col-lg-9">
					<form:input path="note" cssClass="col-xs-10 col-sm-5"  />
					</div>
				</div>
				<form:hidden path="id" id="billId"/>
				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<c:if test="${not empty model.id}">
							<button class="btn btn-info" type="button" id="btnAddOrUpdateBill">
								<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật khách
								hàng
							</button>
						</c:if>
						<c:if test="${empty model.id}">
							<button class="btn btn-info" type="button" id="btnAddOrUpdateBill">
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
	$('#btnAddOrUpdateBill').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		var id = $('#billId').val();
		if (id == "") {
			addBill(data);
		} else {
			updateBill(data);
		}
	});

	function addBill(data) {
		$
				.ajax({
					url : '${billAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						window.location.href = "${editBillURL}?id=" + result.id
								+ "&message=insert_success";
					},
					error : function(error) {
						window.location.href = "${billListURL}?page=1&limit=2&message=error_system";
					}
				});
	}

	function updateBill(data) {
		$.ajax({
			url : '${billAPI}',
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${editBillURL}?id=" + result.id
						+ "&message=update_success";
			},
			error : function(error) {
				window.location.href = "${editBillURL}?id=" + result.id
						+ "&message=error_system";
			}
		});
	}
</script>
</body>

</html>