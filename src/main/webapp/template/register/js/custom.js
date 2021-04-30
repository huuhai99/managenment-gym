$(document).ready(function() {
	$("#btn-submit-regis").prop('disabled', true);
	$("#btn-submit-regis").css("color", "red");
	$("#userName").blur(function usernameExists() {
		var userName = $("#userName").val();
		if (userName.length > 6 && userName.length < 32) {
			var data = {};
			data["userName"] = userName;
			$(".status").html("<font> Checking availability...</font>");
			$.ajax({
				type : "POST",
				url : "/spring-mvc/check",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(result) {
					if (result.code == 1) {
						$(".status").html(result.msg);
						$("#btn-submit-regis").prop('disabled', true);
						return false;
					} else {
						$(".status").html(result.msg);
						return true
						
					}
				},
				error : function(error) {
					console.log(error);
					alert("error");
				}
			});
		} else {
			$(".status").html("<font>Please use between 6 and 32 characters.</font>");
			$("#btn-submit-regis").prop('disabled', true);
			return false;
		}
	});
	
	$("#email").blur(function emailExists() {
		var email = $("#email").val();
			var data = {};
			data["email"] = email;
			$(".statusEmail").html("<font> Checking availability...</font>");
			$.ajax({
				type : "POST",
				url : "/spring-mvc/checkEmail",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(result) {
					if (result.code == 1) {
						$(".statusEmail").html(result.msg);
						$("#btn-submit-regis").prop('disabled', true);
						return false;
					} else {
						$(".statusEmail").html(result.msg);
						return true;
					}
				},
				error : function(error) {
					console.log(error);
					alert("error");
				}
			});
	});
	$("#repeatPass").blur(function checkRepeatPass() {
		var password = $("#password").val();
		var repeatPass = $("#repeatPass").val();
		if (password.length > 8 && password.length < 32) {
			var data = {};
			data["password"] = password;
			data["repeatPass"] = repeatPass;
			$.ajax({
				type : "POST",
				url : "/spring-mvc/checkPass",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(result) {
					if (result.code == 1) {
						$(".statusRepeatPass").html(result.msg);
						$("#btn-submit-regis").prop('disabled', true);
						return false;
					} else {
						$(".statusRepeatPass").html(result.msg);
						return true;
					}
				},
				error : function(error) {
					console.log(error);
					alert("error");
				}
			});
		} else {
			$(".statusPass").html("<font>Try one with at least 8 characters.</font>");
			$("#btn-submit-regis").prop('disabled', true);
			return false;
		}
	});
	function validateButton(){
		var resultUser = ususernameExists();
		var  resultEmail = emailExists();
		var resultPass = checkRepeatPass();
		if(resultUser == true && resultEmail == true && resultPass == true){
			$("#btn-submit-regis").prop('disabled', false);
			$("#btn-submit-regis").css("color", "black");
		}
	};
	
});