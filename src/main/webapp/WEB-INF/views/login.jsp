<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<c:url var="home" value="/login" />
<c:url var="ApiUrl" value="/register" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
	  <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('assets/images/backgrounds/login-bg.jpg')">
            	<div class="container">
            		<div class="form-box">
            			<div class="form-tab">
	            			<ul class="nav nav-pills nav-fill" role="tablist">
							    <li class="nav-item">
							        <a class="nav-link active" id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab" aria-controls="signin-2" aria-selected="false">Đăng Nhập</a>
							    </li>
							    <li class="nav-item">
							        <a class="nav-link " id="register-tab-2" data-toggle="tab" href="#register-2" role="tab" aria-controls="register-2" aria-selected="true">Đăng Ký</a>
							    </li>
							</ul>
							<div class="tab-content">
							    <div class="tab-pane fade show active" id="signin-2" role="tabpanel" aria-labelledby="signin-tab-2">
							    	<c:if test="${param.incorrectAccount != null}">
								<div class="alert alert-danger">	
									Tên Hoặc Mật Khẩu Không Đúng !
								</div>
								</c:if>
							<c:if test="${param.accessDenied != null}">
									<div class="alert alert-danger">	
									Bạn Không Phải Admin
									</div>
								</c:if>
							    	
							    	<form action="j_spring_security_check" id="formLogin" method="post">
							    		<div class="form-group">
							    			<label for="singin-email-2">Tên đăng nhập *</label>
							    			<input type="text" class="form-control" id="userNameLogin" name="j_username" required>
							    		</div><!-- End .form-group -->

							    		<div class="form-group">
							    			<label for="singin-password-2">Mật Khẩu *</label>
							    			<input type="password" class="form-control" id="passwordLogin" name="j_password" required>
							    		</div><!-- End .form-group -->

							    		<div class="form-footer">
							    			<button type="submit" class="btn btn-outline-primary-2">
			                					<span>Đăng Nhập</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>

											<a href="<c:url value='email'/>" class="forgot-link">Quên mật Khẩu?</a>
							    		</div><!-- End .form-footer -->
							    	</form>
							    </div><!-- .End .tab-pane -->
							    <div class="tab-pane fade  " id="register-2" role="tabpanel" aria-labelledby="register-tab-2">
							    	<c:if test="${param.confirmationMessage}">
										<div class="alert alert-success">A Confirm Email Has BeenSent</div>
									</c:if>
							    	<form id="formRegister" action="register" method="post">

									<div class="form-group ">
										<label for="fullName">Họ và Tên *</label> <input type="text"
											class="form-control" id="fullName" name="fullName" required />
										<p class="statusfullName" style="color: red;"></p>
									</div>
									<!-- End .form-group -->


									<div class="form-group ">
										<label for="userName">Tên Đăng Nhập *</label> <input
											type="text" class="form-control" id="userName" 
											name="userName" required   />
										<p class="status" style="color: red;"></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="email">Email*</label> <input type="email"
											class="form-control" id="email" name="email" required  />
										<p class="statusEmail" style="color: red;"></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group">
										<label for="phoneNumber">Số Điên Thoại *</label> <input
											type="number" class="form-control" id="phoneNumber"
											name="phoneNumber" required  />
										<p class="statusphoneNumber" style="color: red;"></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="address">Địa Chỉ *</label> <input type="text"
											class="form-control" id="address" name="address" required />
										<p class="statusaddress" style="color: red;"></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="password">Mật Khẩu *</label> <input
											type="password" class="form-control" id="password"
											name="password" required />
										<p class="statusPassword" style="color: red;"></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="repeatPass">Nhập lại mật khẩu *</label> <input
											type="password" class="form-control" id="repeatPass"
											name="repeatPass" required />
										<p class="statusrepeatPass" style="color: red;"></p>
									</div>
									<!-- End .form-group -->

									<div class="form-footer">
										<button type="submit"
											class="btn btn-outline-primary-2">
											<span>Đăng ký</span> <i class="icon-long-arrow-right"></i>
										</button>
									</div>
									<!-- End .form-footer -->
								</form>
							    </div><!-- .End .tab-pane -->
							</div><!-- End .tab-content -->
						</div><!-- End .form-tab -->
            		</div><!-- End .form-box -->
            	</div><!-- End .container -->
            </div><!-- End .login-page section-bg -->
        </main><!-- End .main -->
        
        
   <script>
   
	$(document).ready(function() {
						 $("#userName").blur(function userNameExists() {
											var userName = $("#userName").val();
											if (userName.length > 6 && userName.length < 32) {
												var data = {};
												data["userName"] = userName;
												$.ajax({
														type : "POST",
														url : "/spring-mvc/check",
														contentType : "application/json",
														data : JSON.stringify(data),
														success : function(result) {
																if (result.code == 1) {
																	$(".status").html(result.msg);
																	$("#createUser").prop('disabled', true);
																	return false;
																} else {
																	$(".status").html(result.msg);
																	$(".status").css("color","green");
																	$("#createUser").prop('disabled', false); 
																	return true;

																}
															},
															error : function(error) {
																swal("Thất bại","Sản phẩm vẫn an toàn","error");
															}
														});
											} else {
												$(".status").html("<font>Tên đăng nhập phải dài hơn 6 ký tự và nhỏ hơn 32 ký tự.</font>");
												return false;
											}
										});

						$("#email").blur(function emailExists() {
									var email = $("#email").val();
									var data = {};
									data["email"] = email;
									$.ajax({
										type : "POST",
										url : "/spring-mvc/checkEmail",
										contentType : "application/json",
										data : JSON.stringify(data),
										success : function(result) {
											if (result.code == 1) {
												$(".statusEmail").html(result.msg);
												$("#createUser").prop('disabled', true);

												return false;
											} else {$(".statusEmail").html(result.msg);
												$(".statusEmail").css("color","green");
												$("#createUser").prop('disabled', false); 
												return true;
											}
										},
										error : function(error) {
											console.log(error);
											alert("error");
										}
									});
								});

						$("#password").blur(function password() {
											var password = $("#password").val();
											
												if (password.length > 6) {
													$(".statusPassword").html("<font>Mật Khẩu hợp lệ</font>");
													$(".statusPassword").css("color", "green");
													return true;
												} else {
													$(".statusPassword")
															.html("<font>Mật khẩu phải dài hơn 6 ký tự.</font>");
													return false;
												}
											
										});
						$("#phoneNumber").blur(function phoneNumber() {
											var phoneNumber = $("#phoneNumber").val();
											if (phoneNumber.length > 0) {
												$(".statusphoneNumber").html("<font>Số điện thoại hợp lệ</font>");
												$(".statusphoneNumber").css("color", "green");
												return true;
											} else {
												$(".statusphoneNumber").html("<font>Vui lòng nhập số điện thoại</font>");
												return false;
											}
										});

						$("#fullName").blur(function fullName() {
											var fullName = $("#fullName").val();
											if (fullName.length > 0) {$(".statusfullName").html("<font>Hợp lệ</font>");
												$(".statusfullName").css("color", "green");
												return true;
											} else {
												$(".statusfullName").html("<font>Vui lòng nhập họ và tên</font>");
												return false;
											}
										});
						$("#address").blur(function address() {
											var address = $("#address").val();
											if (address.length > 0) {
												$(".statusaddress").html("<font>Hợp lệ</font>");
												$(".statusaddress").css("color", "green");
												return true;
											} else {
												$(".statusaddress").html("<font>Vui lòng nhập địa chỉ</font>");
												return false;
											}
										});

						$("#repeatPass").blur(function repeatPass() {
		 									var repeatPass = $("#repeatPass").val();
											var password = $("#password").val();
											if (repeatPass == password) {
												$(".statusrepeatPass").html("<font></font>");
												$("#createUser").prop('disabled', false); 
												return true;
											} else {
												$(".statusrepeatPass").html("<font>Mật khẩu không trùng khớp</font>");
												$("#createUser").prop('disabled', true);
												return false;
											}
										});

					}); 
</script>
</html>