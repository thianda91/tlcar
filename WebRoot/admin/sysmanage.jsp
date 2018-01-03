<%@page import="com.jdbc.DAO"%>
<%@page import="com.yxd.obj.tlcars"%>
<%@page import="com.yxd.obj.drivers"%>
<%@page import="com.yxd.obj.Uusers"%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<c:if test="${user.uauthority ne 1}">
	<script>
		history.go(-1);
	</script>
</c:if>
<title>派车系统管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">
<link rel="stylesheet" type="text/css" href="css/admin_manage.css">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.managediv {
	width: 950px;
	height: 475px;
}

button {
	background-color: #eee;
}

button#openseconddiv {
	background-color: #666;
	color: #0f0;
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>

<body>
	<div align="center">
		<div style="width: 1100px;">
			<%@ include file="../usertop.jsp"%>
			<div class="menu_nav" id="manage_menu">
				<ul>
					<li id="userapp1"><a href="javascript:void(0)">申请派车</a></li>
					<li class="active" id="apptodo"><a href="javascript:void(0)">待办列表</a>
					</li>
					<li id="appdone"><a href="javascript:void(0)">已处理</a></li>
					<li id="userinfo1"><a href="javascript:void(0)">个人信息 </a></li>
					<li id="sysmanage"><a href="javascript:void(0)">系统管理 </a></li>
				</ul>
			</div>
		</div>
		<div style="margin: 10px 0px 0px;">
			<button id="openseconddiv" type="button">车辆管理</button>
		</div>
		<br>
		<div id="defaultdiv" style="display: none;">
			<div class="managediv">
				<div style="float: left;">
					<%@ include file="managecar.jsp"%>
				</div>
				<div style="float: left;">
					<jsp:include page="managedri.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<div id="seconddiv">
			<%@ include file="manageuser.jsp"%>
		</div>

		<div
			style="font-size: 12px; font-family: Arial; margin-top: 50px; width: 480px;">
			版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;XDa
		</div>

	</div>
</body>

<script type="text/javascript" src="js/menu_nav.js"></script>
<script type="text/javascript" src="js/admin_manage.js"></script>

<script type="text/javascript">
	$("#openseconddiv").bind("click", function() {
		if ($(this).text() == "账户管理") {
			$(this).text("车辆管理");
		} else {
			$(this).text("账户管理");
		}
		$("#defaultdiv").toggle(1000);
		$("#seconddiv").toggle(1000);
	});
	/**
 * 获取url ? 传参
 */
 
function getUrlParams() {
	var url = location.search;
	var params = new Object();
	if (url.indexOf("?") != -1) {
		var str = url.substr(1);
		strs = str.split("&");
		for ( var i = 0; i < strs.length; i++) {
			params[strs[i].split("=")[0]] = strs[i].split("=")[1];
		}
	}
	return params;
}
var urlsearch = getUrlParams();
// 模拟点击 切换到 车辆管理页面，而不是默认的用户管理
if(urlsearch.f=="1")
	$("#openseconddiv").click();
</script>
</html>
