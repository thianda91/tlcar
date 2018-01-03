{

	var userqx = $("#userqx").text();
	// userqx = parseInt(userqx);
	if (4 > userqx) {
		$("#manage_menu").show();
		$("#user_menu").remove();
	} else {
		$("#user_menu").show();
		$("#manage_menu").remove();
	}
	$("#userapp1").click(function() {
		location.href = "/TLCAR/apply.jsp";
		return false;
	});
	$("#userapp2").click(function() {
		location.href = "/TLCAR/apply.jsp";
		return false;
	});
	$("#userview").click(function() {
		window.location.href = "/TLCAR/browse.jsp";
		return false;
	});
	$("#userinfo1").click(function() {
		window.location.href = "/TLCAR/userinfo.jsp";
		return false;
	});
	$("#userinfo2").click(function() {
		window.location.href = "/TLCAR/userinfo.jsp";
		return false;
	});
	$("#apptodo").click(function() {
		window.location.href = "/TLCAR/manager.jsp";
		return false;
	});
	$("#appdone").click(function() {
		window.location.href = "/TLCAR/manager.jsp?tab=1";

		return false;
	});
	if ($("#tabflag").text() != "null") {
		// thisurl = "javascript:void(0)";
		$("#appdone").addClass("active");
		$("#apptodo").removeClass("active");
		$("#todo").hide();
		$("#done").show();
	}

	if (1 < userqx) {
		$("#sysmanage").click(
				function() {
					$("#sysmanage").html("<a style='color:red;'>您无权管理</a>");
					setTimeout("renew()", 1000);
					return false;
				});
	} else {
		$("#sysmanage").click(function() {
			window.location.href = "/TLCAR/admin/sysmanage.jsp";
			return false;
		});
	}
	function renew(){
		$('#sysmanage').html("<a href='javascript:void(0)'>系统管理</a>");
	}
}