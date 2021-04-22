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
            <h2>Thêm Hóa Đơn</h2>
            <br>
            <br>
        </div>
        <div class="col-lg-8 push-lg-4 personal-info">
             <form role="form">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Id Khách Hàng</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="number" value=""  required="required" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Nội Dung</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="" required="required" />
                    </div>
                </div>
                
               <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Số Tiền</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="number" value="" required="required" />
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