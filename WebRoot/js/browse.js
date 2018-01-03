/**
 * used in browse.jsp
 * 
 * @Author XDa
 */
{

	// $("#browse_tab tr:even").css("background", "green");
	// $("#browse_tab tr:odd").css("background", "orange");
	var qx = $("#userqx").text();// 获取当前用户权限
	if (qx < 4) {
		$(".button_link").css("display", "inline");
	}
	$("#browse_tab tr").click(function() {
		// var arg = $(this).find("a").attr("href");
		var arg = $(this).find("a").text();
		location.href = "detail.jsp?item=" + arg;
		return false;
	});
	$("#browse_tab tr").mouseover(function() {
		$(this).css("cursor", "pointer");
		//$(this).css("font-weight", "bold");
		$(this).css("background", "#99BC99");
	});
	$("#browse_tab tr").mouseout(function() {
		$(this).css("cursor", "auto");
		//$(this).css("font-weight", "normal");
		$(this).css("background", "#99CC99");
	});
	$("marquee").attr("behavior", "alternate");
	$("marquee").attr("scrolldelay", "500");
	$(".td7").each(
			function() {
				var _td6 = $(this).prev();
				var td6val = $(this).prev().text();
				if ($(this).text() == 10) {// 已同意
					_td6.children("span").text(
							td6val.substr(td6val.indexOf("，") + 1));
				} else {
					$(this).prev().remove();
					$(this).prev().remove();
					$(this).prev().html(_td6.html()).removeClass().attr(
							"colspan", 3).css("width", "390px");
					/*
					 * if (_td6.text().length > 8) {
					 * $(this).prev().children("span").text(
					 * _td6.text().substring(0, 7) + "..."); }
					 */
				}
			});
};