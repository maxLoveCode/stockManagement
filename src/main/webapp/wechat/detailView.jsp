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
        
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <style>
  /* Make the image fully responsive */
  .carousel-inner img { 
      width: 100%;
    
        }
  </style>  
	</head>
	<body >
	<ion-view title="Home" hide-nav-bar="true">
      <ion-scroll   style="height: 94%">
		<%--  <div class="item item-image">
			<img src="${warehouse.frontPage}">
		</div> --%>
		
 
			<div id="demo" class="carousel slide" data-ride="carousel">
 
  <!-- 指示符 -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
 
  <!-- 轮播图片 -->
  <div class="carousel-inner controller">
    <div class="item active item-image">
      <img src="${warehouse.frontPage}?imageView2/1/w/400/h/267/q/100|imageslim">
    </div>
    <div class="item item-image">
      <img src="${warehouse.frontPage1}?imageView2/1/w/400/h/267/q/100|imageslim">
    </div>
    <div class="item item-image">
      <img src="${warehouse.frontPage2}?imageView2/1/w/400/h/267/q/100|imageslim">
    </div>
   <!--  <div class="carousel-item item-image">
      <img src="http://ozsr8m125.bkt.clouddn.com/1512355114399?imageView2/1/w/400/h/267/q/100|imageslim">
    </div> -->
  </div>
 
  <!-- 左右切换按钮 -->
  <!-- <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a> -->

</div>
			
				<div class="list">

					<div class="item item-input">
						<div class="input-label">
							<b><span style="color:#2a3380">仓库名称</span></b>
						</div>
						${warehouse.name}
					</div>

					<div class="item item-input" >
						<div class="input-label" >
							<b><span style="color:#2a3380">所在地址</span></b>
						</div>
						<table>
						<tr><td width="220px">${warehouse.address}</td></tr>
						
						</table>
					</div>

					<div class="item item-input ">
						<div class="input-label">
							<b><span style="color:#2a3380">面积</span></b>
						</div>
						${warehouse.area}平方米
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