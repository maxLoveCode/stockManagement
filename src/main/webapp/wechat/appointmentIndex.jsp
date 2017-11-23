<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html ng-app="ionicApp">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
        <title>郑明-预约参观</title>
        <script type="text/javascript" src="http://validform.rjboy.cn/wp-content/themes/validform/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="http://validform.rjboy.cn/Validform/v5.1/Validform_v5.1_min.js"></script>
        <link href="https://cdn.bootcss.com/ionic/1.3.2/css/ionic.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/ionic/1.3.2/js/ionic.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
		<style>
		.input-label{
				color: blue;
				font-weight:bold ;
			}
			
			
		</style>
		
    </head>
    
    
    
    <body>

    <form  action="appoint">

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
          <input type="text" name="visitTime" datatype="date"
						nullmsg="请输入参观时间！" errormsg="请输入正确的日期格式，如1996-01-29">
        </label>
        <div class="bar">
      <div class="h1 title">选择仓库</div>
    </div>
    <div class="content has-header">
      <div class="list">
        <label class="item item-input">
          <span class="input-label">仓库</span><select class="button button-defut " style="width: 200px;" name="wareHouseid"
						datatype="*" nullmsg="请选择！">
          	<option value="1">上海桃浦冷库</option>
                                    <option value="2">上海沅江库</option>
                                    <option value="3">南京冷库</option>
          </select>
        </label>
        	
      </div>
      <div class="padding">
      <input type="submit" class="button button-block button-positive" value="预约"/>
      
      </div>
    </div>
    </form>
  </body>
  
  <script>
  		
/*  $(".registerform").Validform(
		{
			datatype : {
				"zh1-6" : /^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
			},
			tiptype : 2,
			callback : function(form) {
				var check = confirm("您确定要提交表单吗？");
				if (check) {
					form[0].submit();
				}

				return false;
			}
		}
		
		); 
  	 */
  </script>
</html>
