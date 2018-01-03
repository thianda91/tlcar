<%@page import="com.yxd.obj.Uusers"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>tlydgs派车系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content=no-cache http-equiv=Pragma>
<meta content=no-cache http-equiv=Cache-Control>
<meta content=0 http-equiv=Expires>

<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/iconfont1.css">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/time.js"></script>
<script type="text/javascript" src="js/md5-min.js"></script>

</head>

<body>

	<div align="center">
		<div class="title-bg clearfix">
			<div class="logoo"></div>
			<div class="titlee">
				tlydgs派车系统 <a id="showversion" href="javascript:void(0)"><big>V</big>1.88<span>更新历史</span>
				</a>
			</div>
		</div>
		<div class="link-center-con">
			<div align="left" id="index_nav" class='nav iconfont1'></div>
			<form method="post" action="Welcome" id="form1">
				<table align="center" cellspacing="5" cellpadding="1" id="tab1"
					border="0">
					<tr>
						<td colspan="2" class="renzheng">派车系统登录平台</td>
					</tr>
					<tr class="input">
						<th>用户：</th>
						<td><input type="text" id="user" name="user"
							class="logininnput" maxlength=20>
						</td>
					</tr>
					<tr style="width: 320px;">
						<td></td>
						<td><a class="forget-pwd"
							onmousemove="c$.mmove(this,'初始密码为Qq_0247asdf，忘记密码请联系派车人员修改.')"
							onmouseout="c$.mout();" href="javascript:void(0)" tabindex="-1">忘记密码</a>
						</td>
					</tr>
					<tr class="input">
						<th>密码：</th>
						<td><input type="password" id="pwd" name="pwd"
							class="logininnput" style="ime-mode:disabled" maxlength=32
							onmousemove="c$.mmove(this,'用户名为姓名的拼音或者姓名的汉字，初始密码均为Qq_0247asdf，登录后可修改。')"
							onmouseout="c$.mout();">
						</td>
					</tr>
					<tr>
						<td colspan="2"><span class='ifcookiepwd'><input
								id="ifcookiepwd" type="checkbox">记住密码</span><span class="tem"><a
								id="xuzhi" href="javascript:void(0)"
								onmousemove="c$.mmove(this,'遇到问题？请咨询 610671')"
								onmouseout="c$.mout();">使用需知</a> </span></td>
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
							</div></td>
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
								onmousedown="this.className='login-btnhover'"> </span>
						</td>
					</tr>
					<!--  -->
				</table>
				<span id="time"></span>

				<div id="ifwritepwd"></div>

			</form>
			<div id="gotoregisterbg" class="gotoregisterbg"
				onmousemove="c$.mmove(this,'无法登陆提示用户不存在的，自己注册账户即可。')"
				onmouseout="c$.mout();">
				<a>免费注册</a>
				<!-- <div id="gotoregister" class="gotoregister"></div> -->
			</div>
			<div id="firefox_tip" style="">
				<br> 火狐浏览器<br>无法登陆本系统<br>请使用IE或谷歌浏览器<br>
			</div>
		</div>
		<div
			style="font-size: 12px; font-family: Arial; margin-top: 50px; width: 480px;">
			版权所有&nbsp;&copy;&nbsp;2015-<span id="thisyear"></span>&nbsp;XDa
		</div>
	</div>
	<div id="strongpwd"
		style="display:none; font-size:14px; color:#03f; text-align: left; padding: 10px 30px;">
		<h3>根据省公司“撞库攻击”风险防控整改要求，已对派车系统进行安全加固。</h3>
		<p>本次安全加固,系统升级为V1.88，版本历史可点击页面上方更新历史查看，具体措施包括：</p>
		<p>
			1.密码长度最小8字符<br>
			2.密码组合要求：必须是字母大写，字母小写，数字，特殊字符中任意三个组合<br>
			3.首次登陆必须修改密码<br>
			4.密码采用md5加密传输，服务器保存的是md5加密后的密码，非明文。<br>
		</p>
		<p style="font-size:12px;color:#666;">
			忘记密码可以进行重置，方法如下：由派车人（初少军）登陆后进入【系统管理】，找到对应用户后【单击查看】用户信息，点击【密码重置】即可恢复为原始密码。<br><br>
			现在的初始密码为 <span style="color: #000; font-size: 14px; font-weight: 700;">Qq_0247asdf</span>，请在登陆后立即修改。
		</p>
		<p style="text-align: right;">XDa<br>2016-8-8</p>
		<p style="text-align: center;">	
			<span>
				<span><input id="strongpwd_read" type="checkbox">&nbsp;不再显示</span><br>
				<span style="color:#000;font-size:12px;">点击忘记密码可再次显示</span>
			</span>
		</p>
	</div>
</body>

<script type="text/javascript">
	{
		$(function($) {//自动弹出密码强度提示
			if (getCookies("tlcar_strongpwd") == "read")
				$("#strongpwd_read").attr("checked", "checked");
			else
				$(".forget-pwd").click();
		});

		var isFirefox = navigator.userAgent.toUpperCase().indexOf("FIREFOX") > 0 ? true
				: false;//是否是火狐浏览器
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
		$(".forget-pwd").click(function() {
			// 忘记密码弹出窗
			$.getScript("zDrag.js", function() {
				$.getScript("zDialog.js", function() {
					var diag = new Dialog();
					diag.Title = '公告';
					diag.Width = 650;
					diag.Height = 400;
					diag.InvokeElementId = "strongpwd";
					diag.OKEvent = function() {
						if ($("#strongpwd_read").is(":checked"))
							setCookies("tlcar_strongpwd", "read", 30);
						else
							setCookies("tlcar_strongpwd", "", -1);
						diag.close();
					};
					diag.show();
				});
			});
			return false;
		});
		startTime();
		$("#index_nav").load("index_nav.htm");
		if (isFirefox) {
			$("#gotoregisterbg").remove();
			$("#firefox_tip").show();
		} else {
			$("form").submit(function() {
				if ($("#user").val() == "") {
					$("#tips").text("亲，你为什么不填写用户名呢？");
					return false;
				} else if ($("#pwd").val() == "") {
					$("#tips").text("密码不能为空！");
					return false;
				} else if (!isFirefox) {
					setCookies("tlcarname", $("#user").val(), 30);
					if ($("#ifcookiepwd").is(":checked")) {
						setCookies("tlcarpwd", $("#pwd").val(), 30);
						setCookies("tlcarifcookiepwd", "yes", 30);
					} else {//清除pwd的cookie
						setCookies("tlcarpwd", "", -1);
						setCookies("tlcarifcookiepwd", "", -1);
					}
					var arg = hex_md5($("#pwd").val());
					$("#pwd").val(arg);
					$("#tips").text("正在为您登陆，请稍后。");
					return true;
				}
			});
		}
		$("#user").val(getCookies("tlcarname"));
		if (getCookies("tlcarifcookiepwd") == "yes") {
			$("#ifcookiepwd").attr("checked", "checked");
			$("#pwd").val(getCookies("tlcarpwd"));
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
</script>
</html>