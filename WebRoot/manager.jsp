<%@page import="com.servlet.LogininServlet"%>
<%@page import="com.yxd.obj.Uusers"%>
<%@page import="com.jdbc.manageDAO"%>
<%@page import="com.yxd.obj.userview"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String tab = request.getParameter("tab");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>派车系统管理平台&nbsp;&nbsp;&nbsp;&nbsp; 【${user.uname}】</title>
<!-- 10秒自动刷新页面的代码写在了js/manager.js -->

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- <meta http-equiv="refresh" content="10"> -->
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">




</head>
<body>
	<!--  menu SHOW/HIDE controlled by menu_nav.js-->
	<span id="tabflag" style="display:none;"><%=tab%></span>

	<div align="center">
		<div style="width: 1100px;">
			<%@ include file="usertop.jsp"%>
			<div class="menu_nav">
				<ul>
					<li id="userapp1"><a href="javascript:void(0)">申请派车</a></li>
					<li class="active" id="apptodo"><a href="javascript:void(0)">待办列表</a>
					</li>
					<li id="appdone"><a href="javascript:void(0)">已处理</a>
					</li>
					<li id="userinfo1"><a href="javascript:void(0)">个人信息 </a>
					</li>
					<li id="sysmanage"><a href="javascript:void(0)">系统管理 </a>
					</li>
				</ul>
			</div>
			<%
				if (curuser != null) {
					if (null == tab)
						manageDAO.findManage(session, curuser);
					else
						manageDAO.findManage(session, curuser, 1);
				}
			%>
			<div id="todo">
				<table class="browse_tabheader" border="1">
					<tr>
						<th class="td0">序号</th>
						<th class="td1">编号</th>
						<th class="td2">出发时间</th>
						<th class="td3">申请人</th>
						<th class="td4">起始点</th>
						<th class="td4">目的地</th>
						<th class="td3">人数</th>
						<th class="td5">原因</th>
						<th class="td6">派车状态</th>
					</tr>
				</table>
				<div class="view">
					<table id="browse_tab" border="1">
						<c:forEach items="${applist}" var="item" varStatus="status">
							<tr>
								<td class="td0">${status.index+1}</td>
								<td class="td1"><a href="item=${item.appid}">${item.appid}</a>
								</td>
								<td class="td2">${item.begintime}</td>
								<td class="td3">${item.appname}</td>
								<td class="td4">${item.beginpoint}</td>
								<td class="td4">${item.go_to}</td>
								<td class="td3">${item.mancount}</td>
								<td class="td5">${item.reason}&nbsp;</td>
								<td class="td6"><c:choose>
										<c:when test='${item.acondition eq "10"}'>已派</c:when>
										<c:when test='${item.acondition eq "9"}'>无车,原因可查看</c:when>
										<c:when test='${item.acondition eq "8"}'>行政事务拒绝</c:when>
										<c:when test='${item.acondition eq "7"}'>中心批准部门拒绝</c:when>
										<c:when test='${item.acondition eq "6"}'>部门拒绝</c:when>
										<c:when test='${item.acondition eq "5"}'>中心拒绝</c:when>
										<c:when test='${item.acondition eq "4"}'>行政事务批准</c:when>
										<c:when test='${item.acondition eq "3"}'>中心部门均批准</c:when>
										<c:when test='${item.acondition eq "2"}'>仅部门已批准</c:when>
										<c:when test='${item.acondition eq "1"}'>中心已批准</c:when>
										<c:when test='${item.acondition eq "0"}'>
											<marquee behavior="alternate" scrolldelay=500>中心或部门待批准</marquee>
										</c:when>
									</c:choose>
								</td>
								<td class="td7">

									<head>
<link rel="stylesheet" type="text/css" href="css/apply.css">
<link rel="stylesheet" type="text/css" href="css/iconfont.css">
									</head>
									<div style="width: 600px; padding:10px;">
										<table class="detailtab" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<th style="visibility: hidden;" id="acondition">${item.acondition}</th>
												<!-- 申请状态  -->
											</tr>
											<tr class="tab_th">
												<th align="center"><i class="icon iconfont icon_che">&#xe6ec;</i>
												</th>
												<th colspan="2" align="center"><h2>
														编号：<span>${item.appid}</span>&nbsp;派车单信息
													</h2></th>
												<th></th>
												<th colspan="2" align="right"
													style="vertical-align: bottom;">tlydgs</th>
											</tr>
											<tr>
												<td>用车部门</td>
												<td colspan="5"><span style="font-size: 14px;"
													id="appdept"><input
														style="width: 10px; visibility: hidden;">${item.appoffice}-${item.appdept}
												</span> <span style="float:right; font-size: 12px; color: #000;">
														申请时间：${item.applydate}<input
														style="width: 10px; visibility: hidden;"> </span></td>
											</tr>
											<tr>
												<td>申请人</td>
												<td><input type="text" id="appname"
													value="${item.appname}" readonly></td>
												<td>用车人数</td>
												<td><input style="width: 50px;" type="text"
													value="${item.mancount}" readonly></td>
												<td>去向</td>

												<td><c:choose>
														<c:when test="${item.range eq 0}">
															<c:set var="range" value="铁岭"></c:set>
														</c:when>
														<c:when test="${item.range eq 1}">
															<c:set var="range" value="市外"></c:set>
														</c:when>
													</c:choose><input style="width: 80px;" type="text" value="${range}"
													readonly></td>
											</tr>
											<tr>
												<td>出发点</td>
												<td><input type="text" id="beginpoint"
													value="${item.beginpoint}" readonly></td>
												<td>目的地</td>
												<td colspan="3"><input type="text"
													value="${item.go_to}" readonly></td>
											</tr>
											<tr>
												<td>出发时间</td>
												<td><input type="text" id="begintime"
													value="${item.begintime}" readonly></td>
												<td>返回时间</td>
												<td colspan="3"><input type="text" id="endtime"
													value="${item.endtime}" readonly></td>
											</tr>
											<tr>
												<td>原因</td>
												<td colspan="5" align="center"><textarea rows="3"
														style="width: 460px;" id="reason" readonly>${item.reason}</textarea><span
													id="acondition" style="display: none;">${item.acondition}</span>
												</td>
											</tr>
											<tr>
												<td>中心意见</td>
												<td colspan="5" align="left"><textarea rows="1"
														cols="40" id="depoption" readonly>${item.depoption}</textarea>
													<span style="display: none;">
														<button id="agree3">同意</button>
														<button id="refuse3">拒绝</button> </span><span id='response3'
													style="display: none;"></span></td>
											</tr>
											<tr>
												<td>部门意见</td>
												<td colspan="5" align="center"><textarea rows="1"
														cols="40" id="depoption2" readonly>${item.depoption2}</textarea>
													<span style="display: none;">
														<button id="agree22">同意</button>
														<button id="refuse22">拒绝</button> </span><span id='response22'
													style="display: none;"></span></td>
											</tr>
											<tr>
												<td>行政事务意见</td>
												<td colspan="5" align="left"><textarea rows="1"
														cols="40" id="comoption" readonly>${item.comoption}</textarea>
													<span style="display: none;"><button id="agree2">同意</button>
														<button id="refuse2">拒绝</button> </span> <span id='response2'
													style="display: none;"></span></td>
											</tr>
											<tr>
												<td>派车处理结果</td>
												<td colspan="5" align="left"><textarea rows="1"
														cols="40" id="appoption" readonly>${item.appoption}</textarea>
												</td>
											</tr>
										</table>
									</div> <script type="text/javascript" src="js/detail.js?v=20151110"></script>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="done" style="display: none;">
				<table class="browse_tabheader" border="1">
					<tr>
						<th class="td0">序号</th>
						<th class="td1">编号</th>
						<th class="td2">出发时间</th>
						<th class="td3">申请人</th>
						<th class="td4">起始点</th>
						<th class="td4">目的地</th>
						<th class="td5">原因</th>
						<th class="td4">所派车辆</th>
						<th class="td6">派车状态</th>
					</tr>
				</table>
				<div class="view">
					<table id="browse_tab" border="1">
						<c:forEach items="${appdone}" var="item" varStatus="status">
							<tr>
								<td class="td0">${status.index+1}</td>
								<td class="td1"><a href="tab=1&item=${item.appid}">${item.appid}</a>
								</td>
								<td class="td2">${item.begintime}</td>
								<td class="td3">${item.appname}</td>
								<td class="td4">${item.beginpoint}</td>
								<td class="td4">${item.go_to}</td>
								<td class="td5">${item.reason}</td>
								<td class="td4">${item.cno}&nbsp;</td>
								<td class="td6"><c:choose>
										<c:when test='${item.acondition eq "10"}'>已派</c:when>
										<c:when test='${item.acondition eq "9"}'>无车,原因可查看</c:when>
										<c:when test='${item.acondition eq "8"}'>行政事务拒绝</c:when>
										<c:when test='${item.acondition eq "7"}'>中心批准部门拒绝</c:when>
										<c:when test='${item.acondition eq "6"}'>部门拒绝</c:when>
										<c:when test='${item.acondition eq "5"}'>中心拒绝</c:when>
										<c:when test='${item.acondition eq "4"}'>行政事务批准</c:when>
										<c:when test='${item.acondition eq "3"}'>中心部门均批准</c:when>
										<c:when test='${item.acondition eq "2"}'>仅部门已批准</c:when>
										<c:when test='${item.acondition eq "1"}'>中心已批准</c:when>
										<c:when test='${item.acondition eq "0"}'>中心或部门待批准</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="button_link">
				<!-- 此 class 无样式 -->
				<br> <a href="browse.jsp" style="color:#00f;">本部门历史派车单查看</a> <a
					id="managehelp" href="managehelp.xlsx" style="color:red;">使用帮助</a>
			</div>
			<div
				style="font-size: 12px; font-family: Arial; margin-top: 30px; width: 480px;">
				版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;XDa
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/manager.js"></script>
<script type="text/javascript" src="js/menu_nav.js"></script>
</html>
