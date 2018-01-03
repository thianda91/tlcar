package com.jdbc;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yxd.obj.Uusers;

public class userDAO extends DAO {
	public userDAO() {
		super();
	}

	/**
	 * 用户登录验证用户名密码，返回用户信息。 （通过姓名登录）
	 * 
	 * @author 
	 * @param uname
	 *            : 姓名
	 * @param pwd
	 *            : 密码
	 * */
	public static Uusers validate(String uname, String pwd) {
		Uusers us = new Uusers();
		// Connection con = null;
		// PreparedStatement pstmt = null;
		// ResultSet rs = null;
		String sql2 = "select * from uusers where uname = ? and upwd = ?";
		String sql = "select * from uusers where uloginname = ? and upwd = ?";
		us = get(Uusers.class, sql, uname, pwd);

		if (us == null)
			us = get(Uusers.class, sql2, uname, pwd);
		return us;
	}

	/**
	 * 派车人员/综合部/部门领导 登录 manager.jsp 使用(已由manageDAO中同名方法代替)
	 * 
	 * @param session
	 * @param curuser
	 */
	// public void findManage(HttpSession session, Uusers curuser, int... args)
	// {
	// String asql = "";
	// String asql2 = "";
	// List<userview> applist = new ArrayList<userview>();
	// List<userview> appdone = new ArrayList<userview>();
	//
	// switch (curuser.getUauthority()) {
	// case 1:
	// if ("车辆管理".equals(curuser.getUdept())) {
	// // 市公司 派车人员
	// if (args.length > 0) {
	// // 派车已处理
	// asql2 = "select * from userapp where acondition in (8,9)"
	// +
	// " AND appdept not in ('开原分公司', '清河分公司', '铁岭县分公司', '调兵山分公司', '银州区分公司', '西丰分公司', '昌图分公司' )"
	// + " order by applydate desc";
	// appdone = getForList(userview.class, asql2);
	// // session.setAttribute("appdone", appdone);
	// } else {
	// // 派车待处理
	// asql = "select * from userapp where acondition < 3"
	// +
	// " AND appdept not in ('开原分公司', '清河分公司', '铁岭县分公司', '调兵山分公司', '银州区分公司', '西丰分公司', '昌图分公司' )"
	// + " order by applydate desc";
	// applist = getForList(userview.class, asql);
	// // session.setAttribute("applist", applist);
	// }
	// break;
	// } else {
	// // 县区公司 派车人员
	// if (args.length > 0) {
	// // 派车已处理
	// asql2 = "select * from userapp where acondition in (8,9)"
	// + "AND appdept = ?" + " order by applydate desc";
	// appdone = getForList(userview.class, asql2,
	// curuser.getUdept());
	// // session.setAttribute("appdone", appdone);
	// } else {
	// // 派车待处理
	// asql = "select * from userapp where acondition < 3"
	// + "AND appdept = ?" + " order by applydate desc";
	// applist = getForList(userview.class, asql,
	// curuser.getUdept());
	// // session.setAttribute("applist", applist);
	// }
	// break;
	// }
	// case 2:
	// if ("综合部".equals(curuser.getUdept())) {
	// // 市公司 综合部
	// if (args.length > 0) {
	// // 市公司综合部 已处理
	// asql2 = "select * from (select * from userapp"
	// + " where comoption != '未处理'"
	// +
	// " AND appdept not in ('开原分公司', '清河分公司', '铁岭县分公司', '调兵山分公司', '银州区分公司', '西丰分公司', '昌图分公司' )"
	// + " order by applydate desc) where rownum <=50";
	// appdone = getForList(userview.class, asql2);
	// } else {
	// // 市公司综合部 待处理
	// asql = "select * from userapp where acondition < 2"
	// +
	// " AND appdept not in ('开原分公司', '清河分公司', '铁岭县分公司', '调兵山分公司', '银州区分公司', '西丰分公司', '昌图分公司' )"
	// + " order by applydate desc";
	// applist = getForList(userview.class, asql);
	// }
	// break;
	// } else {
	// // 县区公司 综合部
	// if (args.length > 0) {
	// // 县区公司 综合部 已处理
	// asql2 = "select * from (select * from userapp"
	// + " where comoption != '未处理'" + " AND appdept = ?"
	// + " order by applydate desc) where rownum <=50";
	// appdone = getForList(userview.class, asql2,
	// curuser.getUdept());
	// } else {
	// // 县区公司 综合部 待处理
	// asql = "select * from userapp where acondition < 2"
	// + " AND appdept = ?" + " order by applydate desc";
	// applist = getForList(userview.class, asql,
	// curuser.getUdept());
	// }
	// break;
	// }
	// case 3:
	// // 部门领导
	// if (args.length > 0) {
	// // 部门 已处理
	// asql2 = "select * from (select * from userapp"
	// + " where depoption != '未处理'" + " AND appdept = ?"
	// + " order by applydate desc) where rownum <=50";
	// appdone = getForList(userview.class, asql2, curuser.getUdept());
	// } else {
	// asql = "select * from userapp where acondition = 0"
	// + " AND appdept = ? order by applydate desc";
	// applist = getForList(userview.class, asql, curuser.getUdept());
	// }
	// break;
	// }
	// if (args.length > 0) {
	// // 已处理
	// session.setAttribute("appdone", appdone);
	// } else {
	// // 待处理
	// session.setAttribute("applist", applist);
	// }
	// return;
	// }

	/**
	 * 获取用户视图(未使用)
	 * 
	 * @param session
	 *            IE 当前会话
	 * @param curuser
	 *            当前用户
	 * @param usql
	 *            查询的SQL
	 * @return List<userview>
	 */

	// public List<userview> getUserview(HttpSession session, Uusers curuser,
	// String usql) {
	// List<userview> applist = new ArrayList<userview>();
	// applist = new userDAO().getForList(userview.class, usql,
	// curuser.getUdept());
	// session.setAttribute("applist", applist);
	// return applist;
	// }

	/**
	 * 
	 * 获取派车人员/综合部/部门领导 待办的信息(applicationtab) (未使用)
	 * 
	 * @param session
	 *            IE 当前会话
	 * @param curuser
	 *            当前用户
	 * @param asql
	 *            查询的sql语句
	 * @return List<applicationtab>
	 */

	// public List<applicationtab> getApp(HttpSession session, Uusers curuser,
	// String asql) {
	// List<applicationtab> apptab = new ArrayList<applicationtab>();
	// apptab = new userDAO().getForList(applicationtab.class, asql,
	// curuser.getUdept());
	// session.setAttribute("apptab", apptab);
	// return apptab;
	// }
	/**
	 * 用户取消派车申请
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public static void cancelApply(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		if (userDAO.validate(session)) {
			String aid = request.getParameter("appid");
			String username = request.getParameter("username");
			String time = request.getParameter("time");
			String str = time + username + "已撤销。";
			String asql = "update applicationtab set acondition = 11, appoption = ?"
					+ " where app_uid = ?";
			update(asql, str, aid);
		}
		response.sendRedirect("appHandle.jsp");
	}

	/**
	 * 插入 新的派车申请 apply.jsp 使用
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ParseException
	 */
	public static void InsertApplicationtab(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		SimpleDateFormat d1 = new SimpleDateFormat("yyyy-MM-dd hh:mm a",
				Locale.US);
		SimpleDateFormat d2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		/*
		 * String appdept = request.getParameter("appdept"); String appoffice =
		 * request.getParameter("gongsi"); String appname =
		 * request.getParameter("appname");
		 */
		int appnameid = Integer.parseInt(request.getParameter("appnameid"));
		int personnum = Integer.parseInt(request.getParameter("personnum"));
		String beginpoint = request.getParameter("beginpoint");
		String range = request.getParameter("range");
		String destination = request.getParameter("destination");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		// 判断传值为空，则跳转
		if (beginpoint == "" || range == "" || destination == ""
				|| begintime == "" || endtime == "") {
			response.sendRedirect("apply.jsp");
			return;
		}
		java.util.Date begintime1 = d1.parse(begintime);
		java.util.Date endtime1 = d1.parse(endtime);
		begintime = d2.format(begintime1);
		endtime = d2.format(endtime1);
		String reason = request.getParameter("reason");
		String sql = "insert into applicationtab (app_uid, applydate, appnameid, appcount,"
				+ " beginpoint, range, destination, reason, begintime, endtime ) values (appseq.nextval, sysdate,"
				+ " ?, ?, ?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd hh24:mi'), TO_DATE(?, 'yyyy-mm-dd hh24:mi'))";
		update(sql, appnameid, personnum, beginpoint, range, destination,
				reason, begintime, endtime);
		int userqx = Integer.parseInt(request.getParameter("userqx"));
		if (userqx < 4)
			response.sendRedirect("manager.jsp");
		else
			response.sendRedirect("browse.jsp");
	}

	/**
	 * 
	 * 根据 uloginname 或 uname 返回 uusers 表中 对应的 uname 值
	 * 
	 * @param uloginname
	 * @return
	 */
	public static String sameulogname(String uloginname) {
		String sql = "select uname from uusers where uloginname = ?";
		String sql2 = "select uname from uusers where uname = ?";
		String getname = getForValue(sql, uloginname);
		if (getname == null)
			getname = getForValue(sql2, uloginname);
		return getname;
	}

	/**
	 * 
	 * 个人信息修改(带参数则为修改密码)
	 * 
	 * @param request
	 * @param response
	 * @param args
	 */
	public static boolean userUpdate(HttpServletRequest request,
			HttpServletResponse response, String... args) {
		HttpSession session = request.getSession();
		boolean flag = true;
		if (validate(session)) {
			String uuid = request.getParameter("uuid");
			// String from = request.getParameter("from"); // 未使用
			if (!uuid.equals("undefined")) {
				int u_uid = Integer.parseInt(uuid);

				if (args[0].equals("info")) {
					String uloginname = request.getParameter("uloginname");
					String uname = request.getParameter("uname");
					String udept = request.getParameter("udept");
					String udept2 = request.getParameter("udept2");
					String uoffice = request.getParameter("uoffice");
					String uphoneno = request.getParameter("uphoneno");
					String uvphone = request.getParameter("uvphone");

					// 检测 uloginname 是否冲突
					String sameuuname = sameulogname(uloginname);
					// Uusers thisuser = (Uusers) session.getAttribute("user");

					if (sameuuname != null & !uname.equals(sameuuname)) {
						// 冲突
						flag = false;
						session.setAttribute("note", "登录名不可用。");
					} else {
						// 更新信息操作
						session.setAttribute("uloginnametip", "此登录名可以使用。");
						String usql = "update uusers set uloginname = ?, udept = ?, udept2 = ?,"
								+ " uoffice = ?, uphoneno = ?, uvphone = ? where u_uid = ?";
						userDAO.update(usql, uloginname, udept, udept2,
								uoffice, uphoneno, uvphone, u_uid);
						Uusers cuser = get(Uusers.class,
								"select * from uusers where u_uid = ?", u_uid);
						Uusers user = (Uusers) (session.getAttribute("user"));
						if (u_uid != user.getU_uid())
							session.setAttribute("cuser", cuser);
						else
							session.setAttribute("user", cuser);
					}

				} else if (args[0].equals("pwd")) {
					// 修改密码
					String newpwd = request.getParameter("newpwd");
					String usql = "update uusers set upwd = ?"
							+ " where u_uid = ?";
					userDAO.update(usql, newpwd, u_uid);
					session.removeAttribute("user");
					session.setAttribute("msg", "密码已修改！请使用新密码登录。");
				} else {
					// 同常不会出现
					flag = false;
				}
			}
		}
		return flag;
	}

	/**
	 * 验证用户是否已登录
	 * 
	 * @param session
	 * @return true or false
	 */
	public static boolean validate(HttpSession session) {
		Uusers user = (Uusers) session.getAttribute("user");
		if (null != user)
			return true;
		else
			return false;
	}

	/**
	 * 注册用户
	 * 
	 * @param request
	 * @param response
	 * @param args
	 *            (未使用)
	 * @return
	 */
	public static boolean register(HttpServletRequest request,
			HttpServletResponse response, String... args) {
		String uloginname = request.getParameter("uloginname");
		String uname = request.getParameter("uname");
		String udept = request.getParameter("udept");
		String udept2 = request.getParameter("udept2");
		String uoffice = request.getParameter("uoffice");
		String uphoneno = request.getParameter("uphoneno");
		String uvphone = request.getParameter("uvphone");
		String iflogin = request.getParameter("iflogin");
		int uauthority = Integer.parseInt(request.getParameter("uauthority"));
		String upwd = request.getParameter("upwd");

		String registersql = "insert into uusers (u_uid, uloginname, uname,"
				+ " udept, udept2, uoffice, uphoneno, uvphone, uauthority, upwd)"
				+ " values(useq.nextval ,? ,? ,? ,? ,? ,? ,? ,? ,?)";
		update(registersql, uloginname, uname, udept, udept2, uoffice,
				uphoneno, uvphone, uauthority, upwd);
		Uusers registeruser = get(Uusers.class,
				"select * from uusers where uloginname = ?", uloginname);
		if (registeruser != null) {
			if (iflogin.equals("1"))
				request.getSession().setAttribute("user", registeruser);
			return true;
		} else {
			return false;
		}
	}

}
