<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>旅游 目的地旅游攻略</title>
<meta name="description" content="我们帮您寻找到适合你的旅行目的地，让你的旅行更精彩！">
<meta name="keywords" content="最新旅行手册路书下载,最新游记照片">
<link href="webpage/mainpage/destination_recom/css/base.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="webpage/css/homepage.css" charset="utf-8" />
<link rel="stylesheet" href="webpage/css/eric-meyer-reset.min.css" />
<link rel="stylesheet" href="webpage/css/common.css" />
<link href="css/mfw-footer.css" rel="stylesheet" type="text/css">
<link rel='stylesheet prefetch'  href='https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css'>
<link rel="stylesheet" href="css/base.css">
<!-- 百度统计代码 -->
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?9a4628a2c3fa798bc8282f6b539f9205";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
	
</script>
<!-- 百度统计代码 -->
</head>
<body>

	<%@ include file="../../head.jsp"%>
	<div class="banner">
		<!--banner start-->
		<div id="container">
			<div id="list" style="left:-1424px">
				<s:a action="productPage_pageSearchIsTop" namespace="/"> <img
					src='<c:url value="/topPhotoFiles/${param.lastTopPhotoRealName}"/>' />
					<s:param name="search">${param.lastTopPhotoCityName}</s:param>
				</s:a>
				<s:iterator value="topPhotoList" id="topPhotoList1" status="s1">
					<s:if test="#s1.getIndex()<5">
						<s:a action="productPage_pageSearchIsTop" namespace="/"> <img
							src='<c:url value="/topPhotoFiles/${param.topPhotoList1.key}"/>' />
							<s:param name="search" value="#topPhotoList1.value">
							</s:param>
						</s:a>
					</s:if>
				</s:iterator>
				<s:a action="productPage_pageSearchIsTop" namespace="/"> <img
					src='<c:url value="/topPhotoFiles/${param.firstTopPhotoRealName}"/>' />
					<s:param name="search">${param.firstTopPhotoCityName }</s:param>
				</s:a>
			</div>
			<div id="buttons">
				<span index="1" class="on"></span> <span index="2"></span> <span
					index="3"></span> <span index="4"></span> <span index="5"></span>
			</div>
			    <a href="javascript:;" id="prev">&lt;</a>
   				 <a href="javascript:;" id="next">&gt;</a>
		</div>
		<!--banner end-->

	</div>
	<style>
.wrap_main {
	width: 100%;
	height: 200%;
	/*background-color: #F3F3F3;*/
	padding-top: 20px;
}

.banner {
	width: 100%;
	height: 400px;
}
.file {
    position: absolute;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
	top:500px;
	right:800px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
</style>

<div class ="container"  data-cs-t="产品搜索" >

  <div class="search_box clearfix">
    <input name="search_input" type="text" maxlength="255" size="20" id="search_input" class="search_input" placeholder="Search...">
    <div class="search_button" >
      <i class="fa fa-search"></i>
    </div>
  </div>
<a href="javascript:;" class="file">上传图片
    <input type="file" name="" id="">
</a>
</div>

	<div class="container" data-cs-t="目的地首页">
		<div class="place-focus" data-cs-p="头图">
<!-- 			<div class="show-banner"> -->
<!-- 				<div class="cover" style="height: auto;"> -->
<!-- 					<a class="bigimg" href=""> <img -->
<!-- 						src='<c:url value="/tdTopPhotoFiles/${topPhoto.tdTopPhotoRealName}"/>' -->
<!-- 						width="980" height="400"> -->

<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="place-search-panel place-search-panel-sm"> -->
<!-- 				 <h2>Don't fear the unknown</h2> -->
<!-- 				<s:form action="cd_searchCity" namespace="/" theme="simple"> -->

<!-- 				</s:form> -->

<!-- 				<div class="place-search-hot"> -->
<!-- 					<s:iterator value="topSeasonCityList" status="ss"> -->
<!-- 						<s:if test="#ss.getIndex()<4"> -->
<!-- 							<s:a action="cdpage_loadCity" namespace="/" theme="simple"> -->
<!-- 								<s:param name="cityName" value="cityName" /> -->
<!-- 								<s:property value="cityName" /> -->
<!-- 							</s:a> -->
<!-- 						</s:if> -->
<!-- 					</s:iterator> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>



		<div class="row">
			<div class="wrapper">
				<div class="row-list" data-cs-p="国内目的地" id="domestic">
					<i class="row-icon" id="theme-icon"></i>
					<h2 class="hd" id="chinamdd">主题目的地</h2>
					<div class="row-line"></div>
					<div class="bd bd-china">
						<s:iterator value="themeTypeCityList" id="themeTypeCityList1">
							<dl class="item">

								<dt class="sub-title">
									<img class="theme-type-icon"
										src='<c:url value="/themeFiles/${themeTypeCityList1.key.themeRealName}"/>' />
									<a style="position: relative;top: 2px;"><s:property
											value="#themeTypeCityList1.key.themeName" /></a>
								</dt>
								<dd>
									<ul>
										<s:iterator value="#themeTypeCityList1.value"
											id="themeTypeCityList2">
											<li><s:a action="cdpage_loadCity" namespace="/"
													theme="simple" cssClass="link-hot">
													<s:param name="cityName" value="themeTypeCityList2" />
													<s:property value="themeTypeCityList2" />
												</s:a></li>
										</s:iterator>
									</ul>
								</dd>
							</dl>
						</s:iterator>
					</div>
				</div>

			</div>

		</div>



		<div class="row">
			<div class="wrapper">
				<div class="row-list" data-cs-p="国内目的地" id="domestic">
					<i class="row-icon" id="mdd-icon"></i>
					<h2 class="hd" id="chinamdd">国内目的地</h2>
					<div class="row-line"></div>
					<div class="bd bd-china">
						<s:iterator value="homeCityList" id="homeCityList1">
							<dl class="item">
								<dt class="sub-title" style="line-height: 34px;">
									<s:property value="#homeCityList1.key" />
								</dt>
								<dd>
									<ul>
										<s:iterator value="#homeCityList1.value" id="homeCityList2">
											<li><s:a action="cdpage_loadCity" namespace="/"
													theme="simple" cssClass="link-hot">
													<s:param name="cityName" value="homeCityList2" />
													<s:property value="homeCityList2" />
												</s:a></li>
										</s:iterator>


									</ul>
								</dd>
							</dl>
						</s:iterator>


					</div>
				</div>

			</div>

		</div>
	</div>


	<link href="css/mfw-footer.css" rel="stylesheet" type="text/css">

	<%@ include file="../../foot.jsp"%>
	<script src="webpage/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("nav").find("li").eq(1).addClass("nav_active");
			$(".search-button").click(function() {

				var value = $("#cd_searchCity_search").val();
				if (value == null || value.trim() == "") {
					alert("请输入要查询的城市名！");
					return false;
				}
			});
		})
	</script>
	<script>
	$('.search_button').click(function() {
		if ($('.search_input').val() == '') 
		    {
		    $('.search_box').toggleClass("start");
		    if (!$(this).is(":focus")){
		      setTimeout(function(){
		        $('.search_input').focus();
		      }, 920);
		    }
		}
		else {
		  $('.search_box').addClass("finish");
		  window.location.href="productPage_findAllIsTop.action?pageNum=1&totalpage=4&pageSize=18";
		}
		});
	</script>
	<script type="text/javascript" src="webpage/js/slider.js"></script>
	<script type="text/javascript" src="webpage/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="webpage/js/homepage.js"></script>
	<script type="text/javascript"></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/base.js"></script>
	
</body>
</html>