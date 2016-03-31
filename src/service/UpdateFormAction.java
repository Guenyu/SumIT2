package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.UserInFo;
import project.UserInFoDao;
public class UpdateFormAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
		UserInFoDao ud = UserInFoDao.getInstance();
		UserInFo ui = ud.select(email);
		request.setAttribute("ui", ui);
		return "UpdateForm.jsp";
	}
}