<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>

<html class="gr__prologis_juxtstaging_com"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>郑明 - 仓库查询</title>
	
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/common.css">
<script type="text/javascript"
	src='${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js'>
<script type="text/javascript"
	src='${pageContext.request.contextPath}/static/js/common.js'>
<script type="text/javascript"
	src='${pageContext.request.contextPath}/static/js/hammer.fakemultitouch.js'>
<script type="text/javascript"
	src='${pageContext.request.contextPath}/static/js/hammer.min.js'>
<script type="text/javascript"
	src='${pageContext.request.contextPath}/static/js/hammer.showtouches.js'>
	
<!--移动端版本兼容 -->
<script type="text/javascript">
         var phoneWidth =  parseInt(window.screen.width);
         var phoneScale = phoneWidth/640;
         var ua = navigator.userAgent;
         if (/Android (\d+\.\d+)/.test(ua)){
                   var version = parseFloat(RegExp.$1);
                   if(version>2.3){
                            document.write('<meta name="viewport" content="width=640, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
                   }else{
                            document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
                   }
         } else {
                   document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
         }
</script><meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi"> 
<!--移动端版本兼容 end -->
</head>
<body data-gr-c-s-loaded="true">
<div class="wrapper">
	<img style="width:100%" src="${pageContext.request.contextPath}/static/images/banner1.png" class="dsb">

    <div class="selectLine">
    
        <select name="district" id="district" >
          <option value="">选择区域</option>
        <c:forEach var="bean" items="${district}">
            <option value="${bean }">${bean}</option>
            </c:forEach>
        </select>
        
        <select name="city" id="city">
         <option value="">选择城市</option>
        <c:forEach items="${city}" var="bean">
            <option value="${bean}">${bean }</option>
            </c:forEach>
        </select>
        
        <select name="area" id="area">
            <option value="">仓库面积</option>
            <option value="0~30000">3万平米以内</option>
            <option value="30000~60000">3-6万平米</option>
            <option value="60000~100000">6-10万平米</option>
            <option value="100000~9999999">10万平米以上</option>
        </select>
    </div>
    
    
    <div class="loftList" id="myList">
    	<c:forEach items="${list}" varStatus="i" var="item">
    		<c:if test="${!(i.count%2 eq 0)}">
        	<div class="loftLine-l"   style="background-color: #ffff;">
           <a href="${pageContext.request.contextPath}/warehouse/detailView+${item.id}">  <img src="${item.frontPage}"  class="loftLineImg" style="margin-left: 40px;margin-top: 15px;margin-right: 50px"></a>
            <div class="llRightInfo">
                <div class="llName" style="margin-left: -90px" ><span style="font-size: 20px;" >${item.name}</span></div>
                <div class="llBtns">
                    <%-- <a href="${pageContext.request.contextPath}/order/appointmentIndex"><img src="${pageContext.request.contextPath}/static/images/btn3.png"></a> --%>
                	<p align="center" ><a href="${pageContext.request.contextPath}/order/appointmentIndex?id=${item.id}"  class="btn btn-primary btn-lg" role="button" style="margin-top: -30px;margin-left: 90px;background-color:#2a3380 " >预约参观</a><p>
                </div>
            </div>
        </div>
        	</c:if><c:if test="${i.count%2 eq 0}">
        	<div class="loftLine-r" data-district="华东"  style="background-color: #ffff;" data-city="上海" data-area="35000">
           <a href="${pageContext.request.contextPath}/warehouse/detailView+${item.id}">  <img src="${item.frontPage}"  class="loftLineImg" style="margin-left: 40px;margin-top: 15px;margin-right: 50px"></a>
            <div class="llRightInfo">
                <div class="llName" style="margin-left: -90px" ><span style="font-size: 20px;" >${item.name}</span></div>
                <div class="llBtns">
                    <%-- <a href="${pageContext.request.contextPath}/order/appointmentIndex"><img src="${pageContext.request.contextPath}/static/images/btn3.png"></a> --%>
                	<p align="center" ><a href="${pageContext.request.contextPath}/order/appointmentIndex?id=${item.id}"  class="btn btn-primary btn-lg" role="button" style="margin-top: -30px;margin-left: 90px;background-color:#2a3380 " >预约参观</a><p>
                </div>
            </div>
        </div>
        	</c:if>
	    </c:forEach>
    </div>
</div>
	    <script type="text/javascript">
	    $('#district,#city,#area').change(function(){
	    	 var district = $('#district').val();
	         var city = $('#city').val();
	         var area = $('#area').val();
	         $.ajax({
	        	 type:"GET",
	        	 url:"ajaxwarehouse?city="+city+"&district="+district,
	        	dataType :"JSON",
	        	success : function(data){
	        		var	str="";
	        		for( var i = 0; i < data.length; i++) {
	        			if(i%2==0){
	        				str+="<div class=\"loftLine-l\"   style=\"background-color: #ffff;\">"
			        			+"<a href=${pageContext.request.contextPath}/warehouse/detailView+"+data[i].id+">  <img src="+data[i].frontPage+"  class=\"loftLineImg\" style=\"margin-left: 40px;margin-top: 15px;margin-right: 50px\"></a>"
			        			+"<div class=\"llRightInfo\">"
			        			+"<div class=\"llName\" style=\"margin-left: -90px\" ><span style=\"font-size: 20px;\" >"+data[i].name+"</span></div>"
			        			+"<div class=\"llBtns\">"
			        			+"<p align=\"center\" ><a href=${pageContext.request.contextPath}/order/appointmentIndex?id="+data[i].id+" class=\"btn btn-primary btn-lg\" role=\"button\" style=\"margin-top: -30px;margin-left: 90px;background-color:#2a3380 \" >预约参观</a><p>"
			        			+"</div></div></div>"
	        			}else{
	        				str+="<div class=\"loftLine-r\"   style=\"background-color: #ffff;\">"
			        			+"<a href=${pageContext.request.contextPath}/warehouse/detailView+"+data[i].id+">  <img src="+data[i].frontPage+"  class=\"loftLineImg\" style=\"margin-left: 40px;margin-top: 15px;margin-right: 50px\"></a>"
			        			+"<div class=\"llRightInfo\">"
			        			+"<div class=\"llName\" style=\"margin-left: -90px\" ><span style=\"font-size: 20px;\" >"+data[i].name+"</span></div>"
			        			+"<div class=\"llBtns\">"
			        			+"<p align=\"center\" ><a href=${pageContext.request.contextPath}/order/appointmentIndex?id="+data[i].id+" class=\"btn btn-primary  btn-lg\" role=\"button\" style=\"margin-top: -30px;margin-left: 90px;background-color:#2a3380 \" >预约参观</a><p>"
			        			+"</div></div></div>"
	        			}
	        			
	        		}

	        		$("#myList").html(str);
	        	}
	         
	    });
	    }); 
    /* 
     function selectStorage()
    {
        var district = $('#district').val();
        var city = $('#city').val();
        var area = $('#area').val();
        $('.loftLine').each(function(i){
            var s = false;//默认显示
            var dataDistrict = $(this).attr('data-district');
            var dataCity = $(this).attr('data-city');
            var dataArea = $(this).attr('data-area');

            if( area != '' ){
                var a = area.split('~');
                if(dataArea >= parseInt(a[0]) && dataArea < parseInt(a[1])){
                    s = false;
                }
                else{
                    s = true;
                }
            }


            if( district != '' && district != dataDistrict){
                s = true;
            }

            if( city != '' && city != dataCity){
                s = true;
            }

            if(s == true){
                $(this).hide();
            }
            else{
                $(this).show();
            }
        });
    }
    $(document).ready(function(){
        $('#district').val('');
        $('#city').val('');
        $('#district').change(function(){
        var district = $('#district').val();
        $('#city').empty().html('<option value="">选择城市</option>');
        var url = 'http://prologis.juxtstaging.com/city';
        var html = '';
        $.getJSON(url, {district:district}, function(json){
            if(json && json.ret == 0){
                $.each(json.data,function(key,value){
                    html += '<option value="'+ value +'">'+ value +'</option>';
                })
                $('#city').append(html);
            }
            else{
                //alert('获取城市失败~')
            }
        })
    })
    selectStorage();
    $('#district,#city,#area').change(function(){
        selectStorage();
    });
    })  */
    </script>



</body></html>