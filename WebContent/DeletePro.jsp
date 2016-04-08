<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
	String email=(String)session.getAttribute("email");
	String password = request.getParameter("password");
	UserInFoDao ud = UserInFoDao.getInstance();
	int chk = ud.loginchk(email, password); 
	if (chk == 1) { 
	   int result = ud.delete(email);
	   if (result > 0) {
	      session.invalidate();
%>
   <script type="text/javascript">
      alert("안녕히....ㅠㅠ");
      location.href = "Cover.jsp";
   </script>
<%
		} else {
%>
   <script type="text/javascript">
      alert("허걱 에러ㅠㅜ");
      history.go(-1);
   </script>
<%
   		}
   	} else {
%>
   <script type="text/javascript">
      alert("비밀번호가 다릅니당!");
      history.go(-1);
   </script>
<%
   }
%>
</body>
</html>