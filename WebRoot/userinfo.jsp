<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String note = (String) request.getAttribute("note");
	note = note == null ? "" : note;
	String uloginnametip = (String) request
			.getAttribute("uloginnametip");
	uloginnametip = uloginnametip == null ? "" : uloginnametip;
	if (request.getParameter("from") == null)
		session.setAttribute("cuser", session.getAttribute("user"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>${user.uname} 个人信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">
<link rel="stylesheet" type="text/css" href="css/userinfo.css">
<link rel="stylesheet" type="text/css" href="css/iconfont.css">
<script type="text/javascript" src="js/md5-min.js"></script>


</head>

<body>
	<div align="center">
	<%@ include file="usertop.jsp"%>
		<div style="width: 1100px;position: relative;">
			
			<div class="menu_nav" id="manage_menu" style="display: none;">
				<ul>
					<li id="userapp1"><a href="javascript:void(0)">申请派车</a>
					</li>
					<li id="apptodo"><a href="javascript:void(0)">待办列表</a>
					</li>
					<li id="appdone"><a href="javascript:void(0)">已处理</a>
					</li>
					<li class="active" id="userinfo1"><a href="javascript:void(0)">个人信息
					</a>
					</li>
					<li id="sysmanage"><a href="javascript:void(0)">系统管理 </a>
					</li>
				</ul>
			</div>
			<div class="menu_nav" id="user_menu" style="display: none;">
				<ul>
					<li id="userapp2"><a href="javascript:void(0)">申请派车</a></li>
					<li id="userview"><a href="javascript:void(0)">派车单浏览</a>
					</li>
					<li class="active" id="userinfo2"><a href="javascript:void(0)">个人信息
					</a>
					</li>
				</ul>
			</div>
			<div id="fanhui_userinfo" style="position: absolute;">
				<%-- 返回按钮 --%>
				<span> <a href="javascript:history.go(-1)"><i
						class="icon iconfont">&#xe621;</i> </a> </span>
			</div>
			<div class="modifypwd">
				<a href="#" id="modifypwd">点此修改密码</a>
			</div>
			<form method="post" action="userupdate.do">
				<table align="center" border="0">
					<tr style="display : none;">
						<%-- fromurl 作用：判断修改从哪个页面修改的信息
					修改后跳转回 userinfo.jsp 或 admin/table_index.jsp  --%>
						<td><input id="fromurl" name="fromurl" type="text"
							style="display: none;">
						</td>
						<td colspan="2"><input id="uuid" type="text" name="uuid"
							value="${cuser.u_uid}">
						</td>
						<%-- r 用于判断 修改信息 或 修改密码 
						在点击 submit 按钮时提交前 --%>
						<td colspan="2"><input id="r" type="text" name="r"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>编号</th>
						<td style="text-align: center;">${cuser.u_uid}</td>
						<th>所属公司</th>
						<td><input id="uoffice" type="text" name="uoffice"
							value="${cuser.uoffice}" maxlength="20" disabled></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>登录名</th>
						<td><input id="uloginname" type="text" name="uloginname"
							value="${cuser.uloginname}" maxlength="20" disabled></td>
						<th>部门</th>
						<td><input id="udept2" type="text" name="udept2"
							value="${cuser.udept2}" maxlength="15" disabled>
						</td>
					</tr>
					<tr>

						<td class="err" id="uloginnameerr">&nbsp;</td>
						<td class="err" colspan="2"><%=uloginnametip%></td>
					</tr>
					<tr>
						<th>姓名</th>
						<td style="text-align: center;">${cuser.uname}</td>

						<th>中心</th>
						<td><input id="udept" type="text" name="udept"
							value="${cuser.udept}" maxlength="15" disabled></td>
					</tr>
					<tr>
						<td colspan="3" style="display : none;"><input type="text"
							name="uname" value="${cuser.uname}">
						</td>
						<td class="err" id="udepterr">&nbsp;</td>
					</tr>
					<tr>
						<th>电话</th>
						<td><input id="uphoneno" type="text" name="uphoneno"
							value="${cuser.uphoneno}" maxlength="11" disabled></td>

						<th>V网小号</th>
						<td><input id="uvphone" type="text" name="uvphone"
							value="${cuser.uvphone}" maxlength="6" disabled></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td class="err" id="uphonenoerr"></td>
						<td></td>
						<td class="err" id="uvphoneerr"></td>
					</tr>
					<tr>
						<th>权限</th>
						<td style="text-align: center;"><c:choose>
								<c:when test='${cuser.uauthority eq "4"}'>
							普通用户</c:when>
								<c:when test='${cuser.uauthority eq "3"}'>
							部门领导</c:when>
								<c:when test='${cuser.uauthority eq "2"}'>
							综合部领导</c:when>
								<c:when test='${cuser.uauthority eq "1"}'>
							派车人员</c:when>
								<c:when test='${cuser.uauthority eq "0"}'>
							超级管理员</c:when>
							</c:choose>
						</td>
						<th>登陆次数</th>
						<td style="text-align: center;">累计${cuser.ulogintimes}次</td>
					</tr>
					<tr style="display: none;">
						<td>&nbsp;</td>
					</tr>
					<tr style="display: none;">
						<th>新密码</th>
						<td><input id="newpwd1" type="password" name="newpwd"
							autocomplete="off" style="ime-mode:disabled" maxlength=32>
						</td>
						<td colspan="2" rowspan="3" id="pwdtip"></td>
					</tr>
					<tr style="display: none;">
						<td>&nbsp;</td>
					</tr>
					<tr style="display: none;">
						<th>确认密码</th>
						<td><input id="newpwd2" type="password" autocomplete="off"
							style="ime-mode:disabled" maxlength=32></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="2" class="err" id="note"><%=note%></td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<th><input id="updateinfo" type="button" value="信息修改">
						</th>
					</tr>
					<tr id="infobotton" style="display: none;">
						<th colspan="4"><span> <input type="submit"
								id="infosubmit" value="提交"> </span>&nbsp;&nbsp;<span><input
								id="inforeset" type="reset"> </span> &nbsp;&nbsp;<input
							type="button" value="取消修改"
							onclick="document.location.href=location.href;">
						</th>
					</tr>
					<tr id="pwdbotton" style="display: none;">
						<th colspan="4"><span id="pwdsubmit"> <input
								type="submit" value="确认修改"> </span>&nbsp;&nbsp;<span><input
								id="pwdreset" type="reset"> </span>&nbsp;&nbsp;<input
							type="button" value="取消修改"
							onclick="document.location.href=location.href;">
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div
			style="font-size: 12px; font-family: Arial; margin-top: 50px; width: 480px;">
			版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;XDa
		</div>
	</div>
</body>

<script type="text/javascript" src="js/userinfo.js"></script>
<script type="text/javascript" src="js/menu_nav.js"></script>
</html>
