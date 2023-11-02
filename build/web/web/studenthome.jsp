<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

        <title>Dashboard</title>
        <style>
            .cus {
                background-color: #f27125;
                margin: 0 0.5rem;
                border-radius: 5px;
                color: #fff!important;
            }

            .text-black {
                color: #333!important;
                font-size: 18px;
            }

            .navbar {
                padding: 0.8rem;
                border-bottom: 1px solid black;
            }

            @media screen and (max-width: 980px) {
                .cus {
                    background: none!important;
                    color: #333!important;
                }
            }


            .card-body > .btn-book {
                margin-top: 1rem;
            }

            .form-group {
                margin: 0.4rem;
                border-radius: 35px;
            }
            
            .text-black {
                color: #333!important;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="home.jsp">
                <img src="https://cdn.haitrieu.com/wp-content/uploads/2021/10/Logo-Dai-hoc-FPT.png" width="100" class="d-inline-block align-top" alt="Logo">
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="cus nav-link" href="#">
                            <i class="fas fa-calendar-alt"></i> View Booking
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="cus nav-link" href="#">
                            <i class="fas fa-file"></i> Request
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="cus nav-link" href="#">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                    <li class="nav-item" id="user-icon">
                        <a class="nav-link text-black" href="#">
                            <i class="fas fa-user"></i> User
                        </a>
                    </li>
                </ul>
            </div>
        </nav>  
        <div class="container mt-4">
            <h1 class="text-center">Dashboard</h1>
            <form action="MainController" method="POST">
                <div class="d-flex justify-content-between mt-2">
                    <input type="hidden" value="Find" name="action"/>
                    <input type="text" name="txtsemester" class="form-control mx-auto" placeholder="E.g FA23">
                    <button type="submit" value="Find" class="btn btn-primary float-right">Find</button>
                </div>
            </form>
            <p class="text-danger text-center mt-2">${requestScope.MSG}</p>
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h5 class="card-title">Sinh viên <span style="color: red" >ĐẶT NHIỀU SLOT NHẤT</span></h5>                              
                            </div>                            
                            <p class="mt-2">Số lượt đặt: <b style="color: red">${requestScope.UserMaxSlot.number}</b></p>
                            <p class="mt-2">MSSV: <b style="color: red">${requestScope.UserMaxSlot.userID}</b></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h5 class="card-title">Sinh viên GỬI <span style="color: red" >NHIỀU REQUEST NHẤT</span></h5>

                            </div>

                            <p class="mt-2">Số lượt request: <b style="color: red">${requestScope.UserMaxRequest.number}</b></p>
                            <p class="mt-2">MSSV: <b style="color: red">${requestScope.UserMaxRequest.userID}</b></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h5 class="card-title">Giảng viên <span style="color: red" >TẠO NHIỀU SLOT NHẤT</span></h5>

                            </div>

                            <p class="mt-2">Số lượt tạo slot: <b style="color: red">${requestScope.LecturerMaxSlot.number}</b></p>
                            <p class="mt-2">MSGV: <b style="color: red">${requestScope.LecturerMaxSlot.userID}</b></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h5 class="card-title">Giảng viên <span style="color: red" >NHẬN ĐƯỢC NHIỀU REQUEST NHẤT</span></h5>

                            </div>

                            <p class="mt-2">Số lượt request: <b style="color: red">${requestScope.LecturerMaxRequest.number}</b></p>
                            <p class="mt-2">MSGV: <b style="color: red">${requestScope.LecturerMaxRequest.userID}</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>