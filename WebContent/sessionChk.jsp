<%
	String id = (String)session.getAttribute("id");
	if (id == null || id == "") {
		response.sendRedirect("LoginForm.jsp");
	}
%>