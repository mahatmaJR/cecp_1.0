<%@ page import="model.TraineeModel" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TraineeModel trainee = (TraineeModel) session.getAttribute("loggedTrainee");
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    String URL = "jdbc:mysql://localhost:3306/cecp";
    String USER = "cecp";
    String PASS = "qwertyuiop.01";
    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, USER, PASS);
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <title>Trainee Portal</title>
    <link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/img/cecp.ico">
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
<%

    try {
        int tID = trainee.getTraineeId();
%>
<header role="banner" class="position-absolute">
    <nav class="background-transparent background-primary-dott full-width sticky">
        <div class="logo hide-l hide-xl hide-xxl">
            <a href="<%=request.getContextPath()%>/index" class="logo">
                <img class="logo-dark" src="<%=request.getContextPath()%>/img/CECP%20logo.JPG" alt="">
            </a>
        </div>

        <div class="top-nav">

            <div class="top-nav left-menu">
                <ul class="right top-ul chevron">
                    <li><a href="<%=request.getContextPath()%>/index">Home</a></li>
                    <li>
                        <a>Our Programs</a>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/enrollmentForm">Coaching Certification</a></li>
                            <li><a href="<%=request.getContextPath()%>/corporateTraining">Corporate Training</a></li>
                            <li><a href="<%=request.getContextPath()%>/enrollmentForm">Soft Skills</a></li>
                        </ul>
                    </li>
                </ul>
            </div>


                      <ul class="logo-menu">
                        <a href="<%=request.getContextPath()%>/index" class="logo">
                          <img class="logo-white" src="<%=request.getContextPath()%>/img/cecp-02.png" alt="">
                          <img class="logo-dark" src="<%=request.getContextPath()%>/img/cecp-02.png" alt="">
                        </a>
                      </ul>

            <div class="top-nav right-menu">
                <ul class="top-ul chevron">
                    <li><a href="<%=request.getContextPath()%>/aboutUs">About Us</a></li>
                    <li><a href="<%=request.getContextPath()%>/contactUs">Contact Us</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<main role="main">
<form>
    <article>
        <header class="section background-image text-center" style="background-image:url(<%=request.getContextPath()%>/img/img-05.jpg)">
            <h1 class="animated-element slow text-extra-thin text-white text-s-size-30 text-m-size-40 text-size-50 text-line-height-1 margin-bottom-30 margin-top-40">
            </h1>

            <img class="arrow-object" src="<%=request.getContextPath()%>/img/arrow-object-dark.svg" alt="">
        </header>

        <section class="section background-grey">
            <div class="line text-center">
                <div class="panel panel-primary">
                    <div class="panel-heading custom-header-panel">
                        <div class="container-fluid panel-container">
                            <div class="col-xs-3 text-left">
                                <h4 class="panel-title">
                                    <label id="traineeId">CECP ID: <b><%= trainee.getTraineeId() %></b></label>
                                </h4>
                            </div>
                            <div class="col-xs-6 text-center ">
                                <h4 class="panel-title">
                                    <label id="traineeUsername">Welcome: <b><%= trainee.getSurname() %></b></label>
                                </h4>
                            </div>
                            <div class="col-xs-3 text-right">
                                <div class="panel-title btn-group">
                                    <a href="<%=request.getContextPath()%>/main/endSession/logoutUser" class="btn btn-warning">LOGOUT</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel-body" style="overflow: auto; max-height: 720px; min-height: 220px" >
                        <ul  class="nav nav-pills list-inline">
                            <li class=""><a  href="#profile" data-toggle="pill">Profile</a></li>
                            <li><a href="#course" data-toggle="pill">Courses</a></li>
                            <li><a href="#account" data-toggle="pill">Account</a></li>
                            <li><a href="#exam" data-toggle="pill">Exam</a></li>
                            <li><a href="#certificate" data-toggle="pill">Certificate</a></li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane" id="profile">
                                <h3>Profile</h3>
                                <form id="traineeDetail">
                                    <table border="1" style="border: #5e5e5e">
                                        <tbody>
                                        <tr>
                                            <td>SURNAME</td>
                                            <td><label id="surname"><%= trainee.getSurname() %></label></td>
                                        </tr>
                                        <tr>
                                            <td>FIRST NAME</td>
                                            <td><label id="firstName"><%= trainee.getFirstName() %></label></td>
                                        </tr>
                                        <tr>
                                            <td>LAST NAME</td>
                                            <td><label id="lastName"><%= trainee.getLastName() %></label></td>
                                        </tr>
                                        <tr>
                                            <td>EMAIL</td>
                                            <td><label id="email"><%= trainee.getEmail() %></label></td>
                                        </tr>
                                        <tr>
                                            <td>MOBILE NUMBER</td>
                                            <td><label id="mobileNumber"> <%= trainee.getPhoneNumber() %> </label></td>
                                        </tr>
                                        <tr>
                                            <td>COACH DETAIL</td>
                                            <td id="coachDetail"> <%= trainee.getCoach() %> </td>
                                            <td id="coachDetailSelection"> <a onclick= "window.open('<%=request.getContextPath()%>/selectCoach?cecpID='+ <%= trainee.getTraineeId()%> +'')"> SELECT/CHANGE COACH </a> </td>
                                        </tr>
                                        <tr>
                                            <td>CENTER DETAIL</td>
                                            <td id="centerDetail"> <%= trainee.getCenter() %> </td>
                                            <td id="centerDetailSelection"> <a onclick= "window.open('<%=request.getContextPath()%>/selectCenter?cecpID='+ <%= trainee.getTraineeId()%> +'')"> SELECT/CHANGE CENTER  </a> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>

                            <div class="tab-pane" id="course">
                                <div>
                                    <div class="col-xs-3 text-left">
                                        <a type="button" class="btn btn-primary" href="<%=request.getContextPath()%>/enrollmentForm?cecpID=<%= trainee.getTraineeId()%>&surname=<%= trainee.getSurname()%>">Click To Enroll Course</a>
                                    </div>
                                    <div class="col-xs-6 text-left">
                                    </div>
                                    <div class="col-xs-3 text-left">
                                        <input type="text" id="searchText" placeholder="Type Here To Search" class="icon-magnifying"/>
                                    </div>
                                </div>
                                <h5>Your Courses</h5>
                                <div>

                                    <table border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Enrollment ID</td>
                                            <td>Certification Level</td>
                                            <td>Date</td>
                                            <td>Course</td>
                                            <td>Add Unit</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Statement stEnrollClass = con.createStatement();
                                                ResultSet rsEnrollClasses = stEnrollClass.executeQuery("SELECT * FROM enroll_trainee_detail WHERE enrolling_trainee_ref = " + tID + "");
                                                while (rsEnrollClasses.next()) {
                                            %>
                                            <tr>
                                                <td><%=rsEnrollClasses.getString("enrollment_id")%> </td>
                                                <td><%=rsEnrollClasses.getString("cert_level")%> </td>
                                                <td><%=rsEnrollClasses.getString("date_enrolled")%> </td>
                                                <td>
                                                    <a onclick="openCourseDisplay('<%=request.getContextPath()%>/courseDisplay.jsp?enrollmentId=<%=rsEnrollClasses.getString("enrollment_id")%>', 'Your Courses', 250, 300)">View Course(s)</a>
                                                    <script type="text/javascript">
                                                        function openCourseDisplay(pageURL, pageTitle, width, height) {
                                                            let left = (screen.width - width) / 2;
                                                            let top = (screen.height - height) / 4;
                                                            let displayWindow = window.open(pageURL, pageTitle, 'resizable=yes,width=' + width + ',height=' + height + ',top=' + top +  ',left=' + left);
                                                        }
                                                    </script>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <%
                                                }
                                                stEnrollClass.close();
                                                rsEnrollClasses.close();
                                            %>
                                        </tbody>
                                    </table>

                                </div>
                            </div>

                            <div class="tab-pane" id="account">
                                <div>

                                    <table border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Enrollment ID</td>
                                            <td>Amount Paid</td>
                                            <td>Transaction Code</td>
                                            <td>Date</td>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr>
                                            <%
                                                Statement stPayments = con.createStatement();
                                                ResultSet rsPayments = stPayments.executeQuery("SELECT * FROM payment_detail WHERE trainee_ref = " + tID + "");
                                                while (rsPayments.next()) {
                                            %>
                                                <td><%=rsPayments.getString("enrollment_ref")%> </td>
                                                <td><%=rsPayments.getString("paid_amount")%> </td>
                                                <td><%=rsPayments.getString("payment_transaction_code")%> </td>
                                                <td><%=rsPayments.getString("paid_date")%> </td>
                                                <td><%=rsPayments.getString("date_enrolled")%> </td>
                                            <%
                                                }
                                                stPayments.close();
                                                rsPayments.close();
                                            %>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>

                            <div class="tab-pane" id="exam">
                                <table border="1" style="border: #5e5e5e">
                                    <thead>
                                    <tr>
                                        <td>Course ID</td>
                                        <td>Name</td>
                                        <td>Level</td>
                                        <td>Date Scheduled</td>
                                        <td>Time Scheduled</td>
                                        <td>Duration</td>
                                        <td>File</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="tab-pane" id="certificate">
                                <table border="1" style="border: #5e5e5e">
                                    <thead>
                                    <tr>
                                        <td>Certificate ID</td>
                                        <td>Level</td>
                                        <td>File</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </article>
</form>
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
                    <a class="text-primary-hover" href="<%=request.getContextPath()%>/contactUs">Contact Us</a><br>
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
                <p class="text-size-12">Understanding Protocols</p>
            </div>

        </div>
    </section>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-scripts.js"></script>
</body>
<%
    } catch (Exception ignored) { }
    finally {
        try { con.close(); } catch ( SQLException e ) {
            System.out.println(e);
        }
    }
%>
</html>