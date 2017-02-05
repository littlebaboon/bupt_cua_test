<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>在线书城</title>
<!-- icon -->
<link rel="shortcut icon" href="siteicon.ico" type="image/x-icon" />
<!-- CUSTOM STYLE -->
<link href="css/style.css" rel="stylesheet">
<!-- THEME TYPO -->
<link href="css/themetypo.css" rel="stylesheet">
<!-- BOOTSTRAP -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- COLOR FILE -->
<link href="css/color.css" rel="stylesheet">
<!-- FONT AWESOME -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- BX SLIDER -->
<link href="css/jquery.bxslider.css" rel="stylesheet">
<!-- Boostrap Slider -->
<link href="css/bootstrap-slider.css" rel="stylesheet">
<!-- Widgets -->
<link href="css/widget.css" rel="stylesheet">
<link href="css/bootstrap-editable.css" rel="stylesheet" />
<link href="css/bootkit.css" rel="stylesheet" />
<!-- responsive -->
<link href="css/responsive.css" rel="stylesheet">
<!-- Component -->
<link href="js/dl-menu/component.css" rel="stylesheet">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" type="text/css" href="css/bookblock.css" />
<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
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
	background: #FE980F;
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
}

#address .panel {
	height: 300px;
}

.btn {
	margin: 2px;
}

.addaddressform {
	width: 40%;
	height: 540px;
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
</style>
</head>
<body>
    <!-- 添加新地址form -->
	<div id="addaddressform" class="panel addaddressform"
		style="display:none">
		<div class="panel-body text-center bk-padding-off bk-wrapper">
			<img src="images/addressheader.jpg" alt="" class="img-responsive">
		</div>
		
	</div>
	<!-- 输入旧密码form -->
	<div id="oldpasswordform" class="over" style="display:none;">
		<div id="oldpasswordform_child" class="over_child">
			<table>
				<tbody id="over_tb">
					<tr>
						<td>请输入旧密码：</td>
						<td><input id="oldpassword" type="password"></td>
					</tr>
				</tbody>
				<tr>
					<td colspan="2" class="error" id="oldpassworderror"></td>
				</tr>
				<tr>
					<td><a id="cancel" class="btn btn-primary">取消</a></td>
					<td><a id="ok" class="btn btn-primary">确定</a></td>
				</tr>

			</table>
		</div>
	</div>
	<!-- 输入新密码form -->
	<div id="newpasswordform" class="over" style="display:none;">
		<div id="newpasswordform_child" class="over_child">
			<table>
				<tbody id="new_over_tb">
					<tr>
						<td>新密码：</td>
						<td><input id="newpassword" type="password"></td>
					</tr>
					<tr>
						<td>重复新密码：</td>
						<td><input id="renewpassword" type="password"
							onblur="check()"></td>
					</tr>
				</tbody>
				<tr>
					<td colspan="2" class="error" id="newpassworderror"></td>
				</tr>
				<tr>
					<td><a id="new_cancel" class="btn btn-primary">取消</a></td>
					<td><a id="new_ok" class="btn btn-primary">确定</a></td>
				</tr>

			</table>
		</div>
	</div>
	 tex<!-- 输入评价form -->
	<div id="appriseform" class="panel addaddressform" style="display:none">
		<div class="panel-bodyt-center bk-padding-off bk-wrapper">
			<img src="images/addressheader.jpg" alt="" class="img-responsive">
		</div>
		<div class="panel-body text-center">
		    <div id="apprise-item" style="height:150px;">
		        <img class="apprisepic" src="" alt="" />
		        <h4></h4>
		        <p></p>
		    </div>
			<form id="fillapprise" onSubmit="return false;">
				<input id="input-rating" value="2" type="number" class="rating" min=0 max=5 step=1 data-size="xs">
				<textarea name="" id="apprisemessage" rows="6" class="form-control" placeholder="在这儿加上一段走心的评论吧~~"></textarea>
			</form>
			<div id="appriseerror" class="error">我是错误信息</div>
			<a id="confirmapprise" class="btn btn-primary" appriseid = "">确定</a>
			<a id="cancelapprise" class="btn btn-primary">取消</a>
		</div>
	</div>
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!--WRAPPER START-->
	<div class="wrapper kode-header-class-3">
		<!--HEADER START-->
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand">Bookaholic</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden-sm"><a href="index.jsp">主页</a></li>
						<li class="hidden-sm"><a href="initSearchAction">开始选购</a></li>
						<li class="hidden-sm"><a href="cart.jsp">购物车</a></li>
						<li id="userbox" style="display:none;">
							<div class="userbox" style="margin-top:30px;">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<div class="profile-info">
										<span class="role">欢迎</span> <span id="usrName" class="name"></span>
									</div> <i class="fa custom-caret"></i>
								</a>
								<div class="dropdown-menu">
									<ul class="list-unstyled">
										<li><a onclick="gouserinfo()"><i class="fa fa-user"></i>我的账户</a>
										</li>
										<li><a href="Logout?"><i class="fa fa-power-off"></i>登出</a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
		<!--HEADER END-->
		<!--BANNER START-->
		<div class="kode-inner-banner">
			<div class="kode-page-heading">
				<h2>我的账户</h2>
				<ol class="breadcrumb">
					<li><a href="#">主页</a></li>
					<li class="active">我的账户</li>
				</ol>
			</div>
		</div>
		<!--BANNER END-->
		<!--CONTENT START-->
		<div
			class="panel bk-widget bk-border-off bk-noradius col-md-8 col-md-offset-2 col-sm-12"
			style="margin-top:2%;">

			<div class="panel-body bk-ltr">
				<div class="row text-center userinfo">
					<a class="col-xs-4" href="InitMyOrder?filter=0"> <i
						class="icon-money"></i><small class="bk-fg-inverse bk-fg-darken">未付款</small>
						<h4 class="bk-margin-off-bottom" id="unpaid"></h4>
					</a> <a class="col-xs-4" href="InitMyOrder?filter=1"> <i
						class="icon-truck"></i><small class="bk-fg-inverse bk-fg-darken">已付款</small>
						<h4 class="bk-margin-off-bottom" id="paid"></h4>
					</a> <a class="col-xs-4" onclick="goapprise()"> <i
						class="icon-paint-brush"></i><small
						class="bk-fg-inverse bk-fg-darken">待评价</small>
						<h4 class="bk-margin-off-bottom" id="unapprise"></h4>
					</a>
				</div>
			</div>
		</div>
		<div class="product-review-tabs col-md-12 col-md-8 col-md-offset-2"
			style="margin-top:10px;">
			<!--NAV TABS START-->
			<ul id="nav-tabs" class="nav nav-tabs" role="tablist">
				
				<li id="apprise-tab" role="presentation" class=""><a
					href="#apprise" aria-controls="reviews" role="tab"
					data-toggle="tab" aria-expanded="false">评价已购书籍</a></li>
			</ul>
			<!--NAV TABS END-->
			<!--TAB PANEL START-->
			<div id="tab-content" class="tab-content">
				


				<div role="tabpanel" class="tab-pane fade" id="apprise">
				</div>
			</div>
		</div>
		<!--CONTENT END-->
		<footer class="footer-3">
			<div class="container">
				<div class="row">
					<!--CATEGORY WIDGET START-->
					<div class="col-md-6 col-sm-6">
						<div class="widget widget-categories">
							<h2>站点地图</h2>
							<ul>
								<li><a href="index.jsp">主页</a></li>
								<li><a href="books.jsp">开始选购</a></li>
								<li><a onclick="gocart()">购物车</a></li>
								<li><a onclick="gouserinfo()">我的账户</a></li>
							</ul>
						</div>
					</div>
					<!--CATEGORY WIDGET END-->
					<!--NEWSLETTER START-->
					<div class="col-md-6 col-sm-6">
						<div class="widget widget-contact-info">
							<h2>联系我们</h2>
							<ul>
								<li><i class="fa fa-paper-plane"></i>
									<div class="kode-text">
										<h4>地址</h4>
										<p>北京市海淀区西土城路10号北京邮电大学</p>
									</div></li>
								<li><i class="fa fa-phone"></i>
									<div class="kode-text">
										<h4>电话号码</h4>
										<p>+55(62) 55258-4570</p>
										<p>+55(62) 55258-4570</p>
									</div></li>
								<li><i class="fa fa-envelope-o"></i>
									<div class="kode-text">
										<h4>电子邮箱</h4>
										<a href="#">teamx@bupt.edu.cn</a>
									</div></li>
							</ul>
						</div>
					</div>
					<!--NEWSLETTER START END-->
				</div>
			</div>
		</footer>
		<div class="copyrights">
			<div class="container">
				<p>Copyrights © 2015-16 BUPTSSE. All rights reserved</p>
				<div class="cards">
					<img src="images/cards.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/modernizr.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.bxslider.min.js"></script>
	<script src="js/bootstrap-slider.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/dl-menu/jquery.dlmenu.js"></script>
	<script type="text/javascript" src="lib/hash.js"></script>
	<script type="text/javascript" src="lib/booklet-lib.js"></script>
	<script src="js/jquerypp.custom.js"></script>
	<script src="js/jquery.bookblock.js"></script>
	<script src="js/functions.js"></script>
	<script src="js/star-rating.js" type="text/javascript"></script>
	<script type="application/x-javascript">
		 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script src="js/bootstrap-editable.min.js"></script>
	<script type="text/javascript">


		//显示隐藏的评价框
		function startapprise(e){
		    $('#appriseerror').html("");
		    $('#apprisemessage').val("");
		    $('.rating .filled-stars').css("width","0%");
		    $('.rating-container .caption span').attr("class","label label-default");
		    $('.rating-container .caption span').html("未评价");
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
			var vmiddle = Math.floor((h - 540) / 2);
			var hmiddle = Math.floor(0.3 * w);
			overDiv.style.top = vmiddle + "px";
			overDiv.style.left = hmiddle + "px";
			var targ = e.target;
			var bookauthor = targ.previousElementSibling.innerHTML;
			var bookname = targ.previousElementSibling.previousElementSibling.innerHTML;
			var bookID = targ.parentNode.getAttribute("appriseid");
			var picurl = targ.parentNode.parentNode.firstElementChild.firstElementChild.getAttribute("src");
			var appriseinfo = document.getElementById("apprise-item");
			appriseinfo.firstElementChild.setAttribute("src", picurl);
			appriseinfo.firstElementChild.nextElementSibling.innerHTML = bookname;
			appriseinfo.firstElementChild.nextElementSibling.nextElementSibling.innerHTML = bookauthor;
			document.getElementById("confirmapprise").setAttribute("appriseid", bookID);
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
		    var bookID = $('#confirmapprise').attr('appriseid');
		    var score = $('#input-rating').val();	
		    if(score == "0"){
		        $('#appriseerror').html("亲，请给这本书评个级！");
		        return;
		    }
		    if(content == ""){
		        $('#appriseerror').html("亲，评论不能为空!");
		        return;
		    }else{
		        $('#appriseerror').html("");
		    }
		    $.ajax({
				url:"AddApprise",
				type:"post",
				data:{"content":content,"bookID":bookID,"score":score},
				dataType:"json",	
				success:function(data){
					if(data=="success"){
						var overDiv = document.getElementById("appriseform");
						overDiv.style.display = "none";
	          		}else{
						alert("Sorry,评论失败!请重新评论~");
	          		}
				}
			});
		});
	</script>
</body>
</html>