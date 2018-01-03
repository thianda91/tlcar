package com.jdbc;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;

import org.junit.Test;

import com.yxd.obj.Uusers;
import com.yxd.obj.userview;
import com.jdbc.userDAO;

public class DAOTest {

	userDAO userdao = new userDAO();

	// DAO dao = new DAO();
	public void getMAC(String yourip) {
		String str = "";
		String macAddress = "";
		try {
			Process p = Runtime.getRuntime().exec("nbtstat -A " + yourip);
			InputStreamReader ir = new InputStreamReader(p.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);
			while ((str = input.readLine()) != null) {
				if (str.indexOf("MAC") > 1) {
					// 使用substring函数截出mac地址
					// macAddress = str.substring(str.indexOf("MAC") + 9,
					// str.length());
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}

	}

	@Test
	// Success
	public void testUpdate() {

		String nusql = "update uusers set uname = ?, udept = ?, udept2 = ?, uoffice = ?,"
				+ " uphoneno = ?, uvphone = ?, uauthority = ?"
				+ " where uloginname = ?";

		System.out.println(userdao.update(nusql, "yy", "yy", "yy", "yy",
				"12345678911", 123123, 1, "yxd"));
	}

	@Test
	// Success
	public void testGet() {
		String sql = "select * from uusers where u_uid= ?";
		Uusers student = userdao.get(Uusers.class, sql, 1000);

		System.out.println(student);
	}

	@Test
	// Success
	public void testGetForList() {
		String sql = "select u_uid, uloginname, uname, upwd, udept, uphoneno, "
				+ "uvphone, uauthority ,ulogintimes from uusers where u_uid = 1000";
		List<Uusers> users = userdao.getForList(Uusers.class, sql);
		System.out.println(users.get(0));
	}

	@Test
	// Success
	public void testGetForValue() {
		// String sql = "SELECT exam_card FROM examstudent " +
		// "WHERE flow_id = ?";
		// String examCard = dao.getForValue(sql, 5);
		// System.out.println(examCard);
		//
		// sql = "SELECT max(grade) FROM examstudent";
		// int grade = dao.getForValue(sql);
		// System.out.println(grade);
	}

	@Test
	public void testHandleResultSetToMapList() {
		String sql = "select u_uid, uloginname, uname, upwd, udept, uphoneno, "
				+ "uvphone, uauthority ,ulogintimes from uusers where u_uid = 1000";
		Map<String, Object> map = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		// rs = userdao.select(sql);
		try {

			connection = JDBCTools.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
			while (rs.next()) {
				map = new HashMap<String, Object>();
				List<String> columnLabels = userdao.getColumnLabels(rs);
				for (String columnLabel : columnLabels) {
					Object value = rs.getObject(columnLabel);
					/* 测试输出11 */System.out.print(columnLabel.toLowerCase()
							+ ", " + value);
					map.put(columnLabel.toLowerCase(), value);
				}
				System.out.println("\n\t\t\t---11--end----");
				lists.add(map);
			}
			/* 测试输出22 */System.out.println(lists.get(0)
					+ "\n\t\t\t---- 22-end----");
			List<Uusers> result = new ArrayList<Uusers>();
			result = userdao.transfterMapListToBeanList(Uusers.class, lists);
			/* 测试输出33 */System.out.println(result.get(0)
					+ "\n\t\t\t ---33 end---");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTools.releaseDB(rs, preparedStatement, connection);
		}

	}

	@Test
	public void dateFormat() {
		// String sql =
		// "insert into applicationtab (app_uid, applydate, applyname, appdept, appcount,"
		// +
		// " beginpoint, destination, reason, begintime, endtime ) values (appseq.nextval, sysdate,"
		// +
		// " ?, ?, ?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd hh24:mi'), TO_DATE(?, 'yyyy-mm-dd hh24:mi'));";
		// "18425fasrtvtrygf", "2015-05-31 15:15", "2015-06-31 15:15");

		String sql = "insert into applicationtab (app_uid, applydate, applyname, appdept, appcount, beginpoint, destination, reason, begintime, endtime ) values (appseq.nextval, sysdate, 'test', 'kxzx', 5, 'f的f', '22d6啊asd', 'efwq226啊', TO_DATE('2015-05-31 15:15', 'yyyy-MM-dd hh24:mi'), TO_DATE('2015-06-03 15:15', 'yyyy-MM-dd hh24:mi'))";
		// userdao.update(sql);
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = JDBCTools.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTools.releaseDB(null, preparedStatement, connection);
		}
	}

	@Test
	public void testInsertTab() {
		String sql = "insert into applicationtab (app_uid, applydate, applyname, appdept, appoffice, appcount,"
				+ " beginpoint, destination, reason, begintime, endtime ) values (appseq.nextval, sysdate,"
				+ " ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd hh24:mi'), TO_DATE(?, 'yyyy-mm-dd hh24:mi'))";
		DAO.update(sql, "test", "kxzx", "铁岭市公司", 5, "nicai", "到了",
				"wan", "2105-06-05 11:11", "2105-06-05 11:11");
	}
	
	/**
	 * 
	 */
	@Test
	public void testRegex(){
		String str = "q124567";
		String i="";
		if(str.matches("\\d+$"))
			i+="a";
		if(str.matches("?!^[a-zA-Z]+$"))
			i+="b";
		if(str.matches("(?!^[_#@]+$).{8,}"))
			i+="c";
		System.out.println(""+"a");
		System.out.println("str :"+i);
		System.out.println(str.matches("(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[_#@]+$).{8,}"));
	}
}
