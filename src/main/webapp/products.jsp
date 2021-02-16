<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: halat
  Date: 09-Dec-20
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Products</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a103af3209.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/products.css">
    <script> function addToCart(id){
        var request = new XMLHttpRequest();
        var url = '<c:out value="${pageContext.request.contextPath}"/>/adauga?produs=' + id ;
        try {
            console.log("value= " + id)
            request.open("POST", url);
            request.send();
        } catch (e) {
            alert("Unable to connect to server");
        }
    }
    </script>
</head>
<body>
<%Cookie[] cookies=request.getCookies();
    String product="";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("product")) {
                product=cookie.getValue();
            }
        }
    }
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <a class="navbar-brand" href="${pageContext.request.contextPath}"/>
    <img src="images/logo.jpg" height="50" alt="Brand">
    </a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="<c:out value="${pageContext.request.contextPath}"/>">Acasa</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:out value="${pageContext.request.contextPath}"/>/produse">Produse</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:out value="${pageContext.request.contextPath}"/>/contact">Contact</a>
        </li>
    </ul>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"><i class="far fa-user-circle"></i> Profil</a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <form class="px-4 py-3" method="post" action="signin">
                        <div class="form-group">
                            <label for="exampleDropdownFormEmail1">Email address</label>
                            <input type="email" class="form-control" name="email" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Password</label>
                            <input type="password" class="form-control" name="password" id="exampleDropdownFormPassword1" placeholder="Password">
                        </div>
                        <div class="form-check">
                            <input type="checkbox" name="rememberMe" class="form-check-input" id="dropdownCheck">
                            <label class="form-check-label" for="dropdownCheck">
                                Remember me
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<c:out value="${pageContext.request.contextPath}"/>/signup">New around here? Sign up</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<c:out value="${pageContext.request.contextPath}"/>/profil">Profile Page</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:out value="${pageContext.request.contextPath}"/>/cos"><i class="fas fa-shopping-cart"></i> Cosul meu</a>
            </li>
        </ul>
    </div>
</nav>
<div>
<%--    <form name="addToCart" method="post">--%>
<div class="card-columns text-center ml-5 mr-4">
    <c:forEach items="${allProducts}" var="product">
        <div class="card">
            <c:choose>
            <c:when test="${product.productImage == null}">
                <img class="card-img-top" src="images/default.jpg" alt="Default">
            </c:when>
            <c:otherwise>
                <img class="card-img-top" src="images/<c:out value="${product.productImage}" />" alt="<c:out value="${product.productName}" />">
            </c:otherwise>
        </c:choose>
            <div class="card-body" id="<c:out value="${product.productName}" />">
                <h5 class="card-title"><c:out value="${product.productName}" /></h5>
                <p class="card-text"><c:out value="${product.productPrice}" /> RON/kg</p>
                <button onclick="addToCart(this.parentNode.id)" class="btn btn-primary">Adauga in cos</button>
            </div>
        </div>
<%--        <c:if test="${rowCounter.count % 5 == 0||rowCounter.count == fn:length(values)}">--%>
<%--        </tr>--%>
<%--        </c:if>--%>
    </c:forEach>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/mure.jpg" alt="Mure">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Mure</h5>--%>
<%--            <p class="card-text">20 RON/kg</p>--%>
<%--            <button class="btn btn-primary" name="mure" value="product" type="submit">Adauga in cos</button>--%>
<%--&lt;%&ndash;            <a class="btn btn-primary" name="mure" type="submit">Adauga in cos</a>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/zmeura.jpg" alt="Zmeura">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Zmeura</h5>--%>
<%--            <p class="card-text">25 RON/kg</p>--%>
<%--            <button class="btn btn-primary" name="zmeura" value="product" type="submit">Adauga in cos</button>--%>
<%--&lt;%&ndash;            <a class="btn btn-primary" name="zmeura" type="submit">Adauga in cos</a>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/capsuni.jpg" alt="Capsuni">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Capsuni</h5>--%>
<%--            <p class="card-text">10 RON/kg</p>--%>
<%--            <button class="btn btn-primary" name="capsuni" value="product" type="submit">Adauga in cos</button>--%>
<%--&lt;%&ndash;            <a class="btn btn-primary" name="capsuni" type="submit">Adauga in cos</a>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="card-deck text-center mt-4 ml-5 mr-2">--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/afine.jpg" alt="Afine">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Afine</h5>--%>
<%--            <p class="card-text">20 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/agrise.jpg" alt="Agrise">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Agrise</h5>--%>
<%--            <p class="card-text">15 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/caise.jpg" alt="Caise">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Caise</h5>--%>
<%--            <p class="card-text">7 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="card-deck text-center mt-4 ml-5 mr-2">--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/cirese.jpg" alt="Cirese">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Cirese</h5>--%>
<%--            <p class="card-text">35 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/coacaze.jpg" alt="Coacaze">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Coacaze</h5>--%>
<%--            <p class="card-text">12 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/visine.jpg" alt="Visine">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Visine</h5>--%>
<%--            <p class="card-text">10 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="card-deck text-center mt-4 ml-5 mr-2">--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/mereverzi.jpg" alt="Mere Verzi">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Mere Verzi</h5>--%>
<%--            <p class="card-text">5 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/meregolden.jpg" alt="Mere Golden">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Mere Golden</h5>--%>
<%--            <p class="card-text">5.5 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/mererosii.jpg" alt="Mere Rosii">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Mere Rosii</h5>--%>
<%--            <p class="card-text">6 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="card-deck text-center mt-4 ml-5 mr-2 mb-4">--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/pere.jpg" alt="Pere">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Pere</h5>--%>
<%--            <p class="card-text">7.5 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/prune.jpg" alt="Prune">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Prune</h5>--%>
<%--            <p class="card-text">8 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="card">--%>
<%--        <img class="card-img-top" src="images/struguri.jpg" alt="Struguri">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Struguri</h5>--%>
<%--            <p class="card-text">11 RON/kg</p>--%>
<%--            <a href="#" class="btn btn-primary">Adauga in cos</a>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
<%--    </form>--%>
</div>
</body>
</html>
