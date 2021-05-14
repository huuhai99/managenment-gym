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
            <h2>Thêm Thẻ mới</h2>
            <br>
            <br>
        </div>
        <div class="col-lg-8 push-lg-4 personal-info">
             <form role="form">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Name</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="${card.nameCustomer}" id="fullName" name="fullName"  required="required" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Phone</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="number" value="${card.numberPhoneCustomer}"  id="numberPhone" name="numberPhone"  required="required" />
                    </div>
                </div>
                
                <!--  <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Age</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="number" value="" required="required" />
                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Sex</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="" required="required"  />
                    </div>
                </div> -->
                
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Issue Date</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="${card.issueDate}" id="issueDate" name="issueDate" required="required"  />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Valid Upto</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="${card.validUpto}" id="validUpto" name="validUpto"   required/>
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
<hr />
		<!-- /.container-fluid -->

		<!-- /.content-wrapper -->
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

</body>

</html>