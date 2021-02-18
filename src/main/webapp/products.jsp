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
        </c:forEach>
    </div>
</div>
</body>
</html>