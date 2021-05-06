<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<c:url var="home" value="/login" />
<c:url var="ApiUrl" value="/sendMail" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Xác Nhận Email</title>
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
							    	
							    	<form action="sendMail" id="formPass" method="post">
							    		<div class="form-group">
							    			<label for="singin-email-2"> Nhập Email để xác minh*</label>
							    			<input type="email" class="form-control" id="email" name="email" required>
							    		<p class="statusEmail" style="color: red;"></p>
							    		
							    		</div><!-- End .form-group -->

							    		<div class="form-footer">
							    			<button type="submit" id ="createUser" class="btn btn-outline-primary-2">
			                					<span>Xác Nhận Email</span>
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
			$("#email").blur(function emailExists() {
						var email = $("#email").val();
						var data = {};
						data["email"] = email;
						$.ajax({
							type : "POST",
							url : "/spring-mvc/checkEmail1",
							contentType : "application/json",
							data : JSON.stringify(data),
							success : function(result) {
								if (result.code == 0) {
									$(".statusEmail").html(result.msg);
									$("#createUser").prop('disabled', true);

									return false;
								} else {$(".statusEmail").html(result.msg);
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
		}); 
</script>
</html>