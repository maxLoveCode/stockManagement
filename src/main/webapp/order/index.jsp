<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>订单管理</title>
<%@ include file="/common/header.jsp"%>

</head>
<body>
<script type="text/javascript">

<%@ include file="/common/dateFormatter.jsp" %>
$(function() {
	$('#dg')
			.datagrid(
					{
						url : "${pageContext.request.contextPath}"
								+ '/order/orderList',
						toolbar : '#toolbar',
						columns : [ [
								{
									field : 'id',
									title : '订单id',
									width : 100,
									align : 'right'
								},
								{
									field : 'visitName',
									title : '联系人',
									width : 100
								},
								{
									field : 'phone',
									title : '联系电话',
									width : 100
								},
								{
									field : 'company',
									title : '公司名称',
									width : 100
								},
								{
									field : 'name',
									title : '仓库名称',
									width : 100
								},
								{
									field : 'visitTime',
									title : '访问时间',
									width : 100
								},
								{
									field : 'createtime',
									title : '创建日期',
									formatter : formatDate,
									width : 180
								}]]
					});

});


</script>
<table id="dg" class="easyui-datagrid" rownumbers="true"
		data-options="fit:true,pagination:true,singleSelect:true">
</table>


</body>

<script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>
</html>