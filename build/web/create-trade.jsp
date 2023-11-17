<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dbaccess.Trade_CategoryDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diễn Đàn | Cat Dog Lover Website</title>
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
                                        <c:if test="${us.role == 'ADMIN'}">
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
                        <a href="DispatcherController?action=forums" class="nav-item nav-link">Forums</a>
                        <a href="DispatcherController?action=trade" class="nav-item nav-link active">Trade</a>
                        <a href="DispatcherController?action=contact-us" class="nav-item nav-link">Contact</a>
                    </div>

                </div>
            </nav>
        </div>
        <!-- Navbar End -->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <c:choose>
                        <c:when test="${us.status ne 'Active' or empty us.user_id}">
                            <h1>Bạn không có quyền vào trang này</h1>
                        </c:when>
                        <c:when test="${param.type eq null || empty param.type}">
                            <div class="col-md-12 d-flex justify-content-around">
                                <a href="DispatcherController?action=create-trade-page&type=fee" style="text-decoration: none;">
                                    <div class="card p-3" style="width: 18rem;">
                                        <div class="card-body">
                                            <h5 class="card-title">Hình thức trả phí <svg style="color: #fff" xmlns="http://www.w3.org/2000/svg" height="1rem" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M160 0c17.7 0 32 14.3 32 32V67.7c1.6 .2 3.1 .4 4.7 .7c.4 .1 .7 .1 1.1 .2l48 8.8c17.4 3.2 28.9 19.9 25.7 37.2s-19.9 28.9-37.2 25.7l-47.5-8.7c-31.3-4.6-58.9-1.5-78.3 6.2s-27.2 18.3-29 28.1c-2 10.7-.5 16.7 1.2 20.4c1.8 3.9 5.5 8.3 12.8 13.2c16.3 10.7 41.3 17.7 73.7 26.3l2.9 .8c28.6 7.6 63.6 16.8 89.6 33.8c14.2 9.3 27.6 21.9 35.9 39.5c8.5 17.9 10.3 37.9 6.4 59.2c-6.9 38-33.1 63.4-65.6 76.7c-13.7 5.6-28.6 9.2-44.4 11V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V445.1c-.4-.1-.9-.1-1.3-.2l-.2 0 0 0c-24.4-3.8-64.5-14.3-91.5-26.3c-16.1-7.2-23.4-26.1-16.2-42.2s26.1-23.4 42.2-16.2c20.9 9.3 55.3 18.5 75.2 21.6c31.9 4.7 58.2 2 76-5.3c16.9-6.9 24.6-16.9 26.8-28.9c1.9-10.6 .4-16.7-1.3-20.4c-1.9-4-5.6-8.4-13-13.3c-16.4-10.7-41.5-17.7-74-26.3l-2.8-.7 0 0C119.4 279.3 84.4 270 58.4 253c-14.2-9.3-27.5-22-35.8-39.6c-8.4-17.9-10.1-37.9-6.1-59.2C23.7 116 52.3 91.2 84.8 78.3c13.3-5.3 27.9-8.9 43.2-11V32c0-17.7 14.3-32 32-32z"/></svg></h5>
                                            <p class="card-text">Bài đăng với hình thức trả phí là hình thức bạn sẽ đăng bài sẽ có giá tiền</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="DispatcherController?action=create-trade-page&type=gift" style="text-decoration: none;">
                                    <div class="card p-3" style="width: 18rem;">
                                        <div class="card-body">
                                            <h5 class="card-title">Hình thức quà tặng <svg xmlns="http://www.w3.org/2000/svg" height="1rem" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M190.5 68.8L225.3 128H224 152c-22.1 0-40-17.9-40-40s17.9-40 40-40h2.2c14.9 0 28.8 7.9 36.3 20.8zM64 88c0 14.4 3.5 28 9.6 40H32c-17.7 0-32 14.3-32 32v64c0 17.7 14.3 32 32 32H480c17.7 0 32-14.3 32-32V160c0-17.7-14.3-32-32-32H438.4c6.1-12 9.6-25.6 9.6-40c0-48.6-39.4-88-88-88h-2.2c-31.9 0-61.5 16.9-77.7 44.4L256 85.5l-24.1-41C215.7 16.9 186.1 0 154.2 0H152C103.4 0 64 39.4 64 88zm336 0c0 22.1-17.9 40-40 40H288h-1.3l34.8-59.2C329.1 55.9 342.9 48 357.8 48H360c22.1 0 40 17.9 40 40zM32 288V464c0 26.5 21.5 48 48 48H224V288H32zM288 512H432c26.5 0 48-21.5 48-48V288H288V512z"/></svg></h5>
                                            <p class="card-text">Bài đăng với hình thức quà tặng là bài đăng sẽ không có giá tiền.</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:when>
                        <c:when test="${param.type eq 'gift'}">
                            <h1 style="color: red;">${empty requestScope.ERR_CONTENT? 'Tạo bài Trao đổi và mua bán với hình thức quà tặng' : requestScope.ERR_CONTENT}</h1>
                            <form action="CreateTradeController" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="author_id" value="${us.user_id}" />
                                <input type="hidden" name="type" value="gift" />
                                <div class="form-group">
                                    <label for="title">Tiêu đề</label>
                                    <input type="text" class="form-control" id="title" name="title" placeholder="Nhập tiêu đề bài viết">
                                </div>
                                <c:set var="categorys" value="${Trade_CategoryDAO.getAllTradeCate()}"/>
                                <div class="form-group">
                                    <label for="exampleDataList" class="form-label">Loại bài viết về</label>
                                    <input required="" class="form-control" list="datalistOptions" id="exampleDataList" name="category" placeholder="Nhập thể loại bài viết...">
                                    <datalist id="datalistOptions">
                                        <c:forEach var="c" items="${categorys}">
                                            <option value="${c.name}">
                                            </c:forEach>
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="condition">Tình Trạng</label>
                                    <input required="" class="form-control" list="datalistOptionsCondition" id="condition" name="condition" placeholder="Nhập tình trạng...">
                                    <datalist id="datalistOptionsCondition">
                                        <option value="Cũ">
                                        <option value="Mới">
                                        <option value="Đã qua sử dụng (còn mới)">
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="images">Chọn nhiều hình ảnh</label>
                                    <input type="file" class="form-control-file" id="images" name="images[]" multiple>
                                    <br/>
                                    <button type="button" onclick="previewFiles()" class="btn btn-primary col-4" data-toggle="modal" data-target="#filePreviewModal">
                                        Xem trước hình ảnh
                                    </button>
                                </div>
                                <div class="form-group">
                                    <label for="content">Nội dung bài viết</label>
                                    <textarea class="form-control" name="content" id="content" rows="4" placeholder="Nhập nội dung bài viết..."></textarea>

                                </div>
                                <button type="submit" class="btn btn-primary">Đăng bài</button>
                            </form>
                        </c:when>
                        <c:when test="${param.type eq 'fee'}">
                            <h1 style="color: red;">${empty requestScope.ERR_CONTENT? 'Tạo bài Trao đổi và mua bán với hình thức trả phí' : requestScope.ERR_CONTENT}</h1>
                            <form action="CreateTradeController" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="create-trade" />
                                <input type="hidden" name="author_id" value="${us.user_id}" />
                                <input type="hidden" name="type" value="fee" />
                                <div class="form-group">
                                    <label for="title">Tiêu đề</label>
                                    <input type="text" class="form-control" id="title" name="title" placeholder="Nhập tiêu đề bài viết">
                                </div>
                                <c:set var="categorys" value="${Trade_CategoryDAO.getAllTradeCate()}"/>
                                <div class="form-group">
                                    <label for="exampleDataList" class="form-label">Loại bài viết về</label>
                                    <input required="" class="form-control" list="datalistOptions" id="exampleDataList" name="category" placeholder="Nhập thể loại bài viết...">
                                    <datalist id="datalistOptions">
                                        <c:forEach var="c" items="${categorys}">
                                            <option value="${c.name}">
                                            </c:forEach>
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="condition">Tình Trạng</label>
                                    <input required="" class="form-control" list="datalistOptionsCondition" id="condition" name="condition" placeholder="Nhập tình trạng...">
                                    <datalist id="datalistOptionsCondition">
                                        <option value="Cũ">
                                        <option value="Mới">
                                        <option value="Đã qua sử dụng (còn mới)">
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="price">Giá (Vietnamdong)</label>
                                    <input type="text" class="form-control" id="price" name="price" placeholder="Nhập giá">
                                </div>
                                <div class="form-group">
                                    <label for="images">Chọn nhiều hình ảnh</label>
                                    <input type="file" class="form-control-file" id="images" name="images[]" multiple>
                                    <br/>
                                    <button type="button" onclick="previewFiles()" class="btn btn-primary col-4" data-toggle="modal" data-target="#filePreviewModal">
                                        Xem trước hình ảnh
                                    </button>
                                </div>
                                <div class="form-group">
                                    <label for="content">Nội dung bài viết</label>
                                    <textarea class="form-control" name="content" id="content" rows="4" placeholder="Nhập nội dung bài viết..."></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Đăng bài</button>
                            </form>
                        </c:when>
                    </c:choose>
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

        <!-- Modal -->
        <div class="modal fade" id="filePreviewModal" tabindex="-1" role="dialog" aria-labelledby="filePreviewModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="filePreviewModalLabel">Xem trước hình ảnh</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Image previews will be displayed here -->
                        <div id="filePreviews" class="d-flex flex-wrap justify-content-around"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.getElementById('price').addEventListener('input', function (event) {
                let value = event.target.value.replace(/\D/g, ''); // Remove non-digit characters
                value = formatAsVietnamdong(value); // Format the input as Vietnamdong
                event.target.value = value;
            });

            document.getElementById('price').addEventListener('blur', function (event) {
                let value = event.target.value.replace(/\D/g, ''); // Remove non-digit characters
                value = formatAsVietnamdong(value); // Format the input as Vietnamdong
                event.target.value = value;
            });

            function formatAsVietnamdong(value) {
                if (!value)
                    return ''; // Return empty string if no value

                const formatter = new Intl.NumberFormat('en-US');
                return formatter.format(value);
            }

            function previewFiles() {
                var previewsContainer = document.getElementById('filePreviews');
                previewsContainer.innerHTML = ''; // Clear previous previews

                var fileInput = document.getElementById('images');
                var files = fileInput.files;

                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        var preview = document.createElement('img');
                        preview.src = e.target.result;
                        preview.style.maxHeight = '100px'; // Set the maximum height for the preview images
                        previewsContainer.appendChild(preview);
                    };

                    reader.readAsDataURL(file);
                }

                // Show the modal after adding image previews
                $('#filePreviewModal').modal('show');
            }
        </script>
        <!-- JavaScript Libraries -->
        <!-- Inputmask library CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/5.0.6/jquery.inputmask.min.js"></script>
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
