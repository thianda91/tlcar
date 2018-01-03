/**
 * used in detail。jsp
 * 
 * @Author XDa
 */

{

	// 打印派车单 按钮
	$("#printform").bind(
			"click",
			function() {
				// 作用：使打印内容占满纸张页面。不使用则打印出来字体小。
				$("#detialcenter").html($("#detailform").html());
				var htmlstr = "<a class='noprint' id='return_detail'"
						+ " href='javascript:history.go(0)'>打印结束，点此返回</a>";
				$("#detialcenter").append(htmlstr);
				// window.print();
				wb.execwb(7, 1);
				var go = setTimeout('window.history.go(0)', 500);
				return false;
			});
	// 初始化option内容
	var ddatenow = new Date();
	var dyear = ddatenow.getFullYear(); // 获取完整年份(4位)
	var dmonth = ddatenow.getMonth() + 1; // 获取月份 (0-11)
	var ddate = ddatenow.getDate(); // 获取当前日 (1-31)
	var datestr = dyear + "-" + dmonth + "-" + ddate + " ";
	var qx = $("#userqx").text();// 获取当前用户权限
	var name = $('.hello b').text();
	name = name.substr(3, 4);// 截取 当前用户姓名/取1个逗号+3个字符
	if ($("#acondition").text() == 9||$("#acondition").text() == 11) {
		$("#appoption").css("color", "red");
	}
	if ($("#acondition").text() < 5) {// 未派车状态
		var appid = $("h2 span").text();// 获取 appid
		// var openstyle1="height=100,width=400,toolbar=no,menubar=no,";
		// var openstyle2="srollbars=no,resizable=no,location=no,status=no";
		var dealok = "保存完毕,请<a href='manager.jsp'>返回</a>。"
				+ "或<a href='javascript:history.go(0)'>重新操作</a>。";
		if (4 == qx) {
			$("#cancelApply").parent().show();
			$("#cancelApply").click(
					function() {
						var openurl0 = "cancelapply.do?appid=" + appid
								+ "&username="+name+"&time=" + datestr+$("#time").text();
						var openurl = encodeURI(openurl0);
						// window.open(openurl,"newtab",openstyle1+openstyle2);
						$("#handle_result").load(openurl);
						$("#cancelresponse").html("撤销成功,请<a href='browse.jsp'>返回</a>。").show();
						$("#cancelApply").parent().hide();
						return false;
						// go_back(2000);

					});
		}

		if (1 == qx) {// 车辆管理
			// $("#appoption").removeAttr("disabled");
			// $("#appoption").attr("readonly", "readonly");
			$("#driverinfo").parent().parent().hide();
			$("#manage1").parent().show();
			// $("#manage1").append(
			// " <input type='button' id='agree1' value='同意' disabled> ");
			// $("#manage1").append(
			// " <input type='button' id='refuse1' value='无车'>");
			// $("#manage1").append(" <span id='response1' ></span>");
			$("#selectcno").change(function() {
				var inval = $("#selectcno option:selected").val();
				$("#selectdri").val(inval);
				$("#agree1").removeAttr("disabled");
			});
			// 自定义拒绝理由填写 函数
			function myrefuseitself() {
				$("#refuse0").click(
						function() {
							if ($("#myrefuse").val() == "") {
								$("#appoption").val("无条件拒绝。");
							} else {
								var aoptn = $("#myrefuse").val() + "。";
								$("#appoption").val(aoptn);
							}
							$("#refuse1").css("display", "none");
							$("#appoption").css("color", "red");
							var appoption = $("#appoption").val();
							// 执行 update 数据
							var openurl0 = "handle.do?appid=" + appid
									+ "&mflag=0" + "&myoption=" + appoption;
							var openurl = encodeURI(openurl0);
							$("#handle_result").load(openurl);
							$("#response1").html(dealok);
							// go_back(2000);
						});
			}
			$("#agree1").click(
					function() {
						// 同意派车
						$("#agree1").attr("disabled", true);
						$("#refuse1").css("display", "none");
						var time = $("#time").text();
						$("#appoption").val("同意。 " + datestr + time + name);
						// $("#appoption").attr("disabled", "true");
						var appoption = $("#appoption").val();
						var carid = $("#selectcno option:selected").attr(
								"value");
						var driid = $("#selectdri option:selected").attr(
								"value");
						// 执行 update 数据

						var openurl0 = "handle.do?appid=" + appid + "&mflag=1"
								+ "&myoption=" + appoption + "&carid=" + carid
								+ "&driid=" + driid;
						var openurl = encodeURI(openurl0);
						// window.open(openurl,"newtab",openstyle1+openstyle2);
						$("#handle_result").load(openurl);
						$("#response1").html(dealok);
						// go_back(2000);
					});
			$("#refuse1").bind(
					"change",
					function() {
						// 无车
						if ($("#refuse1 option:selected").val() == "0") {
							$("#refuse0").parent().parent().css("visibility",
									"visible");
							// 自定义拒绝理由
							myrefuseitself();
						} else {
							$("#agree1").attr("disabled", true);
							$("#refuse1").css("display", "none");
							var time = $("#time").text();
							$("#appoption").css("color", "red");
							$("#appoption").val(
									$("#refuse1 option:selected").val() + "。");
							// $("#appoption").attr("disabled",
							// "true");
							var appoption = $("#appoption").val();
							// 执行 update 数据
							var openurl0 = "handle.do?appid=" + appid
									+ "&mflag=0" + "&myoption=" + appoption;
							var openurl = encodeURI(openurl0);
							// window.open(openurl,"newtab",openstyle1+openstyle2);
							$("#handle_result").load(openurl);
							$("#response1").html(dealok);
							// go_back(2000);
						}

					});

		}
		if ($("#acondition").text() == 2 || $("#acondition").text() == 3) {
			if (2 == qx && $("#curuname").text() == "xzsw") {
				// 部门领导 或 行政事务
				// $("#comoption").removeAttr("disabled");
				// $("#comoption").attr("readonly", "readonly");
				$("#agree2").parent().show();
				var depflag = $("#acondition").text();// 当前的 acondition
				$("#agree2")
						.click(
								function() {
									// 行政事务同意
									var depflag = $("#acondition").text();
									var time = $("#time").text();
									$("#comoption").val(
											"同意。 " + datestr + time + name);
									// $("#comoption").attr("disabled", "true");
									var comoption = $("#comoption").val();
									// 执行 update 数据
									var openurl0 = "handle.do?appid=" + appid
											+ "&mflag=1" + "&myoption="
											+ comoption + "&ifxzsw=yes";
									var openurl = encodeURI(openurl0);
									// window.open(openurl,"newtab",openstyle1+openstyle2);
									// $("#handle_result").load(openurl);
									$("#handle_result").load(openurl);
									$("#agree2").parent().hide();
									$("#response2").show();
									$("#response2").html(dealok);
									// go_back(2000);
									return false;
								});
				$("#refuse2")
						.click(
								function() {
									// 行政事务拒绝
									var time = $("#time").text();
									$("#comoption").val(
											"拒绝。 " + datestr + time + name);
									// $("#comoption").attr("disabled", "true");
									var comoption = $("#comoption").val();
									// 执行 update 数据
									var openurl0 = "handle.do?appid=" + appid
											+ "&mflag=0" + "&myoption="
											+ comoption + "&ifxzsw=yes";
									var openurl = encodeURI(openurl0);
									// window.open(openurl,"newtab",openstyle1+openstyle2);
									$("#handle_result").load(openurl);
									$("#agree2").parent().hide();
									$("#response2").show();
									$("#response2").html(dealok);
									// go_back(2000);
									return false;
								});
			}
		}
		if ($("#acondition").text() < 2) {
			if (2 == qx && $("#curuname").text() != "xzsw") {
				// 部门领导 或 行政事务
				// $("#depoption2").removeAttr("disabled");
				// $("#depoption2").attr("readonly", "readonly");
				$("#agree22").parent().show();
				var depflag = $("#acondition").text();// 当前的 acondition
				$("#agree22").click(
						function() {
							// 部门领导同意
							var depflag = $("#acondition").text();
							var time = $("#time").text();
							$("#depoption2")
									.val("同意。 " + datestr + time + name);
							var depoption2 = $("#depoption2").val();
							$("#depoption2").attr("disabled", "true");
							// var depoption2 = $("#depoption2").val();
							// 执行 update 数据
							var openurl0 = "handle.do?appid=" + appid
									+ "&mflag=1" + "&myoption=" + depoption2
									+ "&depflag=" + depflag + "&ifxzsw=no";
							var openurl = encodeURI(openurl0);
							// window.open(openurl,"newtab",openstyle1+openstyle2);
							// $("#handle_result").load(openurl);
							$("#handle_result").load(openurl);
							$("#agree22").parent().hide();
							$("#response22").show();
							$("#response22").html(dealok);
							// go_back(2000);
							return false;
						});
				$("#refuse2").click(
						function() {
							// 部门领导拒绝
							var time = $("#time").text();
							$("#depoption2")
									.val("拒绝。 " + datestr + time + name);
							// $("#depoption2").attr("disabled",
							// "true");
							var depoption2 = $("#depoption2").val();
							// 执行 update 数据
							var openurl0 = "handle.do?appid=" + appid
									+ "&mflag=0" + "&myoption=" + depoption2
									+ "&depflag=" + depflag + "&ifxzsw=no";
							var openurl = encodeURI(openurl0);
							// window.open(openurl,"newtab",openstyle1+openstyle2);
							$("#handle_result").load(openurl);
							$("#agree22").parent().hide();
							$("#response22").show();
							$("#response22").html(dealok);
							// go_back(2000);
							return false;
						});
			}
		}
		if ($("#acondition").text() == 0) {
			if (3 == qx) {
				// 中心领导
				// $("#depoption").removeAttr("disabled");
				// $("#depoption").attr("readonly", "readonly");
				$("#agree3").parent().show();
				$("#agree3")
						.click(
								function() {
									// 中心领导同意
									var time = $("#time").text();
									$("#depoption").val(
											"同意。 " + datestr + time + name);
									// $("#depoption").attr("disabled", "true");
									var depoption = $("#depoption").val();
									// 执行 update 数据
									var openurl0 = "handle.do?appid=" + appid
											+ "&mflag=1" + "&myoption="
											+ depoption;
									var openurl = encodeURI(openurl0);
									// window.open(openurl,"newtab",openstyle1+openstyle2);
									$("#handle_result").load(openurl);
									$("#agree3").parent().hide();
									$("#response3").show();
									$("#response3").html(dealok);
									// //go_back(2000);
									return false;
								});
				$("#refuse3")
						.click(
								function() {
									// 中心领导拒绝
									var time = $("#time").text();
									$("#depoption").val(
											"拒绝。 " + datestr + time + name);
									// $("#depoption").attr("disabled", "true");
									var depoption = $("#depoption").val();
									// 执行 update 数据
									var openurl0 = "handle.do?appid=" + appid
											+ "&mflag=0" + "&myoption="
											+ depoption;
									var openurl = encodeURI(openurl0);
									// window.open(openurl,"newtab",openstyle1+openstyle2);
									$("#handle_result").load(openurl);
									$("#agree3").parent().hide();
									$("#response3").show();
									$("#response3").html(dealok);
									// go_back(2000);
									return false;
								});
			}
		}
	}
	function go_back(timerr) {
		setTimeout("location.href='manager.jsp'", timerr);
	}
	;
};