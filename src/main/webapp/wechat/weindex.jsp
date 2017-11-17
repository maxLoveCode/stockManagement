<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>

<html class="gr__prologis_juxtstaging_com"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>安博 - 仓库查询</title>

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
	<img src="./安博 - 仓库查询_files/topBar.jpg" class="dsb">
    
    <img src="./安博 - 仓库查询_files/loftImg1.jpg" class="dsb">  
    <div class="selectLine">
        <select name="district" id="district">
            <option value="">选择区域</option>
            <option value="华东">华东</option>
            <option value="华北">华北</option>
            <option value="华南">华南</option>
            <option value="华西">华西</option>
        </select>
    </div>
    <div class="selectLine">
        <select name="city" id="city">
            <option value="">请先选择区域</option>
        </select>
    </div>
    <div class="selectLine">
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
            <img src="./安博 - 仓库查询_files/cc3e274a46bcddb8632121628d3b6e1d.jpeg" class="loftLineImg">
            <div class="llRightInfo">
                <div class="llName">${item.name}</div>
                <div class="llBtns">
                    <a href="http://prologis.juxtstaging.com/storage/1"><img src="./安博 - 仓库查询_files/btn2.png"></a>
                    <a href="http://prologis.juxtstaging.com/visit/1"><img src="./安博 - 仓库查询_files/btn3.png"></a>
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
        /*
        $('#district,#city,#area').change(function(){
            var district = $('#district').val();
            var city = $('#city').val();
            var area = $('#area').val();
            if( district != '' && city != '' && area != ''){
                $('.loftList').html('<div class="llName">加载中...</div>');
                var url = 'http://prologis.juxtstaging.com/storages/list';
                $.getJSON(url, {district:district,city:city,area:area}, function(json){
                    //$('#storage').html(data);
                    var html = '';
                    if(json && json.ret == 0){
                        $.each(json.data,function(i){
                            html += '<div class="loftLine"><img src="'+'/uploads/'+json.data[i].imgUrl+'" class="loftLineImg"><div class="llRightInfo"><div class="llName">'+json.data[i].title+'</div><div class="llBtns"><a href="'+json.data[i].detailUrl+'"><img src="'+'/bundles/app/default/'+'images/btn2.png"></a><a href="'+json.data[i].visitUrl+'"><img src="'+'/bundles/app/default/'+'images/btn3.png"></a></div></div><div class="clear"></div></div>';
                        })
                    }
                    else{
                        html = '<div class="llName">没有您需要的结果</div>';
                    }
                    $('.loftList').html(html);
                })
            }
        })
        */
    })
    </script>



</body></html>