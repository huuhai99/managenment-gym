<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
            <h2>Thêm Khách Hàng</h2>
            <br>
            <br>
        </div>
        <div class="col-lg-8 push-lg-4 personal-info">
             <form role="form">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Full Name</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value=""  required="required" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Phone Numbers</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="number" value="" required="required" />
                    </div>
                </div>
                
                
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Sex</label>
                    <div class="col-lg-9">
							<input required class="  w3-radio" type="radio" name="gender"
								value="male" checked> <label class="w3-validate">Male</label>
							<input required class="w3-radio  " type="radio" name="gender"
								value="female"> <label class="w3-validate">Female</label>
                    </div>
                </div>
           
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">BirthDay</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="date" value="" required="required"  />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Note</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="" required="required"  />
                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label"></label>
                    <div class="col-lg-9">
                        <input type="reset" class="btn btn-secondary" value="Cancel" />
                        <input type="submit" class="btn btn-primary" value="Save Changes" />
                    </div>
                </div>
            </form>
        </div>
</div>

</body>

</html>