<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html ng-app="ionicApp">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
        <title>郑明 - 预约参观</title>
        <script type="text/javascript" src="http://validform.rjboy.cn/wp-content/themes/validform/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="http://validform.rjboy.cn/Validform/v5.1/Validform_v5.1_min.js"></script>
        <link href="https://cdn.bootcss.com/ionic/1.3.2/css/ionic.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/ionic/1.3.2/js/ionic.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
        <script src="/bower/bootstrap-datepicker-mobile/bootstrap-datepicker-mobile.js"></script>
		<style>
		.input-label{
				color: #2a3380;
				font-weight:bold ;
			}
		</style>
		
    </head>
    
    
    
    <body>

    <form class="registerform" id = "form" action="appoint" method="get">

    <div class="bar bar-header">
      <div class="h1 title">预约登记</div>
    </div>
    
    <div class="content has-header">
      <div class="list">
        <label class="item item-input">
          <span class="input-label">姓名</span>
          <input type="text" name="visitName" nullmsg="请输入姓名！" datatype="s2-5" errormsg="姓名至少2个字符,最多5个字符！">
        </label>
        <label class="item item-input">
          <span class="input-label">联系电话</span>
          <input type="text" name="phone" datatype="m" nullmsg="请输入手机号码！" errormsg="手机号码不正确！">
        </label>
        <label class="item item-input">
          <span class="input-label">公司名称</span>
          <input type="text"name="company" datatype="s2-16" nullmsg="请输入公司名称！">
        </label>
        <label class="item item-input">
          <span class="input-label">参观时间</span>
          
         <input type="date" datatype="date" nullmsg="请输入出生日期！" class="date-picker form-control" data-date-start-view="decade" data-date-format="mm/dd/yy" data-date="02/01/99" value="02/01/99" name="visitTime" placeholder="MM/DD/YY" />
  <div class="form-group">
    <div class="input-group">

      <div class="input-group-addon">
        <i class="fa fa-calendar"></i>
      </div>

    </div>
  </div>
        </label>
      <div class="list">
        <label class="item item-input">
          <span class="input-label">仓库</span><select class="button button-defut " style="width: 200px;" name="wareHouseid"
						datatype="*" nullmsg="请选择！">
			<c:forEach items="${warehouses }" var="bean">
			<option value="${bean.id }">${bean.name }</option>
			</c:forEach>
          	
                                  
          </select>
        </label>
      <div class="padding">
      <input type="submit" class="button button-block button-positive" style="background-color:#2a3380 " value="预约"/>
      
      </div>
    </div>
    </form>
  </body>
  
  <script>
  $(function(){
		//$(".registerform").Validform();  //就这一行代码！;
	  $.Tipmsg.r=null;
		
		var showmsg=function(msg){//假定你的信息提示方法为showmsg， 在方法里可以接收参数msg，当然也可以接收到o及cssctl;
			alert(msg);
		}

		$(".registerform").Validform({
			tiptype:function(msg){
				showmsg(msg);
			},
			tipSweep:true,
			callback : function(form) {
				var check = confirm("您确定要提交预约吗？");
				if (check) {
					alert("您的预约已成功提交，我们客服会在3个工作日内联系您");
					form[0].submit();
				}
				return false;
			}
		});
		$.extend($.Datatype,{
			"date":	/^(\d{4})-(\d{2})-(\d{2})$/
	});
	})
	
/* $("#form").submit(function(event) {
    $.get($(this).attr("action"), { serial: $("#serial").val() })
    .done(function(data) {
		alert("操作成功");
    });
}); */
		
  </script>
  
</html>
