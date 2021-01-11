package usermgmt.servlet;

import model.User;
import jpa.service.DBUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/signup"})
public class SignUpServlet extends HttpServlet {
    private DBUser dbUser;

    @Override
    public void init() throws ServletException {
        super.init();
        dbUser = new DBUser();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String passwordCheck = req.getParameter("confirm_password");

        if (password != null && passwordCheck != null){
            if (!password.equals(passwordCheck)){
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("signup.jsp");
                requestDispatcher.include(req, resp);
            } else {
                User user = new User();
                //user.setId(UUID.randomUUID());
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPassword(password);

                dbUser.addUser(user);

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("signupsuccess.jsp");
                requestDispatcher.include(req, resp);
            }
        }
    }
}