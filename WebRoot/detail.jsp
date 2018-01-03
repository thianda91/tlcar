<%@page import="com.yxd.obj.userview"%>
<%@page import="com.yxd.obj.Uusers"%>
<%@page import="com.jdbc.manageDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<%
	String itemid = request.getParameter("item");
	session.setAttribute("itemid", null == itemid ? 0 : itemid);
	//	manageDAO managedao = new manageDAO();
	Uusers user = (Uusers) session.getAttribute("user");
	//String backurl = "/";
	if (null != user) {//根据不同分公司获取 车辆和司机列表显示在select列表中
		manageDAO.initDetail_jsp(session, user);
		/*	if (user.getUauthority() < 4)
				backurl = "/manager.jsp";
			else
				backurl = "/browse.jsp";*/
	}
%>

<title>编号：${itemid}&nbsp;派车单详细信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">
<link rel="stylesheet" type="text/css" href="css/apply.css">
<link rel="stylesheet" type="text/css" href="css/iconfont.css">
<style media="print" type="text/css">
.noprint {
	display: none;
}

table {
	border-collapse: collapse;
}

table td {
	border: 1px solid;
}

table.detailtab td input,textarea {
	border: none;
}
</style>

</head>

<body>
	<span class="noprint"><%@ include file="usertop.jsp"%></span>
	<div id="detialcenter" align="center">
		<div class="menu_nav noprint" id="manage_menu" style="display: none;">
			<ul>
				<li id="userapp1"><a href="javascript:void(0)">申请派车</a>
				</li>
				<li class="active" id="apptodo"><a href="javascript:void(0)">待办列表</a>
				</li>
				<li id="appdone"><a href="javascript:void(0)">已处理</a></li>
				<li id="userinfo1"><a href="javascript:void(0)">个人信息 </a>
				</li>
				<li id="sysmanage"><a href="javascript:void(0)">车辆管理 </a></li>

			</ul>
		</div>
		<div class="menu_nav noprint" id="user_menu" style="display: none;">
			<ul>
				<li id="userapp2"><a href="javascript:void(0)">申请派车</a></li>
				<li class="active" id="userview"><a href="javascript:void(0)">派车单浏览</a>
				</li>
				<li id="userinfo2"><a href="javascript:void(0)">个人信息 </a>
				</li>
			</ul>
		</div>
		<c:catch var="getUloginnameErr">
			<div id="curuname" style="display: none;"><%=user.getUloginname()%></div>
		</c:catch>
		<div style="width: 1050px; height: 550px;">


			<%
				List<userview> itemslist = new ArrayList<userview>();
				if (request.getParameter("tab") != null)
					itemslist = (List<userview>) session.getAttribute("appdone");
				else
					itemslist = (List<userview>) session.getAttribute("applist");
			%>

			<form id="detailform" action="handle.do" target="_blank"
				method="post" style="position:relative;">
				<c:forEach items="<%=itemslist%>" var="item" varStatus="status">
					<c:if test="${item.appid eq itemid}">
						<table class="detailtab" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<th style="visibility: hidden;" id="acondition">${item.acondition}</th>
								<!-- 申请状态  -->
							</tr>
							<tr>
								<td colspan="6"><span style="color:#f00;font-size:12px;background-color:#999;padding:2px;">提示: 因服务器系统时间走时不太准确（偏快），生成的派车单填写时间有可能有偏差。不影响流程使用。我尽量定期手动校准。</span></td>
							</tr>
							<tr class="tab_th">
								<th align="center"><i class="icon iconfont icon_che">&#xe6ec;</i>
								</th>
								<th colspan="2" align="center"><h2>
										编号：<span>${item.appid}</span>&nbsp;派车单信息
									</h2>
								</th>
								<th><span class="printform noprint"><button
											id="printform">打印</button> </span>
								</th>
								<th colspan="2" align="right" style="vertical-align: bottom;">tlydgs</th>
							</tr>
							<tr>
								<td>用车部门</td>
								<td colspan="5"><span style="font-size: 14px;" id="appdept"><input
										style="width: 10px; visibility: hidden;">${item.appoffice}-${item.appdept}
								</span> <span style="float:right; font-size: 12px; color: #000;">
										申请时间：${item.applydate}<input
										style="width: 10px; visibility: hidden;"> </span>
								</td>
							</tr>
							<tr>
								<td>申请人</td>
								<td><input type="text" id="appname" value="${item.appname}"
									readonly>
								</td>
								<td>用车人数</td>
								<td><input style="width: 50px;" type="text"
									value="${item.mancount}" readonly>
								</td>
								<td>去向</td>

								<td><c:choose>
										<c:when test="${item.range eq 0}">
											<c:set var="range" value="铁岭"></c:set>
										</c:when>
										<c:when test="${item.range eq 1}">
											<c:set var="range" value="市外"></c:set>
										</c:when>
									</c:choose><input style="width: 80px;" type="text" value="${range}"
									readonly>
								</td>
							</tr>
							<tr>
								<td>出发点</td>
								<td><input type="text" id="beginpoint"
									value="${item.beginpoint}" readonly>
								</td>
								<td>目的地</td>
								<td colspan="3"><input type="text" value="${item.go_to}"
									readonly>
								</td>
							</tr>
							<tr>
								<td>出发时间</td>
								<td><input type="text" id="begintime"
									value="${item.begintime}" readonly>
								</td>
								<td>返回时间</td>
								<td colspan="3"><input type="text" id="endtime"
									value="${item.endtime}" readonly>
								</td>
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
								<td colspan="5" align="left"><textarea rows="1" cols="40"
										id="depoption" readonly>${item.depoption}</textarea> <span
									style="display: none;">
										<button id="agree3">同意</button>
										<button id="refuse3">拒绝</button> </span><span id='response3'
									style="display: none;"></span>
								</td>
							</tr>
							<tr>
								<td>部门意见</td>
								<td colspan="5" align="center"><textarea rows="1" cols="40"
										id="depoption2" readonly>${item.depoption2}</textarea> <span
									style="display: none;">
										<button id="agree22">同意</button>
										<button id="refuse22">拒绝</button> </span><span id='response22'
									style="display: none;"></span>
								</td>
							</tr>
							<tr>
								<td>行政事务意见</td>
								<td colspan="5" align="left"><textarea rows="1" cols="40"
										id="comoption" readonly>${item.comoption}</textarea> <span
									style="display: none;"><button id="agree2">同意</button>
										<button id="refuse2">拒绝</button> </span> <span id='response2'
									style="display: none;"></span>
								</td>
							</tr>
							<tr>
								<td>派车处理结果</td>
								<td colspan="5" align="left"><textarea rows="1" cols="40"
										id="appoption" readonly>${item.appoption}</textarea><span
									style="display:none;">&nbsp;
										<button id="cancelApply">撤销申请单</button> </span><span
									id="cancelresponse" style="display: none;"></span>
								</td>
							</tr>
							<tr>
								<td>派车信息</td>
								<td colspan="5" align="left"><textarea rows="1" cols="40"
										id="driverinfo" readonly>${item.cno}&nbsp;&nbsp;${item.driverinfo}</textarea>
								</td>
							</tr>
							<tr style="display: none;">
								<td style="color: blue;">派车选择</td>
								<td colspan="5" align="left" id="manage1"><select
									id="selectcno">
										<c:forEach items="${carnolist}" var="item" varStatus="status">
											<option value="${item.c_uid}">${item.cno}</option>
										</c:forEach>
								</select>&nbsp;<select id="selectdri"><c:forEach
											items="${drinamelist}" var="item" varStatus="status">
											<option value="${item.d_uid}">${item.driname}</option>
										</c:forEach>
								</select>&nbsp;
									<button id='agree1' disabled>同意</button>&nbsp; <select
									id="refuse1" name="refuse1" title="拒绝派车理由，选择即确认！">
										<option value="无车">请选择拒绝派车理由</option>
										<option value="暂无空闲车辆">暂无空闲车辆</option>
										<option value="禁止同一人同时派多台车">禁止同一人同时派多台车</option>
										<option value="派车单填写无效">派车单填写无效</option>
										<option value="雪天路滑，不能派车">雪天路滑，不能派车</option>
										<option value="中心或部门领导未批准">领导未批准</option>
										<option value="去市外需要行政事务批准">去市外需要行政事务批准</option>
										<option value="0" style="color:#33e">>>手动填写理由<<</option>
								</select> <span id='response1'></span>
								</td>
							</tr>
							<tr style="visibility: hidden;">
								<td style="color: #33e;">自定义理由</td>
								<td colspan="5"><input id="myrefuse" style="width: 350px;"
									maxlength="20">
									<button id="refuse0">确认</button></td>
							</tr>
						</table>
					</c:if>
				</c:forEach>
				<span id="fanhui_detail" class="noprint"> <a
					href="javascript:history.go(-1)"><i class="icon iconfont">&#xe621;</i>
				</a> </span>
			</form>

			<!-- handle_result DIV 被用为执行处理派车单命令 ↓↓-->
			<div id="handle_result">
				<div id="xx">×</div>
			</div>
			<!-- handle_result DIV 被用为执行处理派车单命令 ↑↑-->
			<div class="noprint"
				style="font-size: 12px; font-family: Arial; margin-top: 50px; width: 480px;">
				版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;XDa
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/menu_nav.js"></script>
<script type="text/javascript" src="js/detail.js?v=20151110"></script>

<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height=0
	id="wb" name="wb" width="0"></OBJECT>
</html>
