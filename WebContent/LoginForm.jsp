<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="comm.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="loginForm1">
<img alt="" src="images/CheckMatelogo.png" width="200" height="200" onclick="location.href='Cover.jsp'">
</div>
<div id="loginForm2">
<form name="frm" action="LoginPro.do">
<table>
<tr><td><input type="text" required="required" name="email" placeholder="E-mail"></td></tr>
<tr><td><input type="password" required="required" name="password" placeholder="PASSWORD"></td></tr>
<tr><td><p></p></td></tr>
<tr><td align="center" colspan="2"><input type="submit" value="다음"></td></tr>
</table>
</form>
</div>
</body>
</html>