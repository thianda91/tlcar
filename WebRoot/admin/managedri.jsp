<%@page import="com.jdbc.DAO"%>
<%@page import="com.yxd.obj.drivers"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>司机变动管理</title>

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
			String dsql = "select * from drivers where d_uid not in (0,10) order by d_uid";
			//	List<drivers> drilist = new ArrayList<drivers>();
			//	drilist = DAO.getForList(drivers.class, dsql);
			session.setAttribute("drilist", DAO.getForList(drivers.class, dsql));
		%>

		<div class="titlediv1">
			<div>
				<button id="newdri" type="button">新增司机</button>
				<span class="mtips">点击新增，或点击列表进行编辑操作。</span>
			</div>
			<table class="mnav">
				<tr>
					<th class="mtd1">编号</th>
					<th class="mtd4">姓名</th>
					<th class="mtd4">电话</th>
					<th class="mtd2">所属公司</th>
					<th class="mtd1">状态</th>
				</tr>
			</table>
		</div>

		<div id="dridiv">
			<table class="mview">
				<c:forEach items="${drilist}" var="item" varStatus="status">
					<tr class="mviewtr">
						<td class="mtd1"><a href="${status.index}">${item.d_uid}</a>
						</td>
						<td class="mtd4">${item.driname}&nbsp;</td>
						<td class="mtd4">&nbsp;${item.driphone}</td>
						<td class="mtd2">${item.ddept}&nbsp;</td>
						<td class="mtd1 ">${item.dricondition}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>

</body>
<script type="text/javascript" src="js/admin_manage.js"></script>
</html>
