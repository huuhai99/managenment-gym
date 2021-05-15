<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:url var="addCategoryURL" value="/api/category" />
<c:url var="saveURL" value="/admin/category/save" />
<c:url var="listCategoryURL" value="/admin/category/list" />
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
            <h2>Thêm Thể Loại</h2>
            <br>
            <br>
        </div>
        <div class="col-lg-8 push-lg-4 personal-info">
             <form role="form" id ="formEditCategory">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Tên</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="" id="name" name="name"  required="required" />
                    </div>
                </div>

                <div class="form-group row">
								<label for="inputState">Chọn trạng thái</label> <select
									id="inputState" class="inputState" name="status" style="margin-left: 62px;width: 110px;height: 36px;border-radius: 5px;"> 
									<option selected>--Chọn--</option>
									<c:forEach var="item" items="${status}">
										<option value="${item.value }"
											${item.value == category.status  ? 'selected' : '' }>${item.key }</option>
									</c:forEach>

								</select>
							</div>
							
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label"></label>
                    <div class="col-lg-9">
                        <input type="reset" class="btn btn-secondary"  value="Cancel" />
                        <input type="submit" class="btn btn-primary" id = "editCategory" value="Lưa" />
                    </div>
                </div>
            </form>
        </div>
</div>

<script>
	$('#editCategory').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formEditCategory').serializeArray();
		$.each(formData, function(index, v) {
			data["" + v.name + ""] = v.value;
		});
		
		addCategory(data);
	});
	function addCategory(data) {
		$.ajax({
			type : "POST",
			url : "${addCategoryURL}",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {
				swal("Thành Công!", "Hãy nhấn vào nút!", "success");
			},
			error : function(error) {
				swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			}
		});
	}
	function editCategory(data) {
		$.ajax({
			type : "PUT",
			url : "${addCategoryURL}",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {
				swal("Thành Công!", "Hãy nhấn vào nút!", "success");
			},
			error : function(error) {
				swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			}
		});
	}
</script>

</body>

</html>