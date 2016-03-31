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
<body>
<%-- 	
	<%
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
	%>
 --%>
	<img alt="" src="images/CMlogohomebt.png" width="100" height="100"
		onclick="location.href='Cover.jsp'" onmouseover="">
	<div id="createForm1">
		<img alt="" src="images/CMlogoom.png" width="200" height="200"
			onclick="location.href='Cover.jsp'">
	</div>
	<form name="frm" onsubmit="return chk(n)">
		<div id="createForm2">
			<table>
				<tr>
					<th>E-mail</th>
					<td colspan="2"><input type="email" required="required"
						placeholder="e-mail" name="email"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td colspan="2"><input type="password" name="password"
						required="required" placeholder="Password"></td>
				</tr>
				<tr>
					<th>Phone</th>
					<td colspan="2"><input type="tel" name="phone" maxlength="12"
						placeholder="phone" required="required"></td>
				</tr>
<%-- 				<tr>
					<th>주소</th>
					<td><input type="text" value="<%=addr1%>" name="addrs1" placeholder="주소"></td>
					<td><button onclick="chk(2)">주소검색</button></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td colspan="2"><input type="text" name="addrs2"value="<%=addr2%>"></td>
				</tr> --%>
				<tr>
					<th>Name</th>
					<td colspan="2"><input type="text" name="name"
						required="required" placeholder="Name" maxlength="10"></td>
				</tr>
<!-- 				<tr>
					<th>Gender</th>
					<td colspan="2" align="center"><input type="radio"
						name="gender" value="남" id="g1">남 &nbsp <input
						type="radio" name="gender" value="여" id="g2">여</td>
				</tr> -->
				<tr>
					<td colspan="3" align="center">
						<button onclick="chk(1)">확인</button> &nbsp
						<button onclick="location.href='Cover.jsp'">취소</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>

</html>