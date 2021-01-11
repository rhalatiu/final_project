package usermgmt.servlet;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/logout"})
public class LogOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final Logger logger = LogManager.getLogger();

    public LogOutServlet(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if(session != null){
            Cookie cookieEmail = new Cookie("cookieUserSignin", null);
            Cookie cookiePassword = new Cookie("cookieSigninPassword", null);
            cookieEmail.setMaxAge(0);
            cookiePassword.setMaxAge(0);
            resp.addCookie(cookieEmail);
            resp.addCookie(cookiePassword);
            HttpSession httpSession = req.getSession();
            httpSession.invalidate();
            req.setAttribute("msg", "You have successfully logged out.");
            System.out.println("log out complete");
            logger.warn("log out complete");
            resp.sendRedirect(req.getContextPath());
        }
    }
}
