<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>注册</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- CSS -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico" type="image/x-icon" />
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/loginstyle.css">
        <link rel="stylesheet" href="assets/css/jquery-labelauty.css">
        <link rel="stylesheet" href="assets/css/sweetalert.css">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    <style>
    .frame{
        padding: 50px 70px; 
        -moz-border-radius: 15px; 
        -webkit-border-radius: 15px; 
        border: solid 2px #ef4300;
        border-radius:15px;          
        background-color:rgba(256,256,256,0.8); 
        color:black;
    }
    ul { list-style-type: none;}
    li { display: inline-block;}
    li { margin: 10px 0;}
    input.labelauty + label { font: 12px "Microsoft Yahei";}
    h1{
        color: #ef4300;
    }
    </style>
    </head>

    <body>

        <div class="page-container" style="top:30%;">
              <form method="post" class="frame">
                  <h1>注册</h1>
                  <input type="text" name="username" class="username" placeholder="用户名" required="">
                  <input type="password" name="password" class="password" placeholder="密码" required="">
                  <input type="password" name="password_check" class="password_check" placeholder="确认密码" required="">
 				  <input type="text" name="userMail" class="userMail" placeholder="电子邮箱" required="">
 				  <input style="display:none" type="text" name="businessName" class="businessName" placeholder="店名" required="">
                  <ul class="dowebok">
                    <li><input type="radio" name="radio" data-labelauty="我是用户" value="1" onclick="OnClickUser();"></li>
                    <li><input type="radio" name="radio" data-labelauty="我是卖家" value="2" onclick="OnClickBusiness();"></li>
                  </ul>
                 <button onclick="Register();return false;">注册</button>
              </form>
        </div> 
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/jquery-labelauty.js"></script>
        <script src="assets/js/sweetalert.min.js"></script>
        <script>
        function OnClickUser(){
        	$('.businessName').hide();
        }
        
        function OnClickBusiness(){
        	$('.businessName').show();
        }
        
        
        function Register(){
	        var username = $('.username').val();
	        var password = $('.password').val();
	        var password_check = $('.password_check').val();
	        var businessName = $('.businessName').val();
	        var usertype = $("input[name='radio']:checked").val();
	        var userMail = $('.userMail').val();
	        if(usertype == null){
	            swal("注意!", "请选择您的用户类型！", "error");
	            return false;
	        }
	        if(username == null || username==""){
	        	swal("注意!", "请输入要注册的用户名！", "error");
	        	return false;
	        }
	        if(password == null || password==""){
	        	swal("注意!", "请输入密码！", "error");
	        	return false;
	        }
	        if(password_check == null || password_check==""){
	        	swal("注意!", "请输入确认密码！", "error");
	        	return false;
	        }
	        if(password_check != password){
	        	swal("注意!", "两次密码输入不一致！", "error");
	        	return false;
	        }
	        if(userMail==null || userMail==""){
	        	swal("注意","请输入电子邮箱","error");
	        	return false;
	        }
	        if(businessName == null || businessName == ""&&usertype == 2){
	        	swal("注意!", "请输入店名！", "error");
	        	return false;
	        }
	        
	        
	        $.ajax({
	        	url: "register",
	        	type: "post",
	        	data: {
	        		"username": username,
	        		"password": password,
	        		"userType": usertype,
	        		"businessName": businessName,
	        		"userMail": userMail
	        	},
	        	dataType:"json",
	        	success:function(data){
	        		if(data == "user_success"){
	        			swal({   
			title: "YES!",   
			text: '注册成功！即将跳转到登录页。。。',   
			html: true,
			timer: 2000,   
			showConfirmButton: false
		});
		setTimeout('window.location = "../login/userlogin.jsp"',1000);
	        			
	        		}
	        		else if(data == "business_success"){
	        			swal({   
			title: "YES!",   
			text: '注册成功！即将跳转到登录页。。。',   
			html: true,
			timer: 2000,   
			showConfirmButton: false
		});
		setTimeout('window.location = "../login/business_login"',1000);
	        		}
	        		else if(data == "name_exists"){
	        			swal("抱歉", "用户名已存在！", "error");
	        		}
	        		else if(data == "Businessname_exists"){
	        			swal("抱歉", "店名已存在！", "error");
	        		}
	        		else if(data == "fail"){
	        			swal("抱歉", "登录失败", "error");
	        		}
	        	}
	        })
        }

        $(function(){
          $(':input').labelauty();
        });
        </script>
    </body>

</html>

