<%@page import="com.jdbc.DAO"%>
<%@page import="com.yxd.obj.tlcars"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>车辆变动管理</title>

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
			String csql = "select * from tlcars where c_uid not in (0,10) order by c_uid";
			//	List<tlcars> carlist = new ArrayList<tlcars>();
			//	carlist = DAO.getForList(tlcars.class, csql);
			session.setAttribute("carlist", DAO.getForList(tlcars.class, csql));
		%>

		<div class="titlediv1">
			<div>
				<button id="newcar" type="button">新增车辆</button>
				<span class="mtips">点击新增，或点击列表进行编辑操作。</span>
			</div>
			<table class="mnav">
				<tr>
					<th class="mtd1">编号</th>
					<th class="mtd2">车牌&nbsp;</th>
					<th class="mtd4">车型</th>
					<th class="mtd2">所属公司&nbsp;</th>
					<th class="mtd1">状态</th>
				</tr>
			</table>
		</div>
		<div id="cardiv">
			<table class="mview">
				<c:forEach items="${carlist}" var="item" varStatus="status">
					<tr class="mviewtr">
						<td class="mtd1"><a href="${status.index}">${item.c_uid}</a>
						</td>
						<td class="mtd2">${item.cno}&nbsp;</td>
						<td class="mtd4">${item.ctype}</td>
						<td class="mtd2">${item.cdept}&nbsp;</td>
						<td class="mtd1">${item.ccondition}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/admin_manage.js"></script>
</html>
