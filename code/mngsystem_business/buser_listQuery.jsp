<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<c:url value='/css/Style.css'/>" rel="stylesheet" type="text/css" />
		<script language="javascript" src="<c:url value='/js/public.js'/>"></script>
		<script type="text/javascript">
			function addUser(){
				window.location.href = "<c:url value='/mngsystem_business/buser_add.jsp'/>";
			}
		</script>
	</HEAD>
	<body>
		<style type="text/css">
			.nav{
				width:100%;
				height:30px;
				background-color: gray;
				
			}
			.nav ul{
				margin:0 auto;
				background-color: #E2E2E2;
			}
			.nav li{
				float:left;
				margin-left:30px;
				line-height: 30px;
				list-style: none;
				padding-left:10px;
				padding-right:10px;
			}
			.nav li:hover{
				background-color: white;
			}
			
			.clear_fix:before, .clear_fix:after {
	   			 clear: both;
	   			 content: "";
	    		display: block;
			}
			
			.active{
				background-color: white;
			}
		</style>
		<div class="nav">
			<ul class="clear_fix">
				<li class="active">
					<a href="">修改店员信息</a>
				</li>
	
			</ul>
		</div>
		<br>
		<s:form action="buser_pageQuery" namespace="/" theme="simple">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>店员列 表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addUser()">
								添加新的店员
							</button>

						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">


									<td align="center" width="10%">
										登录名
									</td>

									<td align="center" width="20%">
										邮箱
									</td>

									<td align="center" width="8%">
										编辑
									</td>
									
									<td align="center" width="7%">
										查看
									</td>
									<td align="center" width="7%">
										删除
									</td>
								</tr>
								<s:iterator value="top">
									<tr onmouseover="this.style.backgroundColor = 'white'"
										onmouseout="this.style.backgroundColor = '#F5FAFE';">

										<td style="CURSOR: hand; HEIGHT: 22px" align="center"
											width="10%">
											<s:property value="buserName"/>
										</td>

										<td style="CURSOR: hand; HEIGHT: 22px" align="center" 
											width="20%">
											<s:property value="buserMail"/>
										</td>

										<td align="center" style="HEIGHT: 22px">
											<s:a action="buser_loadForEdit" namespace="/">
												<s:param name="buserId" value="buserId"/>
												<img src="<c:url value='/images/i_edit.gif'/>" border="0" style="CURSOR: hand">
											</s:a>
										</td>
										<td align="center" style="HEIGHT: 22px">
											<s:a action="buser_load" namespace="/">
												<s:param name="buserId" value="buserId"/>
												<img src="<c:url value='/images/button_view.gif'/>" border="0" style="CURSOR: hand">
											</s:a>
										</td>
										<td align="center" style="HEIGHT: 22px" onclick="return confirm('您是否确定删除该记录？')">
											<s:a action="buser_delete" namespace="/">
												<s:param name="buserId" value="buserId"/>
												<img src="<c:url value='/images/i_del.gif'/>" width="16" height="16" border="0" style="CURSOR: hand">
											</s:a>
										</td>
									</tr>
								</s:iterator>
							</table>
						</td>
					</tr>
					<tr><td align="left">&nbsp;</td></tr>
					<tr>
						<td align="center">
							
							<s:url action="buser_pageQuery1" namespace="/" id="firstPage">
								<s:param name="pageNum">1</s:param>
							</s:url>
							<s:a href="%{firstPage}" cssStyle="color:blue">[首页]</s:a>
							<s:url action="buser_pageQuery1" namespace="/" id="prePage">
								<s:param name="pageNum">
									<s:property value="pageNum-1"/>
								</s:param>
								<s:param name="qbuserNumber" value="qbuserNumber"></s:param>
								<s:param name="qbuserName" value="qbuserName"></s:param>
								<s:param name="qbuserSex" value="qbuserSex"></s:param>
								<s:param name="qbuserDepartment" value="qbuserDepartment"></s:param>
								<s:param name="qbuserRole" value="qbuserRole"></s:param>
							</s:url>
							<s:a href="%{prePage}" cssStyle="color:blue">[上一页]</s:a>
							<s:url action="buser_pageQuery1" namespace="/" id="nextPage">
								<s:param name="pageNum">
									<s:property value="pageNum+1"/>
								</s:param>
								<s:param name="qbuserNumber" value="qbuserNumber"></s:param>
								<s:param name="qbuserName" value="qbuserName"></s:param>
								<s:param name="qbuserSex" value="qbuserSex"></s:param>
								<s:param name="qbuserDepartment" value="qbuserDepartment"></s:param>
								<s:param name="qbuserRole" value="qbuserRole"></s:param>
							</s:url>
							<s:property value="pageNum"/>/<s:property value="totalpage"/>
							<s:a href="%{nextPage}" cssStyle="color:blue">[下一页]</s:a>
							<s:url action="buser_pageQuery1" namespace="/" id="lastPage">
								<s:param name="pageNum">
									<s:property value="totalpage"/>
								</s:param>
								<s:param name="qbuserNumber" value="qbuserNumber"></s:param>
								<s:param name="qbuserName" value="qbuserName"></s:param>
								<s:param name="qbuserSex" value="qbuserSex"></s:param>
								<s:param name="qbuserDepartment" value="qbuserDepartment"></s:param>
								<s:param name="qbuserRole" value="qbuserRole"></s:param>
							</s:url>
							<s:a href="%{lastPage}" cssStyle="color:blue">[末页]</s:a>
							<s:url action="buser_pageQuery1" namespace="/" id="lastPage">
								<s:param name="qbuserNumber" value="qbuserNumber"></s:param>
								<s:param name="qbuserName" value="qbuserName"></s:param>
								<s:param name="qbuserSex" value="qbuserSex"></s:param>
								<s:param name="qbuserDepartment" value="qbuserDepartment"></s:param>
								<s:param name="qbuserRole" value="qbuserRole"></s:param>
							</s:url>
						</td>
					</tr>
				</TBODY>
			</table>
		</s:form>
	</body>
</HTML>

