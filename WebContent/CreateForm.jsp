<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="comm.css">
<script type="text/javascript">
	function chk(n) {
		if (n == 1) {
			frm.action = "CreatePro.jsp";
		}
		/* 		if (n==2){
		 frm.action = ("Daum.jsp");
		 } */
		return true;
	}
</script>
</head>
<link type="text/css" rel="stylesheet" href="comm.css">
</head>
<body bgcolor="gray">
	<div id="Menu1">
		<img alt="" src="images/CheckMatelogo.png" width="15%">
	</div>
	<p id="u199-4">Check-Mate</p>
	<div id="u197-9">
		<p>CHECK-MATE is a real time To-Do list what is based on SNS.</p>
		<p>Group up and meets up together with our AWESOME service!
		<p>
		<p id="u197-5">&nbsp;</p>
		<p id="u197-7">Present by team SUMIT</p>
	</div>
	<form name="frm" onsubmit="return chk(n)">
		<div id="createForm2">
			<table>
				<tr>
					<td>E-mail</td>
					<td><input type="email" name="email" required="required"
						maxlength="30" placeholder="E-Mail"></td>
					<td>&nbsp; <input type="button" value="Redundancy check"
						onclick="emailcheck()" required="required"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="ID" required="required"
						maxlength="15" placeholder="아이디"></td>
					<td>&nbsp; <input type="button" value="Redundancy check"
						onclick="IDCheck()" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" required="required"
						maxlength="20" placeholder="이름"></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name="password" required="required"
						maxlength="30" placeholder="암호"></td>
				</tr>
				<tr>
					<td>암호 확인</td>
					<td><input type="password" name="VarifyingPassword"
						required="required" maxlength="30" placeholder="암호 확인"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="tel" name="phone" required="required"
						maxlength="20" placeholder="연락처"></td>
				</tr>
				<tr>
					<td colspan="2"><button onclick="chk()">확인</button></td>
					<td><button onclick="location.href='Cover.jsp'">돌아가기</button></td>
				</tr>
			</table>
		</div>
	</form>
</body>

</html>