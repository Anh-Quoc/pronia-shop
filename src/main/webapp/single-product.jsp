<%@ page import="dtos.PlantDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="dtos.CategoryDTO" %>
<%@ page import="dtos.TagDTO" %>
<!DOCTYPE html>
<html lang="zxx">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Pronia - Single Product</title>
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
                                            <%
                                                if (isAuthentication) {
                                            %>

                                            <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                            <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                            <%
                                            } else { %>
                                            <li><a class="dropdown-item" href="login">Login |
                                                Register</a>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </li>
                                    <% if(isAuthentication) { %>
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
                                    </li>
                                    <li class="megamenu-holder">
                                        <a href="shop">Shop</a>
                                    </li>

                                    <li>
                                        <a href="about.jsp">About Us</a>
                                    </li>
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
                                        </li>
                                        <li class="megamenu-holder">
                                            <a href="shop">Shop</a>
                                        </li>

                                        <li>
                                            <a href="about.jsp">About Us</a>
                                        </li>

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

                                    <li class="dropdown d-none d-lg-block">
                                        <button class="btn btn-link dropdown-toggle ht-btn p-0" type="button"
                                                id="stickysettingButton" data-bs-toggle="dropdown" aria-label="setting"
                                                aria-expanded="false">
                                            <i class="pe-7s-users"></i>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="stickysettingButton">
                                            <%
                                                if (isAuthentication) { %>
                                            <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                            <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                            <%
                                                } else { %>
                                            <li><a class="dropdown-item" href="login">Login |
                                                Register</a>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </li>
                                    <%
                                        if (isAuthentication) { %>
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
                                    <%
                                        if (isAuthentication) { %>
                                    <li><a class="dropdown-item" href="my-account.html">My account</a></li>
                                    <li><a class="dropdown-item" href="logout?accountType=customer">Logout</a></li>
                                    <%
                                        } else { %>
                                    <li><a class="dropdown-item" href="login">Login | Register</a>
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

        <% if (isAuthentication) { %>
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
                        <li class="minicart-product">
                            <a class="product-item_remove" href="#"><i class="pe-7s-close" data-tippy="Remove"
                                                                       data-tippy-inertia="true"
                                                                       data-tippy-animation="shift-away"
                                                                       data-tippy-delay="50" data-tippy-arrow="true"
                                                                       data-tippy-theme="sharpborder"></i></a>
                            <a href="single-product.html" class="product-item_img">
                                <img class="img-full" src="assets/images/product/small-size/2-1-70x78.png"
                                     alt="Product Image">
                            </a>
                            <div class="product-item_content">
                                <a class="product-item_title" href="single-product.html">American
                                    Marigold</a>
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
                                <a class="product-item_title" href="single-product.jsp">Black Eyed
                                    Susan</a>
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
                    <a href="cart.html" class="btn btn-dark">View Cart</a>
                    <a href="checkout.html" class="btn btn-dark">Checkout</a>
                </div>
            </div>
        </div>
        <% } %>
        <div class="global-overlay"></div>
    </header>
    <!-- Main Header Area End Here -->

    <!-- Begin Main Content Area  -->
    <main class="main-content">

        <% PlantDTO plant = (PlantDTO) request.getAttribute("plant"); %>

        <div class="single-product-area section-space-top-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="single-product-img">
                            <div class="swiper-container single-product-slider">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <a href="<%=plant.getImageLink()%>"
                                           class="single-img gallery-popup">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Image">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="<%=plant.getImageLink()%>"
                                           class="single-img gallery-popup">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Image">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="<%=plant.getImageLink()%>"
                                           class="single-img gallery-popup">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Image">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="<%=plant.getImageLink()%>"
                                           class="single-img gallery-popup">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Image">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="thumbs-arrow-holder">
                                <div class="swiper-container single-product-thumbs">
                                    <div class="swiper-wrapper">
                                        <a href="#" class="swiper-slide">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Thumnail">
                                        </a>
                                        <a href="#" class="swiper-slide">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Thumnail">
                                        </a>
                                        <a href="#" class="swiper-slide">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Thumnail">
                                        </a>
                                        <a href="#" class="swiper-slide">
                                            <img class="img-full"
                                                 src="<%=plant.getImageLink()%>"
                                                 alt="Product Thumnail">
                                        </a>
                                    </div>
                                    <!-- Add Arrows -->
                                    <div class=" thumbs-button-wrap d-none d-md-block">
                                        <div class="thumbs-button-prev">
                                            <i class="pe-7s-angle-left"></i>
                                        </div>
                                        <div class="thumbs-button-next">
                                            <i class="pe-7s-angle-right"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 pt-5 pt-lg-0">
                        <div class="single-product-content">
                            <h2 class="title"><%=plant.getTitle()%>
                            </h2>
                            <div class="price-box">
                                <span class="new-price">$<%=plant.getUnitPrice()%></span>
                            </div>
                            <div class="rating-box-wrap pb-4">
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
                            <p class="short-desc"><%=plant.getDescription()%>
                            </p>
                            <ul class="quantity-with-btn">
                                <li class="quantity">
                                    <div class="cart-plus-minus">
                                        <input class="cart-plus-minus-box" value="1" type="text">
                                    </div>
                                </li>
                                <li class="add-to-cart">
                                    <a class="btn btn-custom-size lg-size btn-pronia-primary" href="cart.html">Add
                                        to
                                        cart</a>
                                </li>
                                <li class="wishlist-btn-wrap">
                                    <a class="custom-circle-btn" href="wishlist.html">
                                        <i class="pe-7s-like"></i>
                                    </a>
                                </li>
                                <li class="compare-btn-wrap">
                                    <a class="custom-circle-btn" href="compare.html">
                                        <i class="pe-7s-refresh-2"></i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="service-item-wrap">
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
                            <div class="product-category">
                                <span class="title">SKU:</span>
                                <ul>
                                    <li>
                                        <a href="#">Ch-256xl</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="product-category">
                                <span class="title">Categories :</span>

                                <ul>
                                    <% List<CategoryDTO> categories = plant.getPlantCategories(); %>
                                    <% if (categories != null && !categories.isEmpty()) {
                                        for (int i = 0; i < categories.size(); ++i) {
                                            CategoryDTO category = categories.get(i);
                                    %>
                                    <li>
                                        <a href="#"><%= i < categories.size() - 1 ? category.getName() + ", " : category.getName()%>
                                        </a>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul>

                            </div>
                            <div class="product-category product-tags">
                                <span class="title">Tags :</span>
                                <ul>
                                    <li>
                                        <% List<TagDTO> tags = plant.getPlantTags(); %>
                                        <% if (tags != null && !tags.isEmpty()) {
                                            for (int i = 0; i < tags.size(); ++i) {
                                                TagDTO tag = tags.get(i);
                                        %>
                                        <a href="#">
                                            <%= i < tags.size() - 1 ? tag.getName() + ", " : tag.getName()%>
                                        </a>
                                        <%
                                                }
                                            }
                                        %>
                                    </li>
                                </ul>
                            </div>
                            <div class="product-category social-link align-items-center pb-0">
                                <span class="title pe-3">Share:</span>
                                <ul>
                                    <li>
                                        <a href="#" data-tippy="Pinterest" data-tippy-inertia="true"
                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                            <i class="fa fa-pinterest-p"></i>
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
                                        <a href="#" data-tippy="Tumblr" data-tippy-inertia="true"
                                           data-tippy-animation="shift-away" data-tippy-delay="50"
                                           data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                            <i class="fa fa-tumblr"></i>
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
                </div>
            </div>
        </div>
        <div class="product-tab-area section-space-top-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="nav product-tab-nav tab-style-2 pt-0" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="tab-btn" id="information-tab" data-bs-toggle="tab" href="#information"
                                   role="tab" aria-controls="information" aria-selected="false">
                                    Information
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="active tab-btn" id="description-tab" data-bs-toggle="tab"
                                   href="#description" role="tab" aria-controls="description" aria-selected="true">
                                    Description
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="tab-btn" id="reviews-tab" data-bs-toggle="tab" href="#reviews" role="tab"
                                   aria-controls="reviews" aria-selected="false">
                                    Reviews(3)
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content product-tab-content">
                            <div class="tab-pane fade" id="information" role="tabpanel"
                                 aria-labelledby="information-tab">
                                <div class="product-information-body">
                                    <h4 class="title">Shipping</h4>
                                    <p class="short-desc mb-4">The item will be shipped from China. So it need 15-20
                                        days to
                                        deliver. Our product is good with reasonable price and we believe you will
                                        worth it.
                                        So please wait for it patiently! Thanks.Any question please kindly to
                                        contact us and
                                        we promise to work hard to help you to solve the problem</p>
                                    <h4 class="title">About return request</h4>
                                    <p class="short-desc mb-4">If you don't need the item with worry, you can
                                        contact us
                                        then we will help you to solve the problem, so please close the return
                                        request!
                                        Thanks</p>
                                    <h4 class="title">Guarantee</h4>
                                    <p class="short-desc mb-0">If it is the quality question, we will resend or
                                        refund to
                                        you; If you receive damaged or wrong items, please contact us and attach
                                        some
                                        pictures about product, we will exchange a new correct item to you after the
                                        confirmation.</p>
                                </div>
                            </div>
                            <div class="tab-pane fade show active" id="description" role="tabpanel"
                                 aria-labelledby="description-tab">
                                <div class="product-description-body">
                                    <p class="short-desc mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing
                                        elit, sed
                                        do eiusmod tempor incidid ut labore et dolore magna aliqua. Ut enim ad minim
                                        veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat.
                                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                        eu
                                        fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt
                                        in culpa
                                        qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde
                                        omnis iste
                                        natus error sit voluptatem accusantium doloremque laudantium, totam rem
                                        aperiam,
                                        eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae
                                        dicta
                                        sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut
                                        odit aut
                                        fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi
                                        nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Begin Product Area -->
        <%--            Related Products--%>
        <% List<PlantDTO> relatedPlants = (List<PlantDTO>) request.getAttribute("relatedPlants"); %>

        <% if (relatedPlants != null && !relatedPlants.isEmpty()) {

        %>

        <div class="product-area section-space-y-axis-90">
            <div class="container">
                <div class="row">
                    <div class="section-title-wrap without-tab">
                        <h2 class="section-title">Related Products</h2>
                        <p class="section-desc">Contrary to popular belief, Lorem Ipsum is not simply random text.
                            It has
                            roots in a piece of classical Latin literature
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <div class="swiper-container product-slider">
                            <div class="swiper-wrapper">

                                <%
                                    for (PlantDTO relatedPlant : relatedPlants) {

                                %>

                                <div class="swiper-slide product-item">
                                    <div class="product-img">
                                        <a href="plants?id=<%=relatedPlant.getId()%>">
                                            <img class="primary-img"
                                                 src="<%=relatedPlant.getImageLink()%>"
                                                 alt="Product Images">
                                            <img class="secondary-img"
                                                 src="<%=relatedPlant.getImageLink()%>"
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
                                                    data-bs-target="#quickModal_<%=relatedPlant.getId()%>">
                                                    <a href="#" data-tippy="Quickview" data-tippy-inertia="true"
                                                       data-tippy-animation="shift-away" data-tippy-delay="50"
                                                       data-tippy-arrow="true" data-tippy-theme="sharpborder">
                                                        <i class="pe-7s-look"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="cart.html" data-tippy="Add to cart"
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
                                        <a class="product-name"
                                           href="plants?id=<%=relatedPlant.getId()%>"><%=relatedPlant.getTitle()%>
                                        </a>
                                        <div class="price-box pb-1">
                                            <span class="new-price">$<%=relatedPlant.getUnitPrice()%></span>
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
                                <%
                                    }
                                %>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <!-- Product Area End Here -->

    </main>
    <!-- Main Content Area End Here  -->

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

    <!-- Begin Modal Area -->
    <%
        if (relatedPlants != null && !relatedPlants.isEmpty()) {
            for (PlantDTO relatedPlant : relatedPlants) {
    %>

    <div class="modal quick-view-modal fade" id="quickModal_<%=relatedPlant.getId()%>" data-bs-backdrop="static"
         data-bs-keyboard="false"
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
                                            <a href="plants?id=<%=relatedPlant.getId()%>" class="single-img">
                                                <img class="img-full"
                                                     src="<%=relatedPlant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="plants?id=<%=relatedPlant.getId()%>" class="single-img">
                                                <img class="img-full"
                                                     src="<%=relatedPlant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="plants?id=<%=relatedPlant.getId()%>" class="single-img">
                                                <img class="img-full"
                                                     src="<%=relatedPlant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="plants?id=<%=relatedPlant.getId()%>" class="single-img">
                                                <img class="img-full"
                                                     src="<%=relatedPlant.getImageLink()%>"
                                                     alt="Product Image">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 pt-5 pt-lg-0">
                            <div class="single-product-content">
                                <h2 class="title"><%=relatedPlant.getTitle()%>
                                </h2>
                                <div class="price-box">
                                    <span class="new-price">$<%=relatedPlant.getUnitPrice()%></span>
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

                                <p class="short-desc"><%=relatedPlant.getDescription()%>
                                </p>
                                <ul class="quantity-with-btn">
                                    <li class="quantity">
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" value="1" type="text">
                                        </div>
                                    </li>
                                    <li class="add-to-cart">
                                        <a class="btn btn-custom-size lg-size btn-pronia-primary"
                                           href="cart.html">Add to
                                            cart</a>
                                    </li>
                                    <li class="wishlist-btn-wrap">
                                        <a class="custom-circle-btn" href="wishlist.html">
                                            <i class="pe-7s-like"></i>
                                        </a>
                                    </li>
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

    <%
            }
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