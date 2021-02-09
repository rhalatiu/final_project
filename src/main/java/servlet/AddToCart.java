package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = {"/adauga"})
public class AddToCart extends HttpServlet {
    private static final String CART = "cart";
    private static final String CARTNO = "cartNo";

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newCookieValue = "";
        Cookie[] cookies = req.getCookies();
        String produs = req.getParameter("produs");
        int index = 0;
        int flag = 0;

        if (!Arrays.stream(cookies).anyMatch(x -> x.getName().equals(CART))) {
            Cookie cookie = new Cookie(CART, produs);
            resp.addCookie(cookie);
            Cookie cookieNo = new Cookie(CARTNO, "1");
            resp.addCookie(cookieNo);
        }
//        cookies = req.getCookies();
        //System.out.println(produs);
        for (Cookie ck : cookies){

          //  if (CART.equals(ck.getName())){
//                String value = ck.getValue();
//                System.out.println(value);
//                Map<String, String> map = Arrays.stream(value.substring(1, value.length() - 1).split(","))
//                        .map(s -> s.split("="))
//                        .collect(Collectors.toMap(a -> a[0], a -> a.length>1? a[1]: ""));
//                String cantitateString = map.get(produs);
//                if (cantitateString == null){
//                    map.put(produs, String.valueOf(1));
//                } else {
//                    Integer cantitate = Integer.parseInt(map.get(produs));
//                    map.put(produs, String.valueOf(cantitate + 1));
//                }
//
//                newCookieValue = map.toString().replaceAll(", ", "/");
//                System.out.println(newCookieValue);
//                break;
                if(ck.getName().equals(CART)){
                    index = 0;
//                    if(ck.getValue().isEmpty()){
//                        Cookie cookie = new Cookie(CART, "{" + produs + "}");
//                        resp.addCookie(cookie);
//                        Cookie cookieNo = new Cookie(CARTNO, "{1}");
//                        resp.addCookie(cookieNo);
//                        flag = 0;
//                        ck.setValue("{" + produs + "}");
//                    } else {
                        if(ck.getValue().contains(produs)){
                            flag = 1;
                            if (ck.getValue().contains("/")){
                                List<String> cookieList = Arrays.asList(ck.getValue().split("/", -1));
                                for (String produsCookie : cookieList) {
                                    if (!produsCookie.equals(produs)){
                                        index++;
                                    } else {
                                        break;
                                    }
                                }
                          }
                        } else {
                            flag = 2;
                            ck.setValue(ck.getValue() + "/" + produs);
                            resp.addCookie(ck);
                        }
                  //  }
                }
                if(ck.getName().equals(CARTNO)){
//                    if(flag == 0){
//                        ck.setValue("{1}");
//                    } else
                    if (flag == 1) {

                        List<String> cookieValueList = Arrays.asList(ck.getValue().split("/", -1));
                        cookieValueList.set(index, String.valueOf(Integer.parseInt(cookieValueList.get(index)) + 1));

                        String reconstruct = "";
                        for(String value : cookieValueList){
                            reconstruct += value + "/";
                        }

                        reconstruct = reconstruct.substring(0, reconstruct.length() - 1);
                        ck.setValue(reconstruct);

                        resp.addCookie(ck);

                    } else if (flag == 2){
                        ck.setValue(ck.getValue() + "/1");

                        resp.addCookie(ck);
                    }
                }
            //}
        }

    }
}
