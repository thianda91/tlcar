package com.jdbc;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yxd.obj.Uusers;
import com.yxd.obj.drivers;
import com.yxd.obj.tlcars;
import com.yxd.obj.userview;

public class manageDAO extends DAO {

	public manageDAO() {
		super();
	}

	/**
	 * 
	 * 处理派车单(同意、拒绝、派车、无车)
	 * 
	 * @param request
	 * @param response
	 * @param qx
	 *            ：权限
	 * @throws IOException
	 */
	public static void updateAppcationtab(HttpServletRequest request,
			HttpServletResponse response, int qx) throws IOException {
		HttpSession session = request.getSession();
		if (userDAO.validate(session)) {
			String myoption = request.getParameter("myoption");
			String aid = request.getParameter("appid");
			String m_flag = request.getParameter("mflag");
			if (aid == null || m_flag == null) {// 同意 mflag = 1，拒绝 mflag = 0。
				session.setAttribute("msg", "您的浏览器不支持打印操作。请使用IE。");
				response.sendRedirect("/TLCAR");
				return;
			}
			if (qx < 4) {
				// 非普通用户			
				int appid = Integer.parseInt(aid);
				int mflag = Integer.parseInt(m_flag);
				if (qx == 3) {
					// 中心领导
					String asql = "";
					if (mflag == 1) {
						// 中心同意
						asql = "update applicationtab set acondition = 1, depoption = ?"
								+ " where app_uid = ?";
					} else {
						// 中心拒绝
						asql = "update applicationtab set acondition = 5, depoption = ?"
								+ " where app_uid = ?";
					}
					update(asql, myoption, appid);
				}
				if (qx == 2) {
					// 部门领导 或 行政事务
					String asql = "";
					String ifxzsw = "a";
					ifxzsw = request.getParameter("ifxzsw");
					if (ifxzsw.length() == 2) {
						// 部门领导
						int depflag = Integer.parseInt(request
								.getParameter("depflag"));
						if (mflag == 1) {
							// 部门同意
							asql = "update applicationtab set acondition = ?, depoption2 = ?"
									+ " where app_uid = ?";
							update(asql, depflag + 2, myoption, appid);
						} else {
							// 部门拒绝
							asql = "update applicationtab set acondition = ?, depoption2 = ?"
									+ " where app_uid = ?";
							update(asql, depflag + 6, myoption, appid);
						}
					} else if (ifxzsw.length() == 3) {
						// 行政事务
						if (mflag == 1) {
							// 行政事务同意
							asql = "update applicationtab set acondition = ?, comoption = ?"
									+ " where app_uid = ?";
							update(asql, 4, myoption, appid);
						} else {
							// 行政事务拒绝
							asql = "update applicationtab set acondition = ?, comoption = ?"
									+ " where app_uid = ?";
							update(asql, 8, myoption, appid);
						}
					}
				}
				if (qx == 1) {
					// 车辆管理
					if (mflag == 1) {
						// 同意派车
						String carid = request.getParameter("carid");
						String driid = request.getParameter("driid");
						String asql = "update applicationtab set acondition = 10, appoption = ?,"
								+ " cuid = ?, drid = ? where app_uid = ?";
						update(asql, myoption, carid, driid, appid);
					} else {
						// 无车
						String asql = "update applicationtab set acondition = 9, appoption = ?,"
								+ " cuid = 0, drid = 0 where app_uid = ?";
						update(asql, myoption, appid);
					}
				}
			}
			response.sendRedirect("appHandle.jsp");
		} else {
			session.setAttribute("msg", "您操作失败，请重新登录。");
			response.sendRedirect("/TLCAR");
		}
	}

	/**
	 * 
	 * 初始化 detail.jsp 根据不同分公司获取 车辆和司机列表显示在select列表中
	 * 
	 * @param session
	 * @param user
	 * @param args
	 */
	public static void initDetail_jsp(HttpSession session, Uusers user,
			int... args) {
		if (userDAO.validate(session)) {
			List<tlcars> carnolist = new ArrayList<tlcars>();
			List<drivers> drinamelist = new ArrayList<drivers>();
			String csql = "select * from tlcars where cdept = ? order by c_uid";
			String dsql = "select * from drivers where ddept = ? order by d_uid";
			carnolist = getForList(tlcars.class, csql, user.getUoffice());
			drinamelist = getForList(drivers.class, dsql, user.getUoffice());
			session.setAttribute("carnolist", carnolist);
			session.setAttribute("drinamelist", drinamelist);
		}
	}

	/**
	 * 派车人员/综合部/部门领导 登录 manager.jsp 使用(applist/appdone)
	 * 
	 * @param session
	 * @param curuser
	 */
	public static void findManage(HttpSession session, Uusers curuser,
			int... args) {
		String asql = "";
		String asql2 = "";
		List<userview> applist = new ArrayList<userview>();
		List<userview> appdone = new ArrayList<userview>();

		switch (curuser.getUauthority()) {
		case 1:
			// 派车人员
			if (args.length > 0) {
				// 派车已处理
				asql2 = "select * from (select * from userapp where"
						+ " appoffice = ? AND" + " acondition in (9,10)"
						+ " order by applydate desc) where rownum <=50";
				appdone = getForList(userview.class, asql2,
						curuser.getUoffice());
				// session.setAttribute("appdone", appdone);
			} else {
				// 派车待处理

				// asql = "select * from userapp where" + " appoffice = ? AND"
				// + " (range=0 and acondition in (1,2,3))"
				// + " or (range=1 and acondition = 4)"
				// + " order by applydate";// 待处理sql

				asql = "select * from userapp where" + " appoffice = ? AND"
						+ " acondition < 5" + " order by applydate";// 可查看sql

				applist = getForList(userview.class, asql, curuser.getUoffice());
			}
			break;
		case 2:
			// 部门领导 或 行政事务
			if (curuser.getUloginname().equalsIgnoreCase("xzsw")) {
				if (args.length > 0) {
					// 行政事务 已处理
					asql2 = "select * from (select * from userapp where "
							+ " appoffice = ? AND" + " comoption != '未处理'"
							+ " order by applydate desc)"
							+ " where rownum <=50";
					appdone = getForList(userview.class, asql2,
							curuser.getUoffice());
				} else {
					// 行政事务 待处理
					asql = "select * from userapp where" + " appoffice = ? AND"
							+ " range=1 and acondition in (2,3)"
							+ " order by applydate";
					applist = getForList(userview.class, asql,
							curuser.getUoffice());
				}
			} else {
				if (args.length > 0) {
					// 部门领导 已处理
					asql2 = "select * from (select * from userapp"
							+ " where appdept2 = ? AND depoption2 != '未处理'"
							+ " order by applydate desc)"
							+ " where rownum <=50";
					appdone = getForList(userview.class, asql2,
							curuser.getUdept2());
				} else {
					// 部门领导 待处理
					asql = "select * from userapp where appdept2 = ? AND"
							+ " acondition < 2" + " order by applydate";
					applist = getForList(userview.class, asql,
							curuser.getUdept2());
				}
			}
			break;
		case 3:
			// 中心领导
			if (args.length > 0) {
				// 中心 已处理
				asql2 = "select * from (select * from userapp"
						+ " where appoffice = ?"
						+ " AND appdept = ? AND depoption != '未处理'"
						+ " order by applydate desc) where rownum <=50";
				appdone = getForList(userview.class, asql2,
						curuser.getUoffice(), curuser.getUdept());
			} else {
				// 中心 待处理
				asql = "select * from userapp where appoffice = ? AND acondition = 0"
						+ " AND appdept = ? order by applydate";
				applist = getForList(userview.class, asql,
						curuser.getUoffice(), curuser.getUdept());
			}
			break;
		}
		if (args.length > 0) {
			// 已处理
			session.setAttribute("appdone", appdone);
		} else {
			// 待处理
			session.setAttribute("applist", applist);
		}
		return;
	}

	/**
	 * 获取公司(县区)列表
	 * 
	 * @param session
	 */
	public static void getoffices(HttpSession session) {
		String osql = "select distinct uoffice from uusers  order by uoffice";
		List<Uusers> officelist = new ArrayList<Uusers>();
		officelist = manageDAO.getForList(Uusers.class, osql);
		session.setAttribute("officelist", officelist);
	}

	/**
	 * 更新 车辆信息
	 * 
	 * @param request
	 * @param response
	 */
	public static void updatecar(HttpServletRequest request,
			HttpServletResponse response) {
		String c_uid = request.getParameter("c_uid");
		String cno = request.getParameter("cno");
		String ctype = request.getParameter("ctype");
		String cdept = request.getParameter("cdept");
		String ccondition = request.getParameter("ccondition");
		String csql = "update tlcars set cno= ?, ctype= ?, cdept= ?,"
				+ " ccondition = ? where c_uid = ?";
		update(csql, cno, ctype, cdept, ccondition, c_uid);
	}

	/**
	 * 更新 司机信息
	 * 
	 * @param request
	 * @param response
	 */
	public static void updatedri(HttpServletRequest request,
			HttpServletResponse response) {
		String d_uid = request.getParameter("d_uid");
		String driname = request.getParameter("driname");
		String driphone = request.getParameter("driphone");
		String ddept = request.getParameter("ddept");
		String dricondition = request.getParameter("dricondition");
		String dsql = "update drivers set driname= ?, driphone= ?, ddept= ?,"
				+ " dricondition = ? where d_uid = ?";
		update(dsql, driname, driphone, ddept, dricondition, d_uid);
	}

	/**
	 * 添加 车辆信息
	 * 
	 * @param request
	 * @param response
	 */
	public static void newcar(HttpServletRequest request,
			HttpServletResponse response) {
		String cno = request.getParameter("cno");
		String ctype = request.getParameter("ctype");
		String cdept = request.getParameter("cdept");
		String ncsql = "insert into tlcars ( c_uid, cno, ctype, cdept)"
				+ " values( carseq.nextval, ?, ?, ?)";
		update(ncsql, cno, ctype, cdept);
	}

	/**
	 * 添加 司机信息
	 * 
	 * @param request
	 * @param response
	 */
	public static void newdri(HttpServletRequest request,
			HttpServletResponse response) {
		String driname = request.getParameter("driname");
		String driphone = request.getParameter("driphone");
		String ddept = request.getParameter("ddept");
		String ndsql = "insert into drivers ( d_uid, driname, driphone, ddept)"
				+ " values( driseq.nextval, ?, ?, ?)";
		update(ndsql, driname, driphone, ddept);
	}

	/**
	 * 添加 用户信息(若已存在则更新)
	 * 
	 * @param request
	 * @param response
	 */
	public static void newuser(HttpServletRequest request,
			HttpServletResponse response) {
		String uloginname = request.getParameter("uloginname");
		String uoffice = request.getParameter("uoffice");
		String uname = request.getParameter("uname");
		String udept = request.getParameter("udept");
		String udept2 = request.getParameter("udept2");
		String uphoneno = request.getParameter("uphoneno");
		String uvphone = request.getParameter("uvphone");
		String uauthority = request.getParameter("uauthority");
		String nusql = "";
		// if (userDAO.sameulogname(uloginname) != null) {
		// 先执行 update 操作，获取返回行数。
		nusql = "update uusers set uname = ?, udept = ?, udept2 = ?, uoffice = ?,"
				+ " uphoneno = ?, uvphone = ?, uauthority = ? where uloginname = ?";
		if (update(nusql, uname, udept, udept2, uoffice, uphoneno, uvphone,
				uauthority, uloginname) == 0) {
			//若行数为0，则表示 update 失败
			// } else {
			// 执行 insert 操作。
			nusql = "insert into uusers ( u_uid, uloginname, uname, udept,"
					+ " udept2, uoffice, uphoneno, uvphone, uauthority) values"
					+ " ( useq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			update(nusql, uloginname, uname, udept, udept2, uoffice, uphoneno,
					uvphone, uauthority);
		}
	}
}