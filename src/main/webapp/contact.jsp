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
    <title>Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a103af3209.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/contact.css">
    <script>
        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for(var i = 0; i <ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
        $(".dropdown-menu dropdown-menu-right").result(function (event) {
            var withSignIn = () => {
                return (`<form class="px-4 py-3" method="post" action="signin">
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
            <a class="dropdown-item" href="<c:out value="${pageContext.request.contextPath}"/>/signup">New around here? Sign up</a>`);
            }
            var withoutSignIn = () => {
                return(``);
            }

            if (getCookie("cookieUserSignin") === "cookieUserSignin") {
                return withoutSignIn;
            } else {
                return withSignIn;
            }
        })
    </script>
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
                        <a class="dropdown-item" href="<c:out value="${pageContext.request.contextPath}"/>/profil">Profilul meu</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<c:out value="${pageContext.request.contextPath}"/>/signup">Cont nou</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:out value="${pageContext.request.contextPath}"/>/cos"><i class="fas fa-shopping-cart"></i> Cosul meu</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="introText">
        <b>Despre noi</b>
        <p>Infiintata in anul 2015, ferma de arbusti fructiferi - mure, soiul Thornfree si zmeura soiurile Tulamen si Glen Ample.</p><br />
        <b>Ce ne reprezinta?</b>
        <p>Oferim clientilor fructe proaspete, de cea mai buna calitate, produse in sistem bio (fertilizate cu ingrasamant organic si tratate cu substante organice). De asemenea, oferim clientilor material saditor - butasi de mure si drajoni de zmeura, calificati din puncte de vedere fitosanitar, de autenticitate si calitate a materialului de inmultire. </p><br />
        <p>Va asteptam!</p><br />
        </div>
    <div>
                    <div class="contacts"><i class="fas fa-map-marker"> Strada Dealul Brezii</i></div><br />
                    <div class="contacts"><i class="fas fa-phone"> 0748959830</i></div><br />
                    <div class="contacts">
                        <a href="mailto:halatiuradu@gmail.com" style="color:blue"><i class="far fa-envelope"> halatiuradu@gmail.com</i></a><br />
                    </div><br />
                    <div class="contacts"><i class="fas fa-user-alt"> Radu Halatiu</i></div><br />
                    <div class="contacts">
                    <a class="btn" role="button" href="https://www.facebook.com/murealamarin/" style="color:blue"><i class="fab fa-facebook"> Mure a la Marin</i></a><br />
                    </div>
                </div>
    <div class="frame">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2732.530101004851!2d24.654449315565707!3d46.77415797913821!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDbCsDQ2JzI3LjAiTiAyNMKwMzknMjMuOSJF!5e0!3m2!1sro!2sro!4v1609318302178!5m2!1sro!2sro" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
            <div>
        <iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2FMure-a-la-Marin-290482084846846&width=450&layout=standard&action=like&size=small&share=true&height=35&appId" width="450" height="35" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
    </div>
    </body>
</html>
