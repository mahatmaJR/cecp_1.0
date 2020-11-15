<%@ page import="model.CoachModel" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en-US">
<%
    CoachModel coach = (CoachModel) session.getAttribute("loggedCoach");
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<head>
    <title>Coach Portal</title>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
</head>

<body class="size-1280">
<%
    Statement st;
    Connection con = null;
    int cID = coach.getCoachId();
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_dea154609e26f08", "bf29111e8d842e", "98fd5583");


%>

<header role="banner" class="position-absolute">
    <nav class="background-transparent background-primary-dott full-width sticky">
        <div class="logo hide-l hide-xl hide-xxl">
            <a href="<%=request.getContextPath()%>/index" class="logo">
                <img class="logo-dark" src="<%=request.getContextPath()%>/img/cecp-02.png" alt="">
            </a>
        </div>

        <div class="top-nav">

            <div class="top-nav left-menu">
                <ul class="right top-ul chevron">
                    <li><a href="<%=request.getContextPath()%>/coachPortal">Home</a></li>
                    <li>
                        <a>Our Programs</a>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/enrollmentForm">Coaching Certification</a></li>
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
                    <li><a href="<%=request.getContextPath()%>/aboutUs">About</a></li>
                    <li><a href="<%=request.getContextPath()%>/contactUs">Contact</a></li>
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
                                    <label id="coachId">CECP ID: <b><%= coach.getCoachId() %></b></label>
                                </h4>
                            </div>
                            <div class="col-xs-6 text-center ">
                                <h4 class="panel-title">
                                    <label id="userName">Welcome: <b><%= coach.getSurname() %></b></label>
                                </h4>
                            </div>
                            <div class="col-xs-3 text-right">
                                <div class="panel-title btn-group">
                                    <form method="GET" action="<%=request.getContextPath()%>/main/endSession/logoutUser">
                                        <input type="submit" class="btn btn-warning" value="LOGOUT" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel-body" style="max-height: 520px; min-height: 220px" >
                        <ul  class="nav nav-pills list-inline">
                            <li class=""><a  href="#profile" data-toggle="pill">Profile</a></li>
                            <li><a href="#myTrainee" data-toggle="pill">My Trainees</a></li>
                            <li><a href="#exam" data-toggle="pill">Exam</a></li>
                            <li><a href="#timetable" data-toggle="pill">Classes</a></li>
                            <li><a href="#certificate" data-toggle="pill">Certificates</a></li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane" id="profile">
                                <h3>Profile</h3>
                                <form id="coachDetail">
                                    <table>
                                        <tbody>
                                        <tr>
                                            <td>SURNAME</td>
                                            <td><%= coach.getSurname() %></td>
                                        </tr>
                                        <tr>
                                            <td>FIRST NAME</td>
                                            <td><%= coach.getFirstName() %></td>
                                        </tr>
                                        <tr>
                                            <td>LAST NAME</td>
                                            <td><%= coach.getLastName() %></td>
                                        </tr>
                                        <tr>
                                            <td>EMAIL</td>
                                            <td><%= coach.getEmail() %></td>
                                        </tr>
                                        <tr>
                                            <td>MOBILE NUMBER </td>
                                            <td><%= coach.getPhoneNumber() %></td>
                                        </tr>
                                        <tr>
                                            <td>CENTER DETAIL</td>
                                            <td id="centerDetail"> <%= coach.getCoachCenter() %> </td>
                                            <td id="centerDetailSelection"> <a onclick= "window.open('<%=request.getContextPath()%>/selectCenter?cecpID='+ <%= coach.getCoachId() %> +'')"> SELECT/CHANGE CENTER  </a> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>

                            <div class="tab-pane" id="myTrainee">
                                <div>
                                    <a href="<%=request.getContextPath()%>/traineeSignUp"><button class="submit-btn">New Student</button></a>
                                    <input type="text" id="coachTraineeSearch" placeholder="Search Trainee" onkeyup="coachTraineeSearch()" class="icon-magnifying"/>
                                </div>
                                <div>

                                    <table id="coachTrainees" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Trainee ID</td>
                                            <td>Name</td>
                                            <td>Level</td>
                                            <td>Add Unit</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            st = con.createStatement();
                                            ResultSet rs = st.executeQuery("SELECT * FROM trainee_detail WHERE coach_ref = " + cID + "");
                                            while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><%=rs.getString("trainee_id")%> </td>
                                            <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                                            <td><%=rs.getString("cert_level")%> </td>
                                            <td></td>
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
                                    function coachTraineeSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('coachTraineeSearch');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('coachTrainees');
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
                                    <input type="text" id="searchCoachExam" placeholder="Search Name" onkeyup="coachExamSearch()" class="icon-magnifying"/>
                                </div>
                                <form id="examDetail">
                                    <table id="examCoachTable" border="1" style="border: #5e5e5e">
                                        <thead>
                                        <tr>
                                            <td>Exam ID</td>
                                            <td>Course ID</td>
                                            <td>Exam Name</td>
                                            <td>Date Scheduled</td>
                                            <td>Time Scheduled</td>
                                            <td>Add Question</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Statement st1 = con.createStatement();
                                                ResultSet rs1 = st1.executeQuery("SELECT * FROM exam_detail");
                                                while (rs1.next()) {
                                            %>
                                            <tr>
                                                <td><%=rs1.getString("exam_id")%></td>
                                                <td><%=rs1.getString("course_ref")%></td>
                                                <td><%=rs1.getString("exam_name")%></td>
                                                <td><%=rs1.getString("exam_date")%></td>
                                                <td><%=rs1.getString("time_scheduled")%></td>
                                                <td>
                                                    <a onclick="openSetQuestion('<%=request.getContextPath()%>/setExamQuestion.jsp?examId=<%=rs1.getString("exam_id")%>', 'Set Exam Question', 420, 300)">Add Question(s)</a>
                                                    <script type="text/javascript">
                                                        function openSetQuestion(pageURL, pageTitle, width, height) {
                                                            let left = (screen.width - width) / 2;
                                                            let top = (screen.height - height) / 4;
                                                            let displayWindow = window.open(pageURL, pageTitle, 'resizable=yes,width=' + width + ',height=' + height + ',top=' + top +  ',left=' + left);
                                                        }
                                                    </script>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                                rs1.close();
                                                st1.close();
                                            %>

                                            <tr>
                                        </tbody>
                                    </table>
                                </form>
                                <script>
                                    function coachExamSearch() {

                                        let input, filter, table, tr, td, i, txtValue;
                                        input = document.getElementById('searchCoachExam');
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById('examCoachTable');
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
                            <div class="tab-pane" id="certificate">
                                <form id="certDetail" >
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
                                </form>
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
                <p class="text-size-12">Improve Someones Image</p>
            </div>
        </div>
    </section>
</footer>
<%
    } catch (Exception ignored) {

    } finally {
        assert con != null;
        con.close();
    }

%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-scripts.js"></script>
</body>
</html>