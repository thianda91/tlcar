/**
 * used in admin/*.jsp
 * 
 * @Author 
 * 
 */

{
	var itop = (window.screen.availHeight - 30 - 500) / 2;
	var ileft = (window.screen.availWidth - 30 - 600) / 2;
	var openstyle1 = "height=500,width=600,top=" + itop + ",left=" + ileft
			+ ",toolbar=no,menubar=no,";
	var openstyle2 = "srollbars=no,resizable=no,location=no,status=no";
	// 新建按钮功能
	// *****************************************************
	$("#newcar").bind("click", function() {
		var openurl = "/TLCAR/admin/table_index.jsp?fn=newcar";
		window.open(openurl, "newtab", openstyle1 + openstyle2);
		return false;
	});
	$("#newdri").bind("click", function() {
		var openurl = "/TLCAR/admin/table_index.jsp?fn=newdri";
		window.open(openurl, "newtab", openstyle1 + openstyle2);
		return false;
	});
	$("#newuser").bind("click", function() {
		var openurl = "/TLCAR/admin/table_index.jsp?fn=newuser";
		window.open(openurl, "newtab", openstyle1 + openstyle2);
		return false;
	});
	// ******************************************************
	// $("input[type='checkbox']").css("cursor", "pointer");
	$(".mviewtr").mouseover(function() {
		// $(this).css("cursor", "pointer");
		$(this).css("background", "#f0f0aa");
		$(this).css("color", "green");
	});
	$(".mviewtr").mouseout(function() {
		// $(this).css("cursor", "auto");
		$(this).css("background", "#eee");
		$(this).css("color", "black");
	});
	// 修改信息功能，点击 TR 进入详细信息页
	$(".mviewtr").bind(
			"click",
			function() {
				var arg = $(this).find("a").attr("href");
				// var arg = $(this).find("a").text();
				var tabname = $(this).parent().parent().parent().attr("id");
				var openurl = "/TLCAR/admin/table_index.jsp?fn=" + tabname
						+ "&indexid=" + arg;
				// location.href = openurl;

				window.open(openurl, "newtab", openstyle1 + openstyle2);
				return false;
			});

	/**
	 * 字体放大
	 * 
	 * @param size
	 */
	function doZoom(size) {
		document.getElementById('zoom').style.fontSize = size + 'px'
	}

	var DOM = (document.getElementById) ? 1 : 0;
	var NS4 = (document.layers) ? 1 : 0;
	var IE4 = 0;
	if (document.all) {
		IE4 = 1;
		DOM = 0;
	}
	var win = window;
	var n = 0;

	/**
	 * 查找判定
	 */
	function findIt() {
		if (document.getElementById("searchstr").valuemxi != "")
			findInPage(document.getElementById("searchstr").value);
	}
	/**
	 * 页面查找，并滚动
	 * 
	 * @param str
	 * @returns {Boolean}
	 */
	function findInPage(str) {
		var txt, i, found;
		if (str == "")
			return false;
		if (DOM) {
			win.find(str, false, true);
			return true;
		}
		if (NS4) {
			if (!win.find(str))
				while (win.find(str, false, true))
					n++;
			else
				n++;
			if (n == 0)
				alert("未找到指定内容.");
		}
		if (IE4) {
			txt = win.document.body.createTextRange();
			for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
				txt.moveStart("character", 1);
				txt.moveEnd("textedit");
			}
			if (found) {
				txt.moveStart("character", -1);
				txt.findText(str);
				txt.select();
				txt.scrollIntoView();
				n++;
			} else {
				if (n > 0) {
					n = 0;
					findInPage(str);
				} else
					alert("未找到指定内容.");
			}
		}
		return false;
	}
	// *************************
}