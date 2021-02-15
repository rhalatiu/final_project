package servlet;

import jpa.service.DBProducts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns = {"/cos"})
public class Cart extends HttpServlet {
    private static final String CART = "cart";
    private static final String CARTNO = "cartNo";
    DBProducts dbProducts = new DBProducts();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if (cookies != null){

            List<Integer> prices = new ArrayList<Integer>();

            for (Cookie cookie : cookies){
                if (cookie.getName().equals("cart")){
                    String cart = cookie.getValue();
                    String[] cartProduct = cart.split("/");

                    List<String> temporary = new LinkedList<String>(Arrays.asList(cartProduct));
                    temporary.add(0, "Numele Produsului");
                    temporary.add("Numele Produsului");
                    cartProduct = temporary.toArray(new String[temporary.size()]);

                    req.setAttribute("selectedProducts", cartProduct);

                    for (String product : cartProduct){
                        if (!product.equals("Numele Produsului") && !product.equals("")) {
                            int price = dbProducts.findProductPriceByName(product);
                            prices.add(price);
                        }
                    }
                }

                if (cookie.getName().equals("cartNo")){
                    String cartNo = cookie.getValue();
                    String[] cartNoProduct = cartNo.split("/");

                    List<String> temporary = new LinkedList<String>(Arrays.asList(cartNoProduct));
                    temporary.add(0, "Cantitate");
                    temporary.add("Total");
                    cartNoProduct = temporary.toArray(new String[temporary.size()]);

                    req.setAttribute("selectedProductNo", cartNoProduct);

                    int index = 0;
                    int[] arrayPrices = prices.stream().mapToInt(Integer::intValue).toArray();
                    List<String> priceAsString = new ArrayList<>();
                    priceAsString.add("Pret");

                    int total = 0;

                    for (String no : cartNoProduct){
                        if(!no.equals("Cantitate") && !no.equals("Total")) {
                            arrayPrices[index] = arrayPrices[index] * Integer.parseInt(no);
                            priceAsString.add(String.valueOf(arrayPrices[index]));

                            total += arrayPrices[index];
                            index++;
                        }
                    }
                    priceAsString.add(String.valueOf(total));

                    req.setAttribute("selectedPrices", priceAsString);

                }
            }
        }
        //req.setAttribute("selectedProducts", dbProducts.findSelectedProducts());
        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            //for (int i = 0; i < cookies.length; i++) {
             //   writer.println("Name: " + cookies[i].getName() + "; Value: " + cookies[i].getValue());
                //req.getCookies(); asta ii pentru add to cart
           // }
            for (Cookie cookie : cookies){
                if (cookie.getName().equals("cart")){
                    writer.write("Name="+cookie.getName()+", Value="+cookie.getValue());

                }
            }
        }
    }
}
