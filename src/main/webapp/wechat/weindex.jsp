<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>

<html class="gr__prologis_juxtstaging_com"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>郑明 - 仓库查询</title>

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
<style>
	body{ background:#f3f3f3;}
</style>
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
    
    
    <div class="loftList">
    <c:forEach items="${list}" varStatus="i" var="item" >
    
        
        <div class="loftLine" data-district="华东" data-city="上海" data-area="35000">
            <img src="${item.frontPage}" class="loftLineImg">
            <div class="llRightInfo">
                <div class="llName">${item.name}</div>
                <div class="llBtns">
                    <a href="${pageContext.request.contextPath}/warehouse/detailView+${item.id}"><img src="${pageContext.request.contextPath}/static/images/btn2.png"></a>
                    <a href="${pageContext.request.contextPath}/order/appointmentIndex"><img src="${pageContext.request.contextPath}/static/images/btn3.png"></a>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </c:forEach>

        </div>
	</div>
	    <script type="text/javascript">
    
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
    }) 
    </script>



</body></html>