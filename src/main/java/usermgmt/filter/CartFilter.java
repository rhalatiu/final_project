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

@WebFilter(urlPatterns = {"/cos"})
public class CartFilter extends HttpFilter {
    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        Cookie[] cookies = req.getCookies();
        if (cookies != null){
            if (Arrays.stream(cookies).anyMatch(x -> x.getName().equals("cookieUserSignin"))){
                chain.doFilter(req, res);
            } else {
                res.sendRedirect(req.getContextPath() + "/signin");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
