<%-- Document : staffpage Created on : Oct 11, 2023, 12:34:53 AM Author : overw --%>

    <%-- Document : about Created on : Oct 1, 2023, 10:28:30 PM Author : ADMIN --%>

        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>JSP Page</title>

                    <!-- Favicon -->
                    <link href="img/favicon.ico" rel="icon">

                    <!-- Google Web Fonts -->
                    <link
                        href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap"
                        rel="stylesheet">

                    <!-- Font Awesome -->
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                        rel="stylesheet">

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
                                    <c:set var="us" value="${sessionScope.USER}" />
                                    <c:set var="us" value="${sessionScope.USER}" />
                                    <c:choose>
                                        <c:when test="${us == null}">
                                            <a style="text-align: center" class="text-white pl-3" href="login.jsp">
                                                <i class="fa fa-user"></i> Log in
                                                <i class="fa fa-user"></i> Log in
                                            </a>
                                        </c:when>
                                        <c:when test="${us != null}">
                                            <div class="dropdown">
                                                <button class="btn btn-primary dropdown-toggle" type="button"
                                                    id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    <i class="fa fa-user"></i> ${us.user_id}
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="viewprofile.jsp">View Profile</a>
                                                    <c:if test="${us.role == 'ADMIN'}">
                                                        <a class="dropdown-item"
                                                            href="DispatcherController?action=manage">Dashboard</a>
                                                    </c:if>
                                                    <c:if test="${us.role eq 'STAFF'}">
                                                        <a class="dropdown-item"
                                                            href="DispatcherController?action=staff-manage">Dash
                                                            board</a>
                                                    </c:if>
                                                    <a class="dropdown-item"
                                                        href="DispatcherController?action=my-post">My Posts</a>
                                                    <a class="dropdown-item" href="LoadConversationController">Chat</a>
                                                    <a class="dropdown-item"
                                                        href="DispatcherController?action=logout">Log out</a>
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
                                    <h1 class="m-0 display-5 text-capitalize"><span
                                            class="text-primary">Dog&Cat</span>Lover</h1>
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
                                <h1 class="m-0 display-5 text-capitalize font-italic text-white"><span
                                        class="text-primary">Dog&Cat</span>Lover</h1>
                            </a>
                            <button type="button" class="navbar-toggler" data-toggle="collapse"
                                data-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                                <div class="navbar-nav mr-auto py-0">
                                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                                    <a href="about.jsp" class="nav-item nav-link">About</a>
                                    <a href="DispatcherController?action=forums" class="nav-item nav-link">Forums</a>
                                    <a href="DispatcherController?action=trade" class="nav-item nav-link">Trade</a>
                                    <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                                </div>

                            </div>
                        </nav>
                    </div>
                    <!-- Navbar End -->
                    <c:set var="listOfMember" value="${requestScope.MEMBERS}" />

                    <!-- Staff Dashboard Start -->
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-md-12">
                                <h1>Staff Dashboard</h1>
                                <div class="row mb-3">
                                    <div class="col-md-12 text-center">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Total Members</h5>
                                                <p class="card-text">3</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage Members</h5>
                                        <input type="text" class="form-control mb-3" placeholder="Search Members">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Member ID</th>
                                                    <th>Member Name</th>
                                                    <th>Member Email</th>
                                                    <th>Member Posts</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Rows for members go here -->
                                                <tr class="text-center">
                                                    <td>1</td>
                                                    <td><a
                                                            href="viewprofile.jsp?username=Tan&email=tan@gmail.com">Tân</a>
                                                    </td>
                                                    <td>tan@gmail.com</td>
                                                    <td><a href="manage-threads.jsp">Post</a></td>
                                                    <td class="text-center">
                                                        <button class="btn btn-warning"><a
                                                                href="editprofileuser.jsp">Edit</a></button>
                                                        <button class="btn btn-danger">Delete</button>
                                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                            data-target="#modal-promote">
                                                            Ban
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td>1</td>
                                                    <td><a href="viewprofile.jsp?username=An&email=an@gmail.com">An</a>
                                                    </td>
                                                    <td>an@gmail.com</td>
                                                    <td><a href="">Post</a></td>
                                                    <td>
                                                        <button class="btn btn-warning"><a
                                                                href="editprofileuser.jsp">Edit</a></button>
                                                        <button class="btn btn-danger">Delete</button>
                                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                            data-target="#modal-promote">
                                                            Ban
                                                        </button>

                                                    </td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td>1</td>
                                                    <td><a
                                                            href="viewprofile.jsp?username=Nguyen&email=nguyen@gmail.com">Nguyên</a>
                                                    </td>
                                                    <td>nguyen@gmail.com</td>
                                                    <td><a href="">Post</a></td>
                                                    <td>
                                                        <button class="btn btn-warning"><a
                                                                href="editprofileuser.jsp">Edit</a></button>
                                                        <button class="btn btn-danger">Delete</button>
                                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                            data-target="#modal-promote">
                                                            Ban
                                                        </button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Staff Dashboard End -->



                    <!-- JavaScript Libraries -->
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script
                        src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
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