<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dbaccess.PostDAO" %>
<%@page import="dbaccess.AccountDAO" %>
<%@page import="dbaccess.CommentDAO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diễn Đàn | Cat Dog Lover Website</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="img/favicon.ico"> 

        <!-- Google Web Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Flaticon Font -->
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="assets/css/forums.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-lg-5">
                <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-white pr-3" href="">FAQs</a>
                        <span class="text-white">|</span>
                        <a class="text-white px-3" href="">Help</a>
                        <span class="text-white">|</span>
                        <a class="text-white pl-3" href="">Support</a>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <!-- GET SESSION -->
                        <c:set var="us" value="${sessionScope.USER}" />
                        <c:choose>
                            <c:when test="${us == null}">
                                <a style="text-align: center" class="text-white pl-3" href="DispatcherController?action=login-page">
                                    <i class="fa fa-user"></i> Log in
                                </a>
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-user"></i> ${us.user_id}
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="DispatcherController?action=my-profile">View Profile</a>
                                        <c:if test="${us.role eq 'ADMIN'}">
                                            <a class="dropdown-item" href="DispatcherController?action=manage">Dashboard</a>
                                        </c:if>
                                        <c:if test="${us.role eq 'STAFF'}">
                                            <a class="dropdown-item" href="DispatcherController?action=staff-manage">Dashboard</a>
                                        </c:if>
                                        <a class="dropdown-item" href="DispatcherController?action=my-post">My Posts</a>
                                        <a class="dropdown-item" href="DispatcherController?action=conversation">Chat</a>
                                        <a class="dropdown-item" href="DispatcherController?action=logout">Log out</a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="row py-3 px-lg-5">
                <div class="col-lg-4">
                    <a href="" class="navbar-brand d-none d-lg-block">
                        <h1 class="m-0 display-5 text-capitalize"><span class="text-primary">Dog&Cat</span>Lover</h1>
                    </a>
                </div>
                <div class="col-lg-8 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <div class="d-inline-flex flex-column text-center pr-3 border-right">
                            <h6>Support Hours</h6>
                            <p class="m-0">8.00AM - 9.00PM</p>
                        </div>
                        <div class="d-inline-flex flex-column text-center px-3 border-right">
                            <h6>Email Us</h6>
                            <p class="m-0">info@gmail.com</p>
                        </div>
                        <div class="d-inline-flex flex-column text-center pl-3">
                            <h6>Call Us</h6>
                            <p class="m-0">+012 345 6789</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <div class="container-fluid p-0">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-lg-5">
                <a href="" class="navbar-brand d-block d-lg-none">
                    <h1 class="m-0 display-5 text-capitalize font-italic text-white"><span class="text-primary">Dog&Cat</span>Lover</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="DispatcherController" class="nav-item nav-link">Home</a>
                        <a href="DispatcherController?action=about-us" class="nav-item nav-link">About</a>
                        <a href="DispatcherController?action=forums" class="nav-item nav-link active">Forums</a>
                        <a href="DispatcherController?action=trade" class="nav-item nav-link">Trade</a>
                        <a href="DispatcherController?action=contact-us" class="nav-item nav-link">Contact</a>
                    </div>

                </div>
            </nav>
        </div>
        <!-- Navbar End -->
        <div class="container mt-5">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Diễn Đàn</li>
                </ol>
                <div class="breadcrumb justify-content-around">
                    <div class="input-group">
                        <span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg></span>
                        <a class="custom-btn form-control" href="${us.user_id != null ? 'DispatcherController?action=create-post-page' : 'DispatcherController?action=login-page'}">Create post...</a>
                    </div>
                </div>
            </nav>

            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Mục Lục</h5>
                            <ul class="list-group">
                                <c:forEach var="c" items="${requestScope.CATEGORYS}">
                                    <li class="list-group-item"><a href="DispatcherController?action=forums-cate&id=${c.id}">${c.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <c:set var="listPost" value="${requestScope.POSTS}" />
                <c:set var="cate" value="${requestScope.CATE}" />
                <div class="col-md-9">
                    <div id="thread-${cate.name}" class="card">
                        <div class="card-body">
                            <h5 class="card-title">${cate.name}</h5>
                            <c:choose>
                                <c:when test="${empty listPost}">
                                    <p class="ml-4 mt-4">Chưa có bài viết nào</p>
                                </c:when>
                                <c:otherwise>
                                    <ul class="list-group">
                                        <c:set var="pageSize" value="10" />
                                        <c:set var="currentPage" value="${param.pageNumber != null ? param.pageNumber : 1}" />
                                        <c:set var="startIndex" value="${(currentPage - 1) * pageSize}" />
                                        <c:set var="endIndex" value="${currentPage * pageSize}" />
                                        <c:forEach var="p" begin="${startIndex}" end="${endIndex}" items="${listPost}" varStatus="loop">
                                            <c:if test="${loop.index >= startIndex && loop.index < endIndex}">
                                                <li class="list-group-item">
                                                    <div class="card" style="width: 100%;">
                                                        <div class="card-body d-flex align-items-center justify-content-between">
                                                            <div class="col-md-9 d-flex flex-row align-items-center">
                                                                <div style="width: 60px" class="user-info d-flex flex-column align-items-center">
                                                                    <img src="${(AccountDAO.getAccount(p.author_id).avatar ne 'NULL' && not empty AccountDAO.getAccount(p.author_id).avatar)?  AccountDAO.getAccount(p.author_id).avatar : 'assets/img/149071.png'}" alt="Avatar" class="rounded-circle img-thumbnail" style="width: 60px; height: 60px;">
                                                                    <p><strong>${p.author_id}</strong></p>
                                                                </div>
                                                                <div style="margin-left: 30px;">
                                                                    <h5 class="card-subtitle mb-2 text-body-secondary" style="max-width: 500px; word-wrap: break-word;">
                                                                        <a href="DispatcherController?action=thread&id=${p.id}">
                                                                            ${p.title}
                                                                        </a>
                                                                    </h5>
                                                                    <p><strong>${p.created_at}</strong></p>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <p><strong>Replies: ${p.amountComment}</strong></p>
                                                                <p><strong>Lượt thích: ${p.favorites}</strong></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    <br/>
                                    <!-- Bootstrap Pagination -->
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination justify-content-center">
                                            <fmt:formatNumber var="totalPages" value="${Mat.ceil((listPost.size() + pageSize - 1) / pageSize)}" maxFractionDigits="0" />
                                            <c:set var="totalPagesInt" value="${totalPages}" />
                                            <c:if test="${totalPages > 1}">
                                                <c:choose>
                                                    <c:when test="${currentPage == 1}">
                                                        <li class="page-item disabled">
                                                            <span class="page-link">1</span>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage+1}">
                                                                ${currentPage+1}
                                                            </a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage+2}">
                                                                ${currentPage+2}
                                                            </a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" data-toggle="collapse" data-target="#collapsedPages" aria-expanded="false" aria-controls="collapsedPages">
                                                                <span aria-hidden="true">...</span>
                                                            </a>
                                                        </li>

                                                        <div class="collapse" id="collapsedPages">
                                                            <nav aria-label="Page navigation">
                                                                <ul class="pagination justify-content-center">
                                                                    <c:forEach var="page" begin="${currentPage+3}" end="${totalPages-1}">
                                                                        <li class="page-item">
                                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${page}">
                                                                                ${page}
                                                                            </a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${totalPagesInt}">
                                                                ${totalPagesInt}
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:when test="${currentPage == totalPagesInt}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=1">1</a>
                                                        </li>
                                                        <div class="collapse" id="collapsedPages">
                                                            <nav aria-label="Page navigation">
                                                                <ul class="pagination justify-content-center">
                                                                    <c:forEach var="page" begin="${2}" end="${currentPage-3}" step="1">
                                                                        <c:set var="decr" value="${totalPagesInt-page}"/>
                                                                        <li class="page-item">
                                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${page}">
                                                                                ${page}
                                                                            </a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" data-toggle="collapse" data-target="#collapsedPages" aria-expanded="false" aria-controls="collapsedPages">
                                                                <span aria-hidden="true">...</span>
                                                            </a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage-2}">
                                                                ${currentPage-2}
                                                            </a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage-1}">
                                                                ${currentPage-1}
                                                            </a>
                                                        </li>
                                                        <li class="page-item disabled">
                                                            <span class="page-link">${param.pageNumber}</span>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage - 1}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>
                                                        <c:if test="${currentPage-3 >= 1}">
                                                            <div class="collapse" id="collapsedPages">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination justify-content-center">
                                                                        <c:forEach var="page" begin="${1}" end="${currentPage-3}" step="1">
                                                                            <c:set var="decr" value="${totalPagesInt-page}"/>
                                                                            <li class="page-item">
                                                                                <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${page}">
                                                                                    ${page}
                                                                                </a>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                            <li class="page-item">
                                                                <a class="page-link" href="#" data-toggle="collapse" data-target="#collapsedPages" aria-expanded="false" aria-controls="collapsedPages">
                                                                    <span aria-hidden="true">...</span>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${currentPage-2 ne 0}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage-2}">
                                                                    ${currentPage-2}
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage-1}">
                                                                ${currentPage-1}
                                                            </a>
                                                        </li>
                                                        <li class="page-item disabled">
                                                            <span class="page-link">${currentPage}</span>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage+1}">
                                                                ${currentPage+1}
                                                            </a>
                                                        </li>
                                                        <c:if test="${currentPage+2 < totalPagesInt}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage+2}">
                                                                    ${currentPage+2}
                                                                </a>
                                                            </li>

                                                        </c:if>
                                                        <c:if test="${currentPage+3 <= totalPagesInt}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="#" data-toggle="collapse" data-target="#collapsedPages2" aria-expanded="false" aria-controls="collapsedPages2">
                                                                    <span aria-hidden="true">...</span>
                                                                </a>
                                                            </li>
                                                            <div class="collapse" id="collapsedPages2">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination justify-content-center">
                                                                        <c:forEach var="page" begin="${currentPage+3}" end="${totalPages}">
                                                                            <li class="page-item">
                                                                                <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${page}">
                                                                                    ${page}
                                                                                </a>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </c:if>
                                                        <li class="page-item">
                                                            <a class="page-link" href="DispatcherController?action=forums-cate&id=${cate.id}&pageNumber=${currentPage + 1}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white mt-5 py-5 px-sm-3 px-md-5">
            <div class="row pt-5">
                <div class="col-lg-4 col-md-12 mb-5">
                    <h1 class="mb-3 display-5 text-capitalize text-white"><span class="text-primary">Dog&Cat</span>Lover</h1>
                    <p class="m-0">Chung toi hi vong nen tang nay se giup ban trong viec cham soc thu cung va hay tham gia dien dan de ban co the tham gia trao doi voi nha nhu trao doi cho, meo, do dung cua cho hoac meo va dich vu cham soc thu cung</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="text-primary mb-4">Get In Touch</h5>
                            <p><i class="fa fa-map-marker-alt mr-2"></i>Nha van hoa sinh vien, Tp.Thu Duc, VN</p>
                            <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                            <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="text-primary mb-4">Popular Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Forums</a>
                                <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Trade</a>
                                <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-white py-4 px-sm-3 px-md-5" style="background: #111111;">
            <div class="row">
                <div class="col-md-6 text-center text-md-left mb-3 mb-md-0">
                    <p class="m-0 text-white">
                        &copy; <a class="text-white font-weight-bold" href="#"> 2023 DCLP</a>.All Rights Reserved.
                    </p>
                </div>
                <div class="col-md-6 text-center text-md-right">
                    <ul class="nav d-inline-flex">
                        <li class="nav-item">
                            <a class="nav-link text-white py-0" href="#">Privacy</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white py-0" href="#">Terms</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white py-0" href="#">FAQs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white py-0" href="#">Help</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
