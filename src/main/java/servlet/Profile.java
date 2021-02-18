package servlet;

import jpa.service.DBUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/profil"})
public class Profile extends HttpServlet {
    DBUser userInfo = new DBUser();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies != null){
            for (Cookie ck : cookies){
                if (ck.getName().equals("cookieUserSignin")){
                    String value = ck.getValue();
                    System.out.println(value);
                    String firstName = userInfo.getUsersFirstName(value);
                    System.out.println(firstName);

                    req.setAttribute("firstNameProfile", firstName);
                }
            }
        }
        req.getRequestDispatcher("/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
