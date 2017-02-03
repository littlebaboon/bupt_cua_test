<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>客服服务</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="vendor/skycons/css/skycons.css" rel="stylesheet" />
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="css/chatpagestyle.css" rel="stylesheet" />
<link rel="stylesheet" href="css/amazeui.min.css">
<link href="plugins/bootkit/css/bootkit.css" rel="stylesheet" />
<link href="plugins/summernote/summernote.css" rel="stylesheet" />
<link href="plugins/PNotify/pnotify.custom.min.css" rel="stylesheet" />
<link href="css/sweetalert.css" rel="stylesheet" />
<link href="css/animate.css" rel="stylesheet" />
<script src="js/sweetalert.min.js"></script>
<style>
body{  
    overflow-x: hidden;  
    overflow-y: hidden;  
}  
.friend-list {
	list-style: none;
	margin-left: -40px;
	margin-top: 0;
	margin-bottom: 0;
}

.friend-list li {
	border-bottom: 1px solid black;
}

.friend-list li a img {
	float: left;
	width: 45px;
	height: 45px;
	margin-right: 0px;
}

.friend-list li a {
	position: relative;
	display: block;
	padding: 10px;
	transition: all .2s ease;
	-webkit-transition: all .2s ease;
	-moz-transition: all .2s ease;
	-ms-transition: all .2s ease;
	-o-transition: all .2s ease;
}

.friend-list li.active a {
	background-color: #3A3F45;
}

.friend-list li a .friend-name, .friend-list li a .friend-name:hover {
	color: white;
}

.friend-list li a .last-message {
	width: 65%;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	color: white;
}

.friend-list li a .time {
	position: absolute;
	top: 10px;
	right: 8px;
}

small, .small {
	font-size: 85%;
}

.friend-list li a .chat-alert {
	position: absolute;
	right: 8px;
	top: 27px;
	font-size: 10px;
	padding: 3px 5px;
}

.chat-content-container {
	overflow-y: auto;
	padding: 20px;
}

.nano {
	position: relative;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
.nano>.nano-content {
	position: absolute;
	overflow-y: auto;
	overflow-x: hidden;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
}

.mar-btm {
	margin-bottom: 15px;
}

.media-block .media-left {
	display: block;
	float: left;
}

.img-sm {
	width: 46px;
	height: 46px;
}

.media-block .media-body {
	display: block;
	overflow: hidden;
	width: auto;
}

.pad-hor {
	padding-left: 15px;
	padding-right: 15px;
}

.speech {
	position: relative;
	background: #b7dcfe;
	color: #317787;
	display: inline-block;
	border-radius: 0;
	padding: 12px 20px;
}

.speech:before {
	content: "";
	display: block;
	position: absolute;
	width: 0;
	height: 0;
	left: 0;
	top: 0;
	border-top: 7px solid transparent;
	border-bottom: 7px solid transparent;
	border-right: 7px solid #b7dcfe;
	margin: 15px 0 0 -6px;
}

.speech-right>.speech:before {
	left: auto;
	right: 0;
	border-top: 7px solid transparent;
	border-bottom: 7px solid transparent;
	border-left: 7px solid #ffdc91;
	border-right: 0;
	margin: 15px -6px 0 0;
}

.speech .media-heading {
	font-size: 1.2em;
	color: #317787;
	display: block;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	margin-bottom: 10px;
	padding-bottom: 5px;
	font-weight: 300;
}

.speech-time {
	margin-top: 20px;
	margin-bottom: 0;
	font-size: .8em;
	font-weight: 300;
}

.media-block .media-right {
	float: right;
}

.speech-right {
	text-align: right;
}

.pad-hor {
	padding-left: 15px;
	padding-right: 15px;
}

.speech-right>.speech {
	background: #ffda87;
	color: #a07617;
	text-align: right;
}

.speech-right>.speech .media-heading {
	color: #a07617;
}

.btn-primary, .btn-primary:focus, .btn-hover-primary:hover,
	.btn-hover-primary:active, .btn-hover-primary.active, .btn.btn-active-primary:active,
	.btn.btn-active-primary.active, .dropdown.open>.btn.btn-active-primary,
	.btn-group.open .dropdown-toggle.btn.btn-active-primary {
	background-color: #579ddb;
	border-color: #5fa2dd;
	color: #fff !important;
}

.btn {
	cursor: pointer;
	color: inherit;
	padding: 6px 12px;
	border-radius: 0;
	border: 1px solid 0;
	font-size: 11px;
	line-height: 1.42857;
	vertical-align: middle;
	-webkit-transition: all .25s;
	transition: all .25s;
}

.form-control {
	font-size: 11px;
	height: 100%;
	border-radius: 0;
	box-shadow: none;
	border: 1px solid #e9e9e9;
	transition-duration: .5s;
}

.nano>.nano-pane {
	background-color: rgba(0, 0, 0, 0.1);
	position: absolute;
	width: 5px;
	right: 0;
	top: 0;
	bottom: 0;
	opacity: 0;
	-webkit-transition: all .7s;
	transition: all .7s;
}

.input {
	height: 6em;
	overflow-y: auto;
	overflow-x: hidden;
	outline: 0;
	border: 0;
	font-size: large;
}

.toolbar {
	padding-left: 20px;
}

.tabs {
	margin-top: 20px;
	font-size: 30px;
}

.tabs .tab-item {
	border-right: 1px solid black;
}

.tab-item a {
	color: white;
}

.tabs .active a {
	color: #3caf36;
}

.noteoption {
	padding: 20px;
	color: white;
}

ul.messages-list {
	list-style: none;
}

ul.messages-list li:hover {
	background: #FAFAFA;
	padding: 10px;
}

ul.messages-list li {
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	cursor: pointer;
	margin-bottom: 0;
	padding: 10px;
	border-bottom: 1px solid #f7f7f7;
}

ul.messages-list li a {
	color: #777;
}

ul.messages-list li.unread .header, .mailbox ul.messages-list li.unread .title
	{
	font-weight: bold;
}

.checkbox-custom {
	position: relative;
	padding: 0 0 0 25px;
	margin-bottom: 7px;
	margin-top: 0;
}

ul.messages-list li .header .from {
	width: 49.9%;
	white-space: nowrap;
	overflow: hidden !important;
	text-overflow: ellipsis;
}

ul.messages-list li .header .date {
	width: 50%;
	text-align: right;
	float: right;
}

.flowstep {
	
}

.flowstep ol {
	overflow: hidden;
	zoom: 1;
}

.flowstep-5 {
	margin-left: 0px;
	padding-left: 0px;
}

ul, ol {
	list-style: none;
}

.flowstep-5 li {
	width: 25%;
}

.flowstep li {
	float: left;
	text-align: center;
}

.flowstep .step-name {
	padding: 3px 0;
	font-weight: 700;
	color: #888;
}

.flowstep .step-first .step-done .step-no {
	background-position: 50% -204px;
}

.flowstep .step-done .step-no {
	background-position: 50% -170px;
}

.flowstep .step-no {
	height: 34px;
	line-height: 34px;
	font-family: 'arial black';
	color: #fff;
	font-size: 18px;
}

.flowstep .step-no, .flowstep .step-sub-box .step-sub {
	background: url(images/progressbar.png) no-repeat 50% -102px;
}

.flowstep .step-time {
	color: #999;
	margin-top: 10px;
}

.flowstep .step-time {
	color: #999;
	padding: 8px 0;
}

.flowstep .step-cur .step-no {
	background-position: 50% 0;
}

.flowstep .step-last .step-no {
	background-position: 50% -136px;
}

.flowstep .step-no, .flowstep .step-sub-box .step-sub {
	background: url(images/progressbar.png) no-repeat 50% -102px;
}

.flowstep .step-last .step-done .step-no {
	background-position: 50% -68px;
}

.uline-title {
	margin-bottom: 15px;
	padding: 0 0 37px;
	text-align: center;
	background: url("images/utitlebg.png");
	background-repeat: no-repeat;
	background-position: center bottom -2px;
}

.lead {
	margin: 0;
	line-height: 93px;
	font-size: x-large;
}

.contact-box {
    float: left;
    width: 100%;
    padding: 30px;
    border : solid 2px;
    margin-bottom: 20px;
}
.item-action {
    background: #FFF;
    border-radius: 100px;
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.2);
    color: #B4BBC1;
    display: inline-block;
    font-size: 14px;
    font-size: 1.4rem;
    height: 30px;
    line-height: 30px;
    line-height: 3rem;
    position: relative;
    width: 30px;
    text-align: center;
    margin: 2px;
    -webkit-transition-property: color;
    -moz-transition-property: color;
    transition-property: color;
    -webkit-transition-duration: 0.3s;
    -moz-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-timing-function: cubic-bezier(0.2, 0.6, 0.25, 1);
    -moz-transition-timing-function: cubic-bezier(0.2, 0.6, 0.25, 1);
    transition-timing-function: cubic-bezier(0.2, 0.6, 0.25, 1);
    -webkit-transition-delay: 0.1s;
    -moz-transition-delay: 0.1s;
    transition-delay: 0.1s;
}
.item-action:hover {
    color: #57636C;
    text-decoration: none;
}
</style>
</head>

<body>
	<div class="col-md-3 col-xs-3" style="padding:0;background: #2e3238;">
		<div class="panel bk-widget bk-border-off bk-noradius"
			style="margin:0;">
			<div id="leftheader"
				class="panel-body text-left bk-fg-white bk-padding-top-10 bk-padding-bottom-10"
				style="border-bottom: solid 2px black;">
				<div class="row">
					<div class="col-xs-4 bk-vcenter">
						<div class="bk-avatar">
							<img src="images/support.png" alt=""
								class="img-circle bk-img-80 bk-border-white bk-border-3x">
						</div>
					</div>
					<div class="col-xs-8 text-right bk-vcenter">
						<h4 class="bk-margin-off" id="supportname"></h4>
						<div class="bk-margin-top-10">
							<a onclick="logOut()" class="btn btn-default pull-right">登出</a>
						</div>
					</div>
					<div class="tabs">
						<div class="col-xs-6 text-center tab-item active">
							<a title="在线客户" onclick="gochat(event)"><i
								class="fa fa-comment"></i></a>
						</div>
						<div class="col-xs-6 text-center tab-item">
							<a title="客户留言" onclick="gonote(event)"><i
								class="fa fa-envelope"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div id="list-container" class="nano has-scrollbar tab-pane">
				<div class="nano-content pad-all" tabindex="0">
					<div id="nouser" class="noconversation"
						style="text-align:center;vertical-align:middle;margin-top: 35%;color:white;">
						<i class="fa fa-users" style="font-size:100px;"></i> <br>
						暂时没有在线客户
					</div>
					<ul class="friend-list" id="customerList">
					</ul>
				</div>
			</div>
			<div id="note-list-container" class="nano has-scrollbar tab-pane" style="">
				<div class="nano-content pad-all" tabindex="0">
					<ul class="friend-list">
						<li class="noteoption active" style="background-color: #3A3F45"
							onclick="gounreadnote()">
							<div class="text-left" style="padding-left:10%;">
								<strong><i class="fa fa-pencil"></i></strong> <strong
									style="padding-left:10%;">未读留言</strong> <span
									class="label label-danger" style="margin-left:20%;"
									id="unreadnotecount"></span>
							</div>
						</li>
						<li class="noteoption" onclick="goreadnote()">
							<div class="text-left" style="padding-left:10%;">
								<strong><i class="fa fa-check"></i></strong> <strong
									style="padding-left:10%;">已读留言</strong> <span
									class="label label-success" style="margin-left:20%;"
									id="readnotecount"></span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="chatpanel" class="col-md-9 col-xs-9" style="padding:0;">
		<div class="panel bk-widget bk-border-off bk-noradius"
			style="margin:0;">
			<div id="rightheader"
				class="panel-body bk-bg-white text-center bk-padding-top-10 bk-padding-bottom-10">
				<div class="row">
					<div class="col-xs-6 text-right bk-vcenter">
						<h6 class="bk-margin-off" id="chatcustomername"></h6>
					</div>
					<div class="col-xs-6 bk-vcenter text-left">
						<i class="fa fa-comments-o"></i>
					</div>
				</div>
			</div>
			<hr class="bk-margin-off" />
			<div class="bk-bg-white">
				<div class="nano has-scrollbar bk-bg-white">
					<div class="chat-content-container" tabindex="0">
						<div id="noconversation" class="noconversation"
							style="text-align:center;vertical-align:middle;margin-top: 23%;;">
							<i class="fa fa-comments" style="font-size:100px;"></i> <br>
							未选择聊天
						</div>
						<div id="nomessage" class="noconversation"
							style="text-align:center;vertical-align:middle;margin-top: 15%;display:none;">
							<i class="fa fa-comment-o" style="font-size:100px;"></i> <br>
							暂时没有新消息
						</div>
						<ul class="list-unstyled media-block" id="chatarea">

						</ul>
					</div>
					<div class="nano-pane">
						<div class="nano-slider"
							style="height: 141px; transform: translate(0px, 0px);"></div>
					</div>
				</div>
				<div id="inputarea" class="inputarea-container bk-bg-white">
					<hr class="bk-margin-off" />
					<div class="toolbar" id="tool_bar">
						
					</div>
					<div id="chatinput">
						<textarea id="inputtxt" class="input col-md-12 col-xs-12"></textarea>
					</div>
					<div id="send" class="text-right bk-bg-white">
						<a class="btn btn-primary" onclick="sendMessage()"
							style="margin-right:20px;"> <i class="fa fa-send"></i> 发送
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="notepanel" class="col-md-9 col-xs-9" style="padding:0;display:none;">
		<div class="panel bk-widget bk-border-off bk-noradius"
			style="margin:0;">
			<div id="rightheader"
				class="panel-body bk-bg-white text-center bk-padding-top-10 bk-padding-bottom-10">
				<div class="row">
					<div class="col-xs-6 text-right bk-vcenter">
						<h6 class="bk-margin-off" id="noteheadertxt">未读留言</h6>
					</div>
					<div class="col-xs-6 bk-vcenter text-left">
						<i class="fa fa-envelope-o"></i>
					</div>
				</div>
			</div>
			<hr class="bk-margin-off" />
			<div id="notearea" class="bk-bg-white"
				style="overflow-y: scroll;">
				<div id="nonote" class="noconversation"
					style="text-align:center;vertical-align:middle;padding-top: 23%;display:none;">
					<i class="fa fa-edit" style="font-size:100px;"></i> <br> <span
						id="nonotetxt">没有未读留言</span>
				</div>
				<div id="unreadnoteoperation" style="padding-left:42px;padding-top:10px;display:none;">
				    <span class='checkbox-custom'>
				        全选<input type='checkbox' class='selectall' onclick="checkall(event)">
					    <label for='mailInbox'></label>
				    </span>
				    <a class="item-action fa fa-trash-o" onclick="deletenotes()" title="删除所选留言"></a>
				    <a class="item-action fa fa-tags" onclick="changenotestatus()" title="将所选留言标为已读"></a>
				</div>
				<div id="readnoteoperation" style="padding-left:42px;padding-top:10px;display:none;">
				    <span class='checkbox-custom'>
				        全选<input type='checkbox' class='selectall' onclick="checkall(event)">
					    <label for='mailInbox'></label>
				    </span>
				    <a class="item-action fa fa-trash-o" onclick="deletenotes()" title="删除所选留言"></a>
				</div>
				<ul id="notelist" class="messages-list">

				</ul>
			</div>
			<div id="notedetail" class="bk-bg-white" style="overflow-y: scroll;padding-top:5%;display:none;">
				<div class="col-md-4 text-center">
					<blockquote style="background-color:white;font-family: inherit;">
						<div style="margin-bottom:15px;">
							<b>留言状态</b><br />
						</div>
						<div style="margin-bottom:15px;">
							<span id="notestatuslabel" class=""></span>
						</div>
						<a id="gosw" class="btn btn-primary" style="width:50%">标为已读</a>
					</blockquote>
				</div>
				<div class="row text-center col-md-8">
					<div class="flowstep">
						<ol id="cancelstats" class="flowstep-5 ordecancelstatus">
							<li class="step-first" style="width:50%;">
								<div class="step-done">
									<div class="step-name">未读</div>
									<div class="step-no"></div>
								</div>
							</li>
							<li class="step-last" style="width:50%;">
								<div id="beenread" class="">
									<div class="step-name">已读</div>
									<div class="step-no">2</div>
								</div>
							</li>
						</ol>
					</div>
				</div>
				<div class="col-sm-12">
					<h2 class="uline-title text-center">客户</h2>
				</div>
				<div class="col-md-6 col-md-offset-3">
					<div class="contact-box">
						<div class="row">
							<div class="">
								<table>
									<tbody>
										<tr>
											<td><i class="fa  fa-user"></i></td>
											<td>姓名:</td>
											<td id="notename"></td>
										</tr>
										<tr>
											<td><i class="fa fa-phone"></i></td>
											<td>电话：</td>
											<td id="notephone"></td>
										</tr>
										<tr>
											<td><i class="fa  fa-envelope"></i></td>
											<td>邮箱：</td>
											<td id="noteemail"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<h2 class="uline-title text-center">留言</h2>
				</div>
				<textarea id="notemessage" class="col-xs-6 col-xs-offset-3" cols="30" rows="8" disabled="disabled" style="border:none;"></textarea>
			</div>
		</div>
	</div>
	<script src="vendor/js/jquery.min.js"></script>
	<script src="vendor/js/jquery-2.1.1.min.js"></script>
	<script src="vendor/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/skycons/js/skycons.js"></script>
	<script src="plugins/summernote/summernote.js"></script>
	<script src="plugins/PNotify/pnotify.custom.min.js"></script>
	<script type="text/javascript">
		var ringtone = document.createElement("audio");
		PNotify.prototype.options.styling = "bootstrap3";
		ringtone.src = "ringtone.mp3";
		ringtone.volume = 0.80;
		ringtone.autoPlay = false;
		ringtone.preLoad = true;
		var ip = window.location.hostname;  
		Array.prototype.remove = function(dx) {
			if (isNaN(dx) || dx > this.length) {
				return false;
			}
			for (var i = 0, n = 0; i < this.length; i++) {
				if (this[i] != this[dx]) {
					this[n++] = this[i]
				}
			}
			this.length -= 1;
		}
		$(document).ready(
				function() {
					var h = window.innerHeight;//返回窗口的文档显示区的高度;
					var leftheaderheight = $('#leftheader').outerHeight();
					var rightheaderheight = $('#rightheader').outerHeight();
					var chatareah = (h - rightheaderheight) * 0.7;
					var inputareah = (h - rightheaderheight) * 0.3;
					var toolbarh = inputareah * 0.2;
					var inputh = inputareah * 0.6;
					var sendh = inputareah * 0.2;
					var listcontainerh = chatareah + inputareah
							+ rightheaderheight - leftheaderheight;
					$('#list-container').attr("style",
							"height:" + listcontainerh + "px;");
					$('#note-list-container').attr("style",
							"height:" + listcontainerh + "px;display:none;");
					$('.chat-content-container').attr("style",
							"height:" + chatareah + "px;");
					$('#inputarea').attr("style",
							"height:" + inputareah + "px;");
					$('#tool_bar').attr(
							"style",
							"height:" + toolbarh + "px;font-size:" + 0.6
									* toolbarh + "px;");
					$('#chatinput').attr("style", "height:" + inputh + "px;");
					$('#send').attr("style", "height:" + sendh + "px;");
					$('#inputarea').css("visibility", "hidden");
					$('#notepanel').css("height",
							$('#chatpanel').outerHeight() + "px");
					$('#notearea').css(
							"height",
							$('#chatpanel').outerHeight() - rightheaderheight
									+ "px");
					$('#notedetail').css(
							"height",
							$('#chatpanel').outerHeight() - rightheaderheight
									+ "px");
					bindConversation();
				});
		var webSocket = new WebSocket(
				"ws://" + ip + ":8080/bupt_cua_test/WebSocketDemo");
		var customers = [];//记录当前连接的客户以及聊天记录
		webSocket.onpen = function(message) {
			processOpen(message);
		};
		webSocket.onmessage = function(message) {
			processMessage(message);
		};
		webSocket.onclose = function(message) {
			processClose(message);
		};
		webSocket.onerror = function(message) {
			processError(message);
		};
		function processOpen(message) {

		}
		function processMessage(message) {
			var data = message.data;
			var o = eval('(' + data + ')');//将字符串转换成JSON
			//新的客户连接
			if (o.type == 'newcustomer') {
				//推送通知
				new PNotify({
					title : o.data,
					text : "用户加入客服服务",
					icon : 'fa fa-user',
					buttons : {
						sticker : false,
					},
					animate : {
						animate : true,
						in_class : 'rotateInDownLeft',
						out_class : 'rotateOutUpRight'
					},
					delay : 3000
				});
				var lisStr = "<li class='bounceInDown' name='" + o.data + "'><a class='clearfix'>"
						+ "<img src='images/customer.png' alt='' class='img-circle'>"
						+ "<div class='friend-name'>"
						+ "<strong class='name'>"
						+ o.data
						+ "</strong>"
						+ "</div>"
						+ "<div class='last-message text-muted'></div>"
						+ "<small class='chat-alert label label-danger'></small>"
						+ "</a></li>";
				$('#nouser').css("display", "none");
				$("#customerList").append(lisStr);
				//新建一个聊天记录
				var log = [];
				var newchatlog = new chatlog(o.data, log, 0);
				customers[customers.length] = newchatlog;
				bindConversation();
			} else if (o.type == 'newsupport') {//更新客服的名字
				$("#supportname").html(o.data);
			} else if (o.type == 'message') {//来自客户的新消息
				ringtone.play();//提示音
				var mydate = new Date();
				var t = mydate.toLocaleString();
				var incomingcustomer = o.customername;
				var licus = $("li[name='" + incomingcustomer + "']");
				var liStr;
				if (licus.attr("class") == 'bounceInDown active') {//如果消息来自当前会话的客户
					$('#nomessage').css("display", "none");
					liStr = "<li class='mar-btm'>"
							+ "<div class='media-left'>"
							+ "<img src='images/customer.png' class='img-circle img-sm' alt='Profile Picture'>"
							+ "</div>" + "<div class='media-body pad-hor'>"
							+ "<div class='speech'>"
							+ "<a href='#' class='media-heading'>"
							+ incomingcustomer + "</a>" + "<p>" + o.data
							+ "</p>" + "<p class='speech-time'>"
							+ "<i class='fa fa-clock-o fa-fw'></i>" + t
							+ "</p>" + "</div>" + "</div>" + "</li>";
					//前端聊天区域扩展新消息
					$('#chatarea').append(liStr);
					// 把滚动条滚动到底部
					$(".chat-content-container").scrollTop(
							$(".chat-content-container")[0].scrollHeight);
					//更新聊天记录
					$.each(customers, function(n, value) {
						if (value.username == incomingcustomer) {
							value.log[value.log.length] = liStr
						}
					});
				} else {//如果消息来自其他客户
					var unreadcount;//未读信息数量
					var lastmessage = o.data.substr(0, 10) + "......";//这里截取前10个字符
					liStr = "<li class='mar-btm'>"
							+ "<div class='media-left'>"
							+ "<img src='images/customer.png' class='img-circle img-sm' alt='Profile Picture'>"
							+ "</div>" + "<div class='media-body pad-hor'>"
							+ "<div class='speech'>"
							+ "<a href='#' class='media-heading'>"
							+ incomingcustomer + "</a>" + "<p>" + o.data
							+ "</p>" + "<p class='speech-time'>"
							+ "<i class='fa fa-clock-o fa-fw'></i>" + t
							+ "</p>" + "</div>" + "</div>" + "</li>";
					//更新聊天记录
					$.each(customers, function(n, value) {
						if (value.username == incomingcustomer) {
							value.log[value.log.length] = liStr
							value.unreadcount++;
							unreadcount = value.unreadcount;
						}
					});
					//更新客户列表信息
					licus.find(".last-message").html(lastmessage);
					licus.find(".chat-alert").html(unreadcount);
					//推送通知
					new PNotify({
						title : incomingcustomer,
						text : lastmessage,
						icon : 'fa fa-comment',
						buttons : {
							sticker : false,
						},
						animate : {
							animate : true,
							in_class : 'rotateInDownLeft',
							out_class : 'rotateOutUpRight'
						},
						delay : 3000
					});
				}
			} else if (o.type == 'userlogout') {//客户登出
				var incomingcustomer = o.data;
				//推送通知
				new PNotify({
					title : incomingcustomer,
					text : "用户离开客服服务",
					icon : 'fa fa-user',
					buttons : {
						sticker : false,
					},
					animate : {
						animate : true,
						in_class : 'rotateInDownLeft',
						out_class : 'rotateOutUpRight'
					},
					delay : 3000
				});
				var licus = $("li[name='" + incomingcustomer + "']");
				if (licus.attr("class") == 'bounceInDown active') {//如果消息来自当前会话的客户
					$('#chatarea').empty();//清空当前聊天区域
					$('#chatcustomername').html("");//清空会话名称
					$('#noconversation').css("display", "block");//提示选择新的会话
					$('#inputarea').css("visibility", "hidden");//隐藏输入框
				}
				$('#nomessage').css("display", "none");
				licus.remove();
				//删除聊天记录
				for (var i = 0; i < customers.length; i++) {
					if (customers[i].username == incomingcustomer) {
						customers.remove(i);
						break;
					}
				}
				if (customers.length == 0) {
					$('#nouser').css("display", "block");
				}
			}
		}
		//发送消息
		function sendMessage() {
			$('#nomessage').css("display", "none");
			var supportname = $('#supportname').html();
			var customername = $('#chatcustomername').html();
			var mydate = new Date();
			var t = mydate.toLocaleString();
			var markupStr = $('#inputtxt').val();
			if (markupStr == "") {//消息为空
				swal("错误!", "消息不能为空！", "error");
				return;
			}
			var liStr = "<li class='mar-btm'>"
					+ "<div class='media-right'>"
					+ "<img src='images/support.png' class='img-circle img-sm' alt='Profile Picture'>"
					+ "</div>"
					+ "<div class='media-body pad-hor speech-right'>"
					+ "<div class='speech'>"
					+ "<a href='#' class='media-heading'>" + supportname
					+ "</a>" + "<p>" + markupStr + "</p>"
					+ "<p class='speech-time'>"
					+ "<i class='fa fa-clock-o fa-fw'></i>" + t + "</p>"
					+ "</div>" + "</div>" + "</li>"
			//前端聊天区域扩展新消息
			$('#chatarea').append(liStr);
			$('#inputtxt').val("");
			// 把滚动条滚动到底部
			$(".chat-content-container").scrollTop(
					$(".chat-content-container")[0].scrollHeight);
			//更新聊天记录
			$.each(customers, function(n, value) {
				if (value.username == customername) {
					value.log[value.log.length] = liStr
				}
			});
			//封装并发送给服务器的消息
			webSocket.send(JSON.stringify({
				type : "message",
				fromname : supportname,
				toname : customername,
				content : markupStr
			}));
		}
		function processClose(message) {
		}
		//点击“在线客户”标签
		function gochat(e) {
			$('.tab-item').attr("class", "col-xs-6 text-center tab-item");
			$(e.target).parent().parent().attr("class",
					"col-xs-6 text-center tab-item active");
			$('#list-container').css("display", "block");
			$('#note-list-container').css("display", "none");
			$('#chatpanel').css("display", "block");
			$('#notepanel').css("display", "none");
		}
		//点击“客户留言”标签
		function gonote(e) {
			getreadcount();
			getunreadcount();
			$('.tab-item').attr("class", "col-xs-6 text-center tab-item");
			$(e.target).parent().parent().attr("class",
					"col-xs-6 text-center tab-item active");
			$('#list-container').css("display", "none");
			$('#note-list-container').css("display", "block");
			$('#chatpanel').css("display", "none");
			$('#notepanel').css("display", "block");
			gounreadnote();
		}
		//给每个会话对象绑定选择会话对象出发的函数
		function bindConversation() {
			$('.bounceInDown')
					.click(
							function() {
								$('.bounceInDown')
										.attr("class", "bounceInDown");
								$(this).attr("class", "bounceInDown active");
								$(this).find(".last-message").html("");
								$(this).find(".chat-alert").html("");
								$('#noconversation').css("display", "none");
								$('#inputarea').css("visibility", "visible");
								var name = $(this).find(".name").html();
								$('#chatcustomername').html(name);
								$
										.each(
												customers,
												function(n, value) {
													if (value.username == name) {
														$('#chatarea').empty();
														if (value.log.length != 0) {
															$('#nomessage')
																	.css(
																			"display",
																			"none");
															$
																	.each(
																			value.log,
																			function(
																					j,
																					value) {
																				$(
																						'#chatarea')
																						.append(
																								value);
																			});
															// 把滚动条滚动到底部
															$(
																	".chat-content-container")
																	.scrollTop(
																			$(".chat-content-container")[0].scrollHeight);
															value.unreadcount = 0;
														} else {
															$('#nomessage')
																	.css(
																			"display",
																			"block");
														}
													}
												})
							});
		}
		//构建新的聊天记录
		function chatlog(username, log, unreadcount) {
			this.username = username;
			this.log = log;
			this.unreadcount = unreadcount;
		}
		//登出
		function logOut() {
			webSocket.close();
			open(location, '_self').close();
		}

		$('.noteoption').click(function() {
			$('.noteoption').css("background-color", "");
			$(this).css("background-color", "#3A3F45");
		})
		function getreadcount() {
			$.ajax({
				url : "GetReadCount",
				dataType : "json",
				success : function(data) {
					$('#readnotecount').html(data);
				}
			});
		}
		function getunreadcount() {
			$.ajax({
				url : "GetUnreadCount",
				dataType : "json",
				success : function(data) {
					$('#unreadnotecount').html(data);
				}
			});
		}
		function goreadnote() {
			$('#noteheadertxt').html("已读留言");
			$('#nonotetxt').html("没有已读留言");
			$('#notearea').css("display","block");
		    $('#notedetail').css("display","none");
		    $('#unreadnoteoperation').css("display","none");
			$
					.ajax({
						url : "GetReadNote",
						dataType : "json",
						success : function(data) {
							if (data == "") {
								$('#nonote').css("display", "block");
								$('#notelist').css("display", "none");
								$('#readnoteoperation').css("display", "none");
							} else {
								$('#nonote').css("display", "none");
								$('#notelist').css("display", "block");
								$('#readnoteoperation').css("display", "block");
								$('#notelist').empty();
								$
										.each(
												data,
												function(n, value) {
													var liStr = "<li><a noteid='" + value.noteId + "' href='javascript:checknote(" + value.noteId + ")'>"
															+ "<div class='header'>"
															+ "<span class='checkbox-custom'>"
															+ "<input type='checkbox' class='mailInbox' onclick='unsel()' noteid='"+ value.noteId +"'>"
															+ "<label for='mailInbox'></label>"
															+ "</span> <span class='from'>"
															+ value.customername
															+ "</span> <span class='date'>"
															+ "<i class='fa fa-paperclip'></i>"
															+ value.time
															+ "</span>"
															+ "</div>"
															+ "<div class='title'>"
															+ "<span class='action'><i class='fa fa-star'></i></span> 客户留言"
															+ "</div>"
															+ "<div class='description'></div>"
															+ "</a></li>";
													$('#notelist')
															.append(liStr);
												});
							}
						}
					})
		}
		function gounreadnote() {
			$('#noteheadertxt').html("未读留言");
			$('#nonotetxt').html("没有未读留言");
			$('#notearea').css("display","block");
		    $('#notedetail').css("display","none");
		    $('#readnoteoperation').css("display", "none");
			$
					.ajax({
						url : "GetUnreadNote",
						dataType : "json", /* 服务器返回的数据类型 */
						success : function(data) {
							if (data == "") {
								$('#nonote').css("display", "block");
								$('#notelist').css("display", "none");
								$('#unreadnoteoperation').css("display", "none");
							} else {
								var unreadcount = 0;
								$('#notelist').empty();
								$('#nonote').css("display", "none");
								$('#notelist').css("display", "block");
								$('#unreadnoteoperation').css("display", "block");
								$
										.each(
												data,
												function(n, value) {
													var liStr = "<li class='unread'><a noteid='" + value.noteId + "' href='javascript:checknote(" + value.noteId + ")'>"
															+ "<div class='header'>"
															+ "<span class='checkbox-custom'>"
															+ "<input type='checkbox' class='mailInbox' onclick='unsel()' noteid='"+ value.noteId +"'>"
															+ "<label for='mailInbox'></label>"
															+ "</span> <span class='from'>"
															+ value.customername
															+ "</span> <span class='date'>"
															+ "<i class='fa fa-paperclip'></i>"
															+ value.time
															+ "</span>"
															+ "</div>"
															+ "<div class='title'>"
															+ "<span class='action'><i class='fa fa-star'></i></span> 客户留言"
															+ "</div>"
															+ "<div class='description'></div>"
															+ "</a></li>";
													$('#notelist')
															.append(liStr);
													unreadcount++;
												});
								new PNotify({
									title : "未读留言",
									text : "您有" + unreadcount + "条未读留言",
									icon : 'fa fa-envelope',
									buttons : {
										sticker : false,
									},
									animate : {
										animate : true,
										in_class : 'rotateInDownLeft',
										out_class : 'rotateOutUpRight'
									},
									delay : 3000
								});
							}
						}
					});
		}
		function checknote(noteId){
		    $.ajax({
		        url : "GetNote",
		        type : "post",
		        data : {
		            "noteId" : noteId,
		        },
		        dataType : "json",
		        success : function(data) {
		            $('#notearea').css("display","none");
		            $('#notedetail').css("display","block");
		            if(data.status == "0"){//未读的留言
		                $('#notestatuslabel').attr("class","label label-warning");
		                $('#notestatuslabel').html("未读");
		                $('#gosw').html("标为已读");
		                $('#gosw').attr("onclick","markread(" + noteId + ")");
		                $('#beenread').attr("class","");
		            }else if(data.status == "1"){//已读的留言
		                $('#notestatuslabel').attr("class","label label-success");
		                $('#notestatuslabel').html("已读");
		                $('#gosw').html("返回");
		                $('#gosw').attr("onclick","returnread()");
		                $('#beenread').attr("class","step-done");
		            }
		            $('#notename').html(data.customername);
		            if(data.telephone != ''){
		                $('#notephone').html(data.telephone);
		            }else{
		                $('#notephone').html("无");
		            }
		            if(data.email != ''){
		                $('#noteemail').html(data.email);
		            }else{
		                $('#noteemail').html("无");
		            }
		            $('#notemessage').val(data.note);
		        }
		    })
		}
		function markread(noteId){
		    $.ajax({
		        url : "ChangeStatus",
		        type : "post",
		        data : {
		            "noteId" : noteId,
		        },
		        dataType : "json",
		        success : function(data) {
		            gounreadnote();
		            getunreadcount();
		            getreadcount();
		        }
		    })
		}
		function returnread(){
		    goreadnote();
		}
		function checkall(e){
		    if($(e.target).attr('checked')){
		        $('.mailInbox').attr("checked", "checked"); 
		    }else{
		        $('.mailInbox').removeAttr("checked");  
		    }
		}
		function unsel(){
		    $('.selectall').removeAttr("checked");  
		}
		function deletenotes(){
		    var noteIds = "";
		    $.each($('.mailInbox'),function(n,value){
		        if($(value).attr('checked')){
		            noteIds += $(value).attr('noteid') + ",";
		        }
		    })
		    if(noteIds == ""){
		        swal("错误", "请至少选择一个需要删除的留言!", "error");
		    }else{
		        swal({
					title : "您确定要删除吗？",
					text : "您确定要删除这些留言吗？",
					type : "warning",
					showCancelButton : true,
					closeOnConfirm : false,
					confirmButtonText : "是的，我要删除",
					confirmButtonColor : "#ec6c62"
				}, function(){
				     $.ajax({
		                 url : "DeleteNotes",
		                 type : "post",
		                 data : {
		                     "noteIds" : noteIds,
		                 },
		                 dataType : "json",
		                 success : function(data) {
		                     getunreadcount();
		                     getreadcount();
		                     if($('#noteheadertxt').html() == '已读留言'){
		                         goreadnote();
		                     }else{
		                         gounreadnote();
		                     }
		                 swal("成功","成功删除留言","success");
		                }
		            })
				})  
		    }
		}
		function changenotestatus(){
		    var noteIds = "";
		    $.each($('.mailInbox'),function(n,value){
		        if($(value).attr('checked')){
		            noteIds += $(value).attr('noteid') + ",";
		        }
		    })
		    if(noteIds == ""){
		        swal("错误", "请至少选择一个需要修改状态的留言!", "error");
		    }else{
		        $.ajax({
		            url : "ChangeMultiStatus",
		            type : "post",
		            data : {
		                "noteIds" : noteIds,
		            },
		            dataType : "json",
		            success : function(data) {
		                getunreadcount();
		                getreadcount();
		                if($('#noteheadertxt').html() == '已读留言'){
		                    goreadnote();
		                }else{
		                    gounreadnote();
		                }
		                swal("成功","成功修改留言状态","success");
		            }
		        })
		    }
		}
	</script>
</body>
</html>

