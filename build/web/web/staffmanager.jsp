<%-- 
    Document   : staffmanager
    Created on : Oct 9, 2023, 7:42:19 PM
    Author     : Kuuga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Account" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1>Staff Manager</h1>

        <!-- Staff manager start -->
        <div>
            <div class="row">
                <div class="col-md-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="admin.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Add Staff</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Manage Members</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="StaffManagerController">Manage Staff</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-9">
                    <form action="SearchStaffController">
                        <input type="text" name="txtsearch" placeholder="Search Staffs" required=""/>
                        <input type="submit" value="Search"/>
                    </form>
                    <c:if test="${result != null}">
                        <h2>Kết quả tìm kiếm:</h2>
                        <table border="1">
                            <tbody>
                                <c:forEach items="${result}" var="staff">
                                    <tr>
                                        <td>${staff.getUser_id()}</td>
                                        <td>${staff.getFullname()}</td>
                                        <td>${staff.getEmail()}</td>
                                        <td>${staff.getPhone_number()}</td>
                                        <td>${staff.getStatus()}</td>
                                        <td>${staff.getCreated_at()}</td>
                                        <td>
                                            <form action="DispatcherController" method="post">
                                                <button><a href="edit-staff.jsp">Edit</a></button>
                                                <input type="hidden" name="txtusername" value="${staff.getUser_id()}"/>
                                                <input type="submit" name="btn" value="Delete"/>
                                                <input type="submit" value="Ban"/>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:if test="${not empty error}">
                        <p>${error}</p>
                    </c:if>
                    <hr>
                    <c:if test="${staffs != null}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>User Name</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Status</th>
                                    <th>Created At</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${staffs}" var="st">
                                    <tr>
                                        <td>${st.getUser_id()}</td>
                                        <td>${st.getFullname()}</td>
                                        <td>${st.getEmail()}</td>
                                        <td>${st.getPhone_number()}</td>
                                        <td>${st.getStatus()}</td>
                                        <td>${st.getCreated_at()}</td>
                                        <td>
                                            <form action="DispatcherController" method="post">
                                                <button><a href="edit-staff.jsp">Edit</a></button>
                                                <input type="hidden" name="txtusername" value="${st.getUser_id()}"/>
                                                <input type="submit" name="btn" value="Delete"/>
                                                <input type="submit" value="Ban"/>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Staff manager end -->

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
