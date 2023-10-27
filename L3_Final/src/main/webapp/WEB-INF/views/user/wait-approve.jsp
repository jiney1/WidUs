<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../resources/mainboard/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>가입대기</title>
<meta name="description" content="" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="../resources/user/js/wait-approve.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../resources/mainboard/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../resources/mainboard/assets/js/config.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.container {
	margin-top: 25px;
}

.card {
	width: 100%;
	height: 100%;
}

.btn_move {
	font-size: 20px;
	border: none;
	border-radius: 5px;
	color: white;
	background-color: #9F7AB0;
	width: 300px;
	height: 60px;
	margin-left: 550px;
}

.btn_cancel{
	font-size: 15px;
	border: none;
	border-radius: 5px;
	color: white;
	background-color: #9F7AB0;
	width: 200px;
	height: 50px;
	
}

.cancel-link {
	cursor: pointer;
	text-decoration: underline;
}

.cancelwait {
	margin: 30px 0px 30px 600px;
}
</style>
</head>

<body>

	<div class="container">
		<div class="card">
			<form action="admin/wait-approve" method="GET">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
					 
				
				<h2 style="text-align: center; margin-top: 60px;">가입 요청 완료</h2>
				<img src="../resources/admin/image/wait.png"
					style="width: 400px; height: 300px; margin-left: 37%;" /> <br>
				<h4 style="text-align: center;">회사 관리자에게 가입 요청</h4>
				<p style="text-align: center;">관리자 승인 완료 시 접속할 수 있습니다.
				<div class="moveToLogin">
					<button class="btn_move" type="button">
						로그인페이지로 이동</button>
				</div>

				<div class="cancelwait">
					<button class="btn_cancel" type="button" >
					가입 요청 취소</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>