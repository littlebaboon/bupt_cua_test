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
<meta charset="UTF-8">
<title>旅游攻略网站</title>
<link rel="stylesheet" href="webpage/css/homepage.css" charset="utf-8" />
<link rel="stylesheet" href="webpage/css/eric-meyer-reset.min.css" />
<link rel="stylesheet" href="webpage/css/common.css" />
<link href="webpage/mainpage/destination_recom/css/base.css"
	rel="stylesheet" type="text/css">
<link href="css/mfw-footer.css" rel="stylesheet" type="text/css">
<!-- 统计代码 -->
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?9a4628a2c3fa798bc8282f6b539f9205";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
<!-- 统计代码 -->
</head>
<body>
	<%@ include file="head.jsp"%>
	<div class="banner">
		<!--banner start-->
		<div id="container">
			<div id="list" style="left:-1424px">
				<s:a action="productPage_pageSearchIsTop" namespace="/"> <img
					src='<c:url value="/topPhotoFiles/${lastTopPhotoRealName}"/>' />
					<s:param name="search">${lastTopPhotoCityName}</s:param>
				</s:a>
				<s:iterator value="topPhotoList" id="topPhotoList1" status="s1">
					<s:if test="#s1.getIndex()<5">
						<s:a action="productPage_pageSearchIsTop" namespace="/"> <img
							src='<c:url value="/topPhotoFiles/${topPhotoList1.key}"/>' />
							<s:param name="search" value="#topPhotoList1.value">
							</s:param>
						</s:a>
					</s:if>
				</s:iterator>
				<s:a action="productPage_pageSearchIsTop" namespace="/"> <img
					src='<c:url value="/topPhotoFiles/${firstTopPhotoRealName}"/>' />
					<s:param name="search">${firstTopPhotoCityName }</s:param>
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
</style>
<div class="container" data-cs-t="目的地首页">
		<div class="row">
			<div class="wrapper">
				<div class="row-list" data-cs-p="国内目的地" id="domestic">
					<i class="row-icon" id="theme-icon"></i>
					<h2 class="hd" id="chinamdd">主题目的地</h2>
					<div class="row-line"></div>
					<div class="bd bd-china">
						<s:iterator value="themeTypeCityList" id="themeTypeCityList1">
							<dl class="item">

							
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
	<script type="text/javascript" src="webpage/js/slider.js"></script>
	<script type="text/javascript" src="webpage/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="webpage/js/homepage.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>