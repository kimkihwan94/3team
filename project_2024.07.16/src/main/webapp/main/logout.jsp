<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
session.removeAttribute("id");
response.sendRedirect("main.jsp");
%>