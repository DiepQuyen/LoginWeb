<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
  HttpSession sessionLogout = request.getSession(false);
  if (sessionLogout != null) {
    sessionLogout.invalidate();
  }
  response.sendRedirect("login.jsp");
%>