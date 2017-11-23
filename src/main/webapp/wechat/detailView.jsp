<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html ng-app="ionicApp">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<title>菜鸟教程(runoob.com)</title>
		<link href="https://cdn.bootcss.com/ionic/1.3.2/css/ionic.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/ionic/1.3.2/js/ionic.bundle.min.js"></script>
		<style>
			.col {
				background-color: #4aa0e5;
				padding: 5px;
				border: 1px solid #ddd;
				border-radius: 2px;
				text-align: center;
			}
			.co {
				background-color: #8ab9df;
				padding: 5px;
				border: 1px solid #ddd;
				border-radius: 2px;
				text-align: center;
			}
		</style>
	</head>
	<body>

		<div class="bar bar-header bar-positive">
			<a class="button icon-right ion-chevron-left button-positive"></a>
			<h1 class="title">${warehouse.name}</h1>
		</div>
		<div class="item item-image">
			<img src="img/1.png">
		</div>

				<div class="list">

					<div class="item item-input">
						<div class="input-label">
							<b><span style="color:#3333CC">物业类型</span></b>
						</div>
						单栋两层库
					</div>

					<div class="item item-input">
						<div class="input-label">
							<b><span style="color:#3333CC">  所在地址</span></b>
						</div>
						上海市普陀区金达路428号 &nbsp;&nbsp;<a href=""><i class="ion ion-android-pin"></i></a>
					</div>

					<div class="item item-input ">
						<div class="input-label">
							<b><span style="color:#3333CC">面积</span></b>
						</div>
						5000平米
					</div>

					<div class="item item-input ">
						<div class="input-label">
							<b><span style="color:#3333CC">  联系电话</span></b>
						</div>
						021-62761667
					</div>
				<a class="button button-clear button-energized button-full">
					<b>——————     我们的优势       ——————</b>
				</a>

				<div class="row">
					<div class="col">
						<div class="col-demo"></div>
					</div>
					<div class="col">
						<div class="col-demo">.col</div>
					</div>
					<div class="col">
						<div class="col-demo">.col</div>
					</div>
					<div class="col">
						<div class="col-demo">.col</div>
					</div>
					<div class="col">
						<div class="col-demo">.col</div>
					</div>
				</div>
				<div class="row">
					<div class="col co">.col.col-50</div>
					<div class="col col-75 co">.col</div>
				</div>
				<div class="row">
					<div class="col co">.col.col-50</div>
					<div class="col col-75 co">.col</div>
				</div>
				<div class="row">
					<div class="col co">.col.col-50</div>
					<div class="col col-75 co">.col</div>
				</div>
				<div class="row">
					<div class="col co">.col</div>
					<div class="col co">.col</div>
				</div>
			</div>
		<div class="bar bar-footer bar-positive">
			<div class="title">预约参观</div>
		</div>
	</body>

</html>