<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="all" name="robots">
<meta name="robots" content="index,follow">
<meta name="keywords" content="旅游产品">
<link href="css/bootkit.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/sweetalert.css">
<style>
a#chat:hover{
	color:#FF6600;
}

a#chat{
	color: #000000;font-weight: bold;
}


</style>
<title>旅游攻略系统</title>
<link charset="utf-8" type="text/css" rel="stylesheet"
	href="webpage/mainpage/chanpin2/css/detail.css">

<style type="text/css">
. /* Userbox */
.userbox {
	display: inline-block;
	margin: -3px 17px 0 0;
	position: relative;
	vertical-align: middle;
}

.userbox>a {
	display: inline-block;
	text-decoration: none;
}

.userbox a:hover {
	text-decoration: none;
}

.userbox .profile-info, .userbox .profile-picture {
	display: inline-block;
	vertical-align: middle;
}

.userbox .profile-picture img {
	width: 35px;
	color: transparent;
}

.userbox .profile-info {
	margin: 0 25px 0 10px;
}

.userbox .name, .userbox .role {
	display: block;
}

.userbox .name {
	color: orange;
	font-size: 13px;
	font-size: 1.3rem;
	line-height: 1.2em;
}

.userbox .role {
	color: orange;
	font-size: 11px;
	font-size: 1.1rem;
	line-height: 1.2em;
}

.userbox .custom-caret {
	color: #000011;
	font-size: 16px;
	font-weight: bold;
}

.userbox .custom-caret:before {
	content: "\f107";
}
/* Userbox - Open */
.userbox.open>a {
	position: relative;
	z-index: 993;
}

.userbox.open>a .custom-caret:before {
	content: "\f106";
}

.userbox.open .dropdown-menu {
	border: 1px solid rgba(0, 0, 0, 0.2);
	-webkit-box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.2);
	box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.2);
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	left: -11px;
	padding: 45px 10px 0;
	top: -10px;
	width: 100%;
	z-index: 992;
	margin-top: 30px;
}

.userbox.open .dropdown-menu li {
	margin-bottom: 5px;
}

.userbox.open .dropdown-menu a {
	border-radius: 2px;
	color: #7d7d7d;
	display: block;
	font-size: 12px;
	font-size: 1.2rem;
	line-height: 15px;
	line-height: 1.5rem;
	padding: 5px 10px;
}

.userbox.open .dropdown-menu a:hover {
	background: none;
	color: #435D78;
}

.userbox.open .dropdown-menu i {
	font-size: 17px;
	font-size: 1.7rem;
	margin-right: 3px;
	vertical-align: middle;
	width: 20px;
}
/* Userbox - Mobile */
@media only screen and (max-width: 767px) {
	.userbox {
		float: left;
		margin: 0 0 0 12px;
		position: relative;
	}
	.userbox:after {
		background: #E9E9E6;
		content: '';
		height: 63px;
		margin: 0;
		position: absolute;
		right: -21px;
		top: -18px;
		width: 1px;
	}
	.userbox .profile-picture {
		display: none;
	}
	.userbox.open .dropdown-menu {
		left: -5px;
		padding: 43px 0 0 0;
	}
}
.panel {
	border: 1;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
	margin-bottom: 30px;
}

.panel .panel-body {
	border-width: 0;
	border-style: none;
	border-top: none;
	border-right-color: none;
	border-bottom-color: none;
	border-left-color: none;
}

.bk-avatar img.bk-img-120 {
	width: 120px;
	height: 120px;
}

.bk-border-3x {
	border-width: 3px !important;
}

.bk-border-light-gray {
	border: 1px solid #dfdfdf !important;
}

.img-circle {
	border-radius: 50%;
}

.userinfo>a {
	color: orange;
	font-size: x-large;
}

.userinfo a:hover {
	background-color: #f5f5f5 !important;
	text-decoration: none;
}

.pic img {
	float: left;
	max-width: 80px;
	max-height: 90px;
	margin-right: 5%;
	margin-bottom: 5%;
}

.msg p {
	margin: 0;
}

.msg .book-title {
	font-size: x-large;
	color: #FF9606;
}

.orderno {
	margin-left: 15%;
}

.btn.btn-primary {
	background: #6BC2FA;
	color: white;
	border: 0 none;
	border-radius: 0;
}

.checkallorder {
	text-align: center;
	margin-bottom: 15px;
}

.modifyitem {
	text-align: center;
	vertical-align: middle;
}

.modifyitem>i {
	font-size: 80px;
	margin: 20px;
}

.modifyitem>a {
	color: orange;
}

.over {
	position: fixed;
	left: 0px;
	top: 0px;
	z-index: 1;
}

.over .over_child {
	width: 400px;
	height: 250px;
	padding: 15px;
	margin-left: auto;
	margin-right: auto;
	background-color: white;
	opacity: 1;
	position: fixed;
	z-index: 100;
	border-radius: 20px;
	border: 5px solid orange;
}

.over .over_child p {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	color: white;
}

.over .over_child table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: separate;
	border-spacing: 10px;
}

.over .over_child table td {
	text-align: center;
}

.error {
	color: red;
}

.mail {
	font-size: large;
}

.order_list tbody td {
	vertical-align: top;
	text-align: center;
}

.order_list thead th {
	vertical-align: top;
	text-align: center;
}

.order_list thead .order_number {
	vertical-align: top;
	text-align: left;
}

.order-table col-md-9 col-md-offset-1 col-xs-12 table tbody td {
	vertical-align: top;
	text-align: center;
}

a {
	color: orange;
	cursor:pointer;
}

#address .panel {
	height: 300px;
}

.btn {
	margin: 2px;
}

.addaddressform {
	width: 40%;
	height: 300px;
	padding: 15px;
	margin-left: auto;
	margin-right: auto;
	background-color: white;
	opacity: 1;
	position: fixed;
	z-index: 100;
}

.addaddressform input {
	margin-bottom: 8px;
	width: 80%;
}

.apprisepic{
    width:100px;
    float:left;
    margin-bottom:40px;
}
.kode-comments{
    margin-bottom:30px;
	width:100%;
	float:left;
}
.kode-comments h2{
	text-transform:uppercase;
	margin-bottom:30px;
}

.kode-comments ul{
	list-style:none;
	margin:0px;
	padding:0px;
	float:left;
	width:100%;
}
.kode-comments ul li{
	float:left;
	width:100%;
	margin-bottom:20px;
}
.kode-comments ul li .kode-thumb{
	float:left;
	width:80px;
	height:80px;
	border-radius:100%;
	overflow:hidden;
}
.kode-comments ul li .kode-thumb img{
	width:100%;
}
.kode-comments ul li .kode-text{
	padding:0px 0px 0px 100px;
	position:relative;
}
.kode-comments ul li .kode-text a.reply{
	position:absolute;
	right:0px;
	top:0px;
	color:#333;
	border:solid 1px #999;
	display:inline-block;
	padding:0px 10px 1px 10px;
	text-decoration:none;
	font-size:10px;
	line-height: 24px;
	text-transform:uppercase;
}
.replay-yy{
	right:0px;
	top:0px;
	color:#333;
	border:solid 1px #999;
	display:inline-block;
	padding:0px 10px 1px 10px;
	text-decoration:none;
	font-size:12px;
	line-height: 24px;
	text-transform:uppercase;
}
.kode-comments ul li .kode-text a.reply:hover{
	color:#fff;
}
.kode-comments ul li .kode-text h4{
	margin:0px 0px 5px 0px;
	font-size:16px;
	text-transform:uppercase;
}
.kode-comments ul li .kode-text p.designation{
	font-size:12px;
	text-transform:uppercase;
	margin:0px;
}
.kode-comments ul ul{
	padding:0px 0px 0px 100px;
	margin-top:20px;
}

</style>
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
	<!--面包屑-->
	<div id="appriseform" class="panel addaddressform" style="display:none">
		<div class="panel-bodyt-center bk-padding-off bk-wrapper">
<!-- 			<img src="images/addressheader.jpg" alt="" class="img-responsive"> -->
		</div>
		<div class="panel-body text-center">
			<form id="fillapprise" onSubmit="return false;">
				<textarea name="" id="apprisemessage" rows="6" class="form-control" placeholder="在这儿加上一段走心的评论吧~~"></textarea>
			</form>
			<div id="appriseerror" class="error">我是错误信息</div>
			<a id="confirmapprise" class="btn btn-primary" appriseid = "" onclick="add_comment()">确定</a>
			<a id="cancelapprise" class="btn btn-primary">取消</a>
		</div>
	</div>
	
	
	
		<div id="replayform" class="panel addaddressform" style="display:none">
		<div class="panel-bodyt-center bk-padding-off bk-wrapper">
		</div>
		<div class="panel-body text-center">
			<form id="fillreply" onSubmit="return false;">
				<textarea name="" id="replaymessage" rows="6" class="form-control" placeholder="在这儿对评论进行回复吧~~"></textarea>
			</form>
			<div id="replayerror" class="error">我是错误信息</div>
			<a id="confirmreplay" class="btn btn-primary" appriseid = "" onclick="add_replay()">确定</a>
			<a id="cancelreplay" class="btn btn-primary">取消</a>
		</div>
	</div>
	
	
	<ul id="breadcrumbs-four">
		<li><a
			href="<s:url action="productPage_pageIsTop.action" namespace="/"/>">产品首页&gt;&gt;</a></li>
		
		<li><a class="current"><s:property value="cityName" /></a></li>
	</ul>
	<!-- 面包屑end-->
	<!--页头结束-->
	<div class="ipad_v1">
		<div class="bg_miancolor">
			<div class="vacation_bd">
				<!--基本信息-->
				<div class="detail_main_wrap basefix">
					<div class="detail_main_title">
						<h1>
							<s:property value="productName" />
							<!-- <div class="tips">
                            <span class="icon_red">热门产品</span>
                        </div> -->
						</h1>
					</div>
					<!--图片信息-->
					<div class="main_left">
						<div id="js_photoviewer" class="attraction_photo_wrap">
							<div id="js-preview-photo" class="attraction_photo_big"
								data-id="">
								<img src='<c:url value="/productFiles/${productRealName}"/>'
									alt="万丽酒店-外景" height="280px" width="500px">
								<div class="photo_name">
									<p>
										<s:property value="productName" />
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="main_right mice_in_bottom" style="-webkit-box-sizing: content-box !important;
    -moz-box-sizing: content-box !important;
    box-sizing: content-box !important;">
						<div class="main_price_wrap basefix">
							<!--起价说明-->
							<div class="main_price_wrap_left">
								<strong class="total_price" id="js-product-min-price">
									<dfn>￥</dfn> <s:property value="productPrice" /><em>元</em>
								</strong> <span class="favorable_tips" id="js-product-min-price-remark">
								</span>
							</div>
						</div>
						<div class="product_scroll_wrap">
							<!--支付方式-->
							<dl>
								<dt>产品销售热线：</dt>
								<dd>
									<s:property value="productCellphone" />
								</dd>
							</dl>

							<dl>
								<dt>销售起始时间：</dt>
								<dd>
									<s:property value="startDate" />
									~
									<s:property value="endDate" />
								</dd>
							</dl>
							<dl>
								<dt>产品描述：</dt>
								<dd>
									<s:property value="productDescription" />
								</dd>
							</dl>
							<dl>
								<dt>商家名称：</dt>
								<dd>
									<s:property value="businessName" />
								</dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="new_detail_content">
					<ul>
						<li class="active">产品详情</li>
						<li style="border-top:0px !important"><a id="chat" href="CustomerLogin?businessId=${businessId}" style="">联系客服</a></li>
					</ul>
				</div>
				<div class="under_tab_detail">
					<!--推荐玩法-->
					<div class="" id="divTourSchedule">
						<!--推荐玩法-->
						<div class="detail_content first_detail_content">
							<!--行程-->
							<h3 class="resource_title">
								行&nbsp;&nbsp;程 <i class="icon_b icon_b_03"></i>
							</h3>
							<!--    <div class="route_tab basefix">
                            <a href="javascript:void(0);" class="tab_li current">行程<b></b></a>
                        </div> -->

							<ul class="journey_list basefix" id="js_detail_travelCtrip">
								<s:iterator value="journeyList">
									<li><a id="day2"
										style="margin-top: -100px;
                                position: absolute;">&nbsp;</a>
										<div class="journey_title">
											<h5 class="time_list">
												第
												<s:property value="journeyDayNumber" />
												天
											</h5>
											<i class="icon_b icon_b_day">D<s:property
													value="journeyDayNumber" /></i>
											<h4>
												<s:property value="journeyTitle" />
											</h4>
										</div>
										<div class="journey_detail">
											<i class="icon_s icon_s_scene"></i>
											<dl>
												<dd>
													<div class="js_simple_no_show">
														<p>
															<s:property value="journeyDescription" />
														</p>
														<div class="journey_pic">
															<img title="天涯海角"
																src='<c:url value="/journeyFiles/${journeyRealName}"/>'
																height="105px" width="186px">
														</div>
													</div>
												</dd>
											</dl>
										</div></li>
								</s:iterator>


								<li class="journey_end">
									<div class="journey_detail border_none">
										<i class="icon_s icon_s_end"></i>

										<p>以上行程时间安排可能会因天气、路况等原因做相应调整，敬请谅解。</p>
									</div>
								</li>
							</ul>

						</div>

					</div>
					<!--费用-->

					<div class="detail_content">
						<i id="fy" class="under_tab_anchor"></i>

						<h3 class="resource_title">
							产品特色 <i class="icon_b icon_b_04"></i>
						</h3>
						<dl class="detail_date">
							<dt>产品特色</dt>
							<dd>
								<!-- <ul class="num_list">
                                <li>全程往返机票，包含机票税及燃油附加费。</li>
                                <li>当地酒店住宿费用。</li>
                            </ul> -->
								<s:property value="productFeature" />
							</dd>
						</dl>
					</div>

					<div class="detail_content">
						<i id="fy" class="under_tab_anchor"></i>

						<h3 class="resource_title">
							费&nbsp;&nbsp;用 <i class="icon_b icon_b_03"></i>
						</h3>
						<dl class="detail_date">
							<dt>费用包含</dt>
							<dd>
								<!-- <ul class="num_list">
                                <li>全程往返机票，包含机票税及燃油附加费。</li>
                                <li>当地酒店住宿费用。</li>
                            </ul> -->
								<s:property value="costDescription" />
							</dd>
						</dl>
					</div>


					<!--预订须知-->

					<div class="detail_content">
						<i id="ydxz" class="under_tab_anchor"></i>
						<h3 class="resource_title">
							预订须知 <i class="icon_b icon_b_06"></i>
						</h3>
						<dl class="detail_date">
							<dt>出行警示及说明</dt>
							<dd>
								<ul class="num_list">
									<li>为普及旅游安全知识及旅游文明公约，使您的旅程顺利圆满完成，特制定 <a rel="nofollow"
										href="http://www.flycua.com/guide2/xqfw/lkxz/4680/index.html"> 《联航旅游须知》 </a> ，请您认真阅读并切实遵守。
									</li>
									<li>请您携带身份证等有效证件和产 品确认单，建议您携带游泳衣、防晒 霜、晴雨伞、沙滩鞋、创可贴、雨衣、
										常备药品等物品出行。</li>
								</ul>
							</dd>
						</dl>

						<dl class="detail_date border_none">
							<dt>安全指南</dt>
							<dd>
								<p>旅游安全是旅游的生命线， 为保障游客“住得安心、吃得放心、 玩的舒心”，联航从出行常识、旅游
									活动和特殊人群三方面为您提供旅游安 全指南。出行前，提醒您仔细阅读相关 内容，重视旅游安全，使您的出游真正成为
									“快乐之游、难忘之游、收获之游”。</p>
							</dd>
						</dl>
					</div>
				</div>
				<!-- 评论 -->
				<div class="under_tab_detail" style="border:1px thin solid">
					
					<div class="kode-comments">
					<ul id="reviews">

				    </ul>
				    </div>
				  
						
							<div  style="margin:10px auto;width: 160px;">
								<div class='best-seller-pro'>
										<div class='kode-caption' >
											<a class='add-to-cart' onclick="startapprise(event)" style="padding: 10px 60px;
    border: 1px solid #ddd;
    margin:0px auto;
    display: inline-block;
    background-color: #6BC2FA;
    color: white;
    font-size: 14pt;
    border-radius: 5px">评价</a>
										</div>
								</div>
							</div>
						
					
				</div>
				
				
				
				
			</div>

		</div>
	</div>
	<%@ include file="../../foot.jsp"%>
	<script src="js/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("nav").find("li").eq(2).addClass("nav_active");
		})
			//显示隐藏的评价框
			var usertype=1;
		function startapprise(id){

			$.ajax({
				url : "GetUsrname",
				dataType : "json",
				success : function(data) {
					if (data.userName == "") {
						swal("抱歉", "请先登录！", "error");
					} else if(data.userType == 1){	// user
						startAppriseCore();
					} else {	//business
						swal("抱歉", "商家身份不允许评论~", "error");
					}
				}
			})

		}
		
		
		function startAppriseCore(){
		    $('#appriseerror').html("");
		    $('#apprisemessage').val("");
		    //1.获得隐藏的DIV
			var overDiv = document.getElementById("appriseform");
			//2.将隐藏的div有隐藏显现出来hidden-->block
			overDiv.style.display = "block";
			/**
			 *控制遮罩层的宽度，高度；
			 *
			 */
			var w = window.innerWidth;//返回窗口的文档显示区的宽度;
			var h = window.innerHeight;//返回窗口的文档显示区的高度;
			console.log("w=" + w + "h=" + h);
			/*遮罩层的内部div垂直居中*/
			var vmiddle = Math.floor((h - 300) / 2);
			var hmiddle = Math.floor(0.3 * w);
			overDiv.style.top = vmiddle + "px";
			overDiv.style.left = hmiddle + "px";
			/*
			var targ = e.target;
			//var userName = targ.previousElementSibling.innerHTML;
			var productId = targ.previousElementSibling.previousElementSibling.innerHTML;
			//var commentId = targ.parentNode.getAttribute("appriseid");
			//var picurl = targ.parentNode.parentNode.firstElementChild.firstElementChild.getAttribute("src");
			var appriseinfo = document.getElementById("apprise-item");
			appriseinfo.firstElementChild.setAttribute("src", picurl);
			appriseinfo.firstElementChild.nextElementSibling.innerHTML = bookname;
			appriseinfo.firstElementChild.nextElementSibling.nextElementSibling.innerHTML = bookauthor;
			document.getElementById("confirmapprise").setAttribute("appriseid", bookID);
			*/
		}
		//显示隐藏的回复框
		var replayid=0;
		function startReplay(id){
			replayid=id;
			$.ajax({
				url : "GetUsrname",
				dataType : "json",
				success : function(data) {
					if (data.userName == "") {
						swal("抱歉", "请先登录！", "error");
					} 
					else {
						usertype=data.userType;
						startReplayCore();
						}
				}
			})

		}
		
		
		function startReplayCore(){
		    $('#replayerror').html("");
		    $('#replaymessage').val("");
		    //1.获得隐藏的DIV
			var overDiv = document.getElementById("replayform");
			//2.将隐藏的div有隐藏显现出来hidden-->block
			overDiv.style.display = "block";
			/**
			 *控制遮罩层的宽度，高度；
			 *
			 */
			var w = window.innerWidth;//返回窗口的文档显示区的宽度;
			var h = window.innerHeight;//返回窗口的文档显示区的高度;
			console.log("w=" + w + "h=" + h);
			/*遮罩层的内部div垂直居中*/
			var vmiddle = Math.floor((h - 300) / 2);
			var hmiddle = Math.floor(0.3 * w);
			overDiv.style.top = vmiddle + "px";
			overDiv.style.left = hmiddle + "px";
		}
		
		
		
		
		//添加评论form的取消按钮
		$('#cancelapprise').click(function() {
			//将遮罩层的内容隐藏掉
			//1.获得隐藏div
			var overDiv = document.getElementById("appriseform");
			overDiv.style.display = "none";
		});
		//添加评论form的确定按钮
		$('#confirmapprise').click(function() {
		    var content = $('#apprisemessage').val();
		    if(content == ""){
		        $('#appriseerror').html("亲，评论不能为空!");
		        return;
		    }else{
		        $('#appriseerror').html("");
		    }
		   
		});
		
		
		//添加回复form的取消按钮
		$('#cancelreplay').click(function() {
			//将遮罩层的内容隐藏掉
			//1.获得隐藏div
			var overDiv = document.getElementById("replayform");
			overDiv.style.display = "none";
		});
		//添加回复form的确定按钮
		$('#confirmreplay').click(function() {
		    var content = $('#replaymessage').val();
		    if(content == ""){
		        $('#replayerror').html("亲，回复不能为空!");
		        return;
		    }else{
		        $('#replayerror').html("");
		    }		   
		});
		
		
		function add_comment(){
			 var content = $('#apprisemessage').val();
			 $.ajax({
					url:"AddComment",
					type:"post",
					data:{"content":content,"productId":${productId},"replayId":0},
					dataType:"json",
					success:function(data){
							var overDiv = document.getElementById("appriseform");
							overDiv.style.display = "none";
							LoadComment();
					}
				});
		}
		
		function add_replay(){
			var content = $('#replaymessage').val();
			 $.ajax({
					url:"AddComment",
					type:"post",
					data:{"content":content,"productId":${productId },"replayId":replayid},
					dataType:"json",
					success:function(data){
							var overDiv = document.getElementById("replayform");
							overDiv.style.display = "none";
							LoadComment();
					}
				});
		}
		
		LoadComment();
		
		function LoadComment(){
			$("ul[id='reviews']").empty();
			$.ajax({
				url : "LoadComment",
				data : {"productId":${productId }},
				type : "post",
				dataType : "json",
				success : function(data) {
					$.each(data, function(i,list) {
						if(list.userName.substring(0,3)=="商家:") var src="<img src='images/nico2.jpg' alt=''/>";
						else var src="<img src='images/nico.jpg' alt=''/>";
						if(list.replayId==0){
						var strLi = "<li>" + "<div class='kode-thumb'>"
								+ "<a href='#'>"
								+ src
								+ "</a>" + "</div>" + "<div class='kode-text'>"
								+ "<h4>" + list.userName + "</h4>"
								+ "<p class='designation'>"
								+ formatDate(list.date) + "</p>" + "<p>"
								+ list.content + "</p>" 
								+ "<a id="+list.commentId+" style='right:0px;position:absolute' onclick='startReplay(this.id)'>"+"回复"+"</a>"
								+"</div>" + "</li>";
								}
						else {
							var yytext;
							for(var j=0;j<i;j++){
								if(data[j].commentId==list.replayId) yytext=data[j].userName+":"+data[j].content;
							}
							var strLi = "<li>" + "<div class='kode-thumb'>"
									+ "<a href='#'>"
									+ src
									+ "</a>" + "</div>" + "<div class='kode-text'>"
									+ "<h4>" + list.userName + "</h4>"
									+ "<p class='designation'>"
									+ formatDate(list.date) + "</p>" +"<div class='replay-yy'>"+"<p>"
									+ "引用“" + yytext +"”"+ "</p>" +"</div>"+"<br/>"
									+  "<p>"+"回复："
									+ list.content + "</p>" 
									+ "<a id="+list.commentId+" style='right:0px;position:absolute' onclick='startReplay(this.id)'>"+"回复"+"</a>"
									+"</div>" + "</li>";
							}
						$("ul[id='reviews']").append(strLi);
					})
				}
			})
		}
			function formatDate(data) {
			var d = new Date(data); //for date in the format "YYYY-MM-DDTHH:MM:SS" where T means timezone!!! 
			var formattedDate = d.getFullYear() + "-" + (d.getMonth() + 1)
					+ "-" + d.getDate();
			var hours = ((d.getHours()) % 24 < 10) ? "0"
					+ (d.getHours()) % 24 : (d.getHours()) % 24;
			var minutes = (d.getMinutes() < 10) ? "0" + d.getMinutes() : d
					.getMinutes();
			var seconds = (d.getSeconds() < 10) ? "0" + d.getSeconds() : d
					.getSeconds();
			var formattedTime = hours + ":" + minutes + ":" + seconds;
			formattedDate = formattedDate + " " + formattedTime;
			return formattedDate;
		}
			
			
		

	</script>
</body>
</html>