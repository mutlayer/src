<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%!boolean isIdExist = false;%>
<%
	// 요청시 한글 처리
	request.setCharacterEncoding("UTF-8");

	// 요청시 한글처리
	response.setContentType("text/html;charset=UTF-8");

	// 요청한 곳으로부터 파라미터 받기
	String u_id = request.getParameter("id");
	String u_pwd = request.getParameter("pwd");

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String tableName = "account";
	String sql = "";

	try {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/hsdata01?characterEncoding=EUCKR";
		String db_id = "root";
		String db_pw = "test1234";
		con = DriverManager.getConnection(url, db_id, db_pw);

		st = con.createStatement();

		sql = "SELECT id,pwd,name,phone FROM " + tableName
				+ " WHERE id='" + u_id + "'";
		rs = st.executeQuery(sql);

		System.out.println(sql);

		while (rs.next()) {
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String msg = "";
			
			System.out.println(u_id);
			
			if (id.equals(u_id)) {
				System.out.println("pwd = "+pwd);
				System.out.println("u_pwd = "+u_pwd);
				isIdExist = true;
				if (pwd.equals(u_pwd)) {
					out.println(name + "님 로그인되었습니다. 환영합니다.");
					/* msg = name+ "님 로그인되었습니다. 환영합니다.";
					session.setAttribute("id", id);
					session.setAttribute("pwd", pwd);
					session.setAttribute("name", name);
					session.setAttribute("phone", phone);
					session.setAttribute("msg", msg);
					response.sendRedirect("editUser.jsp"); */
				} else {
					out.println("비밀번호가 틀렸습니다.");
				}
			}
		}
		if (!isIdExist) {
			out.println("아이디가 틀렸습니다.");
		}

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	try {
		if (rs != null)
			rs.close();
		if (st != null)
			st.close();
		if (con != null)
			con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>