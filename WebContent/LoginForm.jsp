<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="comm.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body bgcolor="gray">
	<div id="Menu1">
		<img alt="" src="images/CheckMatelogo.png" width="15%"
			onclick="location.href='Cover.jsp'">
	</div>
	<p id="u199-4">Check-Mate</p>
	<div id="u197-9">
		<p>CHECK-MATE is a real time To-Do list what is based on SNS.</p>
		<p>Group up and meets up together with our AWESOME service!
		<p>
		<p id="u197-5">&nbsp;</p>
		<p id="u197-7">Present by team SUMIT</p>
	</div>
		<form name="frm" action="LoginPro.do">
			<table id="tableCenter">
				<tr>
					<td><input type="text" required="required" name="email"
						placeholder="E-mail"></td>
				</tr>
				<tr>
					<td><input type="password" required="required" name="password"
						placeholder="PASSWORD"></td>
				</tr>
				<tr>
					<td><p></p></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="다음"></td>
				</tr>
			</table>
		</form>
</body>
</html>