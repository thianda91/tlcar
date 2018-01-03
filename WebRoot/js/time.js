var today = 0;
var h = 0;
var m = 0;
var flag = 0;
function startTime() {
	today = new Date();
	h = today.getHours();
	m = today.getMinutes();
	var s = today.getSeconds();
	h = checkTime(h);
	m = checkTime(m);
	s = checkTime(s);
	document.getElementById("time").innerHTML = h + ":" + m + ":" + s;
	if (flag == 0) {
		wstatus();
		flag++;
	}
	t = setTimeout('startTime()', 500);
}/* " " + */
function checkTime(i) {
	if (i < 10) {
		i = "0" + i;
	}
	return i;
}
function wstatus() {
	window.status = "您的本机时间为： " + today.toLocaleDateString() + " " + h + ":"
			+ m;
	w = setTimeout('wstatus()', 30000);
}