/**
 * used in userinfo.jsp
 * 
 * @Author XDa
 */
{

	// ***************
	$("#updateinfo").click(function() {
		$("#udept").removeAttr("disabled");
		$("#udept").css("background-color", "lightgreen");
		$("#udept2").removeAttr("disabled");
		$("#udept2").css("background-color", "lightgreen");
		$("#uoffice").removeAttr("disabled");
		$("#uoffice").css("background-color", "lightgreen");
		$("#uphoneno").removeAttr("disabled");
		$("#uphoneno").css("background-color", "lightgreen");
		$("#uvphone").removeAttr("disabled");
		$("#uvphone").css("background-color", "lightgreen");
		// $("#uname").removeAttr("disabled");
		// $("#uname").css("background-color","lightgreen");
		$("#uloginname").removeAttr("disabled");
		$("#uloginname").css("background-color", "lightgreen");
		$("#modifypwd").hide();
		$("#updateinfo").parent().parent().hide();
		$("#infobotton").show();
		$("#uloginname").select();

		$("#uloginname").bind("keyup", function() {
			if (/[\W]/g.test(this.value)) {
				this.value = this.value.replace(/[\W]/g, '');
				$("#uloginnameerr").text("登录名不能为汉字");
			} else
				$("#uloginnameerr").text("ok");
		});
		$("#uphoneno").bind("keyup", function() {
			if (/\D/g.test(this.value)) {
				this.value = this.value.replace(/\D/g, '');
				$("#uphonenoerr").text("只能输入数字");
			} else
				$("#uphonenoerr").text("ok");
		});
		$("#uvphone").bind("keyup", function() {
			if (/\D/g.test(this.value)) {
				this.value = this.value.replace(/\D/g, '');
				$("#uvphoneerr").text("只能输入数字");
			} else
				$("#uvphoneerr").text("ok");
		});
		return false;
	});
	$("#infosubmit").click(function() {
		if ($("#uloginname").val() == "") {
			$("#uloginnameerr").text("登录名不能为空");
			$("#uloginname").focus();
		} else if ($("#udept").val() == "") {
			$("#udepterr").text("请填写所在部门");
			$("#udept").focus();
		} else if ($("#uphoneno").val() == "") {
			$("#uphonenoerr").text("请填写手机号");
			$("#uphoneno").focus();
		} else if ($("#uvphone").val() == "") {
			$("#uvphoneerr").text("请填写V网小号");
			$("#uvphone").focus();
		} else {
			$("#note").text("正在修改，请稍后。");
			$("#r").val("info");
			alert("    若修改后登录名没有变则表示此登录名已使用，\n请重新修改。");
			$("#fromurl").val(location.href);
			return true;
		}
		return false;
	});
	$("#inforeset").click(function() {
		$("#pwdtip").text("已重置。");
		return true;
	});
	$("#modifypwd").click(function() {
		$("#infobotton").remove();
		$("#newpwd1").parent().parent().show();
		$("#newpwd1").parent().parent().prev().show();
		$("#newpwd2").parent().parent().show();
		$("#newpwd2").parent().parent().prev().show();
		$("#newpwd1").css("background-color", "lightgreen");
		$("#newpwd2").css("background-color", "lightgreen");
		$("#pwdbotton").show();
		$("#updateinfo").hide();
		$("#modifypwd").hide();
		$("form").css("height", "480px");
		$("#newpwd1").focus();
		return false;
	});
	$("#pwdsubmit").click(function() {
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
			$("#fromurl").val(location.href);
			return true;
		}
		return false;
	});
	$("#pwdreset").click(function() {
		$("#pwdtip").text("已重置。");
		return true;
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
}