<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dbaccess.MessageDAO" %>
<%@ page import="dbaccess.ConversationDAO" %>
<c:set var="us" value="${sessionScope.USER}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giới Thiệu | Cat Dog Lover Website</title>

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

            .card-body {
                height: 400px;
                overflow-y: scroll;
            }
        </style>
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
                                            <a class="dropdown-item" href="DispatcherController?action=staff-manage">Dash board</a>
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
                        <a href="DispatcherController?action=forums" class="nav-item nav-link">Forums</a>
                        <a href="DispatcherController?action=trade" class="nav-item nav-link">Trade</a>
                        <a href="DispatcherController?action=contact-us" class="nav-item nav-link">Contact</a>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->
        <c:set var="listMess" value="${MessageDAO.getAllMessage(requestScope.CONVER_ID)}" />
        <c:set var="topic" value="${ConversationDAO.getConversationTopic(requestScope.CONVER_ID)}" />
        <div class="container mt-5 mb-5">
            <div id="chatBox" class="chat-box">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        ${topic}
                        <button type="button" class="close" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="card-body chat-container">
                        <div class="chat-messages">
                            <c:forEach var="m" items="${listMess}">
                                <div class="${m.sender_id == us.user_id ? 'my-message' : 'other-message'}"><strong>${m.sender_id == us.user_id ? us.user_id : m.sender_id}:</strong> ${m.content}</div>
                            </c:forEach>
                            <div id="chat" class="chat"></div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <form action="DispatcherController" method="POST" id="messageForm">
                            <input type="hidden" name="action" value="create-message" />
                            <input type="hidden" name="sender_id" value="${us.user_id}" />
                            <input type="hidden" name="receiver_id" value="${listMess.get(0).receiver_id}" />
                            <input type="hidden" name="conversation_id" value="${listMess.get(0).conversation_id}" />
                            <div class="input-group">
                                <input type="text" name="content" required="*" id="msg" class="form-control" placeholder="Type a message...">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </div>
                            </div>
                        </form>
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

        <script type="text/javascript">
            var wsUrl;
            if (window.location.protocol == 'http:') {
                wsUrl = 'ws://';
            } else {
                wsUrl = 'wss://';
            }
            var ws = new WebSocket(wsUrl + window.location.host + "/DogCatLoverPlatform");

            var username = '<c:out value="${sessionScope.USER.user_id}" />';

            ws.onmessage = function (event) {
                var mySpan = document.getElementById("chat");
                mySpan.innerHTML += event.data + "<br/>";
            };

            ws.onerror = function (event) {
                console.log("Error ", event)
            }

            function sendMsg() {
                var msg = document.getElementById("msg").value;
                if (msg) {
                    ws.send(username + ": " + msg);
                    appendMessage(username + ": " + msg, true);
                }
                document.getElementById("msg").value = "";
            }

            function appendMessage(message, isMyMessage) {
                var chatBox = document.getElementById('chat');
                var messageContainer = document.createElement('div');
                var messageContent = document.createElement('div');
                messageContent.innerText = message;
                messageContainer.appendChild(messageContent);

                if (isMyMessage) {
                    messageContainer.classList.add('my-message');
                } else {
                    messageContainer.classList.add('other-message');
                }

                chatBox.appendChild(messageContainer);
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
