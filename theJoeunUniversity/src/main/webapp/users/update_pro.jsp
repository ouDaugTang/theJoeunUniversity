<%@page import="admin.Service.UserServiceImpl"%>
<%@page import="admin.Service.UserService"%>
<%@page import="admin.DTO.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 필요한 정보 : 번호, 제목, 작성자, 내용
String reqNo = request.getParameter("no");
int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
String studentid = request.getParameter("studentid");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String mail = request.getParameter("mail");
String academicstatus = request.getParameter("academicstatus");
String dno = request.getParameter("dno");

Users users = new Users(studentid, name, birth, mail, academicstatus, Integer.parseInt(dno));
users.setUno(no);

UserService userService = new UserServiceImpl();
int result = userService.update(users);

String root = request.getContextPath();
if (result > 0) {
	//수정성공
	response.sendRedirect(root + "/users/userslist.jsp");
} else {
	//수정실패
	response.sendRedirect(root + "/users/update.jsp?msg=" + no + "&msg=0");
}
%>