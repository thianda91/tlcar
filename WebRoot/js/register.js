/**
 * used in admin/table_index.jsp AND register.jsp
 * 
 * @Author XDa
 * 
 */
$("td input").css("border", "1px black solid");

$("#uloginname").bind("keyup", function() {
	if (/[\W]/g.test(this.value)) {
		this.value = this.value.replace(/[\W]/g, '');
		$("#uloginnameerr").html("<span style='color:red;'>登录名不能为汉字</span>");
		this.focus();
		submitflag = false;
	} else if ($("#uloginnameerr").text().length > 5) {
		this.focus();
		submitflag = false;
	} else {
		$("#uloginnameerr").text("ok");
		submitflag = true;
	}
});
$("#uloginname").bind("blur", function() {

	if (this.value == "") {
		$("#uloginnameerr").html("<span style='color:red;'>登录名不能为空</span>");
		submitflag = false;
	} else {
		var uloginname = $("#uloginname").val();
		$("#uloginnameerr").load("if_it_has_uname.do", {
			uloginname : uloginname
		}, function() {
			if ($("#uloginnameerr").text().length < 5) {
				// 文字长度小于5，则 为 "可注册。"
				$("#uloginnameerr").css("color", "green");
				$("#uloginname").css("border", "1px black solid");
				// $("#uloginname").css("background-color","inherit");
				submitflag = true;
			} else {
				$("#uloginname").select();
				$("#uloginname").css("border", "1px red dashed");
				$("#uloginnameerr").css("color", "red");
				// document.getElementById("uloginname").style.backgroundColor="#0080f0";
				submitflag = false;
			}
		});

	}
});
$("#uname").bind("blur", function() {
	if (this.value == "") {
		$("#unameerr").html("<span style='color:red;'>姓名不能为空</span>");
		submitflag = false;
	} else {
		$("#unameerr").text("ok");
		submitflag = true;
	}
});
$("#uoffice").bind("blur", function() {
	if (this.value == "") {
		$("#uofficeerr").html("<span style='color:red;'>公司名不能为空</span>");
		submitflag = false;
	} else {
		$("#uofficeerr").text("ok");
		submitflag = true;
	}
});
$("#udept").bind("blur", function() {
	if (this.value == "") {
		$("#udepterr").html("<span style='color:red;'>中心不能为空</span>");
		submitflag = false;
	} else {
		$("#udepterr").text("ok");
		submitflag = true;
	}
});
$("#udept2").bind("blur", function() {
	if (this.value == "") {
		$("#udept2err").html("<span style='color:red;'>部门不能为空</span>");
		submitflag = false;
	} else {
		$("#udept2err").text("ok");
		submitflag = true;
	}
});

$("#uphoneno").bind("keyup", function() {
	if (/\D/g.test(this.value)) {
		this.value = this.value.replace(/\D/g, '');
		$("#uphonenoerr").html("<span style='color:red;'>只能输入数字</span>");
		submitflag = false;
	}
});
$("#uphoneno").bind("blur", function() {
	if (this.value == "") {
		$("#uphonenoerr").html("<span style='color:red;'>电话号不能为空</span>");
		submitflag = false;
	} else if (this.value.length < 11) {
		$("#uphonenoerr").html("<span style='color:red;'>手机号需11位。</span>");
		this.focus();
		submitflag = false;
	} else {
		$("#uphonenoerr").text("ok");
		submitflag = true;
	}
});
$("#uvphone").bind("keyup", function() {
	if (/\D/g.test(this.value)) {
		this.value = this.value.replace(/\D/g, '');
		$("#uvphoneerr").html("<span style='color:red;'>只能输入数字</span>");
		submitflag = false;
	}
});
$("#uvphone").bind("blur", function() {
	if (this.value == "") {
		$("#uvphoneerr").html("<span style='color:red;'>小号不能为空</span>");
		submitflag = false;
	} else if (this.value.length < 5) {
		$("#uvphoneerr").html("<span style='color:red;'>小号位数不够。</span>");
		this.focus();
		submitflag = false;
	} else {
		$("#uvphoneerr").text("ok");
		submitflag = true;
	}
});