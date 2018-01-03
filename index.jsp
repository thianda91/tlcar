<%@page import="com.yxd.obj.Uusers"%>
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

<title>tlydgs派车系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content=no-cache http-equiv=Pragma>
<meta content=no-cache http-equiv=Cache-Control>
<meta content=0 http-equiv=Expires>

<link rel="stylesheet" type="text/css" href="css/index.css?v=11">
<link rel="stylesheet" type="text/css" href="css/iconfont1.css">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/time.js"></script>
<script type="text/javascript" src="js/md5-min.js"></script>

</head>

<body onload="startTime()">

	<div align="center">
		<div class="title-bg clearfix">
			<div class="logoo"></div>
			<div class="titlee">
				tlydgs派车系统 <a id="showversion" href="javascript:void(0)"><big>V</big>1.8<span>更新历史</span>
				</a>
			</div>
		</div>
		<div class="link-center-con">
			<div align="left" class='nav iconfont1'>
				<span>友情链接&nbsp;<i>&#xf003e;</i> </span>
				<ul>
					<li onmousemove="c$.mmove(this,'电脑故障自助修复，常用软件下载等。');"
						onmouseout="c$.mout();">&#xf0064;<a href='/TLHELP'>tlydgs自助服务平台<span
							style="font-size:12px;color:red;">(建设中)</span> </a></li>
					<li onmousemove="c$.mmove(this,'Shared Files');"
						onmouseout="c$.mout();">&#xf0064;<a
						href='http://10.61.214.71:8081/share'>Shared Files</a></li>
					<li onmousemove="c$.mmove(this,'attachments');" onmouseout="c$.mout();">&#xf0064;<a
						href='http://10.61.214.71:8081/attachments'>附件文件</a></li>
				</ul>
			</div>
			<form method="post" action="Welcome" id="form1">
				<table align="center" cellspacing="5" cellpadding="1" id="tab1"
					border="0">
					<tr>
						<td colspan="2" class="renzheng">派车系统登录平台</td>
					</tr>
					<tr class="input">
						<th>用户：</th>
						<td><input type="text" id="user" name="user"
							class="logininnput" maxlength=20></td>
					</tr>
					<tr style="width: 320px;">
						<td colspan="2"><a class="forget-pwd"
							onmousemove="c$.mmove(this,'初始密码为111111，忘记密码请联系派车人员修改.')"
							onmouseout="c$.mout();" href="javascript:void(0)">忘记密码</a></td>
					</tr>
					<tr class="input">
						<th>密码：</th>
						<td><input type="password" id="pwd" name="pwd"
							class="logininnput" style="ime-mode:disabled" maxlength=32
							onmousemove="c$.mmove(this,'用户名为姓名的拼音或者姓名的汉字，初始密码均为111111，登录后可修改。')"
							onmouseout="c$.mout();"></td>
					</tr>
					<tr>
						<td colspan="2"><span class='ifcookiepwd'><input
								id="ifcookiepwd" type="checkbox">记住密码</span><span class="tem"><a
								id="xuzhi" href="javascript:void(0)" style="color: #e55;"
								onmousemove="c$.mmove(this,'遇到问题？请咨询 610173')"
								onmouseout="c$.mout();">使用需知</a> </span>
						</td>
					</tr>
					<%
						String tips = (String) session.getAttribute("msg");
						if (tips == null)
							tips = " ";
						else
							session.removeAttribute("msg");
					%>
					<tr>
						<td colspan="2"><div id="tips">
								&nbsp;<%=tips%>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><span class="outbg"> <input
								value="重置" type="reset" class=login-btn
								onmouseover="this.className='login-btnhover'"
								onmouseout="this.className='login-btn'"
								onmousedown="this.className='login-btn'"> </span>&nbsp;&nbsp; <span
							class="outbg"> <input id="submitt" type="submit"
								value="登录" class="login-btnhover"
								onmouseover="this.className='login-btn'"
								onmouseout="this.className='login-btnhover'"
								onmousedown="this.className='login-btnhover'"> </span></td>
					</tr>
					<!--  -->
				</table>
				<span id="time"></span>

				<div id="ifwritepwd"></div>

			</form>
			<div id="gotoregisterbg" class="gotoregisterbg">
				<a>免费注册</a>
				<!-- <div id="gotoregister" class="gotoregister"></div> -->
			</div>

		</div>
		<div
			style="font-size: 12px; font-family: Arial; margin-top: 50px; width: 480px;">
			版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;XDa
		</div>
	</div>

</body>

<script type="text/javascript">
	{
		$("#user").val(getCookies("tlcarname"));
		if (getCookies("tlcarifcookiepwd") == "yes") {
			$("#ifcookiepwd").attr("checked", "checked");
			$("#pwd").val(getCookies("tlcarpwd"));
		}
		//////////
		$("#thisyear").text(new Date().getFullYear());//获取版权处今年年份
		$("#gotoregisterbg").bind("click", function() {//注册按钮
			window.location.href = "register.jsp";
		});
		var itop = (window.screen.availHeight - 30 - 500) / 2;
		var ileft = (window.screen.availWidth - 30 - 600) / 2;
		var openstyle1 = "height=500,width=600,top=" + itop + ",left=" + ileft
				+ ",toolbar=no,menubar=no,";
		var openstyle2 = "srollbars=no,resizable=no,location=no,status=no";
		$("#xuzhi").bind("click", function() {
			//var openurl = "/TLCAR/xuzhi.html";
			//window.open(openurl, "newtab", openstyle1 + openstyle2);
			$.getScript("zDrag.js", function() {
				$.getScript("zDialog.js", function() {
					var diag = new Dialog();
					diag.Width = 540;
					diag.Height = 400;
					diag.URL = "/TLCAR/xuzhi.html";
					diag.OKEvent = function() {
						diag.close();
					};
					diag.show();
				});
			});

			return false;
		});
		$("#showversion").click(function() {
			//var openurl = "update_history.html";
			//window.open(openurl, "newtab", openstyle1 + openstyle2);
			$.getScript("zDrag.js", function() {
				$.getScript("zDialog.js", function() {
					var diag = new Dialog();
					diag.Width = 600;
					diag.Height = 500;
					diag.URL = "update_history.html";
					diag.show();
				});
			});
			return false;
		});
		$("form").submit(function() {
			if ($("#user").val() == "") {
				$("#tips").text("亲，你为什么不填写用户名呢？");
				return false;
			} else if ($("#pwd").val() == "") {
				$("#tips").text("密码不能为空！");
				return false;
			} else {
				setCookies("tlcarname", $("#user").val(), 30);
				if ($("#ifcookiepwd").is(":checked")) {
					setCookies("tlcarpwd", $("#pwd").val(), 30);
					setCookies("tlcarifcookiepwd", "yes", 30);
				} else {//清除pwd的cookie
					setCookies("tlcarpwd", "", -1);
					setCookies("tlcarifcookiepwd", "", -1);
				}
				///
				var arg = hex_md5($("#pwd").val());
				//if (confirm(arg)) {
				$("#pwd").val(arg);
				$("#tips").text("正在为您登陆，请稍后。");
				return true;
				//} else {
				//	$("#tips").text("您取消了登录");
				//		return false;
				//	}
			}
		});
		function setCookies(c_name, value, expiresdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + expiresdays);
			document.cookie = c_name + "=" + escape(value) + ";expires="
					+ exdate.toGMTString();
		}
		function getCookies(c_name) {

			if (document.cookie.length > 0) {
				c_start = document.cookie.indexOf(c_name + "=");
				if (c_start != -1) {
					c_start = c_start + c_name.length + 1;
					c_end = document.cookie.indexOf(";", c_start);
					if (c_end == -1)
						c_end = document.cookie.length;
					return unescape(document.cookie.substring(c_start, c_end));
				}
			}
			return "";
		}
	}
	//***随鼠标动提示框
	var c$ = {};
	var w$ = function(s) {
		document.write(s);
	};
	var o$ = function(id) {
		return document.getElementById(id);
	};
	w$("<div id=\"tlts\" style=\"position:absolute;color:#0000ff;background-color:#FFFFE6;font-size: 12px;padding: 3px; border: 1px solid #FFCC99;display:none\"></div>");

	c$.mmove = function(o, s) {
		// alert(typeof(s));
		var evt = event || window.event;
		if (s == "" || typeof (s) == "undefined") {
			o$("tlts").innerHTML = o.innerHTML;
		} else {
			o$("tlts").innerHTML = s;
		}
		var x = evt.clientX - o$("tlts").offsetWidth / 2;
		var y = evt.clientY + 20;
		o$("tlts").style.left = x + "px";
		o$("tlts").style.top = y + "px";
		o$("tlts").style.display = "";
	};
	c$.mout = function() {
		o$("tlts").style.display = "none";
	};
	//***随鼠标动提示框
</script>

</html>
