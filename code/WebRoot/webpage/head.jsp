<%@ page pageEncoding="utf-8" %>

</head>
<body>


<style>

    /*导航菜单start*/
    nav {
        height: 52px;
        margin: 10px auto;
        width: auto;
    }

    nav ul {
        margin-left: 0;
        margin: 0 auto;
        width: 1190px;
        height: inherit;
    /*     background-image: linear-gradient(to top, red,  #FFC7C7); */
        box-sizing: border-box;
        background-color: #2577e3;

    }
    
    nav ul li.login{
    	float: left;
        height: inherit;
        width: 200px;
        text-align: center;
        transition: all 0.5s ease 0s;
        list-style: none;
        background: #ff9913;
        display: none;
    }
    
    nav ul li.user{
    	float: left;
        height: inherit;
        width: 120px;
        text-align: center;
        transition: all 0.5s ease 0s;
        list-style: none;
        background: #ff9913;
        display: none;
        margin-left: 70px;
    }
	
	nav ul li.business{
    	float: left;
        height: inherit;
        width: 120px;
        text-align: center;
        transition: all 0.5s ease 0s;
        list-style: none;
        background: #ff9913;
        display: none;
        margin-left: 70px;
    }
	
    nav ul li {
        float: left;
        height: inherit;
        width: 163px;
        text-align: center;
        transition: all 0.5s ease 0s;
        list-style: none;
    }
    
     nav ul li.login a{
        padding: 0px 0px 0px 0px;
       	line-height: 52px;
	    color: white;
	    font-family: "Microsoft YaHei UI Light";
	    font-size: 16px;
	    /* text-decoration: none; */
	    /* font-weight: bold; */
	    /* padding: 14px 36px; */

    }
    
    nav ul li.login a:hover{
    	text-decoration: underline;
    }
    
    nav ul li.user a{
        padding: 0px 0px 0px 0px;
       	line-height: 52px;
	    color: white;
	    font-family: "Microsoft YaHei UI Light";
	    font-size: 16px;
	    /* text-decoration: none; */
	    /* font-weight: bold; */
	    /* padding: 14px 36px; */

    }
    
    nav ul li.user a.userlogout:hover{
    	text-decoration: underline;
    }
    
    nav ul li.business a{
        padding: 0px 0px 0px 0px;
       	line-height: 52px;
	    color: white;
	    font-family: "Microsoft YaHei UI Light";
	    font-size: 16px;
	    /* text-decoration: none; */
	    /* font-weight: bold; */
	    /* padding: 14px 36px; */

    }
    
    nav ul li.business a:hover{
    	text-decoration: underline;
    }
    
    nav ul li.login span {
       	line-height: 52px;
	    color: white;
	    font-family: "Microsoft YaHei UI Light";
	    font-size: 16px;
	    /* text-decoration: none; */
	    /* font-weight: bold; */
	    /* padding: 14px 36px; */

    }
    
    nav ul li span {
       	line-height: 52px;
	    color: white;
	    font-family: "Microsoft YaHei UI Light";
	    font-size: 16px;
	    /* text-decoration: none; */
	    /* font-weight: bold; */
	    /* padding: 14px 36px; */

    }

    nav a {
       line-height: 52px;
    color: white;
    font-family: "Microsoft YaHei UI Light";
    font-size: 16px;
    /* text-decoration: none; */
    /* font-weight: bold; */
    padding: 14px 36px;
    

    }

    nav li:hover {
        background-color: #216ACA;
    }

    .nav_active {
        background-color: #216ACA;
    }

    /*导航菜单end*/
</style>
<header>
    <nav>

        <ul class="clear_fix">
             <li>
                <a href="<s:url action="homepage_load" namespace="/"/>">攻略首页</a>
            </li>
            <li>
                <a href="<s:url action="cd_loadCity" namespace="/"/>" style="padding:14px 30px">目的地推荐</a>
            </li>
            <li>
                <a href="<s:url action="productPage_pageIsTop" namespace="/"/>">产品推荐</a>
            </li>
            <li>
                <a href="<s:url action="sffirstpage_loadStrategy" namespace="/"/>">攻略下载</a>
            </li>
            <li>
                <a href="<s:url action="travelNoteFirstPage_pageIsTop" namespace="/"/>">攻略游记</a>
            </li>

            <li>
                <a href="<s:url action="wenda_page" namespace="/"/>">指路问答</a>
            </li>
            
            <li class="login" id="loginli">
            	<a class="login" href="<s:url action = "user_login"/>">用户登录</a>
            	<span>|</span>
            	<a class="login" href="<s:url action="login/business_login" namespace="/"/>">商家登录</a>
            	<span>|</span>
            	<a class="signup" href="register/register.jsp">注册</a>
            </li>
            
            <li class="user" id="userli">
            	<a class="user" href="#" id="user"></a>
            	<span>|</span>
            	<a class="userlogout" id="logout" href="logout">注销</a>
            </li>
            
            <li class="business" id="businessli">
            	<a class="business" href="login_business/home.jsp" id="business"></a>
            	<span>|</span>
            	<a class="userlogout" id="logout" href="logout">注销</a>
            </li>
            
        </ul>
    </nav>
    <script type="text/javascript" src="webpage/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
    	$.ajax({
				url : "GetUsrname",
				dataType : "json",
				success : function(data) {
					if (data.userName == "") {
						$('#loginli').css("display", "block");
						$('#userli').css("display","none");
						$('#businessli').css("display","none");
					} else if(data.userType == 1){	// user
						$('#loginli').css("display", "none");
						$('#userli').css("display","block");
						$('#businessli').css("display","none");
						$('#user').html(data.userName);
					} else {	//business
						$('#loginli').css("display", "none");
						$('#userli').css("display","none");
						$('#businessli').css("display","block");
						$('#business').html(data.userName);
					}
				}
			})
    </script>
</header>
