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
					<h6 class="m-0 font-weight-bold text-primary">Danh Sách Khách Hàng</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>IdBill</th>
									<th>IdCustomer</th>
									<th>Content</th>
									<th>Money</th>
									<th>CreateDate</th>
									<th>CreateBy</th>
									<th>ModifiledDate</th>
									<th>ModifiledBy</th>
									<th>Manipulationc</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>IdBill</th>
									<th>IdCustomer</th>
									<th>Content</th>
									<th>Money</th>
									<th>CreateDate</th>
									<th>CreateBy</th>
									<th>ModifiledDate</th>
									<th>ModifiledBy</th>
									<th>Manipulationc</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td>${item.id}</td>
										<td>${item.idCustomer}</td>
										<td>${item.content}</td> 
										<td>${item.money}</td> 
										<td>${item.createdDate}</td> 
										<td>${item.createdBy}</td> 
										<td>${item.modifiedDate}</td> 
										<td>${item.modifiedBy}</td> 
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								</c:forEach>
								<tr>
									<td>5</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>8</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>	
								<tr>
									<td>9</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>10</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>11</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>
									<i class="fas fa-trash-alt" style="color: red;"></i>
									<i class="fas fa-edit" style="color: green;"></i>
									</td>
								</tr>
								<tr>
									<td>12</td>
									<td>1</td>
									<td>gym</td>
									<td>100$</td>
									<td>2011/04/25</td>
									<td>admin</td>
									<td>2011/04/25</td>
									<td>admin</td>
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