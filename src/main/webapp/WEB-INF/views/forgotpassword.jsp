<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<c:url var="home" value="/login" />
<c:url var="ApiUrl" value="/register" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Quên Mật Khẩu</title>
</head>
	  <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('assets/images/backgrounds/login-bg.jpg')">
            	<div class="container">
            		<div class="form-box">
            			<div class="form-tab">
	            			<ul class="nav nav-pills nav-fill" role="tablist">
							    <li class="nav-item">
							        <a class="nav-link active" id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab" aria-controls="signin-2" aria-selected="false">Quên Mật Khẩu</a>
							    </li>
							</ul>
							<div class="tab-content">
							    <div class="tab-pane fade show active" id="signin-2" role="tabpanel" aria-labelledby="signin-tab-2">
							    	
							    	<form action="forgotpass" id="formPass" method="post">
							    	
							    		<div class="form-group">
							    			<input type="hidden" class="form-control" id="confirmToken" name="confirmToken" value ="${token.confirmToken}" required>
							    		
							    		</div><!-- End .form-group -->
							    	
							    		<div class="form-group">
							    			<label for="singin-email-2">Mật Khẩu Mới*</label>
							    			<input type="password" class="form-control" id="password" name="password" required>
							    		<p class="statusPassword" style="color: red;"></p>
							    		
							    		</div><!-- End .form-group -->

							    		<div class="form-group">
							    			<label for="singin-password-2">Nhập lại mật khẩu *</label>
							    			<input type="password" class="form-control" id="repeatPass" name="repeatPass" required>
							    		<p class="statusrepeatPass" style="color: red;"></p>
							    		</div><!-- End .form-group -->

							    		<div class="form-footer">
							    			<button type="submit" id ="createUser" class="btn btn-outline-primary-2">
			                					<span>Đổi Mật Khẩu</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>
							    		</div><!-- End .form-footer -->
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