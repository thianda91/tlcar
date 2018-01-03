<%@page import="com.servlet.LogininServlet"%>
<%@page import="com.yxd.obj.Uusers"%>
<%@page import="com.jdbc.userDAO"%>
<%@page import="com.yxd.obj.userview"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	
	List<userview> applist  = new ArrayList<userview>();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>欢迎登陆派车系统&nbsp;&nbsp;&nbsp;&nbsp; 【${user.uname}】</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">



</head>
<body>
	<button onclick="show_xuzhi(1)"
		style="display: block; position: absolute; top: 100px; left: 50px">使用需知</button>
	<div id="ccenter" align="center">
		<div style="width: 1100px;">
			<br><%@ include file="usertop.jsp"%>
			<div class="menu_nav">
				<ul>
					<li id="userapp2"><a href="javascript:void(0)">申请派车</a></li>
					<li class="active" id="userview"><a href="javascript:void(0)">派车单浏览</a>
					</li>
					<li id="userinfo1"><a href="javascript:void(0)">个人信息 </a>
					</li>
				</ul>
			</div>
			<%
				if (curuser != null) {
															String usql = "select * from (select * from userapp "
																	+ "where appdept = ? order by appid desc ) where ROWNUM <= 50";
															applist = userDAO.getForList(userview.class, usql,
																	curuser.getUdept());
															session.setAttribute("applist", applist);
														}
			%>
			<table class="browse_tabheader" border="1">
				<tr>
					<th class="td1">编号</th>
					<th class="td2">申请时间</th>
					<th class="td3">申请人</th>
					<th class="td4">目的地</th>
					<th class="td5">原因</th>
					<th style="width: 390px;">派车单摘要</th>
					<!-- <th class="td4">所派车辆</th>
					<th class="td4">所派司机</th>
					<th class="td6">派车状态</th> -->
				</tr>
			</table>
			<div class="view">
				<table id="browse_tab" border="1">
					<%--	<%
					for (int i = 0; i < applist.size(); i++) {
				%>
				<tr>
					<td class="td1"><a href=""><%=applist.get(i).getAppid()%></a>&nbsp;</td>
					<td class="td2"><%=applist.get(i).getApplydate()%>&nbsp;</td>
					<td class="td3"><%=applist.get(i).getAppname()%>&nbsp;</td>
					<td class="td4"><%=applist.get(i).getGo_to()%>&nbsp;</td>
					<td class="td5"><%=applist.get(i).getReason()%>&nbsp;</td>
					<td class="td6"><%=applist.get(i).getCno()%>&nbsp;</td>
					<td class="td7"><%=applist.get(i).getDriverinfo()%>&nbsp;</td>
					<td class="td8"><%=applist.get(i).getAppoption()%>&nbsp;</td>
				</tr>
				<%
					}
				%>
--%>
					<c:forEach items="${applist}" var="item" varStatus="status">
						<tr>
							<td class="td1"><a href="${status.index}">${item.appid}</a>
							</td>
							<td class="td2">${item.applydate}</td>
							<td class="td3">${item.appname}</td>
							<td class="td4">${item.go_to}</td>
							<td class="td5">${item.reason}</td>
							<td class="td4 td_r">${item.cno}&nbsp;</td>
							<td class="td4">${item.driverinfo}&nbsp;</td>
							<td class="td6 td_l"><c:choose>
									<c:when test='${item.acondition eq "11"}'>
										<span style="color:#f0f;">${item.appoption}</span>
									</c:when>
									<c:when test='${item.acondition eq "10"}'>
										<span style="color:#00f;">${item.appoption}已同意</span>
									</c:when>
									<c:when test='${item.acondition eq "9"}'>
										<span style="color:#a44;">拒绝原因：${item.appoption}</span>
									</c:when>
									<c:when test='${item.acondition eq "8"}'>行政事务拒绝</c:when>
									<c:when test='${item.acondition eq "7"}'>中心批准部门拒绝</c:when>
									<c:when test='${item.acondition eq "6"}'>部门拒绝</c:when>
									<c:when test='${item.acondition eq "5"}'>中心拒绝</c:when>
									<c:when test='${item.acondition eq "4"}'>行政事务批准</c:when>
									<c:when test='${item.acondition eq "3"}'>中心部门均批准</c:when>
									<c:when test='${item.acondition eq "2"}'>仅部门已批准</c:when>
									<c:when test='${item.acondition eq "1"}'>中心已批准</c:when>
									<c:when test='${item.acondition eq "0"}'>
										<marquee>等待领导同意</marquee>
									</c:when>
								</c:choose></td>
							<td class="td7">${item.acondition}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="button_link" style="display:none;">
				<!-- 此 class 无样式 -->
				<br> <a href="manager.jsp" style="color:#00f;">返回派车单审批</a> <a
					id="managehelp" href="managehelp.xlsx" style="color:red;">使用帮助</a>
			</div>
			<div
				style="font-size: 12px; font-family: Arial; margin-top: 30px; width: 480px;">
				版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;X.Da
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/browse.js"></script>
<script type="text/javascript" src="js/menu_nav.js"></script>
<script>
	$(function() {
		var uremarks = "${user.uremarks}";

		if (uremarks == "0") {
			show_xuzhi();
		}

	});
	function show_xuzhi(arg) {

		$.getScript("zDrag.js", function() {
			$.getScript("zDialog.js", function() {
				var diag = new Dialog();
				diag.Width = 540;
				diag.Height = 400;
				diag.URL = "/TLCAR/xuzhi.html";
				if (arg == undefined) {
					alert("您在更新版本后首次登陆，\r\n请仔细阅读使用需知。\n\n1分钟后自动关闭。");
					diag.AutoClose = 60;
					diag.ShowCloseButton = false;
				}else{
					diag.OKEvent = function() {
						diag.close();
					};
				}
				diag.show();
			});
		});
	}
</script>
</html>
