<%@page import="com.jdbc.DAO"%>
<%@page import="com.yxd.obj.Uusers"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>账号变动管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">
<link rel="stylesheet" type="text/css" href="css/admin_manage.css">
</head>

<body>
	<div align="center">

		<%
			String usql = "select * from uusers where u_uid != 0 order by nlssort(uname, 'NLS_SORT=SCHINESE_PINYIN_M')";
			//	List<Uusers> carlist = new ArrayList<Uusers>();
			//	userlist = DAO.getForList(Uusers.class, csql);
			session.setAttribute("userlist", DAO.getForList(Uusers.class, usql));
		%>
		<div class="titlediv2">
			<div>
				<input id="newuser" type="button" value="新增用户"> <span
					class="mtips">点击新增，或点击列表进行编辑操作。</span><span><input
					type="text" id="searchstr" name="searchstr"
					size="10"> <input type="submit" value="页内查找"
					onclick="javascript:findIt();">
				</span>
			</div>
			<table class="mnav">
				<tr>
					<th class="mtd1">编号</th>
					<th class="mtd2">登录名&nbsp;</th>
					<th class="mtd4">姓名&nbsp;</th>
					<th class="mtd3">中心&nbsp;</th>
					<th class="mtd2">电话</th>
					<th class="mtd4">小号&nbsp;</th>
					<th class="mtd5">公司&nbsp;</th>
					<th class="mtd1">权限</th>
				</tr>
			</table>
		</div>
		<div id="userdiv">
			<table class="mview">
				<c:forEach items="${userlist}" var="item" varStatus="status">
					<tr class="mviewtr">
						<td class="mtd1"><a href="${item.u_uid}">${item.u_uid}</a></td>
						<td class="mtd2">${item.uloginname}&nbsp;</td>
						<td class="mtd4">${item.uname}&nbsp;</td>
						<td class="mtd3">${item.udept}&nbsp;</td>
						<td class="mtd2">${item.uphoneno}&nbsp;</td>
						<td class="mtd4">${item.uvphone}&nbsp;</td>
						<td class="mtd5">${item.uoffice}&nbsp;</td>
						<td class="mtd1">${item.uauthority}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/admin_manage.js"></script>
</html>
