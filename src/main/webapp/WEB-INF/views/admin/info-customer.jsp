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
	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-9">
	<h1>Thông tin khách hàng</h1>
	<table>
	<tr>
	<td>Họ tên : </td>
	<td>${model.fullName } </td></tr>
	<tr>
	<td>Ngày sinh : </td>
	<td>${model.birthday } </td></tr>
	<tr><td>Giới tính </td>
	<td>${model.sex } </td></tr>
	<tr><td>Điện thọai: </td>
	<td>${model.numberPhone } </td></tr>
	<tr><td>Ghi chú(nếu có): </td>
	<td>${model.note } </td></tr>
	<tr><td>Nhân viên quản lý: </td>
	<td>${model.idUser } </td></tr>
	<tr><td>Danh sách hóa đơn: </td>
	<td></td></tr>
	
	<c:forEach var="item" items="${listBill}">
	<tr>
	<td></td>
	<td>${item.toString() } </td>
	</tr>
	
								</c:forEach>
	
	</table>
	<br>
	<a href="danh-sach" class="btn btn-primary">Danh sách khách hàng</a>
			
			</div>
			
		</div>
	</div>
</body>

</html>