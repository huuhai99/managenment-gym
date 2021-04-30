<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more"
				style="background-image: url('images/bg-01.jpg');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">

				<form:form method="POST" class="login100-form validate-form"
					action="dang-ky" modelAttribute="userForm">
					<span class="login100-form-title p-b-59"> Đăng ký </span>

					<div class="wrap-input100 validate-input "
						data-validate="Name is required">
						<span class="label-input100">Full Name</span> <input
							class="input100" type="text" id="fullName" name="fullName"
							placeholder="Name..."> <span class="focus-input100"></span>
					</div>


					<div class="form-group ${status.error ? 'has-error' : ''}"
						data-validate="Valid email is required: ex@abc.xyz">
						<span class="label-input100">Email</span>
						 <form:input path="email" class="input100"
							type="text" id="email" name="email" placeholder="Email addess..."></form:input>
						<form:errors path="email"></form:errors>
						<p class="statusEmail"></p>
					</div>

					<div class="form-group ${status.error ? 'has-error' : ''}"
						data-validate="Username is required">
						<span class="label-input100">Username</span>
						<form:input class="input100" path="userName" type="text"
							id="userName" name="userName" placeholder="Username..."></form:input>
						<form:errors path="userName"></form:errors>
						<p class="status"></p>
						<span class="focus-input100"></span>
					</div>

					<div class="form-group ${status.error ? 'has-error' : ''}"
						data-validate="Password is required">
						<span class="label-input100">Password</span> 
						<form:input path="password"
							class="input100" type="password" id="password" name="password"
							placeholder="*************"></form:input>
							<form:errors path="password"></form:errors>
							<span class="focus-input100"></span>
							<p class="statusPass"></p>
					</div>
					<div class="form-group ${status.error ? 'has-error' : ''}"
						data-validate="Repeat Password is required">
						<span class="label-input100">Repeat Password</span> 
						<form:input path="repeatPass" class="input100" type="password" name="repeatPass"
							placeholder="*************"></form:input>
							<form:errors path="repeatPass"></form:errors>
							<span class="focus-input100"></span>
							<p class="statusRepeatPass"></p>
					</div>
					<div class="flex-m w-full p-b-33">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="remember-me"> <label class="label-checkbox100"
								for="ckb1"> <span class="txt1"> I agree to the <a
									href="#" class="txt2 hov1"> Terms of User </a>
							</span>
							</label>
						</div>


					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button id="btn-submit-regis" class="login100-form-btn" >Sign Up</button>
						</div>

						<a href="#"
							class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30"> Sign
							in <i class="fa fa-long-arrow-right m-l-5"></i>
						</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>


</body>
</html>