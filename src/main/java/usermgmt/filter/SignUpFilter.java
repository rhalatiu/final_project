package usermgmt.filter;


import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebFilter(urlPatterns = {"/signup"})
public class SignUpFilter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        Cookie[] cookies = req.getCookies();
        if (cookies != null){
            if (Arrays.stream(cookies).anyMatch(x -> x.getName().equals("cookieUserSignin"))){
                res.sendRedirect(req.getContextPath() + "/profil");
            } else {
                chain.doFilter(req, res);
            }
        }
    }


    @Override
    public void destroy() {

    }
}
