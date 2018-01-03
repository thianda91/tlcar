package com.servlet;

import java.io.IOException;
import java.io.InputStream;

import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.JDBCTools;
import com.jdbc.userDAO;
import com.yxd.obj.Uusers;

public class LogininServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5247953856084515118L;

	/**
	 * Constructor of the object.
	 */
	public LogininServlet() {
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
		// doPost(request, response);
		HttpSession session = request.getSession(true);
		if (null == session.getAttribute("user")) {
			session.setAttribute("msg", "非法访问，请登录后操作。");
			response.sendRedirect("/TLCAR");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 设置编码防止中文乱码
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		// response.setContentType("UTF-8");// 已通过EncodingFilter 实现
		String RemoteAddr = (String) request.getRemoteAddr();
		String RemoteHost = (String) request.getRemoteHost();
		String RemoteUser = request.getRemoteUser();
		String user = (String) request.getParameter("user").toLowerCase();
		String pwd = (String) request.getParameter("pwd");
		HttpSession session = request.getSession();
		// 判断账户密码是否正确，若正确直接登陆。
		Uusers curuser = userDAO.validate(user, pwd);
		if (null != curuser) {
			session.setAttribute("user", curuser);
			String loginlog = "***" + new Date().toLocaleString() + "     "
					+ RemoteUser + ":" + user + ":" + pwd + "在" + RemoteAddr
					+ "," + RemoteHost + "登陆。***\n"; // 输出用户名密码
			// 此处可以使用IO流将日志保存成文本。
			String loginsql = "insert into loginlog values(logseq.nextval, TO_DATE(?, 'yyyy-mm-dd hh24:mi:ss'),?,?,?,? )";
			userDAO.update(loginsql, new Date().toLocaleString(), user, pwd,
					RemoteAddr, "登陆");
			System.out.print(loginlog);
			/*
			 * 更新登陆次数
			 */
			String updatesql = "update uusers set ulogintimes = ? where u_uid = ?";
			userDAO.update(updatesql, curuser.getUlogintimes() + 1,
					curuser.getU_uid());
			// session.removeAttribute("errtimes");
			if (pwd.equalsIgnoreCase(userDAO.getProperty("default_pwd")))
				// 初始密码需要强制进行修改，否则无法使用。
				response.sendRedirect("change_password.jsp");
			else
				logininRedirect(response, session);
		} else {// 登陆失败
			// 记录登陆错误次数
			String errtimes = (String) session.getAttribute("errtimes");
			if (errtimes == null) {
				session.setAttribute("errtimes", "a");
				errtimes = "a";
			}
			if (errtimes.length() >= 5) {
				session.setAttribute("msg", "登陆失败，您尝试次数过多！请稍后再试。");
			} else {
				session.setAttribute("errtimes", errtimes + "a");
				String thisname = userDAO.sameulogname(user);
				if (null == thisname) {// 试图登陆的用户不存在
					session.setAttribute("msg", "用户不存在。请重试或点击下方注册按钮。");
				} else {// 登陆的用户存在，验证密码
					session.setAttribute("msg", "密码错误。请重新输入。");
				}
			}
			response.sendRedirect("/TLCAR");
			// request.getRequestDispatcher("/TLCAR").forward(request,response);

		}
	}

	/**
	 * 登录用户Redirect跳转
	 * 
	 * @param response
	 * @param session
	 * @throws IOException
	 * @throws ServletException
	 */
	public void logininRedirect(HttpServletResponse response,
			HttpSession session) throws IOException, ServletException {
		Uusers curuser = (Uusers) (session.getAttribute("user"));
		switch (curuser.getUauthority()) {
		case 0:
			response.sendRedirect("admin.jsp");
			;
			break;
		case 1:
		case 2:
		case 3:
			response.sendRedirect("manager.jsp");
			break;
		case 4:// 普通用户
			response.sendRedirect("browse.jsp");
			break;
		// request.getRequestDispatcher("/Welcome.jsp").forward(request,response);
		default:
			session.setAttribute("msg", "用户权限异常，请与管理员联系。");
			// session.removeAttribute("user");
			response.sendRedirect("/TLCAR");
			break;
		}
	}

	// public void logoff(HttpServletResponse response, HttpSession session)
	// throws IOException {
	// session.removeAttribute("user");
	// session.setAttribute("msg", "您已退出登录。");
	// response.sendRedirect("/");
	// }

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		super.service(request, response);
		if ("off".equals(request.getParameter("method"))) {
			// 退出登录操作
			HttpSession session = request.getSession(false);
			if (null != session) {
				session.invalidate();
			}
			// session.removeAttribute("user");
			// session.setAttribute("msg", "您已退出登录。");
			// response.sendRedirect("/");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
