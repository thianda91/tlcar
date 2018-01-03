/**
 * Used in /admin/table_index.jsp
 * 
 * @author Xianda
 * 
 */

{
	$("#submitcar").click(function() {

	});
	$(".numcheck").bind("keyup", function() {
		if (/\D/g.test(this.value)) {
			this.value = this.value.replace(/\D/g, '');
		}
	});
	/** ************************************* */
	if ($("#userindex span").text() == "稍等") {
		$("#userindex div")
				.load(
						"userinfo.jsp?from=admin form",
						function() {
							$.getScript("js/userinfo.js");
							$("#updateinfo")
									.parent()
									.after(
											"<th colspan='2'><input type='button' id='resetpwd' value='密码重置'></th>");
							$("#resetpwd")
									.bind(
											"click",
											function() {
												var uuid = $("#uuid").val();
												// 执行重置密码
												if (confirm("确定重置登录密码？")) {
													$("#note").load(
															"resetpwd.do?uuid="
																	+ uuid);
												} else {
													$("#note").text("已取消操作");
												}
												return false;
											});
						});
	}
	/*
	 * if ($("#userindex").text() == "yes") { // 检测 user form 是否显示 alert("user
	 * form 是否显示"); $("#uloginname").bind("keyup", function() { if
	 * (/[\W]/g.test(this.value)) { this.value = this.value.replace(/[\W]/g,
	 * ''); $("#uloginnameerr").text("登录名不能为汉字"); } else
	 * $("#uloginnameerr").text("ok"); }); $("#uphoneno").bind("keyup",
	 * function() { if (/\D/g.test(this.value)) { this.value =
	 * this.value.replace(/\D/g, ''); $("#uphonenoerr").text("只能输入数字"); } else
	 * $("#uphonenoerr").text("ok"); }); $("#uvphone").bind("keyup", function() {
	 * if (/\D/g.test(this.value)) { this.value = this.value.replace(/\D/g, '');
	 * $("#uvphoneerr").text("只能输入数字"); } else $("#uvphoneerr").text("ok"); });
	 * 
	 * $("#usersubmit").bind("click", function() { if ($("#uloginname").val() ==
	 * "") { $("#uloginnameerr").text("登录名不能为空"); $("#uloginname").focus(); }
	 * else if ($("#udept").val() == "") { $("#udepterr").text("请填写所在部门");
	 * $("#udept").focus(); } else if ($("#uphoneno").val() == "") {
	 * $("#uphonenoerr").text("请填写手机号"); $("#uphoneno").focus(); } else if
	 * ($("#uvphone").val() == "") { $("#uvphoneerr").text("请填写V网小号");
	 * $("#uvphone").focus(); } else if ($("#newpwd1").val() == "") {
	 * $("#pwdtip").text("新密码不能为空"); $("#newpwd1").focus(); } else if
	 * ($("#newpwd2").val() == "") { $("#pwdtip").text("请再次确认新密码");
	 * $("#newpwd2").focus(); } else if ($("#newpwd1").val().length < 5) {
	 * $("#pwdtip").text("新密码长度至少6位。"); $("#newpwd1").select(); } else if
	 * ($("#newpwd1").val() != $("#newpwd2").val()) {
	 * $("#pwdtip").text("两次密码不一致。"); $("#newpwd2").select(); } else { var arg =
	 * hex_md5($("#newpwd1").val());
	 * 
	 * $("#note").text("正在处理，请稍后。"); if (confirm("
	 * 若修改后登录名没有变则表示此登录名已使用，\n请重新修改。")) { $("#fromurl").val(location.href);
	 * 
	 * $("#newpwd1").val(arg); $("#fromurl").val(location.href); return true; } }
	 * return false; }); }
	 */
	$("#usersubmit").bind("click", function() {
		
		if (submitflag) 
			return true;
		else
			return false;
	});

	// $("input[name='closethis']").bind("click", function() {
	// alert("关闭");
	// // window.close();
	// return false;
	// });

	/**
	 * 获取url ? 传参
	 */
	function getUrlParams() {
		var url = location.search;
		var params = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");
			for ( var i = 0; i < strs.length; i++) {
				params[strs[i].split("=")[0]] = strs[i].split("=")[1];
			}
		}
		return params;
	}
	var urlsearch = getUrlParams();
	// 显示关闭窗口
	var msg = urlsearch.msg;
	$("#" + msg).show();
}
