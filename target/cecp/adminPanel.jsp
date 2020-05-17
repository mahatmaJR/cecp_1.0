<%@ page import="model.CoachModel" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.hibernate.tool.schema.internal.StandardTableExporter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    CoachModel logAdmin = (CoachModel) session.getAttribute("loggedAdmin");
    String URL = "jdbc:mysql://localhost:3306/cecp";
    String USER = "root";
    String PASS = "qwertyuiop1.";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(URL, USER, PASS);
%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <title>Admin Panel</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/responsee.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/jamsol/jamsol.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/jamsol/jamsol.theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/template-style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userInputForm.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,700,900&amp;subset=latin-ext" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/userInputForm.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>

</head>
<body class="size-1280">
<% try { %>
<header role="banner" class="position-absolute">
    <nav class="background-transparent background-primary-dott full-width sticky">
        <div class="logo hide-l hide-xl hide-xxl">
            <a href="/cecp/index" class="logo">
                <img class="logo-dark" src="<%=request.getContextPath()%>/img/CECP%20logo.JPG" alt="">
            </a>
        </div>

        <div class="top-nav">

            <div class="top-nav left-menu">
                <ul class="right top-ul chevron">
                    <li><a href="/cecp/index">Home</a></li>
                    <li>
                        <a>Our Programs</a>
                        <ul>
                            <li><a href="/cecp/enrollmentForm">Coaching Certification</a></li>
                            <li><a href="/cecp/corporateTraining">Corporate Training</a></li>
                            <li><a href="/cecp/enrollmentForm">Soft Skills</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <%--            <!-- logo -->--%>
            <%--            <ul class="logo-menu">--%>
            <%--                <a href="index.html" class="logo">--%>
            <%--                    <!-- Logo White Version -->--%>
            <%--                    <img class="logo-white" src="img/logo.svg" alt="">--%>
            <%--                    <!-- Logo Dark Version -->--%>
            <%--                    <img class="logo-dark" src="img/logo-dark.svg" alt="">--%>
            <%--                </a>--%>
            <%--            </ul>--%>

            <div class="top-nav right-menu">
                <ul class="top-ul chevron">
                    <li><a href="/cecp/aboutUs">About</a></li>
                    <li><a href="/cecp/contactUs">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>


<main role="main">
    <article>
        <header class="section background-image text-center" style="background-image:url(<%=request.getContextPath()%>/img/img-05.jpg)">
            <h1 class="animated-element slow text-extra-thin text-white text-s-size-30 text-m-size-40 text-size-50 text-line-height-1 margin-bottom-30 margin-top-40">
            </h1>
            <img class="arrow-object" src="<%=request.getContextPath()%>/img/arrow-object-dark.svg" alt="">
        </header>

        <section class="section background-none">
            <div class="line text-center">
                <div class="panel panel-primary">
                    <div class="panel-heading custom-header-panel">
                        <div class="container-fluid panel-container">
                            <div class="col-xs-3 text-left">
                                <h4 class="panel-title">
                                    <label id="adminId">CECP ID: <b><%= logAdmin.getCoachId() %></b></label>
                                </h4>
                            </div>
                            <div class="col-xs-6 text-center ">
                                <h4 class="panel-title">
                                    <label id="adminUsername">Welcome: <b><%= logAdmin.getSurname() %></b></label>
                                </h4>
                            </div>
                            <div class="col-xs-3 text-right">
                                <div class="panel-title btn-group">
                                    <form method="GET" action="/cecp/main/endSession/logoutUser">
                                        <input type="submit" class="btn btn-warning" value="LOGOUT" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body" style="max-height: 650px; min-height: 350px" >
                        <ul  class="nav nav-pills list-inline">
                            <li class=""><a  href="#coach" data-toggle="pill">Coaches</a></li>
                            <li><a href="#trainee" data-toggle="pill">Trainees</a></li>
                            <li><a href="#center" data-toggle="pill">Centers</a></li>
                            <li><a href="#course" data-toggle="pill">Courses</a></li>
                            <li><a href="#exam" data-toggle="pill">Exams</a></li>
                            <li><a href="#payment" data-toggle="pill">Payments</a></li>
                            <li><a href="#corporateContact" data-toggle="pill">Corporate Contacts</a></li>
                            <li><a href="#clientContact" data-toggle="pill">Client Contacts</a></li>
                            <li><a href="#timetable" data-toggle="pill">Classes</a></li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane" id="coach">
                                <div>
                                    <a class="btn btn-primary" href="<%=request.getContextPath()%>/coachSignUp">New Coach</a>
                                    <input type="text" id="searchCoach" onkeyup="coachSearch()" placeholder="Search Surname" class="icon-magnifying"/>
                                </div>
                                <form>

                                    <table id="coachesTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>

                                            <td>Coach ID</td>
                                            <td>First Name</td>
                                            <td>Surname</td>
                                            <td>Last Name</td>
                                            <td>Phone Number</td>
                                            <td>Email</td>
                                            <td>Center</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                Statement st2 = con.createStatement();
                                                ResultSet rs2 = st2.executeQuery("SELECT * FROM coach_detail");
                                                while (rs2.next()) {
                                            %>
                                                <tr>
                                                    <td><%= rs2.getString("coach_id") %></td>
                                                    <td><%= rs2.getString("first_name") %></td>
                                                    <td><%= rs2.getString("surname") %></td>
                                                    <td><%= rs2.getString("last_name") %></td>
                                                    <td><%= rs2.getString("phone_number")%></td>
                                                    <td><%= rs2.getString("email")%></td>
                                                    <td><%= rs2.getString("center_ref")%></td>
                                                </tr>
                                            <%
                                                }
                                                st2.close();
                                                rs2.close();
                                            %>

                                        </tbody>
                                    </table>
                                </form>
                                <script>
                                    function coachSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchCoach');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('coachesTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[2];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="trainee">
                                <div>
                                    <a href="<%=request.getContextPath()%>/traineeSignUp"><button class="submit-btn">New Trainee</button></a>
                                    <input type="text" id="searchTrainee" onkeyup="traineeSearch()" placeholder="Search Surname" class="icon-magnifying"/>
                                </div>
                                <form>

                                    <table id="traineesTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Trainee ID</td>
                                            <td>First Name</td>
                                            <td>Surname</td>
                                            <td>Last Name</td>
                                            <td>Phone Number</td>
                                            <td>Email</td>
                                            <td>Level</td>
                                            <td>Center</td>
                                            <td>Coach</td>
                                            <td>Add Unit</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                Statement st6 = con.createStatement();
                                                ResultSet rs6 = st6.executeQuery("SELECT * FROM trainee_detail");
                                                while (rs6.next()) {
                                            %>
                                                <tr>
                                                    <td><%= rs6.getString("trainee_id") %></td>
                                                    <td><%= rs6.getString("first_name") %></td>
                                                    <td><%= rs6.getString("surname") %></td>
                                                    <td><%= rs6.getString("last_name") %></td>
                                                    <td><%= rs6.getString("phone_number")%></td>
                                                    <td><%= rs6.getString("email")%></td>
                                                    <td><%= rs6.getString("cert_level")%></td>
                                                    <td><%= rs6.getString("center_ref")%></td>
                                                    <td><%= rs6.getString("coach_ref")%></td>
                                                    <td><a class="btn btn-primary" href="">Enroll To A Course</a></td>
                                                <tr>
                                            <%
                                                }
                                                st6.close();
                                                rs6.close();
                                            %>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <script>
                                    function traineeSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchTrainee');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('traineesTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[2];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="center">
                                <div>
                                    <a href="<%=request.getContextPath()%>/centerRegForm"><button class="submit-btn">New Center</button></a>
                                    <input type="text" id="searchCenter" placeholder="Search Center Name" onkeyup="centerSearch()" class="icon-magnifying"/>
                                </div>
                                <div>
                                    <table id="centersTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Center ID</td>
                                            <td>Name</td>
                                            <td>Location</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                Statement st = con.createStatement();
                                                ResultSet rs = st.executeQuery("SELECT * FROM center_detail");
                                                while (rs.next()) {
                                            %>
                                                <tr>
                                                    <td><%= rs.getString("center_id") %></td>
                                                    <td><%= rs.getString("center_name") %></td>
                                                    <td><%= rs.getString("center_location") %></td>
                                                </tr>
                                            <%
                                                }
                                                st.close();
                                                rs.close();

                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <script>
                                    function centerSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchCenter');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('centersTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[1];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="course">
                                <div>
                                    <input type="text" id="searchCourse" placeholder="Search Course Name" onkeyup="courseSearch()" class="icon-magnifying"/>
                                </div>
                                <div>
                                    <table id="coursesTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Course ID</td>
                                            <td>Name</td>
                                            <td>Certification Level</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                Statement st4 = con.createStatement();
                                                ResultSet rs4 = st4.executeQuery("SELECT * FROM course_detail");
                                                while (rs4.next()) {
                                            %>
                                                <tr>
                                                    <td><%= rs4.getString("course_id") %></td>
                                                    <td><%= rs4.getString("course_name") %></td>
                                                    <td><%= rs4.getString("certification_level") %></td>
                                                </tr>
                                            <%
                                                }
                                                rs4.close();
                                                st4.close();
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <script>
                                    function courseSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchCourse');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('coursesTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[1];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="exam">
                                <div>
                                    <a href="<%=request.getContextPath()%>/examForm"><button class="submit-btn">New Exam</button></a>
                                    <input type="text" id="searchExam" placeholder="Search Exam ID" onkeyup="examSearch()" class="icon-magnifying"/>
                                </div>
                                <form>
                                    <table id="examsTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Exam ID</td>
                                            <td>Course ID</td>
                                            <td>Name</td>
                                            <td>Level</td>
                                            <td>Date Scheduled</td>
                                            <td>Time</td>
                                            <td>File</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </form>
                                <script>
                                    function examSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchExam');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('examsTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[0];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="payment">
                                <div>
                                    <a href="<%=request.getContextPath()%>/payment"><button class="submit-btn">Add Payment Record</button></a>
                                    <input type="text" id="searchPayment" placeholder="Search Transaction Code" onkeyup="paymentSearch()" class="icon-magnifying"/>
                                </div>
                                <form>
                                    <table id="paymentsTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Payment ID</td>
                                            <td>Transaction Code</td>
                                            <td>Amount Paid</td>
                                            <td>Date Paid</td>
                                            <td>Trainee</td>
                                            <td>Enrollment Paid For</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                Statement st5 = con.createStatement();
                                                ResultSet rs5 = st5.executeQuery("SELECT * FROM payment_detail");
                                                while (rs5.next()) {
                                            %>
                                                <tr>
                                                    <td><%= rs5.getString("payment_id") %></td>
                                                    <td><%= rs5.getString("payment_transaction_code") %></td>
                                                    <td><%= rs5.getString("paid_amount") %></td>
                                                    <td><%= rs5.getString("paid_date") %></td>
                                                    <td><%= rs5.getString("trainee_ref") %></td>
                                                    <td><%= rs5.getString("enrollment_ref") %></td>
                                                </tr>
                                            <%
                                                }
                                                rs5.close();
                                                st5.close();
                                            %>

                                        </tbody>
                                    </table>
                                </form>
                                <script>
                                    function paymentSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchPayment');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('paymentsTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[1];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="corporateContact">
                                <div>
                                    <input type="text" id="searchCorporateContact" placeholder="Search Company Name" onkeyup="corporateSearch()" class="icon-magnifying"/>
                                </div>
                                <div>
                                    <table id="corporatesTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Company Name</td>
                                            <td>Company Email</td>
                                            <td>Contact Person</td>
                                            <td>Phone Number</td>
                                            <td>Client Requirement</td>
                                            <td>Date</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                Statement st3 = con.createStatement();
                                                ResultSet rs3 = st3.executeQuery("SELECT * FROM corporate_engagement_detail");
                                                while (rs3.next()) {
                                            %>
                                                <tr>
                                                    <td><%= rs3.getString("company_name") %></td>
                                                    <td><%= rs3.getString("company_email") %></td>
                                                    <td><%= rs3.getString("contact_person") %></td>
                                                    <td><%= rs3.getString("phone_number") %></td>
                                                    <td><%= rs3.getString("client_requirement") %></td>
                                                    <td><%= rs3.getString("date_registered") %></td>
                                                </tr>
                                            <%
                                                }
                                                rs3.close();
                                                st3.close();
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <script>
                                    function corporateSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchCorporateContact');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('corporatesTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[0];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="clientContact">
                                <div>
                                    <input type="text" id="searchClientContact" placeholder="Search Contact Person Name" onkeyup="clientSearch()" class="icon-magnifying"/>
                                </div>
                                <div>
                                    <table id="clientsTable" class="table table-custom table-fixed table-striped" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>User Email</td>
                                            <td>User Full Name</td>
                                            <td>Subject</td>
                                            <td>Message</td>
                                            <td>Date</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                Statement st1 = con.createStatement();
                                                ResultSet rs1 = st1.executeQuery("SELECT * FROM client_contact_detail");
                                                while (rs1.next()) {
                                            %>
                                                <tr>
                                                    <td><%= rs1.getString("user_email") %></td>
                                                    <td><%= rs1.getString("user_full_name") %></td>
                                                    <td><%= rs1.getString("subject") %></td>
                                                    <td><%= rs1.getString("message") %></td>
                                                    <td><%= rs1.getString("date_registered") %></td>
                                                </tr>
                                            <%
                                                }
                                                rs1.close();
                                                st1.close();
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <script>
                                    function clientSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchClientContact');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('clientsTable');
                                        tr = table.getElementsByTagName('tr');

                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName('td')[1];
                                            if (td) {
                                                txtValue = td.textContent || td.innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                            <div class="tab-pane" id="timetable">
                                <h3>Timetable</h3>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </article>
</main>

<footer>
    <div class="background-primary padding text-center">
        <a href="/"><i class="icon-facebook_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-twitter_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-google_plus_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-instagram_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-linked_in_circle text-size-25 text-dark"></i></a>
    </div>
    <section class="section background-dark">
        <div class="line">
            <div class="margin2x">
                <div class="s-12 m-6 l-3 xl-5">
                    <h4 class="text-white text-strong">Our Mission</h4>
                    <p>
                        <b class="text-size-20">Giving POWER,</b><b class="text-size-20"> POLISH & POISE</b> to your Image.</p>
                    </p>
                </div>
                <div class="s-12 m-6 l-3 xl-2">
                    <h4 class="text-white text-strong margin-m-top-30">Useful Links</h4>
                    <a class="text-primary-hover" href="">FAQ</a><br>
                    <a class="text-primary-hover" href="/cecp/contactUs">Contact Us</a><br>
                    <a class="text-primary-hover" href="">Blog</a>
                </div>
                <div class="s-12 m-6 l-3 xl-2">
                    <h4 class="text-white text-strong margin-m-top-30">Term of Use</h4>
                    <a class="text-primary-hover" href="">Terms and Conditions</a><br>
                    <a class="text-primary-hover" href="">Refund Policy</a><br>
                    <a class="text-primary-hover" href="">Disclaimer</a>
                </div>
                <div class="s-12 m-6 l-3 xl-3">
                    <h4 class="text-white text-strong margin-m-top-30">Contact Us</h4>
                    <p>
                        <i class="icon-sli-screen-smartphone text-primary">+254 765 038 370<br></i>
                        <i class="icon-sli-screen-smartphone text-primary">+254 739 999 409</i>
                    </p>
                    <a class="text-primary-hover" href="mailto:contact@cecp.com"><i class="icon-sli-mouse text-primary"></i> contact@cecp.com</a><br>
                    <a class="text-primary-hover" href="mailto:info@cecp.com"><i class="icon-sli-mouse text-primary"></i> info@cecp.com</a>
                </div>
            </div>
        </div>
    </section>
    <div class="background-dark">
        <div class="line">
            <hr class="break margin-top-bottom-0" style="border-color: #777;">
        </div>
    </div>
    <section class="padding-2x background-dark full-width">
        <div class="line">
            <div class="s-12 l-6">
                <p class="text-size-12">Copyright 2020, Centre of Etiquette, Civility & Protocol</p>
                <p class="text-size-12">Serve Others</p>
            </div>
            <div class="s-12 l-6">
                <a class="right text-size-12 text-primary-hover" href="https://www.jamgadsol.co.ke" title="Code Solution"><br>Jamgad Solutions</a>
            </div>
        </div>
    </section>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jamsol/jamsol.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-scripts.js"></script>
<%
    } catch (Exception ignored) { }
    finally {
        try { con.close(); } catch ( SQLException e ) {
            System.out.println(e);
        }
    }
%>
</body>
</html>