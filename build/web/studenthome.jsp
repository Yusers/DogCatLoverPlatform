<%-- 
    Document   : StudentSearch
    Created on : Oct 20, 2023, 12:31:14 PM
    Author     : overw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Thêm liên kết đến Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .user-profile {
                width: 30px; /* Độ rộng của hình tròn */
                height: 30px; /* Chiều cao của hình tròn */
                border-radius: 50%; /* Để biến hình thành hình tròn */
                object-fit: cover; /* Đảm bảo hình ảnh vừa với hình tròn */
            }

            /* Thêm border dưới cho Navbar */
            .navbar {
                border-bottom: 0.5px solid #f27125; /* Màu và độ dày của đường border */
                background-color: #fff; /* Màu nền của Navbar */
            }

            /* Thay đổi màu chữ cho các mục menu */
            .navbar-nav .nav-link {
                color: #fff; /* Màu chữ trắng */
            }

            /* Hiệu ứng hover cho các mục menu */
            .navbar-nav .nav-item:not(:last-child) .nav-link:hover {
                color: tomato; /* Màu chữ khi hover */
                /*border: 1px solid #000;  Viền đen xung quanh khi hover */
            }

            .card-body > div {
                margin-bottom: 0.2rem;
            }
            
            .card-body > .btn-book {
                margin-top: 1rem;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="https://daihoc.fpt.edu.vn/" target="_blank">
                <img src="./img/2021fptulong-1-1@2x.png" width="100px" class="d-inline-block align-top" alt="Logo">
            </a>
            <div class="ml-auto">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">View Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Request</a>
                    </li>
                    <li class="nav-item">
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="./img/person.svg" class="user-profile" alt="User Profile">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#">Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card" style="width: 260px; height: 240px; border-radius: 5%;">
                        <div class="card-body">
                            <div class="d-flex justify-content-between"><strong>Subject:</strong> <span class="ml-auto">SWP209</span></div>
                            <div class="d-flex justify-content-between"><strong>Lecture name:</strong> <span class="ml-auto">LamNN15</span></div>
                            <div class="d-flex justify-content-between"><strong>Semester:</strong> <span class="ml-auto">Fall23</span></div>
                            <div class="d-flex justify-content-between"><strong>Start time:</strong> <span class="ml-auto">12:30 01/10/2023</span></div>
                            <div class="d-flex justify-content-between"><strong>End time:</strong> <span class="ml-auto">13:30 01/10/2023</span></div>
                            <div class="d-flex justify-content-between"><strong>Limit:</strong> <span class="ml-auto">1/6</span></div>
                            <div class="d-flex justify-content-end btn-book">
                                <!-- Added d-flex justify-content-between to create a flex container -->
                                <a href="#" class="btn btn-primary">BOOK</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 260px; height: 240px; border-radius: 5%;">
                        <div class="card-body">
                            <div class="d-flex justify-content-between"><strong>Subject:</strong> <span class="ml-auto">SWP209</span></div>
                            <div class="d-flex justify-content-between"><strong>Lecture name:</strong> <span class="ml-auto">LamNN15</span></div>
                            <div class="d-flex justify-content-between"><strong>Semester:</strong> <span class="ml-auto">Fall23</span></div>
                            <div class="d-flex justify-content-between"><strong>Start time:</strong> <span class="ml-auto">12:30 01/10/2023</span></div>
                            <div class="d-flex justify-content-between"><strong>End time:</strong> <span class="ml-auto">13:30 01/10/2023</span></div>
                            <div class="d-flex justify-content-between"><strong>Limit:</strong> <span class="ml-auto">1/6</span></div>
                            <div class="d-flex justify-content-end btn-book">
                                <!-- Added d-flex justify-content-between to create a flex container -->
                                <a href="#" class="btn btn-primary">BOOK</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 260px; height: 240px; border-radius: 5%;">
                        <div class="card-body">
                            <div class="d-flex justify-content-between"><strong>Subject:</strong> <span class="ml-auto">SWP209</span></div>
                            <div class="d-flex justify-content-between"><strong>Lecture name:</strong> <span class="ml-auto">LamNN15</span></div>
                            <div class="d-flex justify-content-between"><strong>Semester:</strong> <span class="ml-auto">Fall23</span></div>
                            <div class="d-flex justify-content-between"><strong>Start time:</strong> <span class="ml-auto">12:30 01/10/2023</span></div>
                            <div class="d-flex justify-content-between"><strong>End time:</strong> <span class="ml-auto">13:30 01/10/2023</span></div>
                            <div class="d-flex justify-content-between"><strong>Limit:</strong> <span class="ml-auto">1/6</span></div>
                            <div class="d-flex justify-content-end btn-book">
                                <!-- Added d-flex justify-content-between to create a flex container -->
                                <a href="#" class="btn btn-primary">BOOK</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Thêm liên kết đến Bootstrap JS và jQuery -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-xV6VaRqI1z7MOJwz5Mz6f3GC6A5wA5CKh5uFfxn5g5crf7Sc6Pe4OdU8paHdFuI" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
