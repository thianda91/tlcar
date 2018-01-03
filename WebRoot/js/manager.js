/**
 * used in userinfo.jsp
 * 
 * @Author XDa
 */
{
	var thisurl = location.href;
	function refresh() {
		location.href = thisurl;
		// setTimeout('refresh()', 10000);
	}
	var qx = $("#userqx").text();// 获取当前用户权限
	if (qx == 4) {
		history.back();
	}
	var itop = (window.screen.availHeight - 30 - 500) / 2;
	var ileft = (window.screen.availWidth - 30 - 600) / 2;

	var openstyle1 = "height=500,width=700,top=" + itop + ",left=" + ileft
			+ ",toolbar=no,menubar=no,";
	var openstyle2 = "resizable=no,location=no,status=no";

	// *****************************************************

	/*
	 * $("#managehelp").bind("click", function() { var openurl =
	 * "/TLCAR/managehelp.xlsx";// managehelp.html window.open(openurl,
	 * "newtab", openstyle1 + openstyle2); return false; });
	 */
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
		//var x = evt.clientX ;
		var y = evt.clientY + 20;
		o$("tlts").style.left = x + "px";
		o$("tlts").style.top = y + "px";
		o$("tlts").style.display = "";
	};
	c$.mout = function() {
		o$("tlts").style.display = "none";
	};
	//***随鼠标动提示框

	$("#browse_tab tr").click(function() {
		var arg = $(this).find("a").attr("href");
		// var arg = $(this).find("a").text();
		location.href = "detail.jsp?" + arg;
		return false;
	});
	$("#browse_tab tr").mouseover(function() {
		$(this).css("cursor", "pointer");
		$(this).css("font-weight", "bold");
		$(this).css("background", "#ccc");
		
	});
	$("#browse_tab tr").mousemove(function() {
		c$.mmove(this,$(this).children().last().html());
		//显示最后一个td内的内容
		});
	$("#browse_tab tr").mouseout(function() {
		$(this).css("cursor", "auto");
		$(this).css("font-weight", "normal");
		$(this).css("background", "#99CC99");
		c$.mout();
	});
	// 10秒自动刷新
	setTimeout('refresh()', 60000);
}