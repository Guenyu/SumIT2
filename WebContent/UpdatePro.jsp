<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<jsp:useBean id="ui" class="project.UserInFo"></jsp:useBean>
<jsp:setProperty property="*" name="ui"/>
<%
	UserInFoDao ud = UserInFoDao.getInstance();
	int result = ud.update(ui);
	if (result > 0) {
%>
		<script type="text/javascript">
			alert("수정 완료");
			location.href="Mypage.jsp";
		</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("실패 !");
			history.go(-1);
		</script>
<%
	}
%>
</body>
</html>