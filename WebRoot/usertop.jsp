<%@page import="com.yxd.obj.OnlineCounter"%>
<%@page import="com.yxd.obj.Uusers"%>
<%@page import="com.jdbc.DAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	Uusers curuser = (Uusers) session.getAttribute("user");
	if (curuser == null) {
		session.setAttribute("msg", "您未登录或登录超时，请重新登录。");
		response.sendRedirect("/TLCAR");
	}else if(curuser.getUpwd()==DAO.getProperty("default_pwd")){
		//初始密码需要强制进行修改，否则无法使用。
		response.sendRedirect("change_password.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>


<title>usertop.jsp</title>
<!-- 页面浏览超305秒后自动刷新，登陆超时跳转至首页 -->

<meta http-equiv="refresh" content="305">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/time.js"></script>
<script type="text/javascript">
	window.onload = function() {
		$("#thisyear").text(new Date().getFullYear()); //每个页面下面【版权所有】的年份更新
		$("#off").click(function() {
			$("body").load("Welcome?method=off");
			location.href = "/TLCAR";
			return false;
		});
		startTime();
	};
	function closetip() {
		$("#fudongtip").hide();
	};
</script>
</head>
<body>
	<div id="fudongtip" class="fudongtip">
		<div style="text-align: right;">
			<a href='javascript: closetip()'>关闭</a>
		</div>
		<table border="0" align="center" style="border-collapse:collapse;">
			<tr>
				<th colspan="2">▷派车流程：</th>
			</tr>
			<tr>
				<td colspan="2">普通用户登录派车</td>
			</tr>
			<tr>
				<td>■市内</td>
				<td>■市外</td>
			</tr>
			<tr>
				<td colspan="2">填写派车单</td>
				
			</tr>
			<tr>
				<td colspan="2" style="color: #888">↓</td>
		
			</tr>
			<tr>
				<td style="color: #888">中心批准<br>(无中心由部门批准如：财务部)</td>
				<td style="color: #888">中心批准</td>
			</tr>
			<tr>
				<td>↓</td>
				<td style="color: #888">↓</td>
			</tr>
			<tr>
				<td>派车批准</td>
				<td style="color: #888">部门批准</td>
			</tr>
			<tr>
				<td rowspan="4" style="color: #555">（需要部门及以上领导批准的自行告知
					对应领导或派车人员。）</td>
				<td style="color: #888">↓</td>
			</tr>
			<tr>
				<td style="color: #888">行政事务<br>批准</td>
			</tr>
			<tr>
				<td>↓</td>
			</tr>
			<tr>
				<td>派车批准</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<span id="userqx" style="display: none;">${user.uauthority}</span> <span
			id="useruid" style="display: none;">${user.u_uid}</span>
		<div class="header_resize">
			<div class="header">
				<div class="logo">
					<div class="title">tlydgs派车系统</div>
					<div class="hello">
						<b>欢迎你，${user.uname} ！${user.udept} </b>
					</div>
					<br> <span class="time"> <b><a
							href="javascript:void(0)" id="off">退出登录</a> </b> <span id="time"></span>
					</span> <span class="loginfo">这是您第<span style="color: lightgreen;"><span
							style="font-size: 20px">${user.ulogintimes}</span> </span>次登录本系统</span>
							<span>当前在线：<%=OnlineCounter.getOnline()%>人。</span>

				</div>
			</div>
		</div>

	</div>
</body>
</html>