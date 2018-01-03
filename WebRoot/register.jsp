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

<title>tlydgs派车系统-新用户注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/md5-min.js"></script>
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>

<body>
	<div align="center">
		<div class="header_resize">
			<div class="header">
				<div class="logo">
					<div class="title">tlydgs派车系统</div>
					<div class="hello">
						<b>请填写注册信息 </b> <br> <span>或</span><a href="/TLCAR"
							style="color: #fff;">点此登录</a>
					</div>
				</div>
			</div>
		</div>
		<div>
			<form method="post" action="register.do">
				<table border="1" bordercolor="blue">
					<tr style="background-color: #0040f0;color: #fff">
						<td colspan="3"
							style="padding: 0px 30px; line-height: 30px; font-size: 14px;">账户信息</td>
					</tr>
					<tr>
						<th><span>*</span>登录名：</th>
						<td><input type="text" id="uloginname" name="uloginname"
							maxlength="12">
						<td class="tips">由字母组成，推荐使用姓名拼音，以防忘记。</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" class="err" id="uloginnameerr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>姓名：</th>
						<td><input type="text" id="uname" name="uname" maxlength="12">
						<td class="tips">使用真实姓名，填写派车单时作为使用人。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="unameerr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>所属公司：</th>
						<td><input type="text" id="uoffice" name="uoffice"
							maxlength="20" value="铁岭市公司">
						<td class="tips">请填写“<font color="red">铁岭市公司</font>”。或如<font
							color="red">清河</font>请填<font color="red">清河分公司</font>，等。不一致会导致派车单无法被批准。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="uofficeerr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>部门：</th>
						<td><input type="text" id="udept2" name="udept2"
							maxlength="10">
						<td class="tips">自己所在部门，可参考同事的个人信息内容填写。<font color="red">不一致会导致派车单无法被批准。</font>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="udept2err">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>中心：</th>
						<td><input type="text" id="udept" name="udept" maxlength="10">
						<td class="tips">自己所在中心，如：“<font color="red">kxzx</font>”。未划分则与部门名称相同。如：“财务部”。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="udepterr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>手机号：</th>
						<td><input type="text" id="uphoneno" name="uphoneno"
							maxlength="11">
						<td class="tips">11位纯数字。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="uphonenoerr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>V网小号：</th>
						<td><input type="text" id="uvphone" name="uvphone"
							maxlength="6">
						<td class="tips">最长6位纯数字。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="uvphoneerr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>权限：</th>
						<td style="text-align: center;"><select id="uauthority"
							name="uauthority">
								<option selected="selected" value="4">普通用户</option>
								<!-- <option disabled="disabled" value="3">中心领导</option>
								<option disabled="disabled" value="2">部门领导</option>
								<option disabled="disabled" value="1">派车人员</option> -->
						</select></td>
						<td class="tips">这里只能注册为<font color="red">普通用户</font>。若添加领导请使用管理员账号登陆后操作。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="uauthorityerr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>密码：</th>
						<td><input type="password" id="upwd1" value="Qq_0247asdf"
							maxlength="16" readonly="readonly">
						<td class="tips">注：注册密码不可修改。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="uloginnameerr">&nbsp;</td>
					</tr>
					<tr>
						<th><span>*</span>密码确认：</th>
						<td><input type="password" id="upwd2" value="Qq_0247asdf"
							maxlength="16" readonly="readonly">
						<td class="tips">默认为&nbsp;<font color="red">Qq_0247asdf</font>&nbsp;。如需更改请注册成功后登陆，转到个人信息修改。</td>
					</tr>
					<tr>
						<td></td>
						<td class="err" id="uloginnameerr">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3" align="center"><button id="inputsubmit">确认注册</button>
						</td>
					</tr>
					<tr>
						<td style="visibility: hidden; "><input type="password"
							id="upwd" name="upwd">
						</td>
						<td class="err" id="formnote" style="text-align: center;"></td>
						<!-- 注册后是否自动登陆，若管理员添加的则不自动登陆，用户自行注册则自动登陆。 -->
						<td style="display: none;"><input id="iflogin" name="iflogin"
							type="text">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	//注册按钮的效果
	$("#inputsubmit").mouseover(function() {
		$(this).css("background-color", "#ff8f00");
	});
	$("#inputsubmit").mouseout(function() {
		$(this).css("background-color", "#ff7f00");
	});
	$("#uloginname").focus();
	var submitflag = false;
	//*********************************

	//**********************************

	$("#inputsubmit").bind(
			"click",
			function() {
				if (submitflag) {
					var registerstr = "【确认】使用以下信息注册：\n\r\n\r登录名："
							+ $("#uloginname").val();
					registerstr += "\n\r  姓名： " + $("#uname").val();
					registerstr += "\n\r  公司： " + $("#uoffice").val();
					registerstr += "\n\r  部门： " + $("#udept").val();
					registerstr += "\n\r  中心： " + $("#udept2").val();
					registerstr += "\n\r  电话： " + $("#uphoneno").val();
					registerstr += "\n\r  小号： " + $("#uvphone").val();
					registerstr += "\n\r  权限： "
							+ $("option[selected='selected']").text();
					registerstr += "\n\r\n\r除【姓名】其他信息可在登录后修改。";
					if (confirm(registerstr)) {
						var pwd = hex_md5($("#upwd1").val());
						$("#upwd").val(pwd);
						$("#iflogin").val(1);
						$("form").submit();
						$("#formnote").text("注册成功。");

					}
				} else {
					$("#formnote").html(
							"<span style='color:red;'>请将信息填写完整。</span>");
				}
				return false;
			});
</script>
<script type="text/javascript" src="js/register.js"></script>

</html>
