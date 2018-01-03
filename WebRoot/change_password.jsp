<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.yxd.obj.Uusers"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Uusers curuser = (Uusers) session.getAttribute("user");
	if (curuser == null) {
		session.setAttribute("msg", "您未登录或登录超时，请重新登录。");
			response.sendRedirect("/TLCAR");
	}
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>请修改初始密码，否则无法派车</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="305">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/md5-min.js"></script>
<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
<style>
body {
	min-height: 600px;
	height: 100%;
}

.box {
	margin: 80px 0;
	width: 500px;
	border: 1px solid #005880;
}

.box table {
	margin: auto;
}

.box tr {
	padding: 3px;
}

.box tr td {
	color: #333;
}

.box tr td.tips {
	color: #33a;
	font-size: 12px;
}

.box tr td input.text {
	width: 200px;
}

.box tr.button {
	text-align: center;
}

.box tr td #pwdtip {
	color: red;
	font-size: 12px;
}
</style>
</head>

<body>
	<div align="center">
		<div class="box">
			<div style="background:#005880;height:60px;padding:5px;;">
				<p style="color:#fff;font-size:14px;">使用初始密码无法派车，请立即修改密码。</p>
			</div>
			
			<form method="post" action="userupdate.do">
				<table>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td></td>
						<td class="tips" colspan=2>【${user.uname}】,您好，您的密码为初始密码，请设置新的登陆密码并牢记：</td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td></td>
						<td>新密码：</td>
						<td><input class="text" id="newpwd1" type="password"
							name="newpwd" autocomplete="off" style="ime-mode:disabled"
							maxlength=32>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<td>确认密码：</td>
						<td><input class="text" id="newpwd2" type="password"
							autocomplete="off" style="ime-mode:disabled" maxlength=32>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr style="display:none;">
						<td><input class="text" id="r" name="r" type="text">
						</td>
						<td><input class="text" id="fromurl" name="fromurl"
							type="text"></td>
						<td><input id="uuid" type="text" name="uuid"
							value="${user.u_uid}"></td>
						<td></td>
					</tr>
					<tr class="row button">
						<td></td>
						<td colspan=2><input id="submitbutton" type="submit"
							value="确认">&nbsp;&nbsp;&nbsp;<input type="reset"
							value="重置">
						</td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td></td>
						<td colspan=2><span id="pwdtip">&nbsp;</span></td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
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
<script>
	$("#thisyear").text(new Date().getFullYear()); //每个页面下面【版权所有】的年份更新
	
	if ($("#uuid").val() == "") {
			$("#pwdtip").html("您未登陆，请<a href='/TLCAR'>登陆</a>");
			$("#submitbutton").attr("disabled","disabled");
		}
	$("#submitbutton").click(function() {
		if ($("#newpwd1").val() == "") {
			$("#pwdtip").text("新密码不能为空");
			$("#newpwd1").focus();
		} else if ($("#newpwd2").val() == "") {
			$("#pwdtip").text("请再次确认新密码");
			$("#newpwd2").focus();
		} else if ($("#newpwd1").val().length < 7) {
			$("#pwdtip").text("新密码长度至少8位。");
			$("#newpwd1").select();
		} else if ($("#newpwd1").val() != $("#newpwd2").val()) {
			$("#pwdtip").text("两次密码不一致。");
			$("#newpwd2").select();
		} else if (checkPass($("#newpwd1").val())<3) {	//验证密码强度
			$("#pwdtip").text("密码复杂度不够，请重新设置！");
			alert("密码复杂要求：\n\n1、密码长度最小8字符\n2、密码必须是字母大写，字母小写，数字，特殊字符中任意三个组合。");
			$("#newpwd1").select();
		} else {
			var md5_pwd = hex_md5($("#newpwd1").val());
			$("#pwdtip").text("修改密码，请稍后。");
			$("#r").val("pwd");
			$("#newpwd1").val(md5_pwd);
			return true;
		}
		return false;

	});
	
	function checkPass(s) {
		if (s.length < 8) {
			return 0;
		}
		var ls = 0;
		if (s.match(/([a-z])+/)) {
			ls++;
		}
		if (s.match(/([0-9])+/)) {
			ls++;
		}
		if (s.match(/([A-Z])+/)) {
			ls++;
		}
		if (s.match(/[^a-zA-Z0-9]+/)) {
			ls++;
		}
		return ls;
	}
</script>
</html>
