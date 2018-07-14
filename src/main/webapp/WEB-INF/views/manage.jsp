<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.github.scribejava.core.model.OAuth2AccessToken"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GTG</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="resources/plugins/daterangepicker/daterangepicker-bs3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="resources/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="resources/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="resources/plugins/select2/select2.min.css">
<!-- fullCalendar 2.2.5-->
<link rel="stylesheet"
	href="resources/plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet"
	href="resources/plugins/fullcalendar/fullcalendar.print.css" media="print">
<!-- Theme style -->
<link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fa fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="/" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<!-- SEARCH FORM -->
			<form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell-o"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fa fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fa fa-users mr-2"></i>
							8 friend requests <span class="float-right text-muted text-sm">12
								hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fa fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"><i
						class="fa fa-th-large"></i></a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/" class="brand-link"> <img
				src="resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">GTG</span>
			</a>
			<!-- Sidebar -->
			<div class="sidebar">
			<%
				Object obj=session.getAttribute("logincheck");
				if(obj==null || obj.equals("")){
			%>
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="" class="img-circle elevation-2"
							alt="User Image" >
					</div>
					<div class="info">
						<h4 class="d-block"><font color="white">no login</h4></font>
					</div>
				</div>
			<% 
				}
				else{
			
			%>
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="<%=session.getAttribute("profile_image")%> class="img-circle elevation-2"
							alt="User Image" >
					</div>
					<div class="info">
						<h4 class="d-block"><font color="white"><%=session.getAttribute("name") %>님</h4></font>
					</div>
				</div>
<%
				}

%>
				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="/create" class="nav-link">
								<i class="nav-icon fa fa-th"></i>
								<p>시간표 조건 설정</p>
						</a></li>
						<li class="nav-item"><a href="/search" class="nav-link">
								<i class="nav-icon fa fa-th"></i>
								<p>강의 조회</p>
						</a></li>
						<li class="nav-item"><a href="/manage"
							class="nav-link active"> <i class="nav-icon fa fa-th"></i>
								<p>
									내 시간표 관리 <span class="right badge badge-danger">New</span>
								</p>
						</a></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">내 시간표 관리</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Login</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">저장된 시간표</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body p-0">
									<table class="table table-condensed">
										<tbody>
											<tr>
												<th style="width: 10px">#</th>
												<th>시간표 이름</th>
												<th style="width: 10%">보기</th>
												<th style="width: 10%">삭제</th>
											</tr>
											<tr>
												<td>1.</td>
												<td>시간표 1</td>
												<td>
													<button class="btn btn-block btn-success" type="button">보기</button>
												</td>
												<td>
													<button class="btn btn-block btn-danger" type="button">삭제</button>
												</td>
											</tr>
											<tr>
												<td>2.</td>
												<td>시간표 2</td>
												<td>
													<button class="btn btn-block btn-success" type="button">보기</button>
												</td>
												<td>
													<button class="btn btn-block btn-danger" type="button">삭제</button>
												</td>
											</tr>
											<tr>
												<td>3.</td>
												<td>시간표 3</td>
												<td>
													<button class="btn btn-block btn-success" type="button">보기</button>
												</td>
												<td>
													<button class="btn btn-block btn-danger" type="button">삭제</button>
												</td>
											</tr>
											<tr>
												<td>4.</td>
												<td>시간표 4</td>
												<td>
													<button class="btn btn-block btn-success" type="button">보기</button>
												</td>
												<td>
													<button class="btn btn-block btn-danger" type="button">삭제</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">시간표</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body p-0">
									<!-- THE CALENDAR -->
									<div id="calendar"></div>
								</div>
								<!-- /.card-body -->
							</div>

						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
			<div class="p-3">
				<h5>Title</h5>
				<p>Sidebar content</p>
			</div>
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="float-right d-none d-sm-inline">Anything you want</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2014-2018 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script src="resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Select2 -->
	<script src="resources/plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="resources/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="resources/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="resources/plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="resources/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="resources/dist/js/demo.js"></script>
	<!-- Page script -->
	<script>
		$(function() {
			//Initialize Select2 Elements
			$('.select2').select2()

			//Datemask dd/mm/yyyy
			$('#datemask').inputmask('dd/mm/yyyy', {
				'placeholder' : 'dd/mm/yyyy'
			})
			//Datemask2 mm/dd/yyyy
			$('#datemask2').inputmask('mm/dd/yyyy', {
				'placeholder' : 'mm/dd/yyyy'
			})
			//Money Euro
			$('[data-mask]').inputmask()

			//Date range picker
			$('#reservation').daterangepicker()
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				format : 'MM/DD/YYYY h:mm A'
			})
			//Date range as a button
			$('#daterange-btn').daterangepicker(
					{
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract(1, 'days'),
									moment().subtract(1, 'days') ],
							'Last 7 Days' : [ moment().subtract(6, 'days'),
									moment() ],
							'Last 30 Days' : [ moment().subtract(29, 'days'),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract(1, 'month').startOf(
											'month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						},
						startDate : moment().subtract(29, 'days'),
						endDate : moment()
					},
					function(start, end) {
						$('#reportrange span').html(
								start.format('MMMM D, YYYY') + ' - '
										+ end.format('MMMM D, YYYY'))
					})

			//iCheck for checkbox and radio inputs
			$('input[type="checkbox"].minimal, input[type="radio"].minimal')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-blue',
						radioClass : 'iradio_minimal-blue'
					})
			//Red color scheme for iCheck
			$(
					'input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-red',
						radioClass : 'iradio_minimal-red'
					})
			//Flat red color scheme for iCheck
			$('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
					.iCheck({
						checkboxClass : 'icheckbox_flat-green',
						radioClass : 'iradio_flat-green'
					})

			//Colorpicker
			$('.my-colorpicker1').colorpicker()
			//color picker with addon
			$('.my-colorpicker2').colorpicker()

			//Timepicker
			$('.timepicker').timepicker({
				showInputs : false
			})
		})
	</script>

	<!-- fullCalendar 2.2.5 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script src="resources/plugins/fullcalendar/fullcalendar.min.js"></script>
	<!-- Page specific script -->
	<script>
		$(function() {

			/* initialize the external events
			 -----------------------------------------------------------------*/
			function ini_events(ele) {
				ele.each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					}

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject)

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 1070,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					})

				})
			}

			ini_events($('#external-events div.external-event'))

			/* initialize the calendar
			 -----------------------------------------------------------------*/
			//Date for the calendar events (dummy data)
			var date = new Date()
			var d = date.getDate(), m = date.getMonth(), y = date.getFullYear()
			$('#calendar').fullCalendar(
					{
						header : {
							left : 'prev,next',
							center : 'title',
							right : 'agendaWeek'
						},
						defaultView : 'agendaWeek',
						minTime : "09:00:00",
						maxTime : "22:00:00",
						hiddenDays : [ 0, 6 ],
						buttonText : {
							today : 'today',
							month : 'month',
							week : 'week',
							day : 'day'
						},
						//Random default events
						events : [ {
							title : 'Java',
							start : new Date(y, m, d, 9, 0),
							end : new Date(y, m, d, 11, 50),
							allDay : false,
							backgroundColor : '#0073b7', //Blue
							borderColor : '#0073b7' //Blue
						}, {
							title : 'C++',
							start : new Date(y, m, d + 1, 9, 0),
							end : new Date(y, m, d + 1, 11, 50),
							allDay : false,
							backgroundColor : '#00c0ef', //Info (aqua)
							borderColor : '#00c0ef' //Info (aqua)
						}, {
							title : 'Software Design',
							start : new Date(y, m, d + 1, 13, 0),
							end : new Date(y, m, d + 1, 15, 50),
							allDay : false,
							backgroundColor : '#00a65a', //Success (green)
							borderColor : '#00a65a' //Success (green)
						}, {
							title : 'Click for Google',
							start : new Date(y, m, 28),
							end : new Date(y, m, 29),
							url : 'http://google.com/',
							backgroundColor : '#3c8dbc', //Primary (light-blue)
							borderColor : '#3c8dbc' //Primary (light-blue)
						} ],
						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar !!!
						drop : function(date, allDay) { // this function is called when something is dropped

							// retrieve the dropped element's stored Event Object
							var originalEventObject = $(this).data(
									'eventObject')

							// we need to copy it, so that multiple events don't have a reference to the same object
							var copiedEventObject = $.extend({},
									originalEventObject)

							// assign it the date that was reported
							copiedEventObject.start = date
							copiedEventObject.allDay = allDay
							copiedEventObject.backgroundColor = $(this).css(
									'background-color')
							copiedEventObject.borderColor = $(this).css(
									'border-color')

							// render the event on the calendar
							// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
							$('#calendar').fullCalendar('renderEvent',
									copiedEventObject, true)

							// is the "remove after drop" checkbox checked?
							if ($('#drop-remove').is(':checked')) {
								// if so, remove the element from the "Draggable Events" list
								$(this).remove()
							}

						}
					})

			/* ADDING EVENTS */
			var currColor = '#3c8dbc' //Red by default
			//Color chooser button
			var colorChooser = $('#color-chooser-btn')
			$('#color-chooser > li > a').click(function(e) {
				e.preventDefault()
				//Save color
				currColor = $(this).css('color')
				//Add color effect to button
				$('#add-new-event').css({
					'background-color' : currColor,
					'border-color' : currColor
				})
			})
			$('#add-new-event').click(function(e) {
				e.preventDefault()
				//Get value and make sure it is not null
				var val = $('#new-event').val()
				if (val.length == 0) {
					return

					

										

					

				}

				//Create events
				var event = $('<div />')
				event.css({
					'background-color' : currColor,
					'border-color' : currColor,
					'color' : '#fff'
				}).addClass('external-event')
				event.html(val)
				$('#external-events').prepend(event)

				//Add draggable funtionality
				ini_events(event)

				//Remove event from text input
				$('#new-event').val('')
			})
		})
	</script>
</body>
</html>
