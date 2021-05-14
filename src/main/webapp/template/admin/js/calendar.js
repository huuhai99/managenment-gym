$(document).ready(function() {
	$('#t').css('color','red');
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next,today',
			center: 'title',
			right: 'listmonth,listweek,listday'
		},
		views : {
			listday : {
				buttonText : 'list day'
			},
			listweek : {
				buttonText : 'list week'
			}
			
		},
		defaultView :'day',
		defaultDate: '2021-05-18',
		navLinks : true,
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: 'http://localhost:8080/spring-mvc/findAll'
	});
	
});