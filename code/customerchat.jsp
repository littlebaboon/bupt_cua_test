    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>客户服务</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="vendor/skycons/css/skycons.css" rel="stylesheet" />
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="css/chatpagestyle.css" rel="stylesheet" />
<link rel="stylesheet" href="css/amazeui.min.css">
<link href="plugins/bootkit/css/bootkit.css" rel="stylesheet" />
<link href="plugins/summernote/summernote.css" rel="stylesheet" />
<link href="css/sweetalert.css" rel="stylesheet" />
<script src="js/sweetalert.min.js"></script>
<style>
.chat-content-container {
	height: 380px;
	overflow-y: scroll;
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
	overflow: scroll;
	overflow-x: hidden;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
}

.pad-all {
	padding: 15px;
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

.error{
    color:red;
}

.uline-title {
    margin-bottom: 15px;
    padding: 0 0 37px;
    text-align: center;
    background: url("images/utitlebg.png");
    background-repeat: no-repeat;
    background-position: center bottom -2px;
}
</style>
</head>
<body>
	<div class="col-md-12 col-xs-12">
		<div class="panel bk-widget bk-border-off bk-noradius">
			<div id="header"
				class="panel-body bk-bg-primary text-center bk-padding-top-10 bk-padding-bottom-10">
				<div class="row">
					<div class="col-xs-8 text-left bk-vcenter">
						<h6 class="bk-margin-off" id="chatcustomername">欢迎使用在线客服服务！</h6>
					</div>
					<div class="col-xs-4 bk-vcenter text-right">
						<a id="logout" onclick="logOut()" class="btn btn-default pull-right">登出</a>
					</div>
				</div>
			</div>
			<hr class="bk-margin-off" />
			<div id="note" class="col-md-offset-3 col-md-6"
				style="padding-top:10%;display:none;overflow-y:auto;">
				<div class="col-sm-12">
                    <h2 class="uline-title text-center">请留下您的联系方式以及咨询内容，我们会及时与您联系！</h2>
                </div>
				<div class="form-group ">
					<input id="name" class="form-control input-lg" placeholder="姓名"
						type="text" onblur="checkname()">
					<i id="nameerror" class="error"></i>
				</div>
				<div class="form-group ">
					<input id="email" class="form-control input-lg" placeholder="Email"
						type="email" onblur="checkmail()">
					<i id="emailerror" class="error"></i>
				</div>
				<div class="form-group ">
					<input id="phone" class="form-control input-lg" placeholder="电话号码"
						type="text" onblur="checktel()">
					<i id="phoneerror" class="error"></i>
				</div>
				<div class="form-group ">
					<textarea id="noteinput" cols="30" rows="8"
						class="form-control" placeholder="留言" onblur="checknote()"></textarea>
					<i id="noteerror" class="error"></i>
				</div>
				<a class="btn btn-primary col-xs-8 col-xs-offset-2" onclick="addnote()">提交</a>
			</div>
			<div id="chat">
				<div class="nano has-scrollbar bk-bg-white">
					<div class="chat-content-container" tabindex="0">
						<ul class="list-unstyled media-block" id="chatarea">

						</ul>
					</div>
					<div class="nano-pane">
						<div class="nano-slider"
							style="height: 141px; transform: translate(0px, 0px);"></div>
					</div>
				</div>
				<hr class="bk-margin-off" />
				<div id="inputarea" class="inputarea-container bk-bg-white" style="overflow-y:auto;">
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
		<script src="vendor/js/jquery.min.js"></script>
		<script src="vendor/js/jquery-2.1.1.min.js"></script>
		<script src="vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/skycons/js/skycons.js"></script>
		<script src="plugins/summernote/summernote.js"></script>
		<script type="text/javascript">
			var customername;//记录客户姓名
			var supportname;//记录客服名
			var ringtone = document.createElement("audio");
			var ip = window.location.hostname;
			ringtone.src = "ringtone.mp3";
			ringtone.volume = 0.80;
			ringtone.autoPlay = false;
			ringtone.preLoad = true;
			$(document).ready(
					function() {
						var h = window.innerHeight;//返回窗口的文档显示区的高度;
						var headerh = $('#header').outerHeight();
						var chatareah = (h - headerh) * 0.7;
						var inputareah = (h - headerh) * 0.3;
						var toolbarh = inputareah * 0.2;
						var inputh = inputareah * 0.6;
						var sendh = inputareah * 0.2;
						$('.chat-content-container').attr("style",
								"height:" + chatareah + "px;");
						$('#inputarea').attr("style",
								"height:" + inputareah + "px;");
						$('#tool_bar').attr(
								"style",
								"height:" + toolbarh + "px;font-size:" + 0.6
										* toolbarh + "px;");
						$('#chatinput').attr("style",
								"height:" + inputh + "px;");
						$('#note').css("height",
								$('#chat').outerHeight() + "px");
						$('#send').attr("style", "height:" + sendh + "px;");
					});
			var webSocket = new WebSocket(
				"ws://" + ip + ":8080/bupt_cua_test/WebSocketDemo");
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
				if (o.type == 'assignsupport') {//告诉客户进行服务的客服信息的消息
					supportname = o.data;
					$('#chatarea').append(
							"<li class='text-center'>系统消息：" + supportname
									+ "将为您服务</li>");
				} else if (o.type == 'newcustomer') {//告诉客户客户姓名的消息
					customername = o.data;
				} else if (o.type == 'message') {//普通消息
					ringtone.play();//提示音
					var mydate = new Date();
					var t = mydate.toLocaleString();
					var liStr = "<li class='mar-btm'>"
							+ "<div class='media-left'>"
							+ "<img src='images/support.png' class='img-circle img-sm' alt='Profile Picture'>"
							+ "</div>" + "<div class='media-body pad-hor'>"
							+ "<div class='speech'>"
							+ "<a href='#' class='media-heading'>"
							+ supportname + "</a>" + "<p>" + o.data + "</p>"
							+ "<p class='speech-time'>"
							+ "<i class='fa fa-clock-o fa-fw'></i>" + t
							+ "</p>" + "</div>" + "</div>" + "</li>";
					//前端聊天区域扩展新消息
					$('#chatarea').append(liStr);
					// 把滚动条滚动到底部
					$(".chat-content-container").scrollTop(
							$(".chat-content-container")[0].scrollHeight);
				} else if (o.type == 'userlogout') {//客服断开连接
					swal({
						title : "对不起!",
						text : '<span style="color:red">与客服失去了连接，三秒后会自动退出。</span>',
						html : true,
						timer : 3000,
						showConfirmButton : false
					});
					window.setTimeout(logOut, 3000);
				} else if (o.type == 'notassigned') {//没有被分配到客服
					swal({
						title : "对不起!",
						text : '<span style="color:red">当前客服正忙，您可以留下您的联系方式以及咨询内容。</span>',
						html : true,
						timer : 3000,
						showConfirmButton : true
					});
					$('#chat').css("display","none");
					$('#note').css("display","block");
					$('#chatcustomername').html("请留下您的咨询内容");
					$('#logout').html("退出");
				}
			}
			function sendMessage() {
				var mydate = new Date();
				var t = mydate.toLocaleString();
				var markupStr = $('#inputtxt').val();
				if (markupStr == "") {
					swal("错误!", "消息不能为空！", "error");
					return;
				}
				var liStr = "<li class='mar-btm'>"
						+ "<div class='media-right'>"
						+ "<img src='images/customer.png' class='img-circle img-sm' alt='Profile Picture'>"
						+ "</div>"
						+ "<div class='media-body pad-hor speech-right'>"
						+ "<div class='speech'>"
						+ "<a href='#' class='media-heading'>" + "您" + "</a>"
						+ "<p>" + markupStr + "</p>"
						+ "<p class='speech-time'>"
						+ "<i class='fa fa-clock-o fa-fw'></i>" + t + "</p>"
						+ "</div>" + "</div>" + "</li>";
				//前端聊天区域扩展新消息
				$('#chatarea').append(liStr);
				$('#inputtxt').val("");
				// 把滚动条滚动到底部
				$(".chat-content-container").scrollTop(
						$(".chat-content-container")[0].scrollHeight);
				webSocket.send(JSON.stringify({
					type : "message",
					fromname : customername,
					toname : supportname,
					content : markupStr
				}));
			}
			function processClose(message) {
			}
			function checkname(){//判断留言区域是否输入了客户姓名
			    if($('#name').val() == ''){
			        $('#nameerror').html("请留下您的姓名！");
			    }else{
			        $('#nameerror').html("");
			    }
			}
			function checkmail(){//判断留言区域是否输入了邮箱以及邮箱格式是否正确
			    var email = $('#email').val();
			    var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			    if (email != '' && !(reg.test(email))) {
				    $('#emailerror').html("邮箱格式错误");
			    }else {
			        $('#emailerror').html("");
			    }
			}
			function checktel(){//判断留言区域是否输入了电话以及电话格式是否正确
			    var phone = $('#phone').val();
			    var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
			    if (phone != '' && !reg.test(phone)) {
				    $("#phoneerror").html("电话号码格式错误");
			    }else {
				    $("#phoneerror").html("");
			    }
			}
			function checknote(){//判断留言是否为空
			    if($('#noteinput').val() == ''){
			        $('#noteerror').html("请给我们留下您咨询的内容！");
			    }else{
			        $('#noteerror').html("");
			    }
			}
			function addnote(){//添加新评论
			    var name = $('#name').val();
			    var email = $('#email').val();
			    var phone = $('#phone').val();
			    var note = $('#noteinput').val();
			    var mailreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			    var phonereg = /^0?1[3|4|5|8][0-9]\d{8}$/;
			    if(name == ''){
			        $('#nameerror').html("请留下您的姓名！");
			        return;
			    }
			    if(email == '' && phone == ''){
			        $('#phoneerror').html("邮箱以及号码至少填一项！");
			        return;
			    }
			    if (email != '' && !(mailreg.test(email))) {
				    $('#emailerror').html("邮箱格式错误");
				    return;
			    }
			    if (phone != '' && !phonereg.test(phone)) {
				    $('#phoneerror').html("电话号码格式错误");
				    return;
				}
				if(note == ''){
				    $('#noteerror').html("请给我们留下您咨询的内容！");
				    return;
				}
				$.ajax({
					url : "AddNote",
					type : "post",
					data : {
						"customername" : name,
						"telephone" : phone,
						"email" : email,
						"note" : note
					},
					dataType : "json", /* 服务器返回的数据类型 */
					success : function(data) {
						if (data == "success") {
						    swal({
						        title : "感谢!",
						        text : '<span style="color:green">谢谢，我们已经收到您的留言，将会及时处理。</span>',
						        html : true,
						        timer : 3000,
						        showConfirmButton : true
					        });  
					        window.setTimeout(logOut, 3000);
						}else {
							
						}
					}
				});
			}
			function logOut() {//登出
				webSocket.close();
				history.back(-1);
			}
		</script>
</body>
</html>
