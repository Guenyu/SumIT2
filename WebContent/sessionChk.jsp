<%
	String email = (String)session.getAttribute("email");
	if (email == null || email == "") {
		response.sendRedirect("LoginAction.java");
	}
%>