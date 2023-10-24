<%-- 
    Document   : tradepage
    Created on : Oct 4, 2023, 12:19:15 AM
    Author     : overw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <a href="tradepage.jsp" class="nav-item nav-link active">Trade</a>
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
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top img-fluid" src="assets/img/cat-1.jpg" alt="">
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">American Cat</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> <a href="viewprofile.jsp?username=Nguyen&email=nguyen@gmail.com">Nguyên</a></small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> <a href="#">Cat</a></small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Welcome to our thread dedicated to keeping our furry friends in the best possible health!...</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">View Details</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top img-fluid" src="assets/img/cat-2.jpg" alt="">
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">British Longhair Cat</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> <a href="viewprofile.jsp?username=An&email=an@gmail.com">An</a></small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> <a href="#Cat">Cat</a></small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Welcome to our thread dedicated to keeping our furry friends in the best possible health!...</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">View Details</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top img-fluid" src="assets/img/cat-3.jpg" alt="">
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">Munchkin Cat</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> <a href="viewprofile.jsp?username=Kiet&email=kiet@gmail.com">Kiệt</a></small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> <a href="#Cat">Cat</a></small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Welcome to our thread dedicated to keeping our furry friends in the best possible health!...</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">View Details</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top img-fluid" src="assets/img/dog-1.jpg" alt="">
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">Pug Dog</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> <a href="viewprofile.jsp?username=Tan&email=tan@gmail.com">Tân</a></small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> <a href="#Dog">Dog</a></small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Welcome to our thread dedicated to keeping our furry friends in the best possible health!...</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">View Details</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top img-fluid" src="assets/img/dog-2.jpg" alt="">
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">Alaska Dog</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> <a href="viewprofile.jsp?username=Khang&email=khang@gmail.com">Khang</a></small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> <a href="#Dog">Dog</a></small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Welcome to our thread dedicated to keeping our furry friends in the best possible health!...</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">View Details</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 mb-2">
                        <img class="card-img-top img-fluid" src="assets/img/dog-3.jpg" alt="">
                        <div class="card-body bg-light p-4">
                            <h4 class="card-title text-truncate">Corgi Dog</h4>
                            <div class="d-flex mb-3">
                                <small class="mr-2"><i class="fa fa-user text-muted"></i> <a href="viewprofile.jsp?username=Phuoc&email=phuoc@gmail.com">Phước</a></small>
                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> <a href="#Dog">Dog</a></small>
                                <small class="mr-2"><i class="fa fa-comments text-muted"></i> 15</small>
                            </div>
                            <p>Welcome to our thread dedicated to keeping our furry friends in the best possible health!...</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">View Details</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="postModalLabel">American Cat</h5>
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
                                    <h5>Minh Tan</h5>
                                    <p>Email: tan@example.com</p>
                                    <p>Phone: 123-456-7890</p>
                                    <button type="button" class="btn btn-primary mt-2" id="contactUser">Chat</button>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <h5>Description</h5>
                                    <p>Tiêm 1 mũi
                                        Bảo hành sức khoẻ 7 ngày
                                        Xem trực tiếp tại Hà Nội
                                        Ship toàn quốc
                                        Lh Zalo hoặc gọi trực</p>

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
        <div id="chatBox" class="chat-box">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    Chat with User
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="card-body">
                    <div class="chat-messages">
                        <!-- Messages will be added here dynamically using JavaScript -->
                    </div>
                </div>
                <div class="card-footer">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Type a message...">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">Send</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

