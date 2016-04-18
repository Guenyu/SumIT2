<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" errorPage="DBError.jsp"%>
<!DOCTYPE html >
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%	String ID = request.getParameter("ID");	

%>
<script type="text/javascript">
	function cl() {
		opener.frm.ID.value="<%=ID%>";
		window.close();
	}
</script>
</head><body>
<%	UserInFoDao ud = UserInFoDao.getInstance();
	int result   = ud.IDCheck(ID);
	if (result == 1) { %>
		<%=ID %>은(는) 이미 사용 중입니다.<p>
		<form>
			ID : <input type="text" name="ID"><p>
			<input type="submit" value="확인" autofocus="autofocus">
		</form>	
<% } else { %>
	<%=ID %>은(는) 사용할 수 있습니다.
	<button onclick="cl()">창닫기</button>
<% } %>
</body>
</html>


