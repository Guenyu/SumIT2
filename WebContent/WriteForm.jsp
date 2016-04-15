<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="comm.css">
</head>
<body>
	<%	int seq=1;
		String email = request.getParameter("email");
		String year = request.getParameter("year");
		
	%>
	<form action="WritePro.jsp" method="post">
		<input type="hidden" name="writer" value="<%=email%>">
<%-- 		
		<input type="hidden" name="ref" value="<%=ref%>">
		<input type="hidden" name="re_step" value="<%=re_step%>">
		<input type="hidden" name="re_level" value="<%=re_level%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>"> --%>
		<table border="1">
			<caption>일정 작성</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" required="required" name="title"
					autofocus="autofocus"></td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
				
				<input type="date" name="Reg_date" required="required">~
				<input type="date" name="date1" required="required"></td>
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