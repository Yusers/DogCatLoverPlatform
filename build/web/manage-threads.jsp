<%-- 
    Document   : manage-threads
    Created on : Oct 11, 2023, 12:30:58 AM
    Author     : overw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

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
                        <c:set var="us" value="${sessionScope.MEMBER}" />
                        <c:choose>
                            <c:when test="${us == null}">
                                <a style="text-align: center" class="text-white pl-3" href="login.jsp">
                                    <i class="fa fa-user"></i> <br> Log in
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a style="text-align: center" class="text-white pl-3" href="login.jsp">
                                    <i class="fa fa-user"></i> <br> ${us.user_id}
                                </a>
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
                        <a href="about.jsp" class="nav-item nav-link active">About</a>
                        <a href="forums.jsp" class="nav-item nav-link">Forums</a>
                        <a href="tradepage.jsp" class="nav-item nav-link">Trade</a>
                        <!--                        
                        <div class="nav-item dropdown">
                            <a href="tradepage.jsp" class="nav-link dropdown-toggle" data-toggle="dropdown">Trade</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="#" class="dropdown-item">Dog</a>
                                <a href="#" class="dropdown-item">Cat</a>
                                <a href="#" class="dropdown-item">Items</a>
                            </div>
                        </div>
                        -->
                        <a href="#" class="nav-item nav-link">Contact</a>
                    </div>

                </div>
            </nav>
        </div>
        <!-- Navbar End -->

        <!-- Manage Threads Start -->
        <div class="container mt-5">
            <h1 class="mb-4">Manage Threads</h1>

            <!-- Thread List -->
            <div class="card mb-4">
                <div class="card-header">
                    Thread List
                </div>
                <div class="card-body">
                    <div class="accordion" id="threadAccordion">
                        <!-- Thread 1 -->
                        <div class="card">
                            <div class="card-header" id="thread1">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseThread1" aria-expanded="true" aria-controls="collapseThread1">
                                        Thread Title 1
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseThread1" class="collapse" aria-labelledby="thread1" data-parent="#threadAccordion">
                                <div class="card-body">
                                    <div class="card">
                                        <div class="card-header">
                                            Thread Short Details
                                        </div>
                                        <div class="card-body">
                                            <!-- Thread Information -->
                                            <div class="mb-3">
                                                <h5>Thread Title</h5>
                                                <p>Thread Description or Information</p>
                                            </div>

                                            <!-- Thread Actions (e.g., Delete, Edit) -->
                                            <div class="row">
                                                <div class="btn-group col-md-4 d-flex justify-content-start">
                                                    <button class="btn btn-danger">Delete</button>
                                                    <button class="btn btn-primary">Edit</button>
                                                </div>
                                                <div class="col-md-6"></div>
                                                <div class="col-md-2 d-flex justify-content-end">
                                                    <a href="manage-thread.jsp" class="text text-primary">More Details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Thread 2 -->
                        <div class="card">
                            <div class="card-header" id="thread2">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseThread2" aria-expanded="true" aria-controls="collapseThread2">
                                        Thread Title 2
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseThread2" class="collapse" aria-labelledby="thread2" data-parent="#threadAccordion">
                                <div class="card-body">
                                    <div class="card">
                                        <div class="card-header">
                                            Thread Short Details
                                        </div>
                                        <div class="card-body">
                                            <!-- Thread Information -->
                                            <div class="mb-3">
                                                <h5>Thread Title</h5>
                                                <p>Thread Description or Information</p>
                                            </div>

                                            <!-- Thread Actions (e.g., Delete, Edit) -->
                                            <div class="row">
                                                <div class="btn-group col-md-4 d-flex justify-content-start">
                                                    <button class="btn btn-danger">Delete</button>
                                                    <button class="btn btn-primary">Edit</button>
                                                </div>
                                                <div class="col-md-6"></div>
                                                <div class="btn-group col-md-2 d-flex justify-content-end">
                                                    <a href="manage-thread.jsp" class="text text-primary">More Details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Thread 3 -->
                        <div class="card">
                            <div class="card-header" id="thread3">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseThread3" aria-expanded="true" aria-controls="collapseThread3">
                                        Thread Title 3
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseThread3" class="collapse" aria-labelledby="thread3" data-parent="#threadAccordion">
                                <div class="card-body">
                                    <div class="card">
                                        <div class="card-header">
                                            Thread Short Details
                                        </div>
                                        <div class="card-body">
                                            <!-- Thread Information -->
                                            <div class="mb-3">
                                                <h5>Thread Title</h5>
                                                <p>Thread Description or Information</p>
                                            </div>

                                            <!-- Thread Actions (e.g., Delete, Edit) -->
                                            <div class="row">
                                                <div class="btn-group col-md-4 d-flex justify-content-start">
                                                    <button class="btn btn-danger">Delete</button>
                                                    <button class="btn btn-primary">Edit</button>
                                                </div>
                                                <div class="col-md-6"></div>
                                                <div class="btn-group col-md-2 d-flex justify-content-end">
                                                    <a href="manage-thread.jsp" class="text text-primary">More Details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- About End -->

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

