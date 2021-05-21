<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listBookUrl" value="/admin/book/list" />
<c:url var="ApiUrl" value="/api/card" />
<!DOCTYPE html>
<html lang="en" >
<head>
  <title>CodePen - full calendar bootstrap 4</title>

</head>
<body>
<!-- partial:index.partial.html -->
<div class="p-5">
  <h2 class="mb-4">Bảng Điểm Danh</h2>
  <div class="card">
    <div class="card-body p-0">
      <div id="calendar"></div>
    </div>
  </div>
</div>

<!-- calendar modal -->
<div id="modal-view-event" class="modal modal-top fade calendar-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<span class="event-title"></span>
					<br>
					<span class="event-description"></span>
					<br>
					<span  class = "event-start"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

<div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="add-event">
        <div class="modal-body">
        <h4>Điểm Danh</h4>        
          <div class="form-group">
            <label>Tên</label>
            <input type="text" class="form-control" name="title" id="title">
            <span class = "status"></span>
          </div>
          <div class="form-group">
            <label>Mô tả</label>
            <input type="text" class=" form-control"  name="description" id="description">
          </div>        
          <!-- <div class="form-group">
            <label>Event Description</label>
            <textarea class="form-control" name="edesc"></textarea>
          </div> -->
      </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="saveCalendar" >Lưa</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>        
      </div>
      </form>
    </div>
  </div>
</div>

<!-- partial -->

	<script> 
	$( document ).ready(function() {
		 $("#title").blur(function fullNameExists() {
				var fullName = $("#title").val();
					var data = {};
					data["fullName"] = fullName;
					$.ajax({
							type : "POST",
							url : "/spring-mvc/checkFullName",
							contentType : "application/json",
							data : JSON.stringify(data),
							success : function(result) {
									if (result.code == 1) {
										$(".status").html(result.msg);
										$(".status").css('color','green'); 
										$("#saveCalendar").prop('disabled', false);
									} else {
										$(".status").html(result.msg);
									 	$(".status").css('color','red'); 
										$("#saveCalendar").prop('disabled', true); 
									}
								},
								error : function(error) {
									swal("Thất bại","Sản phẩm vẫn an toàn","error");
								}
							});
				
			});
	
	});
	
	
	
	$('#saveCalendar').click(function (e) {
		 e.preventDefault();
		  var data={};
		  var formData = $('#add-event').serializeArray();  
		  $.each(formData, function (index, v) {
		        data["" + v.name + ""] = v.value;
		    });
		  var title = $('#title').val();
		  if(title !=""){
			  addingBook(data);
		  }else {
		  }
		  
		});
		function addingBook(data) {
				   $.ajax({
		            type: "POST",
		  		    url: "${ApiUrl}",
		            data: JSON.stringify(data),
		            dataType: "json",
		            contentType: "application/json",
		            success: function (response) {  
		            	window.location.href = 'http://localhost:8080/spring-mvc/attendance';
		            },
		            error: function (response) {
		            	swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
		            }
		         });
		}
	
	jQuery(document).ready(function(){
		  jQuery('.datetimepicker').datepicker({
		      timepicker: true,
		      language: 'en',
		      range: true,
		      multipleDates: true,
				  multipleDatesSeparator: " - "
		    });
		});

		(function () {    
		    'use strict';
		    function timeFormat(date){
				if(date instanceof Date){
					var isoDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
					var time = date.toLocaleString('en-US', { hour: 'numeric',minute:'numeric', hour12: true });
					return isoDate + ' @ ' + time;	
				}else{
					return "";
				}
			}
		    // ------------------------------------------------------- //
		    // Calendar
		    // ------------------------------------------------------ //
			jQuery(function() {
				// page is ready
				jQuery('#calendar').fullCalendar({
					themeSystem: 'bootstrap4',
					// emphasizes business hours
					businessHours: false,
					defaultView: 'month',
					// event dragging & resizing
					editable: true,
					// header
					header: {
						left: 'title',
						center: 'month,agendaWeek,agendaDay',
						right: 'prev,next'
					},
					views : {
						agendaDay : {
							buttonText : 'Ngày'
						},
						agendaWeek : {
							buttonText : 'Tuần'
						},
						month : {
							buttonText : 'Tháng'
						},
						today :{
							buttonText : 'Hôm nay'
						}
						
					},
					events: 'http://localhost:8080/spring-mvc/findAll',
					eventRender: function(event, element) {
						if(event.icon){
							element.find(".fc-title").prepend("<i class='fa fa-"+event.icon+"'></i>");
						}
					  },
					dayClick: function() {
						jQuery('#modal-view-event-add').modal();
						
					},
					eventClick: function(event, jsEvent, view) {
						 var date = new Date(event.start);
					/*  alert(((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear() + ' ' + date.getHours()+':'+ date.getMinutes()+ ':' +date.getSeconds());   */
					   jQuery('.event-icon').html("<i class='fa fa-"+event.icon+"'></i>");
							jQuery('.event-title').html("<span>Ten: </span> "+event.title);
							jQuery('.event-description').html("<span>Mo ta: </span> "+event.description);
							jQuery('.event-start').html(((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear());
							jQuery('.eventUrl').attr('href',event.url);
							jQuery('#modal-view-event').modal();
					},
				})
			});
		  
		})(jQuery);
	
	</script>
</body>
</html>