<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<ion-view title="Home" hide-nav-bar="true">
      <ion-scroll zooming="true"  style="height: 94%">
		<div class="item item-image">
			<img src="${warehouse.frontPage}">
		</div>

				<div class="list">

					<div class="item item-input">
						<div class="input-label">
							<b><span style="color:#2a3380">仓库名称</span></b>
						</div>
						${warehouse.name}
					</div>

					<div class="item item-input">
						<div class="input-label">
							<b><span style="color:#2a3380">所在地址</span></b>
						</div>
						${warehouse.address} &nbsp;&nbsp;<a href=""></a>
					</div>

					<div class="item item-input ">
						<div class="input-label">
							<b><span style="color:#2a3380">面积</span></b>
						</div>
						${warehouse.area}&nbsp;&nbsp;平方米
					</div>

					<div class="item item-input ">
						<div class="input-label">
							<b><span style="color:#2a3380">  联系电话</span></b>
						</div>
						<span style="color:#2a3380">${warehouse.contact} </span>
					</div>
					<c:if test="${warehouse.article!=null}">
					<div class="article" style="padding:15px">
						${warehouse.article}
					</div>
					</c:if>
			</div> 
      		</ion-scroll>
    </ion-view>
    	<div class="bar bar-footer bar-positive " style="background-color: #2a3380;">
			 <a href="${pageContext.request.contextPath}/order/appointmentIndex?id=${warehouse.id}"><div  class="title">预约参观</div></a>
		</div>
		
	</body>
	
</html>