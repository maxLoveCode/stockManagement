<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>

<html class="gr__prologis_juxtstaging_com" style="background-color: #f2f2f2"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>郑明 - 仓库查询</title>
	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.1&key=bcff4cb66f501fd52e67bf44cf5a4a65&plugin=AMap.DistrictSearch"></script>
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
    
   <select name="province" id='province' onchange='search(this)'>
     <option value="">省份</option>
     </select>
        <select id='city' onchange='search(this)'>
          <option value="">城市</option>
          </select>  
      <%--   <select name="city" id="city">
         <option value="">城市</option>
        <c:forEach items="${city}" var="bean">
            <option value="${bean}">${bean }</option>
            </c:forEach>
        </select>
        
        <select name="district" id="district" >
          <option value="">区域</option>
        <c:forEach var="bean" items="${district}">
            <option value="${bean }">${bean}</option>
            </c:forEach>
        </select> --%>
        
        <select name="area" id="area">
            <option value="">面积</option>
            <option value="0~30000">3万平米以内</option>
            <option value="30000~60000">3-6万平米</option>
            <option value="60000~100000">6-10万平米</option>
            <option value="100000~9999999">10万平米以上</option>
        </select>
    </div>
    
    
    <div class="loftList" id="myList">
    	<c:forEach items="${list}" varStatus="i" var="item">
    		<c:if test="${!(i.count%2 eq 0)}">
        	<div class="loftLine-l"   style="background-color: #ffff;" data-area="${item.area}">
               <a href="${pageContext.request.contextPath}/warehouse/detailView+${item.id}">  <img src="${item.frontPage}?imageView2/1/w/260/h/260/format/jpg/q/100|imageslim"  class="loftLineImg"></a>
            <div class="llRightInfo">
                <div class="llName"><span>${item.name}</span></div>
                <div class="llBtns">
		            <a href="${pageContext.request.contextPath}/order/appointmentIndex?id=${item.id}" class="btn btn-primary btn-lg" role="button">预约参观</a>
                </div>
            </div>
        </div>
        </c:if><c:if test="${i.count%2 eq 0}">
        	<div class="loftLine-r" data-district="华东"  style="background-color: #ffff;" data-city="上海" data-area="${item.area}">
           <a href="${pageContext.request.contextPath}/warehouse/detailView+${item.id}">  <img src="${item.frontPage}?imageView2/1/w/260/h/260/format/jpg/q/100|imageslim"  class="loftLineImg"></a>
            <div class="llRightInfo">
                <div class="llName"><span>${item.name}</span></div>
                <div class="llBtns">
                	<a href="${pageContext.request.contextPath}/order/appointmentIndex?id=${item.id}" class="btn btn-primary btn-lg" role="button">预约参观</a>
                </div>
            </div>
        </div>
        	</c:if>
	    </c:forEach>
    </div>
</div>
	    <script type="text/javascript">
	    $('#province,#city,#area').change(function(){
	    	 var province = $('#province').find("option:selected").text();
	         var city = $('#city').find("option:selected").text();
	         var arear = $('#area').val();
	         var area =0 ;
	         var contact =0;
	         if( arear != '' ){
	                var a = arear.split('~');
	                area = parseInt(a[0]) ;
	                contact = parseInt(a[1]);
	         }
	         $.ajax({
	        	 type:"GET",
	        	 url:"ajaxwarehouse?province="+province+"&city="+city+"&area="+area+"&contact="+contact,
	        	dataType :"JSON",
	        	success : function(data){
	        		var	str="";
	        		for( var i = 0; i < data.length; i++) {
	        			if(i%2==0){
	        				str+="<div class=\"loftLine-l\"   style=\"background-color: #ffff;\">"
			        			+"<a href=${pageContext.request.contextPath}/warehouse/detailView+"+data[i].id+">  <img src="+data[i].frontPage+"?imageView2/1/w/260/h/260/format/jpg/q/100|imageslim  class=\"loftLineImg\" ></a>"
			        			+"<div class=\"llRightInfo\">"
			        			+"<div class=\"llName\" ><span  >"+data[i].name+"</span></div>"
			        			+"<div class=\"llBtns\">"
			        			+"<p align=\"center\" ><a href=${pageContext.request.contextPath}/order/appointmentIndex?id="+data[i].id+" class=\"btn btn-primary btn-lg\" role=\"button\"  >预约参观</a><p>"
			        			+"</div></div></div>"
	        			}else{
	        				str+="<div class=\"loftLine-r\"   style=\"background-color: #ffff;\">"
			        			+"<a href=${pageContext.request.contextPath}/warehouse/detailView+"+data[i].id+">  <img src="+data[i].frontPage+"?imageView2/1/w/260/h/260/format/jpg/q/100|imageslim  class=\"loftLineImg\" ></a>"
			        			+"<div class=\"llRightInfo\">"
			        			+"<div class=\"llName\" ><span  >"+data[i].name+"</span></div>"
			        			+"<div class=\"llBtns\">"
			        			+"<p align=\"center\" ><a href=${pageContext.request.contextPath}/order/appointmentIndex?id="+data[i].id+" class=\"btn btn-primary  btn-lg\" role=\"button\"  >预约参观</a><p>"
			        			+"</div></div></div>"
	        			}
	        			
	        		}

	        		$("#myList").html(str);
	        	}
	         
	    });
	    }); 
    </script>

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


</script>

</body></html>