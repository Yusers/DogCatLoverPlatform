<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dbaccess.CommentDAO" %>
<%@ page import="dbaccess.AccountDAO" %>


<!DOCTYPE html>
<c:set var="post" value="${requestScope.POST}" />
<c:set var="cate" value="${requestScope.CATE}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${post.title}</title>
        <!-- Favicon -->
        <link href="img/icons8-pet-lover-16.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Flaticon Font -->
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- css custom -->
        <link rel="stylesheet" href="./assets/css/thread.css"/>

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .cus-comment {
                margin-left: 4rem;
            }

            .cus-comment:hover {
                cursor: pointer;
            }

            .comment__user-content{
                border: 1px solid #454d55;
                border-radius: 10px;
                background-color: #ededed;
            }
            .comment__user-content p{
                margin: 0.5rem;
            }
        </style>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v13.0&appId=YOUR_APP_ID&autoLogAppEvents=1" nonce="YOUR_NONCE"></script>
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
                            <c:when test="${us != null}">
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
                                            <a class="dropdown-item" href="DispatcherController?action=staff-manage">Dash board</a>
                                        </c:if>
                                        <a class="dropdown-item" href="DispatcherController?action=my-post">My Posts</a>
                                        <a class="dropdown-item" href="DispatcherController?action=conversation">Chat</a>
                                        <a class="dropdown-item" href="DispatcherController?action=logout">Log out</a>
                                    </div>
                                </div>
                            </c:when>
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
        <c:set var="us" value="${sessionScope.USER}"/>
        <c:set var="author" value="${AccountDAO.getAccount(post.author_id)}" />
        <!-- Threads -->
        <div class="container mt-5">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="DispatcherController?action=forums">Diễn Đàn</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Bài Đăng Về -> ${cate.name}</li>
                </ol>
            </nav>
            <!-- Thread Title -->
            <h1>${post.title}</h1>

            <!-- Thread Author -->
            <div class="row align-items-center mb-4">
                <div class="col-md-12">
                    <div class="alert alert-info">
                        <div class="author">
                            <img class="img-fluid mr-3" style="width: 100px; height: 100px; border-radius: 50%" src="${(author.avatar ne 'NULL' && not empty author.avatar) ? author.avatar : 'assets/img/149071.png'}" />
                            <div class="author-container">
                                <div class="author-info">
                                    <c:if test="${us.role != null}"><h6><a href="DispatcherController?action=manage&actions=viewprofile&usname=${post.author_id}">${post.author_id}</a></h6></c:if>
                                    <c:if test="${us.role == null}"><h6><a href="DispatcherController?action=login-page">${post.author_id}</a></h6></c:if>
                                    <p>${post.created_at} | Lượt thích: ${post.favorites}</p>
                                </div>
                                <div class="post-action">
                                    <a href="DispatcherController?action=handle-like&id=${post.id}&likes=${post.favorites}" style="padding: 11px 4px"><svg xmlns="http://www.w3.org/2000/svg" height="1.8em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/></svg></a>
                                    <button style='background-color: inherit; border: none;' id="shareButton" onclick='sharePost()'><svg xmlns="http://www.w3.org/2000/svg" height="1.8em" viewBox="0 0 512 512"><path d="M307 34.8c-11.5 5.1-19 16.6-19 29.2v64H176C78.8 128 0 206.8 0 304C0 417.3 81.5 467.9 100.2 478.1c2.5 1.4 5.3 1.9 8.1 1.9c10.9 0 19.7-8.9 19.7-19.7c0-7.5-4.3-14.4-9.8-19.5C108.8 431.9 96 414.4 96 384c0-53 43-96 96-96h96v64c0 12.6 7.4 24.1 19 29.2s25 3 34.4-5.4l160-144c6.7-6.1 10.6-14.7 10.6-23.8s-3.8-17.7-10.6-23.8l-160-144c-9.4-8.5-22.9-10.6-34.4-5.4z"/></svg></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Thread Content -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="alert alert-secondary" role="alert">
                                Chúng tôi rất vui mừng khi chào đón bạn vào cộng đồng của chúng tôi. Đây là nơi để chia sẻ ý kiến, hỏi đáp và kết nối với những người có sở thích tương tự. 
                                Hãy không ngần ngại tham gia vào các cuộc trò chuyện và đóng góp ý kiến của bạn.
                            </div>
                            <!-- Thread img -->
                            <c:if test="${not empty post.image && post.image ne 'NULL'}">                            
                                <img style="height: 22rem; object-fit: scale-down;" src="${post.image}" class="card-img-top thread-img" alt="${post.title}"><br>
                            </c:if>
                            <p style="text-align: justify; white-space: pre-line;">
                                ${post.content.trim()}
                            </p>
                            <!--<img src="./assets/img/blog-2.jpg" class="card-img-top thread-img" alt="blog-1"><br>-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sidebar with Replies -->
            <div class="row">
                <!-- Replies Section -->
                <div class="col-md-12 replies">
                    <div class="comment">
                        <div class="user-info">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
                            <span><c:if test="${us.role != null}"><a href="DispatcherController?action=manage&actions=viewprofile&usname=${us.user_id}">${us.user_id != null ? us.user_id : "Guess"}</a></c:if>
                                <c:if test="${us.role == null}"><a href="DispatcherController?action=login-page">${us.user_id != null ? us.user_id : "Guess"}</a></c:if></span>
                            </div>
                            <form action="DispatcherController" method="POST">
                                <input type="hidden" name="action" value="comment" />
                                <input type="hidden" name="post-id" value="${post.id}" />
                            <input type="hidden" name="author-id" value="${us.user_id}" />
                            <input type="hidden" name="parent-id" value="0" />
                            <c:choose>
                                <c:when test="${empty us.role}">
                                    <input placeholder="Write a comment..." value="" type="text" class="form-control" aria-label="Sizing example input" disabled aria-describedby="inputGroup-sizing-sm">
                                    <button class="btn btn-primary mt-2" type="button" onclick="showLoginPrompt()">Comment</button>
                                </c:when>
                                <c:when test="${post.status eq 'Created' or post.status eq 'Rejected'}">
                                    <input placeholder="This post need Approve first" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" disabled>
                                </c:when>
                                <c:when test="${us.status ne 'Active'}">
                                    <input placeholder="You are not allowed to comments" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" disabled>
                                </c:when>
                                <c:otherwise>
                                    <input id="commentInput" name="content" required="*" placeholder="Write a comment..." type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                    <button class="btn btn-primary mt-2" type="submit">Comment</button>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                    <!-- Reply 1 -->
                    <c:forEach items="${requestScope.COMMENTS}" var="comment">
                        <c:choose>
                            <c:when test="${comment.parent_id == 0}">
                                <!-- This is a top-level comment -->
                                <div class="comment">
                                    <div class="user-info">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
                                        <span><c:if test="${us.role != null}"><a href="DispatcherController?action=manage&actions=viewprofile&usname=${comment.author_id}">${comment.author_id}</a></c:if>
                                            <c:if test="${us.role == null}"><a href="DispatcherController?action=login-page">${comment.author_id}</a></c:if></span>
                                        </div>
                                        <div class="comment__user-content">
                                            <p>${comment.content}</p>
                                    </div>
                                    <a class="cus-comment text-primary" data-toggle="collapse" data-target="#replyFormTop${comment.id}">Reply</a>
                                    <div class="mt-1 ml-4 collapse" id="replyFormTop${comment.id}">
                                        <div class="user-info">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
                                            <span><a href="DispatcherController?action=manage&actions=viewprofile&usname=NhatNTM">${us.user_id != null ? us.user_id : "Guess"}</a></span>
                                        </div>
                                        <form action="DispatcherController" method="POST">
                                            <input type="hidden" name="action" value="comment" />
                                            <input type="hidden" name="post-id" value="${post.id}" />
                                            <input type="hidden" name="author-id" value="${us.user_id}" />
                                            <input type="hidden" name="parent-id" value="${comment.id}" />
                                            <c:choose>
                                                <c:when test="${empty us.role}">
                                                    <input placeholder="Write a comment..." value="" type="text" class="form-control" aria-label="Sizing example input" disabled aria-describedby="inputGroup-sizing-sm">
                                                    <button class="btn btn-primary mt-2" type="button" onclick="showLoginPrompt()">Comment</button>
                                                </c:when>
                                                <c:when test="${post.status eq 'Created' or post.status eq 'Rejected'}">
                                                    <input placeholder="This post need Approve first" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" disabled>
                                                </c:when>
                                                <c:when test="${us.status ne 'Active'}">
                                                    <input placeholder="You are not allowed to comments" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" disabled>
                                                </c:when>
                                                <c:otherwise>
                                                    <input id="commentInput" name="content" required="*" placeholder="Write a comment..." type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                                    <button class="btn btn-primary mt-2" type="submit">Comment</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </div>
                                    <c:forEach var="sub" items="${CommentDAO.getSubComment(post.id, comment.id)}">
                                        <div class="sub-reply pl-4">
                                            <div class="user-info">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
                                                <span><a href="DispatcherController?action=manage&actions=viewprofile&usname=NhatNTM">${sub.author_id}</a></span>
                                            </div>
                                            <div style="margin-bottom: 0; margin-left: 1rem;" class="comment__user-content"><p>${sub.content}</p></div>
                                            <a class="cus-comment text-primary" data-toggle="collapse" data-target="#replyForm${comment.id}">Reply</a>
                                        </div>
                                    </c:forEach>
                                    <div class="mt-1 pl-4 collapse" id="replyForm${comment.id}">
                                        <div class="user-info">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
                                            <span><a href="DispatcherController?action=manage&actions=viewprofile&usname=NhatNTM">${us.user_id != null ? us.user_id : "Guess"}</a></span>
                                        </div>
                                        <form action="DispatcherController" method="POST">
                                            <input type="hidden" name="action" value="comment" />
                                            <input type="hidden" name="post-id" value="${post.id}" />
                                            <input type="hidden" name="author-id" value="${us.user_id}" />
                                            <input type="hidden" name="parent-id" value="${comment.id}" />
                                            <c:choose>
                                                <c:when test="${empty us.role}">
                                                    <input placeholder="Write a comment..." value="" type="text" class="form-control" aria-label="Sizing example input" disabled aria-describedby="inputGroup-sizing-sm">
                                                    <button class="btn btn-primary mt-2" type="button" onclick="showLoginPrompt()">Comment</button>
                                                </c:when>
                                                <c:when test="${post.status eq 'Created' or post.status eq 'Rejected'}">
                                                    <input placeholder="This post need Approve first" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" disabled>
                                                </c:when>
                                                <c:when test="${us.status ne 'Active'}">
                                                    <input placeholder="You are not allowed to comments" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" disabled>
                                                </c:when>
                                                <c:otherwise>
                                                    <input id="commentInput" name="content" required="*" placeholder="Write a comment..." type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                                    <button class="btn btn-primary mt-2" type="submit">Comment</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- end Threads -->

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
                        &copy; <a class="text-white font-weight-bold" href="#"> Donate</a> de giup tui minh phat trien them nha. All Rights Reserved.
                        <&a class="text-white font-weight-bold" href=""></a>
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

        <script>
            $(document).ready(function () {
                $(".show-sub-replies").click(function () {
                    $(this).siblings(".sub-replies").toggle();
                });
            });

            function showLoginPrompt() {
                var confirmation = confirm("You must be logged in to comment. Do you want to go to the login page?");
                if (confirmation) {
                    window.location.href = "DispatcherController?action=login-page"; // Điều hướng đến trang đăng nhập
                }
            }

            function comment() {
                // Thực hiện xử lý bình luận ở đây
                var commentInput = document.getElementById("commentInput");
                if (commentInput.value.trim() !== '') {
                    alert("Comment submitted");
                    commentInput.value = ''; // Xóa nội dung comment trong trường nhập
                } else {
                    alert("Please enter a comment before submitting.");
                }
            }

            function sharePost() {
                // Replace with the URL of the post you want to share
                const postUrl = window.location.href;

                // Open Facebook share dialog
                FB.ui({
                    method: 'share',
                    href: postUrl,
                }, function (response) {
                    // Optional: Handle the response if needed
                    console.log(response);
                });
            }
        </script>

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
