<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="comm.css">
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호를 다시 입력하세요");
			frm.password.value="";
			frm.password2.value="";
			frm.password.focus();
			return false;
		}
		return true;
	}
</script></head>
<body>
<form action="UpdatePro.jsp" name="frm" onsubmit="return chk()">
<table border="1">
	<caption>정보 수정</caption>
	<tr><th>E-mail</th><td>${ui.email}<input type="hidden" name="email" value="${ui.email}"></td></tr>
	<tr><th>Password</th><td><input type="password" name="password" required="required" placeholder="password" value="${ui.password}"></td></tr>
	<tr><th>Password</th><td><input type="password" name="password2" required="required" placeholder="password"></td></tr>
	<tr><th>Phone</th><td><input type="text" name="phone" required="required" placeholder="phone" value="${ui.phone}"></td></tr>
	<tr><th>Name</th><td><input type="text" name="name" required="required" value="${ui.name}"></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="확인"></td></tr>
</table></form>
</body>
</html>