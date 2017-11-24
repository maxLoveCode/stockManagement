<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html ng-app="ionicApp">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<title>郑明 - 仓库详情</title>
		<link href="https://cdn.bootcss.com/ionic/1.3.2/css/ionic.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/ionic/1.3.2/js/ionic.bundle.min.js"></script>
		 <script type="text/javascript">
        angular.module('ionicApp', ['ionic']);
        </script>
	</head>
	<body>
	<div class="bar bar-header bar-positive">
			<a class="button icon-right ion-chevron-left button-positive" href="../weindex"></a>
			<h1 class="title">${warehouse.name}</h1>
		</div>
	<ion-view title="Home" hide-nav-bar="true">
      <ion-scroll zooming="true" direction="xy" style="width: 500px; height: 500px">
		<div class="item item-image">
			<img src="${warehouse.frontPage}">
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
							<b><span style="color:#3333CC">所在地址</span></b>
						</div>
						${warehouse.address} &nbsp;&nbsp;<a href=""><i class="ion ion-android-pin"></i></a>
					</div>

					<div class="item item-input ">
						<div class="input-label">
							<b><span style="color:#3333CC">面积</span></b>
						</div>
						${warehouse.area}
					</div>

					<div class="item item-input ">
						<div class="input-label">
							<b><span style="color:#3333CC">  联系电话</span></b>
						</div>
						${warehouse.contact}
					</div>
					
					
					
					<div class="item item-input ">
						
						${warehouse.article}
					</div>
					<div class="item item-input ">
						
						<br><br>
					</div>
			</div>
      		</ion-scroll>
    </ion-view>
    	<div class="bar bar-footer bar-positive">
			 <a href="${pageContext.request.contextPath}/order/appointmentIndex"><div class="title">预约参观</div></a>
		</div>
		
	</body>
	
</html>