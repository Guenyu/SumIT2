package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.*;
public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		
		UserInFoDao uf=UserInFoDao.getInstance();
		int result=uf.loginchk(email, password);
		
		if (result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("email", name);
	
		return "LoginPro.jsp";
	}

}
