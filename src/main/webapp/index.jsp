<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a103af3209.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        .bg {
            /* The image used */
            background-image: url("images/homepage.jpg");

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .text-block {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background-color: black;
            color: white;
            padding-left: 20px;
            padding-right: 20px;
        }
    </style>

</head>
<body>
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
<div class="bg">
    <div class="centered">
        <span class="border">
            <h1>Bine ati venit!</h1>
        </span>
    </div>
</div>


</body>
</html>