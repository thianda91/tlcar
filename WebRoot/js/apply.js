/**
 * used in browse.jsp
 * 
 * @Author XDa
 */
{
	/*
	 * var date = new Date(); var begintime = date.getFullYear() + "-" +
	 * checkTime(date.getMonth()) + "-" + checkTime(date.getDate()) + " " +
	 * checkTime(date.getHours()) + ":" + checkTime(date.getMinutes()) + ":" +
	 * checkTime(date.getSeconds()); var endtime = date.getFullYear() + "-" +
	 * checkTime(date.getMonth()) + "-" + checkTime(date.getDate()) + " " +
	 * "16:00:00"; document.getElementById("begintime").value = begintime;
	 * document.getElementById("endtime").value = endtime;
	 */
	var cal = Calendar.setup({
		onSelect : function(cal) {
			cal.hide();
		},
		showTime : true
	});
	cal.manageFields("begintime", "begintime", "%Y-%m-%d %I:%M %p");
	cal.manageFields("endtime", "endtime", "%Y-%m-%d %I:%M %p");
	/*
	 * cal.manageFields("f_btn2", "f_date2", "%b %e, %Y %I:%M %p");
	 * cal.manageFields("f_btn3", "f_date3", "%e %B %Y %I:%M %p");
	 * cal.manageFields("f_btn4", "f_date4", "%A, %e %B, %Y %I:%M %p");
	 */
	$("#reason").bind("focus", function() {
		if (this.value == "(50字以内)")
			this.value = "";
	});
	// $("#beginpoint").keydown(function() {
	// if ($("#beginpoint").length > 20) {
	// $("#beginpoint").val($("#beginpoint").val().substr(0, 20));
	// }
	// })
	$("#reason").bind("keyup", function() {
		if (this.value.length > 50) {
			this.value = this.value.substr(0, 50);
		}
		$("#reasoncheck").text(this.value);
	});

	$("#appform")
			.submit(
					function() {
						var boolean = true;
						if ($("#range option:selected").val() > 1) {
							boolean = false;
							$("#rangeerr").text("去向将影响派车流程。↑请选择。");
						} else {
							$("#rangeerr").html("&nbsp;");
						}
						if ($("#begintime").val() == ""
								|| $("#endtime").val() == "") {
							boolean = false;
							$("#timeerr").text("出发、返回时间不能为空。");
						} else {
							// 12：00 AM 12：00 PM 替换成 01：00 AM 01：00 PM
							if ($("#begintime").val().substr(11, 2) == "12")
								// && $("#begintime").val().substr(17, 2) ==
								// "PM")
								$("#begintime").val(
										$("#begintime").val().replace(
												$("#begintime").val().substr(
														11, 5), "01:00"));
							if ($("#endtime").val().substr(11, 2) == "12")
								// && $("#endtime").val().substr(17, 2) == "PM")
								$("#endtime").val(
										$("#endtime").val().replace(
												$("#endtime").val().substr(11,
														5), "01:00"));

							// 判断日期
							var begindate = $("#begintime").val().substr(0, 10);
							var enddate = $("#endtime").val().substr(0, 10);
							if (enddate < begindate) {
								// 返回日期小于出发日期
								boolean = false;
								$("#timeerr").text("返回日期 不能早于 出发日期。");
							} else if (enddate == begindate) {
								// 出发返回是同一天的情况
								var beginh = $("#begintime").val()
										.substr(17, 2);
								var endh = $("#endtime").val().substr(17, 2);
								if (endh == "AM" && beginh == "PM") {
									// 出发是下午，返回是上午
									boolean = false;
									$("#timeerr").text("您打算下午出发然后穿越到上午回来？");
								} else if (endh == beginh) {
									// 出发返回为同时段
									// 时间的比较
									var begint = $("#begintime").val().substr(
											11, 5);
									var endt = $("#endtime").val()
											.substr(11, 5);
									if (endt <= begint) {
										boolean = false;
										$("#timeerr").text("返回时间需要晚于出发时间。");
									} else
										$("#timeerr")
												.html(
														"<span style='color:#0088ff;'>OK</span>");
								}
							} else
								// 返回日期时间大于出发
								$("#timeerr").html("&nbsp;");
						}
						if ($("#beginpoint").val() == "") {
							boolean = false;
							$("#beginerr").text("为方便派车，起始点必填。");
						} else
							$("#beginerr").html("&nbsp;");
						if ($("#destination").val() == "") {
							boolean = false;
							$("#deserr").text("请填写目的地！");
						} else
							$("#deserr").html("&nbsp;");

						if (boolean) {
							$("#appname").removeAttr("disabled");
							$("#appdept").removeAttr("disabled");

						}
						return boolean;

					});
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
		var x = evt.clientX - o$("tlts").offsetWidth+50;
		var y = evt.clientY - 40;
		o$("tlts").style.left = x + "px";
		o$("tlts").style.top = y + "px";
		o$("tlts").style.display = "";
	};
	c$.mout = function() {
		o$("tlts").style.display = "none";
	};
	//***随鼠标动提示框

};
function checkTime(i) {
	if (i < 10) {
		i = "0" + i;
	}
	return i;
};

