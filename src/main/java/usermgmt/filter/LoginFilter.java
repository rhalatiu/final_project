package usermgmt.filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/profile"})
public class LoginFilter extends HttpFilter{
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        Object aUsr = req.getSession().getAttribute("authenticatedUser");
        if (aUsr != null){
            chain.doFilter(req, res);
        } else {
            res.sendRedirect(req.getAuthType() + "/singin");
        }
    }

    @Override
    public void destroy() {

    }
}
