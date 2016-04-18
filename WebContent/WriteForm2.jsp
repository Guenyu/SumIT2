<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="comm.css">
</head>
<body>
	<%
		int num = 0, ref = 0, re_step = 0, re_level = 0;
		email = request.getParameter("email");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		UserInFoDao bd = UserInFoDao.getInstance();
		/* UserInFo board = bd.select(num); */
	%>
	<form action="WritePro.jsp" method="post">
		<input type="hidden" name="email" value="<%=email%>">
		<%-- 		
		<input type="hidden" name="ref" value="<%=ref%>">
		<input type="hidden" name="re_step" value="<%=re_step%>">
		<input type="hidden" name="re_level" value="<%=re_level%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>"> --%>
		<table border="1">
			<caption>일정 작성</caption>
			<tr>
				<th>작성자:</th>
				<td><input type="text" name="writer" required="required"
					name="writer" value="<%=email%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" required="required" name="title"></td>
			</tr>
			<tr>
				<th>일정</th>
				<td><input type="text" name="reg_date1" value="<%=year%> - <%=month%> - <%=date%>">~
				 <input type="date" name="reg_date2" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="40" name="content"
						required="required"></textarea></td>
			</tr>
			<!-- 		<tr>
				<th>공개설정</th>
				<td><input type="radio" name="type1">공개<input
					type="radio" name="type1">비공개</td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="password" required="required"></td>
			</tr> -->
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>