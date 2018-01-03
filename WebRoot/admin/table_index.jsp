<%@page import="com.yxd.obj.Uusers"%>
<%@page import="com.jdbc.manageDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String fn = request.getParameter("fn");
	int index = 0;
%>
<c:catch var="ErrorMSG">
	<%
		session.setAttribute("fn", fn);
			if (fn.startsWith("new")) {
				//List carlist = (ArrayList) session.getAttribute("carlist");
			} else {
				String indexid = request.getParameter("indexid");
				index = Integer.parseInt(indexid == null ? "0" : indexid);
				session.setAttribute("indexid", indexid);
			}
			manageDAO.getoffices(session);
	%>

</c:catch>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>详细信息页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">
<!--<link rel="stylesheet" type="text/css" href="css/userinfo.css">-->
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>

<style type="text/css">
.xiaobiaoti {
	text-align: center;
	font-family: "黑体";
	background-color: #00ff00;
}

#resetpwd {
	background-color: #f00;
	color: #fff;
}

.err {
	font-size: 12px;
	color: #f00;
	font-family: "宋体";
}
</style>
</head>

<body>
	${ErrorMSG.message}
	<br>
	<div align="center">

		<div style="width: 500px;">
			<div id="tablediv">
				<!-- cardiv -->
				<c:if test="${fn eq 'cardiv'}">
					<c:forEach items="${carlist}" var="item" varStatus="status">
						<c:if test="${status.index == indexid}">
							<div id="carindex">
								<form method="post" action="modifycar.do">
									<table>
										<tr>
											<td colspan="2" class="xiaobiaoti">车辆信息修改</td>
										</tr>
										<tr style="visibility: hidden;">
											<th></th>
											<td><input name="c_uid" type="text"
												value="${item.c_uid}"></td>
										</tr>
										<tr>
											<th>编号</th>
											<td align="center">${item.c_uid}</td>
										</tr>
										<tr>
											<td id="cdept" colspan="2" style="visibility: hidden;">${item.cdept}</td>
										</tr>
										<tr>
											<th>车牌号</th>
											<td><input id="cno" name="cno" type="text"
												value="${item.cno}" maxlength="8">
											</td>
										</tr>
										<tr>
											<td id="cnonote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<th>车型</th>
											<td><input id="ctype" name="ctype" type="text"
												value="${item.ctype}" maxlength="8"></td>
										</tr>
										<tr>
											<td id="ctypenote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<th>所属公司</th>
											<td><select id="cdept" name="cdept">
													<c:forEach items="${officelist}" var="itemm"
														varStatus="statuss">
														<option value="${itemm.uoffice}">${itemm.uoffice}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td id="cdeptnote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<th>状态</th>
											<td align="center"><input class="numcheck"
												id="ccondition" name="ccondition" type="text"
												value="${item.ccondition}" maxlength="1">
											</td>
										</tr>
										<tr>
											<td id="cconditionnote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2" style="" align="center"><input
												id="submitcar" type="submit" value="提交修改">&nbsp;&nbsp;&nbsp;&nbsp;<input
												id="close" type="button" name="closethis" value="关闭窗口"
												onclick="javascript:self.close()"></td>
										</tr>
										<tr>
											<td colspan="2">&nbsp;</td>
										</tr>
									</table>
								</form>
							</div>
							<script type="text/javascript">
								/* 默认选定为所属的公司 */
								$("select").val($("#cdept").text());
							</script>
						</c:if>
					</c:forEach>

				</c:if>
				<!-- dridiv -->
				<c:if test="${fn eq 'dridiv'}">
					<c:forEach items="${drilist}" var="item" varStatus="status">
						<c:if test="${status.index == indexid}">
							<div id="driindex">
								<form method="post" action="modifydri.do">
									<table>
										<tr>
											<td colspan="2" class="xiaobiaoti">司机信息修改</td>
										</tr>
										<tr style="visibility: hidden;">
											<th></th>
											<td><input name="d_uid" type="text"
												value="${item.d_uid}"></td>
										</tr>
										<tr>
											<th>编号</th>
											<td align="center">${item.d_uid}</td>
										</tr>
										<tr>
											<td id="ddept" colspan="2" style="visibility: hidden;">${item.ddept}</td>
										</tr>
										<tr>
											<th>姓名</th>
											<td><input name="driname" type="text"
												value="${item.driname}" maxlength="6">
											</td>
										</tr>
										<tr>
											<td id="drinamenote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<th>电话</th>
											<td><input class="numcheck" name="driphone" type="text"
												value="${item.driphone}" maxlength="6">
											</td>
										</tr>
										<tr>
											<td id="driphonenote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<th>所属公司</th>
											<td><select name="ddept">
													<c:forEach items="${officelist}" var="itemm"
														varStatus="statuss">
														<option value="${itemm.uoffice}">${itemm.uoffice}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td id="cddeptnote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<th>状态</th>
											<td align="center"><input class="numcheck"
												id="dricondition" name="dricondition" type="text"
												value="${item.dricondition}" maxlength="1">
											</td>
										</tr>
										<tr>
											<td id="dricondinote" colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2" style="" align="center"><input
												id="submitcar" type="submit" value="提交修改">&nbsp;&nbsp;&nbsp;&nbsp;<input
												id="close" type="button" name="closethis" value="关闭窗口"
												onclick="javascript:self.close()"></td>
										</tr>
										<tr>
											<td colspan="2">&nbsp;</td>
										</tr>
									</table>
								</form>
							</div>
							<script type="text/javascript">
								/* 默认选定为所属的公司 */
								$("select").val($("#ddept").text());
							</script>
						</c:if>
					</c:forEach>
				</c:if>
				
				<!-- newcar -->
				<c:if test="${fn eq 'newcar'}">
					<form action="newcar.do" method="post">
						<table>
							<tr>
								<td colspan="2" class="xiaobiaoti">新&nbsp;增&nbsp;车&nbsp;辆</td>
							</tr>
							<tr style="visibility: hidden;">
								<td id="userindex">&nbsp;</td>
							</tr>
							<tr>
								<th>车牌：</th>
								<td><input name="cno" type="text" maxlength="10">
								</td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td></td>
							<tr>
								<th>车型：</th>
								<td><input name="ctype" type="text" value="轿车"
									maxlength="8"></td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td></td>
							<tr>
								<th>所属公司：</th>
								<td><select name="cdept">
										<c:forEach items="${officelist}" var="itemm"
											varStatus="statuss">
											<option value="${itemm.uoffice}">${itemm.uoffice}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td></td>
							</tr>
							<tr>
								<th colspan="2"><input id="newcarbuton" type="submit"
									value="确定"> <input type="reset" value="重置">
									<button onclick="javascript:self.close()">取消</button></th>
							</tr>
						</table>
					</form>
					<script type="text/javascript">
						/* 默认选定铁岭市公司 */
						$("select").val("铁岭市公司");
					</script>
				</c:if>
				<!-- newdri -->
				<c:if test="${fn eq 'newdri'}">
					<form action="newdri.do" method="post">
						<table>
							<tr>
								<td colspan="2" class="xiaobiaoti">新&nbsp;增&nbsp;司&nbsp;机</td>
							</tr>
							<tr style="visibility: hidden;">
								<td id="userindex">&nbsp;</td>
							</tr>
							<tr>
								<th>姓名：</th>
								<td><input name="driname" type="text" maxlength="10">
								</td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td></td>
							<tr>
								<th>电话：</th>
								<td><input class="numcheck" name="driphone" type="text"
									value="660" maxlength="6"></td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td></td>
							<tr>
								<th>所属公司：</th>
								<td><select name="ddept">
										<c:forEach items="${officelist}" var="itemm"
											varStatus="statuss">
											<option value="${itemm.uoffice}">${itemm.uoffice}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td></td>
							</tr>
							<tr>
								<th colspan="2"><input id="newdributton" type="submit"
									value="确定"> <input type="reset" value="重置">
									<button onclick="javascript:self.close()">取消</button></th>
							</tr>
						</table>
					</form>
					<script type="text/javascript">
						/* 默认选定铁岭市公司 */
						$("select").val("铁岭市公司");
					</script>
				</c:if>
				<!-- userdiv -->
				<c:if test="${fn eq 'userdiv'}">
					<%
						String sql = "select * from uusers where u_uid = ?";
							Uusers cuser = manageDAO.get(Uusers.class, sql, index);
							session.setAttribute("cuser", cuser);
					%>

					<div class="xiaobiaoti">用户信息修改</div>

					<div id="userindex">
						<div>
							加载中，请<span>稍等</span>
						</div>
						<input type="button" name="closethis" value="关闭窗口"
							onclick="javascript:self.close()">
					</div>
				</c:if>
				<!-- newuser -->
				<c:if test="${fn eq 'newuser'}">
					<form id="newuser" method="post" action="newuser.do">
						<table align="center">
							<tr>
								<td colspan="4" class="xiaobiaoti">新&nbsp;增&nbsp;用&nbsp;户</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<th>登录名</th>
								<td><input type="text" id="uloginname" name="uloginname"
									maxlength="20">
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="3" id="uloginnameerr" class="err"><font
									color="#ff7f00">若登录名存在则修改信息，否则为新建。</font>
								</td>
							</tr>
							<tr>

								<th>所属公司</th>
								<td><input id="uoffice" type="text" name="uoffice"
									maxlength="20"></td>
								<th>部门</th>
								<td><input id="udept2" type="text" name="udept2"
									maxlength="15">
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="err" id="uofficeerr"></td>
								<td></td>
								<td class="err" id="udept2err"></td>

							</tr>
							<tr>
								<th>姓名</th>
								<td><input id="uname" type="text" name="uname"
									maxlength="10">
								</td>
								<th>中心</th>
								<td><input id="udept" type="text" name="udept"
									maxlength="15">
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="err" id="unameerr"><font color="#ff7f00">新建的姓名确认后不可更改。</font>
								</td>
								<td></td>
								<td class="err" id="udepterr"></td>
							</tr>
							<tr>
								<th>电话</th>
								<td><input id="uphoneno" type="text" name="uphoneno"
									maxlength="11">
								</td>

								<th>V网小号</th>
								<td><input id="uvphone" type="text" name="uvphone"
									maxlength="6">
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="err" id="uphonenoerr"></td>
								<td></td>
								<td class="err" id="uvphoneerr"></td>
							</tr>
							<tr>
								<th>权限</th>
								<td colspan="3"><input type="radio" name="uauthority"
									checked="checked" value="4">普通用户 <input type="radio"
									name="uauthority" value="3">中心领导 <input type="radio"
									name="uauthority" value="2">部门领导 <input type="radio"
									name="uauthority" value="1">派车人员</td>
							<tr>
								<td>&nbsp;</td>
								<td colspan="3" class="err" id="uauthorityerr"><font
									color="#ff7f00">行政事务 也选择： “部门领导”。</font></td>
							</tr>
							<tr>
								<th>密码</th>
								<td><input id="newpwd1" type="password" name="newpwd"
									value="Qq_0247asdf" autocomplete="off" disabled="disabled"
									style="ime-mode:disabled" maxlength=32></td>
								<td colspan="2" rowspan="3" id="pwdtip"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="err" colspan="3" style="color: #ff7f00;">
									密码为：Qq_0247asdf。此处不可修改，登陆后可修改。</td>
							</tr>
							<tr>
								<th>确认密码</th>
								<td><input id="newpwd2" type="password" value="Qq_0247asdf"
									autocomplete="off" disabled="disabled"
									style="ime-mode:disabled" maxlength=32>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td style="display: none;"><input id="iflogin"
									name="iflogin" type="text">
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="2" class="err" id="note"></td>
							</tr>

							<tr>
								<th colspan="4"><span> <input type="submit"
										id="usersubmit" value="注册"> </span>&nbsp;&nbsp;<span><input
										id="userreset" type="reset"> </span> &nbsp;&nbsp;<input
									type="button" value="取消" onclick="javascript:self.close()">
								</th>
							</tr>
						</table>
					</form>
					<script type="text/javascript" src="js/register.js"></script>
				</c:if>
				
				<!-- tablediv END -->
			</div>
			<!-- div width:500px END -->
		</div>
		<!-- div center END -->
	</div>
	<br>
</body>
<script type="text/javascript">
	$("#uname").focus();
	$("#newuser #uloginname").focus();
	
	var submitflag = false;
</script>
<script type="text/javascript" src="js/admin_table_index.js"></script>

</html>
