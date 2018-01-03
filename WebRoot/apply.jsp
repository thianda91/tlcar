<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



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

<title>填写派车单&nbsp;&nbsp;&nbsp;&nbsp; 【${user.uname}】</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/jscal2.css">
<link rel="stylesheet" type="text/css" href="css/border-radius.css">
<link rel="stylesheet" type="text/css" href="css/steel.css">
<link rel="stylesheet" type="text/css" href="css/WebStyles.css">
<link rel="stylesheet" type="text/css" href="css/iconfont.css">
<script src="js/jscal2.js"></script>
<script src="js/en.js"></script>

<link rel="stylesheet" type="text/css" href="css/apply.css">

<script type="text/javascript">
	
</script>
</head>

<body>
	<%@ include file="usertop.jsp"%>
	<div align="center">
		<div class="menu_nav" id="manage_menu" style="display: none;">
			<ul>
				<li id="userapp1"><a href="javascript:void(0)">申请派车</a></li>
				<li class="active" id="apptodo"><a href="javascript:void(0)">待办列表</a>
				</li>
				<li id="appdone"><a href="javascript:void(0)">已处理</a></li>
				<li id="userinfo1"><a href="javascript:void(0)">个人信息 </a></li>
				<li id="sysmanage"><a href="javascript:void(0)">系统管理 </a></li>
			</ul>
		</div>
		<div class="menu_nav" id="user_menu" style="display: none;">
			<ul>
				<li class="active" id="userapp2"><a href="javascript:void(0)">申请派车</a>
				</li>
				<li id="userview"><a href="javascript:void(0)">派车单浏览</a></li>
				<li id="userinfo2"><a href="javascript:void(0)">个人信息 </a></li>
			</ul>
		</div>

		<div style="width: 1100px;">
			<!-- <span class="back"><a href="manager.jsp">返回上一页</a> </span> -->
			<form method="post" action="apply.do" id="appform">
				<table class="apptab" border="0">
					<tr style="display : none;">
						<td colspan="2"><input type="text" id="userqx" name="userqx"
							value="${user.uauthority}"> <!-- 申请人权限 -->
						</td>
						<td colspan="2"><input type="text" id="gongsi" name="gongsi"
							value="${user.uoffice}"> <!-- 申请人所属公司 --></td>
						<td colspan="2"><input type="text" id="appnameid"
							name="appnameid" value="${user.u_uid}"> <!-- 申请人u_uid -->
						</td>
					</tr>
					<tr>
						<td colspan="6"><span style="color:#f00;font-size:12px;background-color:#999;padding:2px;">提示: 因服务器系统时间走时不太准确（偏快），生成的派车单填写时间有可能有偏差。不影响流程使用。我尽量定期手动校准。</span></td>
					</tr>
					<tr class="tab_th">
						<th align="center"><i class="icon iconfont icon_che">&#xe612;</i>
						</th>
						<th colspan="2" align="center"><h2>派车单填写</h2></th>
						<th style="vertical-align: bottom;"><span><button
									style="font-size: 12px;" onclick="javascript:history.go(-1)">返回</button>
						</span>
						</th>
						<th colspan="2" align="right" style="vertical-align: bottom;">tlydgs</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>

						<td>用车单位</td>
						<td><input type="text" id="appdept" name="appdept"
							value="${user.udept}" disabled>
						</td>
						<td>用车人数</td>
						<td></td>
						<td colspan="2"><select name="personnum" title="范围1-10">
								<option value="1" selected="selected">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">其他</option>
						</select></td>

					</tr>
					<tr>
						<td colspan="2" style="font-size: 12px; color: graytext ;"
							align="center">此处 不可更改。</td>

					</tr>
					<tr>
						<td>申请人</td>
						<td><input type="text" id="appname" name="appname"
							value="${user.uname}" disabled></td>

						<td>去向</td>
						<td colspan="3"
							onmousemove="c$.mmove(this,'银州区及各县区请选择市内，沈阳等外地请选择市外。');"
							onmouseout="c$.mout();"><select id="range" name="range">
								<option value="9" selected="selected">请选择</option>
								<option value="0">银州区、新区以及各县区【多数人的选择】</option>
								<option value="1">铁岭市外，沈阳等外地【少数情况的选择】</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="font-size: 12px; color: graytext ;"
							align="center">申请人 不可更改。</td>
						<td></td>
						<td colspan="3" align="center" class="err" id="rangeerr"></td>
					</tr>
					<tr>
						<td>出发点</td>
						<td><input type="text" id="beginpoint" name="beginpoint"
							maxlength="10">
						</td>
						<td>目的地</td>
						<td colspan="3"><input type="text" id="destination"
							name="destination" maxlength="10">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center" id="beginerr" class="err"></td>
						<td colspan="4" align="center" id="deserr" class="err"></td>
					</tr>
					<tr>
						<td>出发时间</td>
						<td><input type="text" id="begintime" name="begintime"
							readonly></td>
						<td>返回时间</td>
						<td colspan="3"><input type="text" id="endtime"
							name="endtime" readonly></td>
					</tr>
					<tr>
						<td colspan="6" align="center" id="timeerr" class="err">&nbsp;</td>

					</tr>
					<tr>
						<td>原因</td>
						<td colspan="5"><textarea rows="3" cols="40" id="reason"
								name="reason">(50字以内)</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="6" class="err"><span id="reasoncheck">&nbsp;</span>
						</td>
					</tr>
					<tr>
						<th colspan="6"><button type="submit">提交</button>
							&nbsp;&nbsp;
							<button type="reset">重置</button>
						</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>
			<div
				style="font-size: 12px; font-family: Arial; margin-top: 50px; width: 480px;">
				版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;XDa
			</div>
		</div>

	</div>

</body>
<script type="text/javascript" src="js/browse.js"></script>
<script type="text/javascript" src="js/apply.js"></script>
<script type="text/javascript" src="js/menu_nav.js"></script>
</html>
