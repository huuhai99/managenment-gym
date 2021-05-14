<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listBookUrl" value="/admin/book/list" />
<c:url var="ApiUrl" value="/api/card" />
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - full calendar bootstrap 4</title>

</head>
<body>
<!-- partial:index.partial.html -->
<div class="p-5">
  <h2 class="mb-4">Full Calendar</h2>
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
					<h4 class="modal-title"><span class="event-icon"></span><span class="event-title"></span></h4>
					<div class="event-body"></div>
					<input type="datetime-local" pattern="MM/dd/yyyy" class=" event-start">
					<div class="event-status"></div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="add-event">
        <div class="modal-body">
        <h4>Add Event Detail</h4>        
          <div class="form-group">
            <label>Event name</label>
            <input type="text" class="form-control" name="title" id="title">
          </div>
          <div class="form-group">
            <label>Event Date</label>
            <input type="datetime-local" class=" form-control" >
          </div>        
          <div class="form-group">
            <label>Event Description</label>
            <textarea class="form-control" name="edesc"></textarea>
          </div>
          <div class="form-group">
            <label>Event Color</label>
            <select class="form-control" name="ecolor">
              <option value="fc-bg-default">fc-bg-default</option>
              <option value="fc-bg-blue">fc-bg-blue</option>
              <option value="fc-bg-lightgreen">fc-bg-lightgreen</option>
              <option value="fc-bg-pinkred">fc-bg-pinkred</option>
              <option value="fc-bg-deepskyblue">fc-bg-deepskyblue</option>
            </select>
          </div>
          <div class="form-group">
            <label>Event Icon</label>
            <select class="form-control" name="eicon">
              <option value="circle">circle</option>
              <option value="cog">cog</option>
              <option value="group">group</option>
              <option value="suitcase">suitcase</option>
              <option value="calendar">calendar</option>
            </select>
          </div>        
      </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="saveCalendar" >Save</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>        
      </div>
      </form>
    </div>
  </div>
</div>

<!-- partial -->

	<script> 
	$( document ).ready(function() {
		
		
	
	
	});
	
	
	$('#saveCalendar').click(function (e) {
		var now = new Date();
        alert(now);
		 e.preventDefault();
		  var data={};
		  var formData = $('#add-event').serializeArray();  
		  $.each(formData, function (index, v) {
		        data["" + v.name + ""] = v.value;
		    });
		  addingBook(data);
		});
		function addingBook(data) {
				   $.ajax({
		            type: "POST",
		  		    url: "${ApiUrl}",
		            data: JSON.stringify(data),
		            dataType: "json",
		            contentType: "application/json",
		            success: function (response) {  
		            	swal("Thành công", "Sản phẩm đã được lưa", "success");
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
		  jQuery("#add-event").submit(function(){
		    /*   alert("Submitted"); */
		      /* var values = {};
		      $.each($('#add-event').serializeArray(), function(i, field) {
		          values[field.name] = field.value;
		      }); */
		     /*  console.log(
		        values
		      ); */
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
		    var start = timeFormat(new Date('#event-start'));
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
						right: 'today prev,next'
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
					        jQuery('.event-icon').html("<i class='fa fa-"+event.icon+"'></i>");
							jQuery('.event-title').html(event.title);
							jQuery('.event-body').html(event.description);
							jQuery('.event-start').html(timeFormat(event.start));
							jQuery('.event-status').html(event.status);
							jQuery('.eventUrl').attr('href',event.url);
							jQuery('#modal-view-event').modal();
					},
				})
			});
		  
		})(jQuery);
	
	</script>
</body>
</html>