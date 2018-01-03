package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.DAO;
import com.jdbc.manageDAO;
import com.jdbc.userDAO;
import com.yxd.obj.Uusers;

public class HandleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2688622361802663670L;

	/**
	 * Constructor of the object.
	 */
	public HandleServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	public void init() throws ServletException {
		// Put your code here
	}

	/**
	 * 判断 回传的servlet路径并执行对于的方法 ***** (仿Struts2) *****
	 */
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		super.service(request, response);
		HttpSession session = request.getSession(true);
		String servletPath = request.getServletPath();
		if ("/if_it_has_uname.do".equalsIgnoreCase(servletPath)) {
			// 判断登录名是否已注册
			String uloginname = request.getParameter("uloginname");
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if (userDAO.sameulogname(uloginname) != null) {
				out.println("已注册，请更换新的。");
			} else {
				out.println("可注册");
			}
		} else if ("/register.do".equalsIgnoreCase(servletPath)) {
			// 注册用户
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if (userDAO.register(request, response)) {
				// out.print("注册ok");
				response.sendRedirect("userinfo.jsp");
				// new LogininServlet().logininRedirect(response, session);
				return;
			} else {
				// 应该不会出现此情况
				session.setAttribute("msg", "注册异常，请重试。");
				response.sendRedirect("/TLCAR");
			}

		} else if (null == session.getAttribute("user")) {
			session.setAttribute("msg", "非法访问，请登录后操作。");
			response.sendRedirect("/TLCAR");
		} else {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if ("/apply.do".equalsIgnoreCase(servletPath)) {
				// 填写申请表 （insert into 操作）
				try {
					userDAO.InsertApplicationtab(request, response);

				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else if ("/cancelapply.do".equalsIgnoreCase(servletPath)) {
				// 用户取消派车申请
				userDAO.cancelApply(request, response);

			} else if ("/handle.do".equalsIgnoreCase(servletPath)) {
				Uusers user = (Uusers) session.getAttribute("user");
				// 处理申请表（同意、拒绝、派车、无车等。）
				manageDAO.updateAppcationtab(request, response,
						user.getUauthority());
			} else if ("/userupdate.do".equalsIgnoreCase(servletPath)) {
				// 用户信息、密码修改
				String r = request.getParameter("r");
				// r 用于判断 修改信息还是修改密码
				if (!userDAO.userUpdate(request, response, r)) {
					//修改信息登录名冲突
					session.setAttribute("note", "登录名冲突请重新修改。");
				}
				if (r.equalsIgnoreCase("pwd"))
					response.sendRedirect("/TLCAR");
				else
					response.sendRedirect(request.getParameter("fromurl"));
			} else if ("/resetpwd.do".equalsIgnoreCase(servletPath)) {
				// 重置密码 操作
				String uuid = request.getParameter("uuid");

				if (uuid != "undefined") {
					int u_uid = Integer.parseInt(uuid);
					// 重置密码为 Qq_0247asdf
					String pwdsql = "update uusers set upwd = '"
							+ DAO.getProperty("default_pwd") + "'"
							+ " where u_uid = ?";
					manageDAO.update(pwdsql, u_uid);
					out.println("已将该用户密码重置为：Qq_0247asdf");
				}
			} else if ("/modifycar.do".equalsIgnoreCase(servletPath)) {
				// 修改车辆 操作
				manageDAO.updatecar(request, response);
				// 提示关闭并刷新
				out.println(back_colosed_str("车辆修改成功","?f=1"));

			} else if ("/modifydri.do".equalsIgnoreCase(servletPath)) {
				// 修改司机 操作
				manageDAO.updatedri(request, response);
				// 提示关闭并刷新
				out.println(back_colosed_str("司机修改成功","?f=1"));

			} else if ("/newcar.do".equalsIgnoreCase(servletPath)) {
				// 新增车辆 操作
				manageDAO.newcar(request, response);
				// 提示关闭并刷新
				out.println(back_colosed_str("添加车辆成功","?f=1"));
			} else if ("/newdri.do".equalsIgnoreCase(servletPath)) {
				// 新增司机 操作
				manageDAO.newdri(request, response);
				// 提示关闭并刷新
				out.println(back_colosed_str("新增司机成功","?f=1"));
			} else if ("/newuser.do".equalsIgnoreCase(servletPath)) {
				// 新增用户操作
				manageDAO.newuser(request, response);
				// 提示关闭并刷新
				out.println(back_colosed_str("用户添加成功。",""));
			} else {// 若 servletPath 无匹配
					// 此情况应该不会出现
				out.println("servletPath 无效，请联系管理员。");
			}
		}
	}

	protected String back_colosed_str( String arg,String backmsg) {
		// backmsg 用于修改司机 车辆后 刷新页面后模拟鼠标点击自动展示车辆修改页面。而不是 默认的用户管理页面
		if (arg.length()<1)
			arg = "修改成功";
		return "<br><br><br><br><br><br><br><center>"+arg+"<br><br><br>"
				+ "<button onclick='javascript:closew()'>关闭</button></center>"
				+ "<script>function closew(){if(window,opener&&!window.opener.closed)"
				+ "opener.location.href=opener.location.pathname+'"+backmsg+"';self.close();}</script>";
	}// location.pathname ：当前 URL 的路径部分
}
