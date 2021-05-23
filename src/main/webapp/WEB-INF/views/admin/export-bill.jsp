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
			<h2>Xuất hóa đơn</h2>
			<br>
		</div>
		 <div class="col-lg-8 push-lg-4 personal-info">
				
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Tên Khách Hàng</label>
					<div>
           			 <input type="text" id="nameCustomer" value="${model.customerFullName}" placeholder="Enter your name" />
       			 </div>
				</div>
				
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Ghi chú</label>
					<div>
           			 <input type="text" id="note" value="${model.note}" placeholder="Enter your name" />
       			 </div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Thể Loại</label>
					<div class="col-lg-9">
					 <input type="text" id="nameCategory" value="${model.categoryName}" placeholder="Enter your name" />
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Money</label>
					<div class="col-lg-9">
					
					</div>
				</div>
				<div class="form-group row">
					<label class="col-lg-3 col-form-label form-control-label" for="form-field-1">Note</label>
					<div class="col-lg-9">
					</div>
				</div>
		</div> 
         <div>
            <input type="button" id="bt" value="Save data to file" onclick="saveFile()" />
        </div>
	</div>

<script>


let saveFile = () => {
	
    // Get the data from each element on the form.
	const name = document.getElementById('note');
  /*   const age = document.getElementById('txtAge');
    const email = document.getElementById('txtEmail');
    const country = document.getElementById('selCountry');
    const msg = document.getElementById('msg'); */
    
    // This variable stores all the data.
    let data = 
        '\r Name: ' + name.value ;
        /* + ' \r\n ' + 
        'Age: ' +age.value + ' \r\n ' + 
        'Email: ' + email.value + ' \r\n ' + 
        'Country: ' + country.value + ' \r\n ' + 
        'Message: ' + msg.value; */
    
    // Convert the text to BLOB.
    const textToBLOB = new Blob([data], { type: 'text/plain' });
    const sFileName = 'formData.txt';	   // The file to save the data.

    let newLink = document.createElement("a");
    newLink.download = sFileName;

    if (window.webkitURL != null) {
        newLink.href = window.webkitURL.createObjectURL(textToBLOB);
    }
    else {
        newLink.href = window.URL.createObjectURL(textToBLOB);
        newLink.style.display = "none";
        document.body.appendChild(newLink);
    }

    newLink.click(); 
}




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