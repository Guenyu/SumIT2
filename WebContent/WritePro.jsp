<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="project.Schedule2"/>
<jsp:setProperty property="*" name="user"/>
<%	
	ScheduleDao2 SDao = ScheduleDao2.getInstance();
	int result = SDao.insert(user);
	if (result >0) {
	%>
	<script type="text/javascript">
		location.href="List.jsp?seq=<%=user.getSeq()%>&title=<%=user.getTitle()%>"
		+"&content=<%=user.getContent()%>&writer=<%=user.getWriter()%>"
		+"&reg_date1=<%=user.getReg_date1()%>&reg_date2=<%=user.getReg_date2()%>"
	</script>
	<% } else { %>
<script type="text/javascript">
	alert("잘해 !");  history.go(-1);
</script>
<% } %>
</body>
</html>