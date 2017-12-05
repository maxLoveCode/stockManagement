<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>车辆管理</title>
<%@ include file="/common/header.jsp"%>
<%@ include file="/common/MCchat.jsp"%>
<script
	src="${pageContext.request.contextPath}/static/plupload/moxie.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/plupload/plupload.full.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/qiniu/qiniu.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/photview/viewer.min.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/static/photview/viewer.min.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.1&key=bcff4cb66f501fd52e67bf44cf5a4a65&plugin=AMap.DistrictSearch"></script>
<script src="${pageContext.request.contextPath}/static/ckeditor3/ckeditor.js"></script>

<script type="text/javascript">
	$(function() {
		$('#dg')
				.datagrid(
						{
							url : "${pageContext.request.contextPath}"
									+ '/warehouse/list',
							toolbar : '#toolbar',
							columns : [ [
									{
										field : 'id',
										title : '仓库id',
										width : 100,
										align : 'right'
									},
									{
										field : 'name',
										title : '仓库名称',
										width : 100
									},
									{
										field : 'province',
										title : '仓库区域',
										width : 100
									},
									{
										field : 'district',
										title : '区',
										width : 100
									},
									{
										field : 'city',
										title : '市',
										width : 100
									},
									{
										field : 'contact',
										title : '联系方式',
										width : 100
									},
									{
										field : 'address',
										title : '仓库地址',
										width : 100
									},
									{
										field : 'createtime',
										title : '创建日期',
										formatter : formatDate,
										width : 180
									},
									{
										field : 'url',
										title : '资质/图片',
										formatter : function(data) {
											var list = data;
											if (list != null) {
												var div = document
														.createElement("div");
												var ul = document
														.createElement("ul");
												ul.className = "images"
												$(ul).css("list-style-type",
														"none");
												for (i = 0; i < list.length; i++) {
													var li = document
															.createElement("li");
													$(li).css("float", "left");
													var img = document
															.createElement("img");
													$(img).css("width", "100")
													$(img).css("height", "100")
													$(img).css("padding", "5")
													var src = "http://"
															+ list[i]
															+ "?imageView2/2/w/100/h/100/interlace/0/q/100";
													img.src = src;
													li.appendChild(img);
													ul.appendChild(li);
												}
												div.appendChild(ul);
												return $(div).html();
											}

										},
										width : 500
									} ] ],
							onClickCell : function(index, filed, value) {
								$('.images').viewer({
									navbar : false,
									title : false,
									movable : false,
									scalable : false,
									url : function(img) {
										return img.src.split("?")[0];
									}
								});
							}
						});
						
						$('#fb,#fb1,#fb2').filebox({
   							buttonText: '选择文件',
    						buttonAlign: 'right',
    						accept: 'image/*',
    						onChange: uploadFrontPage
						})
	});
<%@ include file="/common/dateFormatter.jsp" %>
	
</script>

<script
	src="${pageContext.request.contextPath}/static/plupload/moxie.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/plupload/plupload.full.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/qiniu/qiniu.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/photview/viewer.min.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/static/photview/viewer.min.js"></script>
</head>
<body>
	<table id="dg" class="easyui-datagrid" rownumbers="true"
		data-options="fit:true,pagination:true,singleSelect:true">
	</table>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="newWarehouse()">新增</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editWarehouse()">编辑</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="removeDriver()">删除</a> <input class="easyui-searchbox"
			searcher="search" prompt="请输入关键字" name="keywords">
	</div>
	<!--Dialog 增加 -->
	<div id="dlg" class="easyui-dialog"
		style="width: 800px; height: 600px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">仓库信息</div>
		<form id="fm" method="post" novalidate enctype="multipart/form-data">
			<input type="hidden"  name="id" id="id">
			<div class="fitem">
				<label>仓库名:</label> <input name="name" id="name"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>联系方式:</label> <input name="contact" id="contact"
					class="easyui-validatebox" required=" ture">
			</div>
			<div class="fitem">
				<div style="display:inline-block;width: 80px;">省份:</div> <select id='province' style="width:100px;margin-right:50px" onchange='search(this)'></select>
				<div style="display:inline-block;width: 80px;">城市:</div> <select id='city' style="width:100px;margin-right:50px" onchange='search(this)'></select>
				<div style="display:inline-block;width: 80px;">区域:</div> <select id='district' style="width:100px;margin-right:50px" onchange='search(this)'></select>
			</div>
			
			<div class="fitem">
				<label>地址:</label> <input name="address" id="address"
					class="easyui-validatebox" required=" ture">
			</div>
			<div class="fitem">
				<label>面积:</label> <input name="area" id="area"
					class="easyui-validatebox" required=" ture">
			</div>
			
			<div class="fitem">
				<label>选择照片:</label> 
					<input id="fb" type="text" style="width:300px" name="upload">
					<!-- <input type="text"  name="frontPage" id="frontPage">
					<input type="text"  name="frontPage1" id="frontPage1">
					<input type="text"  name="frontPage2" id="frontPage2"> -->
			
			</div>
			
				<div class="fitem">
					<img id=img alt="" src=""  >
					<input type="text" style="width: 50px" name="frontPage" id="frontPage">
					<img id=img1 alt="" src="" >
					<input type="text" style="width: 50px" name="frontPage1" id="frontPage1">
					<img id=img2 alt="" src="" >
					<input type="text" style="width: 50px" name="frontPage2" id="frontPage2">
					
			
			</div>
					
			
			<textarea name="editor1" id="editor1"></textarea>
		<script>
			CKEDITOR.replace('editor1');
		</script>
			</form>
			<!--进度条 -->
			<div class="fitem" id="progressDiv" style="display: none;">
				<div id="progress" class="easyui-progressbar" style="margin: 0 auto"></div>
			</div>
		
		<div id="dlg-buttons">
			<a id="save-btn" href="#" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
		</div>
		
</div>

</body>

<script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>

<script type="text/javascript">
    var district, citycode;
    var provinceSelect = document.getElementById('province');
    var citySelect = document.getElementById('city');
    var districtSelect = document.getElementById('district');
    //行政区划查询
    var opts = {
        subdistrict: 1,   //返回下一级行政区
        showbiz:false  //最后一级返回街道信息
    };
    district = new AMap.DistrictSearch(opts);//注意：需要使用插件同步下发功能才能这样直接使用
    district.search('中国', function(status, result) {
    	console.log("search");
    	console.log(result);
        if(status=='complete'){
            getData(result.districtList[0]);
        }
    });
    
    function getData(data,level) {   
        //清空下一级别的下拉列表
        if (level === 'province') {
            citySelect.innerHTML = '';
            districtSelect.innerHTML = '';
        } else if (level === 'city') {
            districtSelect.innerHTML = '';
        } 

        var subList = data.districtList;
        if (subList) {
            var contentSub = new Option('--请选择--');
            var curlevel = subList[0].level;
            var curList =  document.querySelector('#' + curlevel);
            if(curList)
            {
            	curList.add(contentSub);
        	    for (var i = 0, l = subList.length; i < l; i++) {
    	            var name = subList[i].name;
	                var levelSub = subList[i].level;
                	var cityCode = subList[i].citycode;
            	    contentSub = new Option(name);
        	        contentSub.setAttribute("value", levelSub);
    	            contentSub.center = subList[i].center;
	                contentSub.adcode = subList[i].adcode;
                	curList.add(contentSub);
            	}
            }
        }
        
    }
    
    function search(obj) {
        var option = obj[obj.options.selectedIndex];
        var keyword = option.text; //关键字
        var adcode = option.adcode;
        district.setLevel(option.value); //行政区级别
        district.setExtensions('all');
        //行政区查询
        //按照adcode进行查询可以保证数据返回的唯一性
        district.search(adcode, function(status, result) {
            if(status === 'complete'){
                getData(result.districtList[0],obj.id);
            }
        });
    }
    
    function uploadFrontPage(newValue, oldValue){
    	if(oldValue != newValue)
    	{
    	    var form = new FormData($( "#fm" )[0]);
    	    form.append("upload",newValue); 
            $.ajax({
                url:"${pageContext.request.contextPath}/warehouse/imageUpload",
                type:"post",
                data:form,
                processData:false,
                contentType:false,
                success:function(data){
                	if($("#frontPage").val()==""){
                		$("#frontPage").val(data.url);
                		$("#img").attr('src',data.url+"?imageView2/1/w/50/h/50/q/75|imageslim");
                		return true;
                	}
                    
                	if($("#frontPage1").val()==""){
                		$("#frontPage1").val(data.url);
                		$("#img1").attr('src',data.url+"?imageView2/1/w/50/h/50/q/75|imageslim");
                		return true;
                	}
                	if($("#frontPage2").val()==""){
                		$("#frontPage2").val(data.url);
                		$("#img2").attr('src',data.url+"?imageView2/1/w/50/h/50/q/75|imageslim");
                		return true;
                	}
                },
                error:function(e){
                	 console.log(form)
                    alert("上传图片过大错误！！");
                }
            });        
    	}
    }
    
	/*上传照片  */
	var array = new Array();


	$('#upload').bind('click', function() {
		uploader.start();
	});
	$('#upload1').bind('click', function() {
		uploader.start();
	});
	$('#upload2').bind('click', function() {
		uploader.start();
	});
	var url;
	function newWarehouse() {
		$('#dlg').dialog('open').dialog('setTitle', '新增仓库');
		$('#fm').form('clear');
		$("#progressDiv").hide();
		url = "${pageContext.request.contextPath}" + '/warehouse/add';
	}
	
	function editWarehouse() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '编辑仓库');
			$('#fm').form('load', row);
			console.log(row);
			$('id').val(row.id);
			//$('#province').val('北京市');
			//$("#province option[text='北京市']").attr("selected", true); 
			provinceSelect.text = '北京市';
			console.log($("#province option[text='北京市']"));
			console.log($('#province').val());
			CKEDITOR.instances.editor1.setData(row.article);
			url = "${pageContext.request.contextPath}" + '/warehouse/update'
		}else{
			$.messager.alert("提示", "请先选择仓库");
		}
	}

	//保存提交按钮
	$("#save-btn").click(function() {
				$.ajax({
					type : "post",
					url : url,
					dataType : "json",
					data : {
						id: $("#id").val(),
						name : $("#name").val(),
						contact : $("#contact").val(),
						province: provinceSelect.options[provinceSelect.selectedIndex].text,
						city:citySelect.options[citySelect.selectedIndex].text,
						district:districtSelect.options[districtSelect.selectedIndex].text,
						address: $("#address").val(),
						area: $("#area").val(),
						article: CKEDITOR.instances.editor1.getData(),
						frontPage : $("#frontPage").val(),
						frontPage1 : $("#frontPage1").val(),
						frontPage2 : $("#frontPage2").val()
					},
					error : function(request) {
						$.messager.alert("提示", "保存失败");
					},
					success : function(data) {
						if (data.success) {
								$.messager.show({
								title : "成功",
								msg : "操作成功"
							});
							$('#dlg').dialog('close'); // close the dialog
							$('#dg').datagrid('reload'); // reload the user data
						} else {
							$.messager.show({
								title : "失败",
								msg : data.msg
							});
						}
					}
				})
	})

	function removeDriver() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('确认框', '是否确认删除这条记录?', function(r) {
				if (r) {
					$.post("${pageContext.request.contextPath}"
							+ '/driver/delete', {
						id : row.id
					}, function(result) {
						DO(result)
					}, 'json');
				}
			});
		}
	}


	function searchkw(value, name) {
		$('#dg').datagrid('reload', {
			'keywords' : value
		});
	}
		
</script>
</html>