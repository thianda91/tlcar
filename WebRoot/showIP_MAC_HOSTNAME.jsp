<%@page import="java.net.InetAddress"%>
<%@page import="java.io.LineNumberReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<style>
.infotable {
	font-family: "宋体";
}

.info_detial {
	font-size: 12px;
	color: #080bff;
}
</style>
<title>检测结果</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>
<body>
	
	<%
		String yourip = request.getRemoteAddr();//IP地址
		String yourhostname = InetAddress.getByName(yourip).getHostName();//根据IP获取电脑名
		String str = "";
		String yourmac = "";
		PrintWriter out2 = response.getWriter();
		out2.print("<title>检测结果</title><div id='hostinfo'>获取中...</div>");
		try {
			Process p = Runtime.getRuntime().exec("nbtstat -A " + yourip);
			InputStreamReader ir = new InputStreamReader(p.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);
			while ((str = input.readLine()) != null) {
				if (str.indexOf("MAC") > 1) {
					// 使用substring函数截出mac地址
					yourmac = str.substring(str.indexOf("=") + 2);
					//yourmac = yourmac.substring(yourmac.indexOf("=")+2);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
	%>
	<div id="infotable">
		<table class="infotable">
			<tr>
				<td>您的IP地址：</td>
				<td class="info_detial"><%=yourip%></td>
			</tr>
			<tr>
				<td>您的电脑名：</td>
				<td class="info_detial"><%=yourhostname%></td>
			</tr>
			<tr>
				<td>您的MAC地址：</td>
				<td class="info_detial"><%=yourmac%></td>
			</tr>
		</table>
	</div>
</body>
<script>
	var childnode = document.getElementById("hostinfo");
	childnode.parentNode.removeChild(childnode);
</script>
</html>
