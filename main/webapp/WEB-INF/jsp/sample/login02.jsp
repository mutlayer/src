<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Map"%>

<%
	out.println("login02");
	//String u_id = request.getParameter("id");
	//out.println(request.getParameter("email"));
	Map x = (Map)request.getAttribute("map");	
	out.println(x.get("id"));
	out.println(x.get("pwd"));
	out.println(x.get("email"));
	out.println(x.get("name"));
	out.println(x.get("phone"));
%>

