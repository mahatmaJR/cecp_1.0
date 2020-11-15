<%@ page import="model.TraineeModel" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TraineeModel trainee = (TraineeModel) session.getAttribute("loggedTrainee");
    String tId = request.getParameter("cecpID");
    String surname = request.getParameter("surname");
    request.setAttribute("traineeId", tId);
    request.setAttribute("surname", surname);
    String URL = "jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_dea154609e26f08";
    String USER = "bf29111e8d842e";
    String PASS = "98fd5583";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(URL, USER, PASS);
%>
<html>
<head>
    <title>Enroll Now</title>
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
    <style>
        .myDiv {
            display: none;
            padding: 10px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#certificationLevel').on('change', function () {
                let demoValue = $(this).val();
                $("div.myDiv").hide();
                $("#show"+demoValue).show();
            });
        });
    </script>
</head>
<body>
<%try { %>
<div class="container">
    <section id="content">
        <form id="msform" method="post" action="<%=request.getContextPath()%>/main/enroll/newEnrollmentDetail">


            <h2 class="fs-title">Enroll for a course</h2>
            <input type="text" id="traineeId" name="traineeId" value="<%= trainee.getTraineeId() %>" />
            <input type="text" id="surname" name="surname" value="<%= trainee.getSurname() %>" />
            <input type="text" placeholder="Level of Study" list="certLevel" id="certificationLevel" name="certLevel" >
                <datalist id="certLevel">
                    <option value="Basic_Coaching"></option>
                    <option value="Advanced_Coaching"></option>
                    <option value="Master_Coaching"></option>
                    <option value="Soft_Skills"></option>
                </datalist>

                <div id="showBasic_Coaching" class="myDiv">
                    Select Basic_Coaching Courses <br>
                    <input type="checkbox" name="courseUnit" value="4">Course A <br>
                    <input type="checkbox" name="courseUnit" value="5">Course B <br>
                </div>

                <div id="showAdvanced_Coaching" class="myDiv">
                    Select Advanced_Coaching Courses <br>
                    <input type="checkbox" name="courseUnit" value="6">Course C <br>
                    <input type="checkbox" name="courseUnit" value="7">Course D <br>
                </div>

                <div id="showMaster_Coaching" class="myDiv">
                    Select Master_Coaching Courses <br>
                    <input type="checkbox" name="courseUnit" value="8">Course E <br>
                    <input type="checkbox" name="courseUnit" value="9">Course F <br>
                </div>

                <div id="showSoft_Skills" class="myDiv">
                    Select Soft_Skills Courses <br>
                    <input type="checkbox" name="courseUnit" value="10">Course G <br>
                    <input type="checkbox" name="courseUnit" value="11">Course H <br>
                </div>

            <input type="submit" value="Enroll" />

        </form>
    </section>
</div>
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