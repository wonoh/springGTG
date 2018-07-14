<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<%
 
    request.setCharacterEncoding("UTF-8");

%>

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
	href="/plugins/daterangepicker/daterangepicker-bs3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="../../plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="/plugins/select2/select2.min.css">
<!-- fullCalendar 2.2.5-->
<link rel="stylesheet"
	href="/plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet"
	href="/plugins/fullcalendar/fullcalendar.print.css" media="print">
<!-- Theme style -->
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
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
				src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
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
						<li class="nav-item"><a href="/search" class="nav-link active">
								<i class="nav-icon fa fa-th"></i>
								<p>강의 조회</p>
						</a></li>
						<li class="nav-item"><a href="/manage" class="nav-link">
								<i class="nav-icon fa fa-th"></i>
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
							<h1 class="m-0 text-dark">강의 조회</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">강의 조회</li>
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
			<form action="/searchcourse" method="post">
			<div class="content">
				<div class="container-fluid">
					
					<!-- SELECT2 EXAMPLE -->
					<div class="card card-default">
						<div class="card-header">
							<h3 class="card-title">조건</h3>

							<div class="card-tools"></div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">

							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>강의명</label>
										<div class="input-group input-group-sm">
											
											<input class="form-control" type="text"
												placeholder="강의명을 입력하세요" name="coursename">
											<div class="input-group-append">
												<div class="btn btn-primary">
													<i class="fa fa-search"></i>
												</div>
											</div>
										</div>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								
								<div class="col-md-2">
									<div class="form-group">
										<label>년도</label> <select class="form-control select2"
											style="width: 100%;" name="year">
											<option>2016년</option>
											<option>2017년</option>
											<option selected="selected">2018년</option>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-2">
									<div class="form-group">
										<label>학기</label> <select class="form-control select2"
											style="width: 100%;" name="semester">
											<option selected="selected">1학기</option>
											<option>2학기</option>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-2">
									<div class="form-group">
									
										<label>학년</label> <select class="form-control select2"
											style="width: 100%;" name="grade">
											<option selected="selected" value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								<div class="col-md-2">
									<div class="form-group">
										<label>학과</label> <select class="form-control select2"
											style="width: 100%;" name="major">
											<option value="컴퓨터공학과">컴퓨터공학과</option>
											<option value="행정학과">행정학과</option>
											<option value="법학과">법학과</option>
											<option value="간호학과">간호학과</option>
										</select>
									</div>

									<!-- /.form-group -->
								</div>
								<!-- /.col -->
							</div>
							
							<div class="box-body">
           					 <table class="table table-bordered">
               				 <tbody>
                				<tr>
                    				<th style="width:130px">학수번호</th>
                    				<th style="width: 100px">과목명</th>
                    				<th style="width: 150px">학점</th>
                    				<th style="width: 60px">정원</th>
                    				<th style="width: 60px">담당교수</th>
                    				<th style="width: 60px">강의실</th>
                    				<th style="width: 60px">학과</th>
                				</tr>
                				<c:forEach items="${cvlist}" var="cvlist">
	                				<tr>
                    				<td>${cvlist.code}</td>
                    				<td>${cvlist.title}</td>
                    				<td>${cvlist.credit}</td>
                    				<td>${cvlist.quota}</td>
                    				<td>${cvlist.instructor}</td>
                    				<td>${cvlist.room}</td>
                    				<td>${cvlist.grade}</td>
                				</tr>
								</c:forEach>
                			</tbody>
            				</table>
            		
        					</div>
        				
							<!-- /.row -->
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button class="btn btn-block btn-success" type="submit"
								style="width: 100px;">조회</button>
						</div>
						
					</div>
					
					<!-- /.card -->

				</div>
				<!-- /.container-fluid -->
			</div>
			</form>
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
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Select2 -->
	<script src="../../plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="../../plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="../../plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="../../plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
</body>
</html>
