package servlet;

import jpa.service.DBProducts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/orderSent"})
public class OrderSent extends HttpServlet {
    DBProducts dbProducts = new DBProducts();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        String[] cartProduct = null;
        String[] cartProductNo = null;

        if (cookies != null) {
            for (Cookie ck : cookies) {
                if (ck.getName().equals("cart")) {
                    String cart = ck.getValue();
                    cartProduct = cart.split("/");
                }

                if (ck.getName().equals("cartNo")) {
                    String cart = ck.getValue();
                    cartProductNo = cart.split("/");
                }
            }

            if (cartProduct != null && cartProductNo != null) {
                int index = 0;

                for (String product : cartProduct) {
                    int number = dbProducts.findNumberOfProductByName(product);
                    number = number - Integer.parseInt(cartProductNo[index]);

                    dbProducts.updateNumberOfProductByName(number, product);

                    index++;
                }
            }

            for (Cookie ck : cookies) {
                if (ck.getName().equals("cart")) {
                    Cookie cookie = new Cookie("cart", null);
                    cookie.setMaxAge(0);
                    resp.addCookie(cookie);
                }

                if (ck.getName().equals("cartNo")) {
                    Cookie cookie = new Cookie("cartNo", null);
                    cookie.setMaxAge(0);
                    resp.addCookie(cookie);
                }
            }
        }
    }
}
