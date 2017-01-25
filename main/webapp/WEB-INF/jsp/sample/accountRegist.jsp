<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Map"%>

<%
	out.println("accountRegist");
	//String u_id = request.getParameter("id");
	//out.println(request.getParameter("email"));
	Map x = (Map)request.getAttribute("map");	
	out.println(x);
%>

