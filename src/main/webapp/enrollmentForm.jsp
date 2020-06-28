<%@ page import="model.TraineeModel" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TraineeModel trainee = (TraineeModel) session.getAttribute("loggedTrainee");
    String tId = request.getParameter("cecpID");
    String surname = request.getParameter("surname");
    request.setAttribute("traineeId", tId);
    request.setAttribute("surname", surname);
    String URL = "jdbc:mysql://localhost:3306/cecp";
    String USER = "root";
    String PASS = "qwertyuiop1.";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(URL, USER, PASS);
%>
<html>
<head>
    <title>Enroll Now</title>
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
    <script>

    </script>
</head>
<body>
<%try { %>
<div class="container">
    <section id="content">
        <form id="msform" method="post" action="/cecp/main/enroll/newEnrollmentDetail">


            <h2 class="fs-title">Enroll for a course</h2>
            <input type="text" id="traineeId" value="<%= request.getParameter("cecpID") %>" />
            <input type="text" id="surname" value="<%= request.getParameter("surname") %>" />
            <input type="text" placeholder="Level of Study" list="certLevel" id="certificationLevel" name="certLevel" >
            <datalist id="certLevel">
                <option value="Basic_Coaching">Basic Coaching</option>
                <option value="Advanced_Coaching">Advanced Coaching</option>
                <option value="Master_Coaching">Master Coaching</option>
                <option value="Soft_Skills">Soft Skills</option>
            </datalist>


            <div id="basicCoachingUnits">

            </div>

            <div id="advancedCoachingUnits">

            </div>

            <div id="masterCoachingUnits">

            </div>

            <div id="softSKillsUnits">

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