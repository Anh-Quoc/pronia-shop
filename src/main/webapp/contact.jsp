<!DOCTYPE html>
<html lang="zxx">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Pronia - Contact</title>
    <meta name="robots" content="index, follow" />
    <meta name="description"
        content="Pronia plant store bootstrap 5 template is an awesome website template for any home plant shop.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico" />

    <!-- CSS
    ============================================ -->

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/Pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.min.css" />
    <link rel="stylesheet" href="assets/css/ion.rangeSlider.min.css" />

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
                                            <ul class="dropdown-menu" aria-labelledby="settingButton">

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
                                                <% if (isAuthentication) { %>
                                                <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                                <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                                <% } else { %>
                                                
                                                <li><a class="dropdown-item" href="login">Login |
                                                        Register</a>
                                                </li>
                                                <% } %>
                                            </ul>
                                        </li>
                                        <% if (isAuthentication) { %>
                                        <li class="d-none d-lg-block">
                                            <a href="wishlist.html">
                                                <i class="pe-7s-like"></i>
                                            </a>
                                        </li>
                                        <li class="minicart-wrap me-3 me-lg-0">
                                            <a href="#miniCart" class="minicart-btn toolbar-btn">
                                                <i class="pe-7s-shopbag"></i>
                                                <span class="quantity">3</span>
                                            </a>
                                        </li>
                                        <% } %>
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
                                                    <a href="home">Home One</a>
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
                                                            <a href="shop-list-left-sidebar.html">Shop List Left
                                                                Sidebar</a>
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
                                                            <a href="single-product.jsp">Single Product Variable</a>
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
                                                            <a href="single-product-sticky.html">Single Product
                                                                Sticky</a>
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
                                                            <a href="login">Login | Register</a>
                                                        </li>
                                                        <li>
                                                            <a href="cart.html">Shopping Cart</a>
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
                                            <a href="contact.html">Contact Us</a>
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
                                                        <a href="home">Home One</a>
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
                                                                <a href="shop-grid-fullwidth.html">Shop Grid
                                                                    Fullwidth</a>
                                                            </li>
                                                            <li>
                                                                <a href="shop-right-sidebar.html">Shop Right Sidebar</a>
                                                            </li>
                                                            <li>
                                                                <a href="shop-list-fullwidth.html">Shop List
                                                                    Fullwidth</a>
                                                            </li>
                                                            <li>
                                                                <a href="shop-list-left-sidebar.html">Shop List Left
                                                                    Sidebar</a>
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
                                                                <a href="single-product-group.html">Single Product
                                                                    Group</a>
                                                            </li>
                                                            <li>
                                                                <a href="single-product.jsp">Single Product Default</a>
                                                            </li>
                                                            <li>
                                                                <a href="single-product-affiliate.html">Single Product
                                                                    Affiliate</a>
                                                            </li>
                                                            <li>
                                                                <a href="single-product-sale.html">Single Product
                                                                    Sale</a>
                                                            </li>
                                                            <li>
                                                                <a href="single-product-sticky.html">Single Product
                                                                    Sticky</a>
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
                                                                <a href="login">Login | Register</a>
                                                            </li>
                                                            <li>
                                                                <a href="cart.html">Shopping Cart</a>
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
                                                <a href="contact.html">Contact Us</a>
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
                                                <% if (isAuthentication) { %>
                                                <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                                <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                                <% } else { %>
                                                <li><a class="dropdown-item" href="login">Login |
                                                        Register</a>
                                                </li>
                                                <% } %>
                                            </ul>
                                        </li>
                                        <% if (isAuthentication) { %>
                                        <li class="d-none d-lg-block">
                                            <a href="wishlist.html">
                                                <i class="pe-7s-like"></i>
                                            </a>
                                        </li>
                                        <li class="minicart-wrap me-3 me-lg-0">
                                            <a href="#miniCart" class="minicart-btn toolbar-btn">
                                                <i class="pe-7s-shopbag"></i>
                                                <span class="quantity">3</span>
                                            </a>
                                        </li>
                                        <% } %>
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
                                        <% if (isAuthentication) { %>
                                        <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                        <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                        <% } else { %>
                                        <li><a class="dropdown-item" href="login">Login | Register</a>
                                        </li>
                                        <% } %>
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
                                    <!-- <li class="menu-item-has-children"> -->
                                    <li>
                                        <a href="home">
                                            <span class="mm-text">Home
                                                <!-- <i class="pe-7s-angle-down"></i> -->
                                            </span>
                                        </a>
                                        <!-- <ul class="sub-menu">
                                            <li>
                                                <a href="home">
                                                    <span class="mm-text">Home One</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="index-2.html">
                                                    <span class="mm-text">Home Two</span>
                                                </a>
                                            </li>
                                        </ul> -->
                                    </li>
                                    <!-- <li class="menu-item-has-children"> -->
                                    <li>
                                        <a href="shop">
                                            <span class="mm-text">Shop
                                                <!-- <i class="pe-7s-angle-down"></i> -->
                                            </span>
                                        </a>
                                        <!-- <ul class="sub-menu">
                                            <li class="menu-item-has-children">
                                                <a href="#">
                                                    <span class="mm-text">Shop Layout
                                                        <i class="pe-7s-angle-down"></i>
                                                    </span>
                                                </a>
                                                <ul class="sub-menu">
                                                    <li>
                                                        <a href="shop.jsp">
                                                            <span class="mm-text">Shop Default</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-grid-fullwidth.html">
                                                            <span class="mm-text">Shop Grid Fullwidth</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-right-sidebar.html">
                                                            <span class="mm-text">Shop Right Sidebar</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-list-fullwidth.html">
                                                            <span class="mm-text">Shop List Fullwidth</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-list-left-sidebar.html">
                                                            <span class="mm-text">Shop List Left Sidebar</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-list-right-sidebar.html">
                                                            <span class="mm-text">Shop List Right Sidebar</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item-has-children">
                                                <a href="#">
                                                    <span class="mm-text">Product Style
                                                        <i class="pe-7s-angle-down"></i>
                                                    </span>
                                                </a>
                                                <ul class="sub-menu">
                                                    <li>
                                                        <a href="single-product.jsp">
                                                            <span class="mm-text">Single Product Default</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-group.html">
                                                            <span class="mm-text">Single Product Group</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product.jsp">
                                                            <span class="mm-text">Single Product Variable</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-sale.html">
                                                            <span class="mm-text">Single Product Sale</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-sticky.html">
                                                            <span class="mm-text">Single Product Sticky</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="single-product-affiliate.html">
                                                            <span class="mm-text">Single Product Affiliate</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item-has-children">
                                                <a href="#">
                                                    <span class="mm-text">Product Related
                                                        <i class="pe-7s-angle-down"></i>
                                                    </span>
                                                </a>
                                                <ul class="sub-menu">
                                                    <li>
                                                        <a href="my-account.html">
                                                            <span class="mm-text">My Account</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="login">
                                                            <span class="mm-text">Login | Register</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="cart.html">
                                                            <span class="mm-text">Shopping Cart</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="wishlist.html">
                                                            <span class="mm-text">Wishlist</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="compare.html">
                                                            <span class="mm-text">Compare</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="checkout.html">
                                                            <span class="mm-text">Checkout</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul> -->
                                    </li>
                                    <!-- <li class="menu-item-has-children">
                                        <a href="#">
                                            <span class="mm-text">Blog
                                                <i class="pe-7s-angle-down"></i>
                                            </span>
                                        </a>
                                        <ul class="sub-menu">
                                            <li class="menu-item-has-children">
                                                <a href="#">
                                                    <span class="mm-text">Blog Holder
                                                        <i class="pe-7s-angle-down"></i>
                                                    </span>
                                                </a>
                                                <ul class="sub-menu">
                                                    <li>
                                                        <a href="blog.html">
                                                            <span class="mm-text">Blog Default</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="blog-listview.html">Blog List View</a>
                                                    </li>
                                                    <li>
                                                        <a href="blog-detail.html">Blog Detail</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li> -->
                                    <li>
                                        <a href="about.jsp">
                                            <span class="mm-text">About Us</span>
                                        </a>
                                    </li>
                                    <!-- <li class="menu-item-has-children">
                                        <a href="#">
                                            <span class="mm-text">Pages
                                                <i class="pe-7s-angle-down"></i>
                                            </span>
                                        </a>
                                        <ul class="sub-menu">
                                            <li>
                                                <a href="faq.html">
                                                    <span class="mm-text">Frequently Questions</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="404.html">
                                                    <span class="mm-text">Error 404</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li> -->
                                    <li>
                                        <a href="contact.html">
                                            <span class="mm-text">Contact</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModal" aria-hidden="true">
                <div class="modal-dialog modal-fullscreen">
                    <div class="modal-content modal-bg-dark">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" data-tippy="Close" data-tippy-inertia="true" data-tippy-animation="shift-away" data-tippy-delay="50" data-tippy-arrow="true" data-tippy-theme="sharpborder">
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-search">
                                <span class="searchbox-info">Start typing and press Enter to search or ESC to close</span>
                                <form action="#" class="hm-searchbox">
                                    <input type="text" name="Search..." value="Search..." onblur="if(this.value==''){this.value='Search...'}" onfocus="if(this.value=='Search...'){this.value=''}" autocomplete="off">
                                    <button class="search-btn" type="submit" aria-label="searchbtn">
                                        <i class="pe-7s-search"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="offcanvas-minicart_wrapper" id="miniCart">
                <div class="offcanvas-body">
                    <div class="minicart-content">
                        <div class="minicart-heading">
                            <h4 class="mb-0">Shopping Cart</h4>
                            <a href="#" class="button-close"><i class="pe-7s-close" data-tippy="Close"
                                    data-tippy-inertia="true" data-tippy-animation="shift-away" data-tippy-delay="50"
                                    data-tippy-arrow="true" data-tippy-theme="sharpborder"></i></a>
                        </div>
                        <ul class="minicart-list">
                            <li class="minicart-product">
                                <a class="product-item_remove" href="#"><i class="pe-7s-close" data-tippy="Remove"
                                        data-tippy-inertia="true" data-tippy-animation="shift-away"
                                        data-tippy-delay="50" data-tippy-arrow="true"
                                        data-tippy-theme="sharpborder"></i></a>
                                <a href="single-product.jsp" class="product-item_img">
                                    <img class="img-full" src="assets/images/product/small-size/2-1-70x78.png"
                                        alt="Product Image">
                                </a>
                                <div class="product-item_content">
                                    <a class="product-item_title" href="single-product.jsp">American Marigold</a>
                                    <span class="product-item_quantity">1 x $23.45</span>
                                </div>
                            </li>
                            <!-- <li class="minicart-product">
                                <a class="product-item_remove" href="#"><i class="pe-7s-close" data-tippy="Remove"
                                        data-tippy-inertia="true" data-tippy-animation="shift-away"
                                        data-tippy-delay="50" data-tippy-arrow="true"
                                        data-tippy-theme="sharpborder"></i></a>
                                <a href="single-product.jsp" class="product-item_img">
                                    <img class="img-full" src="assets/images/product/small-size/2-2-70x78.png"
                                        alt="Product Image">
                                </a>
                                <div class="product-item_content">
                                    <a class="product-item_title" href="single-product.jsp">Black Eyed Susan</a>
                                    <span class="product-item_quantity">1 x $25.45</span>
                                </div>
                            </li> -->
                            <!-- <li class="minicart-product">
                                <a class="product-item_remove" href="#">
                                    <i class="pe-7s-close" data-tippy="Remove" data-tippy-inertia="true"
                                        data-tippy-animation="shift-away" data-tippy-delay="50" data-tippy-arrow="true"
                                        data-tippy-theme="sharpborder"></i>
                                </a>
                                <a href="single-product.jsp" class="product-item_img">
                                    <img class="img-full" src="assets/images/product/small-size/2-3-70x78.png"
                                        alt="Product Image">
                                </a>
                                <div class="product-item_content">
                                    <a class="product-item_title" href="single-product.jsp">Bleeding Heart</a>
                                    <span class="product-item_quantity">1 x $30.45</span>
                                </div>
                            </li> -->
                        </ul>
                    </div>
                    <div class="minicart-item_total">
                        <span>Subtotal</span>
                        <span class="ammount">$79.35</span>
                    </div>
                    <div class="group-btn_wrap d-grid gap-2">
                        <a href="cart" class="btn btn-dark">View Cart</a>
                        <a href="checkout.html" class="btn btn-dark">Checkout</a>
                    </div>
                </div>
            </div>
            <div class="global-overlay"></div>
        </header>
        <!-- Main Header Area End Here -->

        <!-- Begin Main Content Area -->
        <main class="main-content">
            <!-- <div class="breadcrumb-area breadcrumb-height" data-bg-image="assets/images/breadcrumb/bg/1-1-1919x388.jpg">
                <div class="container h-100">
                    <div class="row h-100">
                        <div class="col-lg-12">
                            <div class="breadcrumb-item">
                                <h2 class="breadcrumb-heading">Contact</h2>
                                <ul>
                                    <li>
                                        <a href="home">Home</a>
                                    </li>
                                    <li>Contact Us</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="contact-form-area section-space-y-axis-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="contact-wrap">
                                <div class="contact-info text-white"
                                    data-bg-image="assets/images/contact/1-1-370x500.jpg">
                                    <h2 class="contact-title">Contact Info:</h2>
                                    <p class="contact-desc">Fill the form amd our teaam will get to back
                                        to you within 24 hours.
                                    </p>
                                    <ul class="contact-list">
                                        <li>
                                            <i class="pe-7s-call"></i>
                                            <a href="tel://123-456-789">123 456 789</a>
                                        </li>
                                        <li>
                                            <i class="pe-7s-mail"></i>
                                            <a href="mailto://info@example.com">info@example.com</a>
                                        </li>
                                        <li>
                                            <i class="pe-7s-map-marker"></i>
                                            <span>13, Your Address, Here</span>
                                        </li>
                                    </ul>
                                </div>
                                <form id="contact-form" class="contact-form"
                                    action="https://htmlmail.hasthemes.com/mamunur/pronia.php">
                                    <div class="group-input">
                                        <div class="form-field me-lg-30 mb-35 mb-lg-0">
                                            <input type="text" name="con_firstName" id="con_firstName"
                                                placeholder="First Name*" class="input-field" autocomplete="off">
                                        </div>
                                        <div class="form-field mb-35">
                                            <input type="text" name="con_lastName" id="con_lastName"
                                                placeholder="Last Name*" class="input-field" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="group-input mb-35">
                                        <div class="form-field me-lg-30 mb-35 mb-lg-0">
                                            <input type="text" name="con_phone" id="con_phone" placeholder="Phone*"
                                                class="input-field" autocomplete="off">
                                        </div>
                                        <div class="form-field">
                                            <input type="text" name="con_email" id="con_email" placeholder="Email*"
                                                class="input-field" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="form-field mb-5">
                                        <textarea name="con_message" id="con_message" placeholder="Message"
                                            class="textarea-field"></textarea>
                                    </div>
                                    <div class="contact-button-wrap">
                                        <button type="submit" value="submit"
                                            class="btn btn btn-custom-size xl-size btn-pronia-primary"
                                            name="submit">Post
                                            Comment</button>
                                        <p class="form-messege mb-0"></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contact-with-map">
                <div class="contact-map">
                    <iframe class="contact-map-size"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d193595.15830869428!2d-74.119763973046!3d40.69766374874431!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1613802584124!5m2!1sen!2sbd"
                        allowfullscreen="" loading="lazy">
                    </iframe>
                </div>
            </div>
        </main>
        <!-- Main Content Area End Here -->

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