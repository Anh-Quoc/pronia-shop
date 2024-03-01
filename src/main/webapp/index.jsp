<%@ page import="entities.Plant" %>
<%@ page import="java.util.List" %>
<%@ page import="dtos.CartDTO" %>
<%@ page import="dtos.CartDetailDTO" %>
<!DOCTYPE html>
<html lang="zxx">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Pronia - Plant Store Bootstrap 5 Template</title>
    <meta name="robots" content="index, follow"/>
    <meta name="description"
          content="Pronia plant store bootstrap 5 template is an awesome website template for any home plant shop.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico"/>

    <!-- CSS
    ============================================ -->

    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/Pe-icon-7-stroke.css"/>
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.min.css"/>
    <link rel="stylesheet" href="assets/css/ion.rangeSlider.min.css"/>

    <!-- Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>
<div class="preloader-activate preloader-active open_tm_preloader">
    <div class="preloader-area-wrap">
        <div class="spinner d-flex justify-content-center align-items-center h-100">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>
</div>
<div class="main-wrapper">

    <!-- Begin Main Header Area -->
    <header class="main-header-area">
        <div class="header-top bg-pronia-primary d-none d-lg-block">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-6">
                        <div class="header-top-left">
                            <span class="pronia-offer">HELLO EVERYONE! 25% Off All Products</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="header-top-right">
                            <ul class="dropdown-wrap">
                                <li class="dropdown">
                                    <button class="btn btn-link dropdown-toggle ht-btn" type="button"
                                            id="currencyButton" data-bs-toggle="dropdown" aria-label="currency"
                                            aria-expanded="false">
                                        USD
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="currencyButton">
                                        <li><a class="dropdown-item" href="#">GBP</a></li>
                                        <li><a class="dropdown-item" href="#">ISO</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <button class="btn btn-link dropdown-toggle ht-btn" type="button"
                                            id="languageButton" data-bs-toggle="dropdown" aria-label="language"
                                            aria-expanded="false">
                                        English
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="languageButton">
                                        <li><a class="dropdown-item" href="#">French</a></li>
                                        <li><a class="dropdown-item" href="#">Italian</a></li>
                                        <li><a class="dropdown-item" href="#">Spanish</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-middle py-30">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <div class="header-middle-wrap position-relative">
                            <div class="header-contact d-none d-lg-flex">
                                <i class="pe-7s-call"></i>
                                <a href="tel://+00-123-456-789">+00 123 456 789</a>
                            </div>

                            <a href="home" class="header-logo">
                                <img src="assets/images/logo/dark.png" alt="Header Logo">
                            </a>

                            <div class="header-right">
                                <ul>
                                    <!-- <li>
                                        <a href="#exampleModal" class="search-btn bt" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                            <i class="pe-7s-search"></i>
                                        </a>
                                    </li> -->
                                    <li class="dropdown d-none d-lg-block">
                                        <button class="btn btn-link dropdown-toggle ht-btn p-0" type="button"
                                                id="settingButton" data-bs-toggle="dropdown" aria-label="setting"
                                                aria-expanded="false">
                                            <i class="pe-7s-users"></i>
                                        </button>

                                        <%
                                            boolean isAuthentication = false;
                                            Cookie[] cookies = request.getCookies();
                                            if (cookies != null) {
                                                for (Cookie cookie : cookies) {
                                                    if (cookie.getName().equals("customer_session_id")) {
                                                        isAuthentication = true;
                                                        break;
                                                    }
                                                }
                                            }
                                        %>

                                        <ul class="dropdown-menu" aria-labelledby="settingButton">
                                            <%
                                                if (isAuthentication) {
                                            %>
                                            <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                            <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                            <%} else {%>
                                            <li><a class="dropdown-item" href="login-register.jsp">Login |
                                                Register</a>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </li>
                                    <% if (isAuthentication) {%>
                                    <% CartDTO cartDTO = (CartDTO) request.getAttribute("cart");%>
                                    <li class="d-none d-lg-block">
                                        <a href="wishlist.html">
                                            <i class="pe-7s-like"></i>
                                        </a>
                                    </li>
                                    <li class="minicart-wrap me-3 me-lg-0">
                                        <a href="#miniCart" class="minicart-btn toolbar-btn">
                                            <i class="pe-7s-shopbag"></i>
                                            <span class="quantity"><%=cartDTO.getCartDetails().size()%></span>
                                        </a>
                                    </li>
                                    <%}%>
                                    <li class="mobile-menu_wrap d-block d-lg-none">
                                        <a href="#mobileMenu" class="mobile-menu_btn toolbar-btn pl-0">
                                            <i class="pe-7s-menu"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-menu position-relative">
                            <nav class="main-nav">
                                <ul>
                                    <li class="drop-holder">
                                        <a href="home">Home</a>
                                        <!-- <ul class="drop-menu">
                                            <li>
                                                <a href="index.jsp">Home One</a>
                                            </li>
                                            <li>
                                                <a href="index-2.html">Home Two</a>
                                            </li>
                                        </ul> -->
                                    </li>
                                    <li class="megamenu-holder">
                                        <a href="shop">Shop</a>
                                        <!-- <ul class="drop-menu megamenu">
                                            <li>
                                                <span class="title">Shop Layout</span>
                                                <ul>
                                                    <li>
                                                        <a href="shop.jsp">Shop Default</a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-grid-fullwidth.html">Shop Grid Fullwidth</a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-right-sidebar.html">Shop Right Sidebar</a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-list-fullwidth.html">Shop List Fullwidth</a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-list-left-sidebar.html">Shop List Left Sidebar</a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-list-right-sidebar.html">Shop List Right Sidebar</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <span class="title">Product Style</span>
                                                <ul>
                                                    <li>
                                                        <a href="single-product.jsp">Single Product Variable</a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-group.html">Single Product Group</a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product.jsp">Single Product Default</a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-affiliate.html">Single Product Affiliate</a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-sale.html">Single Product Sale</a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-sticky.html">Single Product Sticky</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <span class="title">Product Related</span>
                                                <ul>
                                                    <li>
                                                        <a href="my-account.html">My Account</a>
                                                    </li>
                                                    <li>
                                                        <a href="login-register.jsp">Login | Register</a>
                                                    </li>
                                                    <li>
                                                        <a href="cart">Shopping Cart</a>
                                                    </li>
                                                    <li>
                                                        <a href="wishlist.html">Wishlist</a>
                                                    </li>
                                                    <li>
                                                        <a href="compare.html">Compare</a>
                                                    </li>
                                                    <li>
                                                        <a href="checkout.html">Checkout</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul> -->
                                    </li>
                                    <!-- <li class="drop-holder">
                                        <a href="blog.html">Blog</a>
                                        <ul class="drop-menu">
                                            <li>
                                                <a href="blog-listview.html">Blog List View</a>
                                            </li>
                                            <li>
                                                <a href="blog-detail.html">Blog Detail</a>
                                            </li>
                                        </ul>
                                    </li> -->
                                    <li>
                                        <a href="about.jsp">About Us</a>
                                    </li>
                                    <!-- <li class="drop-holder">
                                        <a href="#">Pages</a>
                                        <ul class="drop-menu">
                                            <li>
                                                <a href="faq.html">FAQ</a>
                                            </li>
                                            <li>
                                                <a href="404.html">Error 404</a>
                                            </li>
                                        </ul>
                                    </li> -->
                                    <li>
                                        <a href="contact.jsp">Contact Us</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-sticky py-4 py-lg-0">
            <div class="container">
                <div class="header-nav position-relative">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-6">

                            <a href="home" class="header-logo">
                                <img src="assets/images/logo/dark.png" alt="Header Logo">
                            </a>

                        </div>
                        <div class="col-lg-6 d-none d-lg-block">
                            <div class="main-menu">
                                <nav class="main-nav">
                                    <ul>
                                        <li class="drop-holder">
                                            <a href="home">Home</a>
                                            <!-- <ul class="drop-menu">
                                                <li>
                                                    <a href="index.jsp">Home One</a>
                                                </li>
                                                <li>
                                                    <a href="index-2.html">Home Two</a>
                                                </li>
                                            </ul> -->
                                        </li>
                                        <li class="megamenu-holder">
                                            <a href="shop">Shop</a>
                                            <!-- <ul class="drop-menu megamenu">
                                                <li>
                                                    <span class="title">Shop Layout</span>
                                                    <ul>
                                                        <li>
                                                            <a href="shop.jsp">Shop Default</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-grid-fullwidth.html">Shop Grid Fullwidth</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-right-sidebar.html">Shop Right Sidebar</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-list-fullwidth.html">Shop List Fullwidth</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-list-left-sidebar.html">Shop List Left Sidebar</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-list-right-sidebar.html">Shop List Right
                                                                Sidebar</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span class="title">Product Style</span>
                                                    <ul>
                                                        <li>
                                                            <a href="single-product.jsp">Single Product
                                                                Variable</a>
                                                        </li>
                                                        <li>
                                                            <a href="single-product-group.html">Single Product Group</a>
                                                        </li>
                                                        <li>
                                                            <a href="single-product.jsp">Single Product Default</a>
                                                        </li>
                                                        <li>
                                                            <a href="single-product-affiliate.html">Single Product
                                                                Affiliate</a>
                                                        </li>
                                                        <li>
                                                            <a href="single-product-sale.html">Single Product Sale</a>
                                                        </li>
                                                        <li>
                                                            <a href="single-product-sticky.html">Single Product Sticky</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span class="title">Product Related</span>
                                                    <ul>
                                                        <li>
                                                            <a href="my-account.html">My Account</a>
                                                        </li>
                                                        <li>
                                                            <a href="login-register.jsp">Login | Register</a>
                                                        </li>
                                                        <li>
                                                            <a href="cart">Shopping Cart</a>
                                                        </li>
                                                        <li>
                                                            <a href="wishlist.html">Wishlist</a>
                                                        </li>
                                                        <li>
                                                            <a href="compare.html">Compare</a>
                                                        </li>
                                                        <li>
                                                            <a href="checkout.html">Checkout</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul> -->
                                        </li>
                                        <!-- <li class="drop-holder">
                                            <a href="blog.html">Blog</a>
                                            <ul class="drop-menu">
                                                <li>
                                                    <a href="blog-listview.html">Blog List View</a>
                                                </li>
                                                <li>
                                                    <a href="blog-detail.html">Blog Detail</a>
                                                </li>
                                            </ul>
                                        </li> -->
                                        <li>
                                            <a href="about.jsp">About Us</a>
                                        </li>
                                        <!-- <li class="drop-holder">
                                            <a href="#">Pages</a>
                                            <ul class="drop-menu">
                                                <li>
                                                    <a href="faq.html">FAQ</a>
                                                </li>
                                                <li>
                                                    <a href="404.html">Error 404</a>
                                                </li>
                                            </ul>
                                        </li> -->
                                        <li>
                                            <a href="contact.jsp">Contact Us</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="header-right">
                                <ul>
                                    <!-- <li>
                                        <a href="#exampleModal" class="search-btn bt" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                            <i class="pe-7s-search"></i>
                                        </a>
                                    </li> -->
                                    <li class="dropdown d-none d-lg-block">
                                        <button class="btn btn-link dropdown-toggle ht-btn p-0" type="button"
                                                id="stickysettingButton" data-bs-toggle="dropdown" aria-label="setting"
                                                aria-expanded="false">
                                            <i class="pe-7s-users"></i>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="stickysettingButton">
                                            <%
                                                if (isAuthentication) {
                                            %>
                                            <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                            <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                            <%} else {%>
                                            <li><a class="dropdown-item" href="login-register.jsp">Login |
                                                Register</a>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </li>

                                    <% if (isAuthentication) {%>
                                    <% CartDTO cartDTO = (CartDTO) request.getAttribute("cart");%>
                                    <li class="d-none d-lg-block">
                                        <a href="wishlist.html">
                                            <i class="pe-7s-like"></i>
                                        </a>
                                    </li>
                                    <li class="minicart-wrap me-3 me-lg-0">
                                        <a href="#miniCart" class="minicart-btn toolbar-btn">
                                            <i class="pe-7s-shopbag"></i>
                                            <span class="quantity"><%=cartDTO.getCartDetails().size()%></span>
                                        </a>
                                    </li>
                                    <%}%>
                                    <li class="mobile-menu_wrap d-block d-lg-none">
                                        <a href="#mobileMenu" class="mobile-menu_btn toolbar-btn pl-0">
                                            <i class="pe-7s-menu"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mobile-menu_wrapper" id="mobileMenu">
            <div class="offcanvas-body">
                <div class="inner-body">
                    <div class="offcanvas-top">
                        <a href="#" class="button-close"><i class="pe-7s-close"></i></a>
                    </div>
                    <div class="header-contact offcanvas-contact">
                        <i class="pe-7s-call"></i>
                        <a href="tel://+00-123-456-789">+00 123 456 789</a>
                    </div>
                    <div class="offcanvas-user-info">
                        <ul class="dropdown-wrap">
                            <li class="dropdown dropdown-left">
                                <button class="btn btn-link dropdown-toggle ht-btn" type="button"
                                        id="languageButtonTwo" data-bs-toggle="dropdown" aria-expanded="false">
                                    English
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="languageButtonTwo">
                                    <li><a class="dropdown-item" href="#">French</a></li>
                                    <li><a class="dropdown-item" href="#">Italian</a></li>
                                    <li><a class="dropdown-item" href="#">Spanish</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <button class="btn btn-link dropdown-toggle ht-btn usd-dropdown" type="button"
                                        id="currencyButtonTwo" data-bs-toggle="dropdown" aria-expanded="false">
                                    USD
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="currencyButtonTwo">
                                    <li><a class="dropdown-item" href="#">GBP</a></li>
                                    <li><a class="dropdown-item" href="#">ISO</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <button class="btn btn-link dropdown-toggle ht-btn p-0" type="button"
                                        id="settingButtonTwo" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="pe-7s-users"></i>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="settingButtonTwo">
                                    <%
                                        if (isAuthentication) {
                                    %>
                                    <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                    <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                    <%} else {%>
                                    <li><a class="dropdown-item" href="login-register.jsp">Login | Register</a>
                                    </li>
                                    <%}%>
                                </ul>
                            </li>
                            <li>
                                <a href="wishlist.html">
                                    <i class="pe-7s-like"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="offcanvas-menu_area">
                        <nav class="offcanvas-navigation">
                            <ul class="mobile-menu">

                                <li>
                                    <a href="home">
                                            <span class="mm-text">Home

                                            </span>
                                    </a>

                                </li>
                                <li>
                                    <a href="shop">
                                            <span class="mm-text">Shop

                                            </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="about.jsp">
                                        <span class="mm-text">About Us</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="contact.jsp">
                                        <span class="mm-text">Contact</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <% if (isAuthentication) {%>
        <% CartDTO cartDTO = (CartDTO) request.getAttribute("cart");%>
        <div class="offcanvas-minicart_wrapper" id="miniCart">
            <div class="offcanvas-body">
                <div class="minicart-content">
                    <div class="minicart-heading">
                        <h4 class="mb-0">Shopping Cart</h4>
                        <a href="#" class="button-close"><i class="pe-7s-close" data-tippy="Close"
                                                            data-tippy-inertia="true" data-tippy-animation="shift-away"
                                                            data-tippy-delay="50"
                                                            data-tippy-arrow="true" data-tippy-theme="sharpborder"></i></a>
                    </div>
                    <ul class="minicart-list">
                        <% for(CartDetailDTO cartDetailDTO : cartDTO.getCartDetails()) {%>
                        <li class="minicart-product">
                            <a class="product-item_remove" href="cart?command=remove&productId=<%=cartDetailDTO.getProductId()%>"><i class="pe-7s-close" data-tippy="Remove"
                                                                       data-tippy-inertia="true"
                                                                       data-tippy-animation="shift-away"
                                                                       data-tippy-delay="50" data-tippy-arrow="true"
                                                                       data-tippy-theme="sharpborder"></i></a>
                            <a href="plants?id=<%=cartDetailDTO.getProductId()%>" class="product-item_img">
                                <img class="img-full" src="<%=cartDetailDTO.getProductImage()%>"
                                     alt="Product Image">
                            </a>
                            <div class="product-item_content">
                                <a class="product-item_title" href="plants?id=<%=cartDetailDTO.getProductId()%>"><%=cartDetailDTO.getProductName()%></a>
                                <span class="product-item_quantity"><%=cartDetailDTO.getQuantity()%> x $<%=cartDetailDTO.getProductPrice()%></span>
                            </div>
                        </li>
                        <%}%>
                    </ul>
                </div>
                <div class="minicart-item_total">
                    <span>Subtotal</span>
                    <span class="ammount">$<%=cartDTO.getTotalPrice()%></span>
                </div>
                <div class="group-btn_wrap d-grid gap-2">
                    <a href="cart" class="btn btn-dark">View Cart</a>
                    <a href="checkout.html" class="btn btn-dark">Checkout</a>
                </div>
            </div>
        </div>
        <%}%>
        <div class="global-overlay"></div>
    </header>
    <!-- Main Header Area End Here -->

    <!-- Begin Slider Area -->
    <div class="slider-area">

        <!-- Main Slider -->
        <div class="swiper-container main-slider swiper-arrow with-bg_white">
            <div class="swiper-wrapper">
                <div class="swiper-slide animation-style-01">
                    <div class="slide-inner style-1 bg-height" data-bg-image="assets/images/slider/bg/1-1.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 order-2 order-lg-1 align-self-center">
                                    <div class="slide-content text-black">
                                        <span class="offer">65% Off</span>
                                        <h2 class="title">New Plant</h2>
                                        <p class="short-desc">Pronia, With 100% Natural, Organic & Plant Shop.</p>
                                        <div class="btn-wrap">
                                            <a class="btn btn-custom-size xl-size btn-pronia-primary"
                                               href="shop">Discover Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-8 offset-md-2 offset-lg-0 order-1 order-lg-2">
                                    <div class="inner-img">
                                        <div class="scene fill">
                                            <div class="expand-width" data-depth="0.2">
                                                <img src="https://template.hasthemes.com/pronia/pronia/assets/images/slider/inner-img/1-1-524x617.png"
                                                     alt="Inner Image">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide animation-style-01">
                    <div class="slide-inner style-1 bg-height" data-bg-image="assets/images/slider/bg/1-1.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 order-2 order-lg-1 align-self-center">
                                    <div class="slide-content text-black">
                                        <span class="offer">65% Off</span>
                                        <h2 class="title">New Plant</h2>
                                        <p class="short-desc">Pronia, With 100% Natural, Organic & Plant Shop.</p>
                                        <div class="btn-wrap">
                                            <a class="btn btn-custom-size xl-size btn-pronia-primary"
                                               href="shop">Discover Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-8 offset-md-2 offset-lg-0 order-1 order-lg-2">
                                    <div class="inner-img">
                                        <div class="scene fill">
                                            <div class="expand-width" data-depth="0.2">
                                                <img src="https://template.hasthemes.com/pronia/pronia/assets/images/slider/inner-img/1-2-524x617.png"
                                                     alt="Inner Image">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination d-md-none"></div>

            <!-- Add Arrows -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>

    </div>
    <!-- Slider Area End Here -->

    <!-- Begin Shipping Area -->
    <div class="shipping-area section-space-top-100">
        <div class="container">
            <div class="shipping-bg">
                <div class="row shipping-wrap">
                    <div class="col-lg-4 col-md-6">
                        <div class="shipping-item">
                            <div class="shipping-img">
                                <img src="assets/images/shipping/icon/car.png" alt="Shipping Icon">
                            </div>
                            <div class="shipping-content">
                                <h2 class="title">Free Shipping</h2>
                                <p class="short-desc mb-0">Capped at $319 per order</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
                        <div class="shipping-item">
                            <div class="shipping-img">
                                <img src="assets/images/shipping/icon/card.png" alt="Shipping Icon">
                            </div>
                            <div class="shipping-content">
                                <h2 class="title">Safe Payment</h2>
                                <p class="short-desc mb-0">With our payment gateway</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
                        <div class="shipping-item">
                            <div class="shipping-img">
                                <img src="assets/images/shipping/icon/service.png" alt="Shipping Icon">
                            </div>
                            <div class="shipping-content">
                                <h2 class="title">Best Services</h2>
                                <p class="short-desc mb-0">Friendly & Supper Services</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shipping Area End Here -->

    <!-- Begin Product Area -->
    <div class="product-area section-space-top-100">
        <div class="container">
            <div class="section-title-wrap">
                <h2 class="section-title mb-0">Our Products</h2>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="nav product-tab-nav tab-style-1" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="active" id="featured-tab" data-bs-toggle="tab" href="#featured" role="tab"
                               aria-controls="featured" aria-selected="true">
                                Featured
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a id="bestseller-tab" data-bs-toggle="tab" href="#bestseller" role="tab"
                               aria-controls="bestseller" aria-selected="false">
                                Bestseller
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a id="latest-tab" data-bs-toggle="tab" href="#latest" role="tab" aria-controls="latest"
                               aria-selected="false">
                                Latest
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="featured" role="tabpanel"
                             aria-labelledby="featured-tab">
                            <div class="product-item-wrap row">
                                <%
                                    List<Plant> featuredPlants = (List<Plant>) request.getAttribute("featuredPlants");
                                    if (featuredPlants != null) {
                                        for (Plant plant : featuredPlants) {
                                %>

                                <div class="col-xl-3 col-md-4 col-sm-6">
                                    <div class="product-item">
                                        <div class="product-img">
                                            <a href="plants?id=<%=plant.getId()%>">
                                                <img class="primary-img"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Images">
                                                <img class="secondary-img"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Images">
                                            </a>
                                            <div class="product-add-action">
                                                <ul>
                                                    <li>
                                                        <a href="wishlist.html" data-tippy="Add to wishlist"
                                                           data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-like"></i>
                                                        </a>
                                                    </li>
                                                    <li class="quuickview-btn" data-bs-toggle="modal"
                                                        data-bs-target="#quickModal_<%=plant.getId()%>">
                                                        <a href="#" data-tippy="Quickview" data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-look"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="cart?command=add&productId=<%=plant.getId()%>&quantity=1" data-tippy="Add to cart"
                                                           data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-cart"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <a class="product-name" href="plants?id=<%=plant.getId()%>"><%=plant.getTitle()%>
                                            </a>
                                            <div class="price-box pb-1">
                                                <span class="new-price">$<%=plant.getUnitPrice()%></span>
                                            </div>
                                            <div class="rating-box">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <% }
                                }
                                %>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="bestseller" role="tabpanel" aria-labelledby="bestseller-tab">
                            <div class="product-item-wrap row">
                                <%
                                    List<Plant> bestsellerPlants = (List<Plant>) request.getAttribute("bestsellerPlants");
                                    if (bestsellerPlants != null) {
                                        for (Plant plant : bestsellerPlants) {
                                %>

                                <div class="col-xl-3 col-md-4 col-sm-6">
                                    <div class="product-item">
                                        <div class="product-img">
                                            <a href=plants?id=<%=plant.getId()%>">
                                                <img class="primary-img"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Images">
                                                <img class="secondary-img"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Images">
                                            </a>
                                            <div class="product-add-action">
                                                <ul>
                                                    <li>
                                                        <a href="wishlist.html" data-tippy="Add to wishlist"
                                                           data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-like"></i>
                                                        </a>
                                                    </li>
                                                    <li class="quuickview-btn" data-bs-toggle="modal"
                                                        data-bs-target="#quickModal_<%=plant.getId()%>">
                                                        <a href="#" data-tippy="Quickview" data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-look"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="cart?command=add&productId=<%=plant.getId()%>&quantity=1" data-tippy="Add to cart"
                                                           data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-cart"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <a class="product-name" href="plants?id=<%=plant.getId()%>"><%=plant.getTitle()%></a>
                                            <div class="price-box pb-1">
                                                <span class="new-price">$<%=plant.getUnitPrice()%></span>
                                            </div>
                                            <div class="rating-box">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <% }
                                }
                                %>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="latest" role="tabpanel" aria-labelledby="latest-tab">
                            <div class="product-item-wrap row">
                                <%
                                    List<Plant> latestPlants = (List<Plant>) request.getAttribute("latestPlants");
                                    if (latestPlants != null) {
                                        for (Plant plant : latestPlants) {
                                %>
                                <div class="col-xl-3 col-md-4 col-sm-6">
                                    <div class="product-item">
                                        <div class="product-img">
                                            <a href="plants?id=<%=plant.getId()%>">
                                                <img class="primary-img"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Images">
                                                <img class="secondary-img"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Images">
                                            </a>
                                            <div class="product-add-action">
                                                <ul>
                                                    <li>
                                                        <a href="wishlist.html" data-tippy="Add to wishlist"
                                                           data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-like"></i>
                                                        </a>
                                                    </li>
                                                    <li class="quuickview-btn" data-bs-toggle="modal"
                                                        data-bs-target="#quickModal_<%=plant.getId()%>">
                                                        <a href="#" data-tippy="Quickview" data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-look"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="cart?command=add&productId=<%=plant.getId()%>&quantity=1" data-tippy="Add to cart"
                                                           data-tippy-inertia="true"
                                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                            <i class="pe-7s-cart"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <a class="product-name" href="plants?id=<%=plant.getId()%>"><%=plant.getTitle()%></a>
                                            <div class="price-box pb-1">
                                                <span class="new-price">$<%=plant.getUnitPrice()%></span>
                                            </div>
                                            <div class="rating-box">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% }
                                }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Product Area End Here -->

    <!-- Begin Banner Area -->
    <div class="banner-area section-space-top-90">
        <div class="container">
            <div class="row g-min-30 g-4">
                <div class="col-lg-8">
                    <div class="banner-item img-hover-effect">
                        <div class="banner-img">
                            <img src="https://template.hasthemes.com/pronia/pronia/assets/images/banner/1-1-770x300.jpg"
                                 alt="Banner Image">
                        </div>
                        <div class="banner-content text-position-left">
                            <span class="collection">Collection Of Cactus</span>
                            <h3 class="title">Pottery Pots & <br> Plant</h3>
                            <div class="button-wrap">
                                <a class="btn btn-custom-size btn-pronia-primary" href="shop">Shop
                                    Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="banner-item img-hover-effect">
                        <div class="banner-img">
                            <img src="https://template.hasthemes.com/pronia/pronia/assets/images/banner/1-2-370x300.jpg"
                                 alt="Banner Image">
                        </div>
                        <div class="banner-content text-position-center">
                            <span class="collection">New Collection</span>
                            <h3 class="title">Plant Port</h3>
                            <div class="button-wrap">
                                <a class="btn btn-custom-size lg-size btn-pronia-primary" href="shop">Shop
                                    Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="banner-item img-hover-effect">
                        <div class="banner-img">
                            <img src="https://template.hasthemes.com/pronia/pronia/assets/images/banner/1-3-370x300.jpg"
                                 alt="Banner Image">
                        </div>
                        <div class="banner-content text-position-center">
                            <span class="collection">New Collection</span>
                            <h3 class="title">Plant Port</h3>
                            <div class="button-wrap">
                                <a class="btn btn-custom-size lg-size btn-pronia-primary" href="shop">Shop
                                    Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="banner-item img-hover-effect">
                        <div class="banner-img">
                            <img src="https://template.hasthemes.com/pronia/pronia/assets/images/banner/1-4-770x300.jpg"
                                 alt="Banner Image">
                        </div>
                        <div class="banner-content text-position-left">
                            <span class="collection">Collection Of Cactus</span>
                            <h3 class="title">Hanging Pots & <br> Plant</h3>
                            <div class="button-wrap">
                                <a class="btn btn-custom-size lg-size btn-pronia-primary" href="shop">Shop
                                    Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Area End Here -->

    <!-- Begin Product Area -->
    <%--    New Products--%>
    <div class="product-area section-space-top-100">
        <div class="container">
            <div class="row">
                <div class="section-title-wrap without-tab">
                    <h2 class="section-title">New Products</h2>
                    <p class="section-desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It
                        has
                        roots in a piece of classical Latin literature
                    </p>
                </div>
                <div class="col-lg-12">
                    <div class="swiper-container product-slider">
                        <div class="swiper-wrapper">
                            <%
                                if (latestPlants != null) {
                                    for (int i = 0; i < 4 && i < latestPlants.size(); i++) {
                                        Plant plant = latestPlants.get(i);
                            %>
                            <div class="swiper-slide product-item">
                                <div class="product-img">
                                    <a href="plants?id=<%=plant.getId()%>">
                                        <img class="primary-img"
                                             src="<%=plant.getImageLink()%>"
                                             alt="Product Images">
                                        <img class="secondary-img"
                                             src="<%=plant.getImageLink()%>"
                                             alt="Product Images">
                                    </a>
                                    <div class="product-add-action">
                                        <ul>
                                            <li>
                                                <a href="wishlist.html" data-tippy="Add to wishlist"
                                                   data-tippy-inertia="true" data-tippy-animation="shift-away"
                                                   data-tippy-delay="50" data-tippy-arrow="true"
                                                   data-tippy-theme="sharpborder">
                                                    <i class="pe-7s-like"></i>
                                                </a>
                                            </li>
                                            <li class="quuickview-btn" data-bs-toggle="modal"
                                                data-bs-target="#quickModal_<%=plant.getId()%>">
                                                <a href="#" data-tippy="Quickview" data-tippy-inertia="true"
                                                   data-tippy-animation="shift-away" data-tippy-delay="50"
                                                   data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                    <i class="pe-7s-look"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="cart?command=add&productId=<%=plant.getId()%>&quantity=1" data-tippy="Add to cart"
                                                   data-tippy-inertia="true" data-tippy-animation="shift-away"
                                                   data-tippy-delay="50" data-tippy-arrow="true"
                                                   data-tippy-theme="sharpborder">
                                                    <i class="pe-7s-cart"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <a class="product-name" href="plants?id=<%=plant.getId()%>"><%=plant.getTitle()%></a>
                                    <div class="price-box pb-1">
                                        <span class="new-price">$<%=plant.getUnitPrice()%></span>
                                    </div>
                                    <div class="rating-box">
                                        <ul>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <% }
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Product Area End Here -->

    <!-- Begin Testimonial Area -->
    <div class="testimonial-area section-space-top-90 section-space-bottom-95">
        <div class="container-fluid">
            <div class="testimonial-bg" data-bg-image="assets/images/testimonial/bg/1-1-1820x443.jpg">
                <div class="section-title-wrap">
                    <h2 class="section-title">What Say Client</h2>
                    <p class="section-desc mb-0">Contrary to popular belief, Lorem Ipsum is not simply random
                        text. It has roots in a piece of classical Latin literature
                    </p>
                </div>
            </div>
            <div class="container custom-space">
                <div class="swiper-container testimonial-slider with-bg">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide testimonial-item">
                            <div class="user-info mb-3">
                                <div class="user-shape-wrap">
                                    <div class="user-img">
                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/testimonial/user/1.png"
                                             alt="User Image">
                                    </div>
                                </div>
                                <div class="user-content text-charcoal">
                                    <h4 class="user-name mb-1">Phoenix Baker</h4>
                                    <span class="user-occupation">Client</span>
                                </div>
                            </div>
                            <p class="user-comment mb-6">Lorem ipsum dolor sit amet, conse adipisic elit, sed do
                                eiusmod
                                tempo
                                incididunt ut labore et dolore. magna
                            </p>
                        </div>
                        <div class="swiper-slide testimonial-item">
                            <div class="user-info mb-3">
                                <div class="user-shape-wrap">
                                    <div class="user-img">
                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/testimonial/user/2.png"
                                             alt="User Image">
                                    </div>
                                </div>
                                <div class="user-content text-charcoal">
                                    <h4 class="user-name mb-1">Phoenix Baker</h4>
                                    <span class="user-occupation">Client</span>
                                </div>
                            </div>
                            <p class="user-comment mb-6">Lorem ipsum dolor sit amet, conse adipisic elit, sed do
                                eiusmod
                                tempo
                                incididunt ut labore et dolore. magna
                            </p>
                        </div>
                        <div class="swiper-slide testimonial-item">
                            <div class="user-info mb-3">
                                <div class="user-shape-wrap">
                                    <div class="user-img">
                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/testimonial/user/3.png"
                                             alt="User Image">
                                    </div>
                                </div>
                                <div class="user-content text-charcoal">
                                    <h4 class="user-name mb-1">Phoenix Baker</h4>
                                    <span class="user-occupation">Client</span>
                                </div>
                            </div>
                            <p class="user-comment mb-6">Lorem ipsum dolor sit amet, conse adipisic elit, sed do
                                eiusmod
                                tempo
                                incididunt ut labore et dolore. magna
                            </p>
                        </div>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination without-absolute"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial Area End Here -->

    <!-- Begin Brand Area -->
    <div class="brand-area section-space-bottom-100">
        <div class="container">
            <div class="brand-bg" data-bg-image="assets/images/brand/bg/1-1170x300.jpg">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="swiper-container brand-slider">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <a class="brand-item" href="#">

                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/brand/1-1.png"
                                             alt="Brand Image">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="brand-item" href="#">
                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/brand/1-2.png"
                                             alt="Brand Image">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="brand-item" href="#">
                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/brand/1-3.png"
                                             alt="Brand Image">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="brand-item" href="#">
                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/brand/1-4.png"
                                             alt="Brand Image">
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a class="brand-item" href="#">
                                        <img src="https://template.hasthemes.com/pronia/pronia/assets/images/brand/1-5.png"
                                             alt="Brand Image">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Brand Area End Here -->

    <!-- Begin Blog Area -->

    <!-- Blog Area End Here -->

    <!-- Begin Footer Area -->
    <div class="footer-area" data-bg-image="assets/images/footer/bg/1-1920x465.jpg">
        <div class="footer-top section-space-top-100 pb-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="footer-widget-item">
                            <div class="footer-widget-logo">
                                <a href="home">
                                    <img src="assets/images/logo/dark.png" alt="Logo">
                                </a>
                            </div>
                            <p class="footer-widget-desc">Lorem ipsum dolor sit amet, consec adipisl elit, sed do
                                eiusmod
                                tempor
                                <br>
                                incidio ut labore et dolore magna.
                            </p>
                            <div class="social-link with-border">
                                <ul>
                                    <li>
                                        <a href="#" data-tippy="Facebook" data-tippy-inertia="true"
                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" data-tippy="Twitter" data-tippy-inertia="true"
                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" data-tippy="Pinterest" data-tippy-inertia="true"
                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                            <i class="fa fa-pinterest"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" data-tippy="Dribbble" data-tippy-inertia="true"
                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                            <i class="fa fa-dribbble"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 pt-40">
                        <div class="footer-widget-item">
                            <h3 class="footer-widget-title">Useful Links</h3>
                            <ul class="footer-widget-list-item">
                                <li>
                                    <a href="#">About Pronia</a>
                                </li>
                                <li>
                                    <a href="#">How to shop</a>
                                </li>
                                <li>
                                    <a href="#">FAQ</a>
                                </li>
                                <li>
                                    <a href="#">Contact us</a>
                                </li>
                                <li>
                                    <a href="#">Log in</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 pt-40">
                        <div class="footer-widget-item">
                            <h3 class="footer-widget-title">My Account</h3>
                            <ul class="footer-widget-list-item">
                                <li>
                                    <a href="#">Sign In</a>
                                </li>
                                <li>
                                    <a href="#">View Cart</a>
                                </li>
                                <li>
                                    <a href="#">My Wishlist</a>
                                </li>
                                <li>
                                    <a href="#">Track My Order</a>
                                </li>
                                <li>
                                    <a href="#">Help</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 pt-40">
                        <div class="footer-widget-item">
                            <h3 class="footer-widget-title">Our Service</h3>
                            <ul class="footer-widget-list-item">
                                <li>
                                    <a href="#">Payment Methods</a>
                                </li>
                                <li>
                                    <a href="#">Money Guarantee!</a>
                                </li>
                                <li>
                                    <a href="#">Returns</a>
                                </li>
                                <li>
                                    <a href="#">Shipping</a>
                                </li>
                                <li>
                                    <a href="#">Privacy Policy</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 pt-40">
                        <div class="footer-contact-info">
                            <h3 class="footer-widget-title">Got Question? Call Us</h3>
                            <a class="number" href="tel://123-456-789">123 456 789</a>
                            <div class="address">
                                <ul>
                                    <li>
                                        Your Address Goes Here
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="payment-method">
                            <a href="#">
                                <img src="assets/images/payment/1.png" alt="Payment Method">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright">
                                <span class="copyright-text">© 2021 Pronia Made with <i
                                        class="fa fa-heart text-danger"></i> by
                                    <a href="https://hasthemes.com/" rel="noopener" target="_blank">HasThemes</a>
                                </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Area End Here -->

    <!-- Begin Modal Area (quick view)-->
    <%
        if (featuredPlants != null) {
            for (Plant plant : featuredPlants) {
    %>
    <div class="modal quick-view-modal fade" id="quickModal_<%=plant.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="quickModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            data-tippy="Close" data-tippy-inertia="true" data-tippy-animation="shift-away"
                            data-tippy-delay="50" data-tippy-arrow="true" data-tippy-theme="sharpborder">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="modal-wrap row">
                        <div class="col-lg-6">
                            <div class="modal-img">
                                <div class="swiper-container modal-slider">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 pt-5 pt-lg-0">
                            <div class="single-product-content">
                                <h2 class="title"><%=plant.getTitle()%></h2>
                                <div class="price-box">
                                    <span class="new-price">$<%=plant.getUnitPrice()%></span>
                                </div>
                                <div class="rating-box-wrap">
                                    <div class="rating-box">
                                        <ul>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>
                                    <div class="review-status">
                                        <a href="#">( 1 Review )</a>
                                    </div>
                                </div>
                                <p class="short-desc"><%=plant.getDescription()%></p>
                                <ul class="quantity-with-btn">
                                    <li class="quantity">
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" value="1" type="text">
                                        </div>
                                    </li>
                                    <li class="add-to-cart">
                                        <a class="btn btn-custom-size lg-size btn-pronia-primary"
                                           href="cart?command=add&productId=<%=plant.getId()%>&quantity=1">Add to
                                            cart</a>
                                    </li>
                                    <li class="wishlist-btn-wrap">
                                        <a class="custom-circle-btn" href="wishlist.html">
                                            <i class="pe-7s-like"></i>
                                        </a>
                                    </li>
<%--                                    <li class="compare-btn-wrap">--%>
<%--                                        <a class="custom-circle-btn" href="compare.html">--%>
<%--                                            <i class="pe-7s-refresh-2"></i>--%>
<%--                                        </a>--%>
<%--                                    </li>--%>
                                </ul>
                                <ul class="service-item-wrap pb-0">
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/car.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Free <br> Shipping</span>
                                        </div>
                                    </li>
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/card.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Safe <br> Payment</span>
                                        </div>
                                    </li>
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/service.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Safe <br> Payment</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% }
    }
    %>

    <%
        if (bestsellerPlants != null) {
            for (Plant plant : bestsellerPlants) {
    %>
    <div class="modal quick-view-modal fade" id="quickModal_<%=plant.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="quickModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            data-tippy="Close" data-tippy-inertia="true" data-tippy-animation="shift-away"
                            data-tippy-delay="50" data-tippy-arrow="true" data-tippy-theme="sharpborder">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="modal-wrap row">
                        <div class="col-lg-6">
                            <div class="modal-img">
                                <div class="swiper-container modal-slider">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 pt-5 pt-lg-0">
                            <div class="single-product-content">
                                <h2 class="title"><%=plant.getTitle()%></h2>
                                <div class="price-box">
                                    <span class="new-price">$<%=plant.getUnitPrice()%></span>
                                </div>
                                <div class="rating-box-wrap">
                                    <div class="rating-box">
                                        <ul>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>
                                    <div class="review-status">
                                        <a href="#">( 1 Review )</a>
                                    </div>
                                </div>
                                <p class="short-desc"><%=plant.getDescription()%></p>
                                <ul class="quantity-with-btn">
                                    <li class="quantity">
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" value="1" type="text">
                                        </div>
                                    </li>
                                    <li class="add-to-cart">
                                        <a class="btn btn-custom-size lg-size btn-pronia-primary"
                                           href="cart?command=add&productId=<%=plant.getId()%>&quantity=1">Add to
                                            cart</a>
                                    </li>
                                    <li class="wishlist-btn-wrap">
                                        <a class="custom-circle-btn" href="wishlist.html">
                                            <i class="pe-7s-like"></i>
                                        </a>
                                    </li>
                                    <%--                                    <li class="compare-btn-wrap">--%>
                                    <%--                                        <a class="custom-circle-btn" href="compare.html">--%>
                                    <%--                                            <i class="pe-7s-refresh-2"></i>--%>
                                    <%--                                        </a>--%>
                                    <%--                                    </li>--%>
                                </ul>
                                <ul class="service-item-wrap pb-0">
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/car.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Free <br> Shipping</span>
                                        </div>
                                    </li>
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/card.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Safe <br> Payment</span>
                                        </div>
                                    </li>
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/service.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Safe <br> Payment</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% }
    }
    %>

    <%
        if (latestPlants != null) {
            for (Plant plant : latestPlants) {
    %>
    <div class="modal quick-view-modal fade" id="quickModal_<%=plant.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="quickModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            data-tippy="Close" data-tippy-inertia="true" data-tippy-animation="shift-away"
                            data-tippy-delay="50" data-tippy-arrow="true" data-tippy-theme="sharpborder">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="modal-wrap row">
                        <div class="col-lg-6">
                            <div class="modal-img">
                                <div class="swiper-container modal-slider">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="#" class="single-img">
                                                <img class="img-full"
                                                     src="<%=plant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 pt-5 pt-lg-0">
                            <div class="single-product-content">
                                <h2 class="title"><%=plant.getTitle()%></h2>
                                <div class="price-box">
                                    <span class="new-price">$<%=plant.getUnitPrice()%></span>
                                </div>
                                <div class="rating-box-wrap">
                                    <div class="rating-box">
                                        <ul>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>
                                    <div class="review-status">
                                        <a href="#">( 1 Review )</a>
                                    </div>
                                </div>
                                <p class="short-desc"><%=plant.getDescription()%></p>
                                <ul class="quantity-with-btn">
                                    <li class="quantity">
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" value="1" type="text">
                                        </div>
                                    </li>
                                    <li class="add-to-cart">
                                        <a class="btn btn-custom-size lg-size btn-pronia-primary"
                                           href="cart?command=add&productId=<%=plant.getId()%>&quantity=1">Add to
                                            cart</a>
                                    </li>
                                    <li class="wishlist-btn-wrap">
                                        <a class="custom-circle-btn" href="wishlist.html">
                                            <i class="pe-7s-like"></i>
                                        </a>
                                    </li>
                                    <%--                                    <li class="compare-btn-wrap">--%>
                                    <%--                                        <a class="custom-circle-btn" href="compare.html">--%>
                                    <%--                                            <i class="pe-7s-refresh-2"></i>--%>
                                    <%--                                        </a>--%>
                                    <%--                                    </li>--%>
                                </ul>
                                <ul class="service-item-wrap pb-0">
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/car.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Free <br> Shipping</span>
                                        </div>
                                    </li>
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/card.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Safe <br> Payment</span>
                                        </div>
                                    </li>
                                    <li class="service-item">
                                        <div class="service-img">
                                            <img src="assets/images/shipping/icon/service.png" alt="Shipping Icon">
                                        </div>
                                        <div class="service-content">
                                            <span class="title">Safe <br> Payment</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% }
    }
    %>

    <!-- Modal Area End Here -->

    <!-- Begin Scroll To Top -->
    <a class="scroll-to-top" href="">
        <i class="fa fa-angle-double-up"></i>
    </a>
    <!-- Scroll To Top End Here -->

</div>

<!-- Global Vendor, plugins JS -->

<!-- JS Files
============================================ -->

<script src="assets/js/vendor/bootstrap.bundle.min.js"></script>
<script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
<script src="assets/js/vendor/jquery-migrate-3.3.2.min.js"></script>
<script src="assets/js/vendor/jquery.waypoints.js"></script>
<script src="assets/js/vendor/modernizr-3.11.2.min.js"></script>
<script src="assets/js/plugins/wow.min.js"></script>
<script src="assets/js/plugins/swiper-bundle.min.js"></script>
<script src="assets/js/plugins/jquery.nice-select.js"></script>
<script src="assets/js/plugins/parallax.min.js"></script>
<script src="assets/js/plugins/jquery.magnific-popup.min.js"></script>
<script src="assets/js/plugins/tippy.min.js"></script>
<script src="assets/js/plugins/ion.rangeSlider.min.js"></script>
<script src="assets/js/plugins/mailchimp-ajax.js"></script>
<script src="assets/js/plugins/jquery.counterup.js"></script>

<!--Main JS (Common Activation Codes)-->
<script src="assets/js/main.js"></script>

</body>

</html>