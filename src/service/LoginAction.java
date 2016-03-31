package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.*;
public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		
		UserInFoDao uf=UserInFoDao.getInstance();
		int result=uf.loginchk(email, password);
		
		request.setAttribute("result", result);
		request.setAttribute("email", name);
	
		return "LoginPro.jsp";
	}

}
