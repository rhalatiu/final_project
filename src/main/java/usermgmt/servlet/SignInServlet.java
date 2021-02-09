package usermgmt.servlet;


import jpa.service.DBUser;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/signin"})
public class SignInServlet extends HttpServlet {
    private DBUser signInDBUser;

    @Override
    public void init() throws ServletException {
        super.init();
        signInDBUser = new DBUser();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            authenticate(req, resp);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    private void authenticate(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = null;

        if (((user = signInDBUser.validate(email, password)) != null) && (email != null && password != null)){
            req.getSession().setAttribute("authenticatedUser", user);
            String value = req.getParameter("rememberMe");
            boolean remeberMe = false;
            if (value != null && value.equalsIgnoreCase("on")){
                remeberMe = true;
            }
            if (remeberMe){
                Cookie cookieEmail = new Cookie("cookieUserSignin", email);
                cookieEmail.setMaxAge(60 * 60 * 24 * 365);
                resp.addCookie(cookieEmail);
                System.out.println(cookieEmail);
                System.out.println("trecut de cookie");
            }
            RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
            dispatcher.forward(req, resp);
        }else{
            req.setAttribute("errorMsg", "Invalid credentials!");
            throw new Exception("Login not successful");
        }
    }
}
