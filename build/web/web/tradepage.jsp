<%-- 
    Document   : tradepage
    Created on : Oct 4, 2023, 12:19:15 AM
    Author     : overw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dbaccess.AccountDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trao Đổi & Mua Bán | Cat Dog Lover Website</title>
        <style>
            .my-message {
                text-align: right;
                background-color: #cceeff; /* Light blue for your messages */
                border-radius: 10px;
                padding: 5px 10px;
                margin: 5px 0;
            }

            .other-message {
                text-align: left;
                background-color: #f0f0f0; /* Light gray for others' messages */
                border-radius: 10px;
                padding: 5px 10px;
                margin: 5px 0;
            }
        </style>
    </head>

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

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="assets/css/trade.css" rel="stylesheet">

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
                                <a style="text-align: center" class="text-white pl-3" href="login.jsp">
                                    <i class="fa fa-user"></i> Log in
                                </a>
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-user"></i> ${us.user_id}
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="viewprofile.jsp">View Profile</a>
                                        <c:if test="${us.role eq 'ADMIN'}">
                                            <a class="dropdown-item" href="DispatcherController?action=manage">Dashboard</a>
                                        </c:if>
                                        <a class="dropdown-item" href="#">My Posts</a>
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
                        <a href="index.jsp" class="nav-item nav-link">Home</a>
                        <a href="about.jsp" class="nav-item nav-link">About</a>
                        <a href="DispatcherController?action=forums" class="nav-item nav-link">Forums</a>
                        <a href="DispatcherController?action=trade" class="nav-item nav-link active">Trade</a>
                        <!--                        <div class="nav-item dropdown">
                                                    <a href="tradepage.jsp" class="nav-link dropdown-toggle" data-toggle="dropdown">Trade</a>
                                                    <div class="dropdown-menu rounded-0 m-0">
                                                        <a href="#" class="dropdown-item">Dog</a>
                                                        <a href="#" class="dropdown-item">Cat</a>
                                                        <a href="#" class="dropdown-item">Items</a>
                                                    </div>
                                                </div>-->
                        <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                    </div>

                </div>
            </nav>
        </div>
        <!-- Navbar End -->
        <div class="container mt-5">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Trao Đổi Và Mua Bán</li>
                </ol>
            </nav>
            <!-- Page Title -->
            <h1>Cat & Dog Trading</h1>

            <!-- Item Listings -->
            <div class="row pb-3">
                <c:forEach var="trade" items="${requestScope.TRADES}">
                    <div class="col-lg-4 mb-4">
                        <div class="card border-0 mb-2">
                            <img class="card-img-top img-fluid" src="${trade.image}" alt="${trade.title}">
                            <div class="card-body bg-light p-4">
                                <h4 class="card-title text-truncate">${trade.title}</h4>
                                <div class="d-flex mb-3">
                                    <small class="mr-2"><i class="fa fa-user text-muted"></i> <a href="viewprofile.jsp?username=Nguyen&email=nguyen@gmail.com">${trade.author_id}</a></small>
                                    <small class="mr-2"><i class="fa fa-folder text-muted"></i> <a href="#">${trade.cate_id}</a></small>
                                    <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                                </div>
                                <p>${trade.content}</p>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal" data-trade-title="${trade.title}" data-trade-author="${trade.author_id}" data-trade-content="${trade.content}">View Details</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="postModalLabel"></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <img src="assets/img/cat-1.jpg" class="img-fluid" alt="Big Image">
                                    </div>
                                    <div class="col-md-6">
                                        <h5 class="author-name"></h5>
                                        <p>Email: <span class="author-email"></span></p>
                                        <p>Điện Thoại: <span class="author-phone"></span></p>
                                        <button type="button" class="btn btn-primary mt-2" id="contactUser">Chat</button>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col">
                                        <h5>Mô Tả</h5>
                                        <p class="trade-content"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="chatBox" class="chat-box">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    Chat with User
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="card-body">
                    <div class="chat-messages" id="chat"></div>
                </div>
                <div class="card-footer">
                    <div class="input-group">
                        <input type="text" name="msg" id="msg" class="form-control" placeholder="Type a message...">
                        <div class="input-group-append">
                            <button onclick="return sendMsg();" class="btn btn-primary" type="button">Send</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#postModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget);
                    var title = button.data('trade-title');
                    var author = button.data('trade-author');
                    var content = button.data('trade-content');

                    var modal = $(this);
                    modal.find('.modal-title').text(title);
                    modal.find('.modal-body .author-name').text(author);
                    modal.find('.modal-body .trade-content').text(content);
                });
            });

            var wsUrl;
            if (window.location.protocol == 'http:') {
                wsUrl = 'ws://';
            } else {
                wsUrl = 'wss://';
            }
            var ws = new WebSocket(wsUrl + window.location.host + "/DogCatLoverPlatform/chat");
            var username = '<c:out value="${us.user_id}"/>'; // Get username from session

            ws.onmessage = function (event) {
                var messageData = JSON.parse(event.data);
                var sender = messageData.sender;
                var message = messageData.message;
                var chat = document.getElementById("chat");
                var messageElement = document.createElement('div');

                if (sender === username) {
                    messageElement.classList.add('my-message');
                } else {
                    messageElement.classList.add('other-message');
                }

                messageElement.innerHTML = '<strong>' + sender + ':</strong> ' + message;
                chat.appendChild(messageElement);
                chat.scrollTop = chat.scrollHeight;
            };

            ws.onerror = function (event) {
                console.log("Error ", event)
            }

            function sendMsg() {
                var msg = document.getElementById("msg").value;
                if (msg) {
                    var messageData = {
                        sender: username,
                        message: msg
                    };
                    ws.send(JSON.stringify(messageData));
                }
                document.getElementById("msg").value = "";
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
        <script src="assets/scripts/trade.js"></script>
    </body>
</html>

