<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		${email}님 환영합니다
		<h2>메뉴</h2>
		<ul>
			<li><a href="Main.jsp">홈</a></li>
			<li><a href="List.jsp">내 예약 일정</a></li>
			<li><a href="UpdateForm.do">개인 정보 수정</a></li>
			<li><a href="DeleteForm.jsp">탈퇴</a></li>
			<li><a href="logout.jsp">로그아웃</a></li>
		</ul>
</body>
</html>