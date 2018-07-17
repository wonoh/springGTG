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
											<option value="CE0140">행정학과</option>
<option value="CE0320">미디어커뮤니케이션학과</option>
<option value="CE0290">언론영상광고학과</option>
<option value="CE2140">관광경영학과</option>
<option value="CE0122">글로벌경제학과</option>
<option value="CE0129">글로벌경제학과(국제무역전공)</option>
<option value="CE0132">글로벌경제학과(야)(국제무역전공)</option>
<option value="CE0123">글로벌경제학과(야)</option>
<option value="CE0275">헬스케어경영학과</option>
<option value="CE0270">글로벌헬스케어경영학과</option>
<option value="CE0240">응용통계학과</option>
<option value="CE1290">사회복지학과</option>
<option value="CE0260">유아교육학과</option>
<option value="CE0124">국제통상학과</option>
<option value="CE0125">국제통상학과(야)</option>
<option value="CE0127">무역학과</option>
<option value="CE0128">무역학과(야)</option>
<option value="CE0126">경제학과</option>
<option value="CE0130">신문방송학과</option>
<option value="CE1160">사회과학대학연계</option>
<option value="CE1150">경찰학 연계전공</option>
<option value="CP0110">경영학과</option>
<option value="CP0130">경영학부(경영학)</option>
<option value="CP0140">경영학부(글로벌경영학)</option>
<option value="CP0111">경영학과(야)</option>
<option value="CP0115">경영학과(경영학트랙)</option>
<option value="CP0117">경영학과(경영학트랙)(야)</option>
<option value="CP0116">경영학과(글로벌경영학트랙)</option>
<option value="CP0121">경영·회계학부(야)</option>
<option value="CP0510">지식산업인재학부(야)</option>
<option value="CP0511">경영학전공(야)</option>
<option value="CP0152">회계·세무학과</option>
<option value="CP0153">회계·세무학과(야)</option>
<option value="CP0261">글로벌경영학과(야)</option>
<option value="CP0610">금융수학과</option>
<option value="CP0620">수학·금융정보학과</option>
<option value="CP0630">수리과학과</option>
<option value="CP0640">수학정보학과</option>
<option value="C12110">한국어문학과</option>
<option value="C12130">영미어문학과</option>
<option value="C12131">영미어문학과(야)</option>
<option value="C12170">동양어문학과</option>
<option value="C12181">유럽어문학과(독일어전공)</option>
<option value="C12171">동양어문학과(일본어전공)</option>
<option value="C12172">동양어문학과(중국어전공)</option>
<option value="C12182">유럽어문학과(프랑스어전공)</option>
<option value="C12180">유럽어문학과</option>
<option value="C12120">중국어문학과</option>
<option value="C10120">중어중문학과</option>
<option value="C10130">영어영문학과</option>
<option value="C10131">영어영문학과(야)</option>
<option value="C10140">독어독문학과</option>
<option value="C12140">독일어문학과</option>
<option value="C10150">불어불문학과</option>
<option value="C12150">프랑스어문학과</option>
<option value="C10160">일어일문학과</option>
<option value="C12160">일본어문학과</option>
<option value="C10110">국어국문학과</option>
<option value="CL0110">법학과</option>
<option value="CL0160">경찰·안보학과</option>
<option value="CL0290">언론영상광고학과</option>
<option value="CL0280">신문방송학과</option>
<option value="CL1160">법과대학연계</option>
<option value="CL1150">경찰학 연계전공</option>
<option value="C61120">도시계획·조경학부</option>
<option value="C60250">조경학전공</option>
<option value="C60110">도시계획학과</option>
<option value="C60120">조경학과</option>
<option value="C60220">실내건축학과</option>
<option value="C60130">건축학과</option>
<option value="C60720">건축공학과</option>
<option value="C60170">전기공학과</option>
<option value="C60735">설비플랜트·소방방재공학과</option>
<option value="C60740">설비·소방공학과</option>
<option value="C61280">화공생명공학과</option>
<option value="C61290">환경에너지공학과</option>
<option value="C60685">기계공학과</option>
<option value="C60530">토목환경공학과</option>
<option value="C60531">토목환경공학과(야)</option>
<option value="C60545">산업경영공학과</option>
<option value="C61240">공과대학연계</option>
<option value="C60700">디스플레이 연계전공</option>
<option value="C61250">에너지생명공학부</option>
<option value="C61260">화공생명공학전공</option>
<option value="C61270">환경에너지공학전공</option>
<option value="C60710">건축설비공학과</option>
<option value="C60730">소방방재공학과</option>
<option value="C60230">식품생물공학과</option>
<option value="C60680">기계·자동차공학과</option>
<option value="C60540">산업정보시스템공학과</option>
<option value="CK2230">식품생물공학과</option>
<option value="CK0130">영양학과</option>
<option value="CK0135">식품영양학과</option>
<option value="CK1100">바이오나노학부</option>
<option value="CK0100">바이오메디컬전공</option>
<option value="CK0110">나노시스템전공</option>
<option value="CK1200">바이오나노학과</option>
<option value="CK1210">생명과학과</option>
<option value="CK1230">나노물리학과</option>
<option value="CK1240">나노화학과</option>
<option value="CK1235">물리학과</option>
<option value="CK1245">화학과</option>
<option value="CK0200">바이오나노연계학부</option>
<option value="CK0210">바이오나노 연계전공</option>
<option value="CJ1200">소프트웨어설계·경영학과</option>
<option value="CJ1205">소프트웨어학과</option>
<option value="CJ0200">컴퓨터공학과</option>
<option value="CJ0190">전자공학과</option>
<option value="CJ0160">전자공학과(야)</option>
<option value="CJ0230">에너지IT학과</option>
<option value="CJ1225">수학·금융정보학과</option>
<option value="CJ1235">수리과학과</option>
<option value="CJ1110">소프트웨어학부</option>
<option value="CJ0110">컴퓨터소프트웨어전공</option>
<option value="CJ1120">전자·정보통신공학부</option>
<option value="CJ0150">정보통신공학전공</option>
<option value="CJ1212">컴퓨터미디어융합학과</option>
<option value="CJ1210">인터랙티브미디어학과</option>
<option value="CJ1150">디스플레이연계</option>
<option value="CJ1160">디스플레이 연계전공</option>
<option value="C50110">한의예과</option>
<option value="C50120">한의학과</option>
<option value="CR4110">미술·디자인학부</option>
<option value="CR4120">미술·디자인학부(회화·조소)</option>
<option value="CR4130">미술·디자인학부(시각디자인)</option>
<option value="CR4140">미술·디자인학부(산업디자인)</option>
<option value="CR4150">미술·디자인학부(패션디자인)</option>
<option value="CR4160">미술·디자인학부(디자인)</option>
<option value="CR5120">음악학부(성악)</option>
<option value="CR5130">음악학부(기악)</option>
<option value="CR5140">음악학부(작곡)</option>
<option value="CR6120">체육학부(체육)</option>
<option value="CR6140">사회체육학과</option>
<option value="CR6150">체육학과</option>
<option value="CR6130">체육학부(태권도)</option>
<option value="CR6135">태권도학과</option>
<option value="CR6136">태권도·경호학과</option>
<option value="CR7110">연기예술학과</option>
<option value="CR7120">연기예술과</option>
<option value="CR0110">회화과</option>
<option value="CR0120">조소과</option>
<option value="CR0130">섬유미술과</option>
<option value="CR1200">시각디자인과</option>
<option value="CR1210">산업디자인과</option>
<option value="CR1190">포토그라피연계</option>
<option value="CR0230">포토그라피 연계전공</option>
<option value="CR3110">성악과</option>
<option value="CR3120">관현악과</option>
<option value="CR3130">피아노과</option>
<option value="CR3140">작곡과</option>
<option value="CR4155">의상학과</option>
<option value="CM3140">자유전공(인문)</option>
<option value="CM3150">가천리버럴아츠칼리지</option>
<option value="CM4110">나노기반 기능성 신소재 연계전공</option>
<option value="CM4120">기능성 생물소재 연계전공</option>
<option value="CM0140">자유전공(인문)</option>
<option value="CM4130">미디어 컴퓨터 연계전공</option>
<option value="CM4140">데이터 과학 연계전공</option>
<option value="CM4150">지능형 행정시스템 연계전공</option>
<option value="CM4160">생명과학과 윤리 연계전공</option>
<option value="CM4170">인지과학 부전공</option>
<option value="CM4180">디지털엔터테인먼트 부전공</option>
<option value="CM4190">지능형 데이터 분석 및 보안 연계전공</option>
<option value="CM4200">화장품공학 연계전공</option>
<option value="CM0110">자유전공학부(인문)</option>
<option value="CG0110">회화과</option>
<option value="CG1200">시각디자인과</option>
<option value="CG1210">산업디자인과</option>
<option value="CG1140">미술디자인대학연계</option>
<option value="CG0180">디지털디자인 연계전공</option>
<option value="CG1190">포토그라피연계</option>
<option value="CG0230">포토그라피 연계전공</option>
<option value="C80140">작곡과</option>
<option value="C90110">의상학과</option>
<option value="C90290">사회복지학과</option>
<option value="C90280">아동복지학과</option>
<option value="C90130">식품영양학과</option>
<option value="C90270">간호학과</option>
<option value="C90150">사회체육학과</option>
<option value="C20110">경영학과</option>
<option value="C20111">경영학과(야)</option>
<option value="C21120">경영·회계학부</option>
<option value="C20160">경영학전공</option>
<option value="C20220">회계·세무학전공</option>
<option value="C20152">회계·세무학과</option>
<option value="C20120">무역학과</option>
<option value="C20121">무역학과(야)</option>
<option value="C20122">국제통상학과</option>
<option value="C20123">국제통상학과(야)</option>
<option value="C20140">관광경영학과</option>
<option value="C20130">경제학과</option>
<option value="C20270">글로벌헬스케어경영학과</option>
<option value="C20230">의료경영학과</option>
<option value="C20240">응용통계학과</option>
<option value="C20280">신문방송학과</option>
<option value="CQ0110">도시계획학과</option>
<option value="CQ0120">조경학과</option>
<option value="CQ0220">실내건축학과</option>
<option value="C40210">수학정보학과</option>
<option value="CM1110">자유전공(인문)</option>
<option value="CM0120">교직과</option>
<option value="CC0110">학점교류학과</option>
<option value="CC0111">학점교류전공</option>
<option value="Y51110">간호학과</option>
<option value="Y54120">치위생학과</option>
<option value="Y54130">응급구조학과</option>
<option value="Y54140">방사선학과</option>
<option value="Y54150">물리치료학과</option>
<option value="Y54170">의용생체공학과</option>
<option value="Y54160">운동재활복지학과</option>
<option value="Y54110">의공학과</option>
<option value="Y53110">약학과</option>
<option value="Y12121">경영전공</option>
<option value="Y12124">경영전공(계약학과)</option>
<option value="Y12122">국제통상전공</option>
<option value="Y12123">컨벤션산업전공</option>
<option value="Y12231">생명과학과</option>
<option value="Y12232">약과학과</option>
<option value="Y12222">식품영양학과</option>
<option value="Y12221">보건행정학과</option>
<option value="Y12312">보건환경시스템학과</option>
<option value="Y12313">산업디자인학과</option>
<option value="Y12311">IT학과</option>
<option value="Y12324">컴퓨터공학전공</option>
<option value="Y12323">정보통신전공</option>
<option value="Y12325">전자공학전공</option>
<option value="Y12321">정보처리전공</option>
<option value="Y12322">유비쿼터스컴퓨팅전공</option>
<option value="Y12326">멀티미디어전공</option>
<option value="Y12406">체육전공(계약학과)</option>
<option value="Y12404">체육전공</option>
<option value="Y12405">운동복지전공</option>
<option value="Y12402">체육학과</option>
<option value="Y12403">건강관리전공</option>
<option value="Y12502">교양학과</option>
<option value="Y12503">자율전공학과</option>
<option value="Y12111">경영학과</option>
<option value="Y55110">의예과</option>
<option value="Y55120">의학과</option>
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
                    				<th style="width: 40px">학점</th>
                    				<th style="width: 40px">강의시간</th>
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
                    				<td>${cvlist.time}</td>
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
