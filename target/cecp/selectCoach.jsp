<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<head>
    <title>Select A Coach</title>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/userInputForm.js"></script>

    <style>
        .coachTableContent{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            border-radius: 5px 5px 0 0;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .coachTableContent thead tr {
            background-color: #00aeef;
            collapse: #ffffff;
            text-align: left;
            font-weight: bold;
        }
        .coachTableContent tbody tr {
            border-bottom: 1px solid #00aeef;
        }
    </style>
</head>
<body>
<div class="container">
    <section id="content">
        <% String tId = request.getParameter("cecpID"); %>

        <% request.setAttribute("traineeId", tId);%>

        <%
            Statement st = null;
            Connection con = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cecp", "root", "qwertyuiop1.");
                st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM coach_detail");%>

        <h4>Our Coaches...</h4>
        <table id="coachTable" class="coachTableContent" >
            <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Surname</th>
            </tr>
            </thead>
            <tbody>
            <%while (rs.next()) { %>
            <tr>
                <td><%=rs.getString("coach_id")%></td>
                <td><%=rs.getString("first_name")%></td>
                <td><%=rs.getString("surname")%></td>
            </tr>
            <%}%>
            </tbody>
        </table>

            <%} catch (Exception ignored) {

            } finally {
                st.close();
                assert con != null;
                con.close();
            }
            %>


        <form action="/cecp/main/select/coachDetail" method="post" onsubmit="return closeWindow(this)">
            <p>Your CECP ID: <%=request.getParameter("cecpID")%></p> <br>
            <input name="sessionTraineeId" type="hidden" value="<%= tId %>">
            <h3>SELECT A COACH</h3> <br>
                <h6>Click from the above table and the below form will be automatically filled</h6>
            <br>
            <input type="text" required="" placeholder="Coach ID" id="cId" name="coachId"/>
            <input type="text" required="" placeholder="First Name" id="fName" name="fName" />
            <input type="text" required="" placeholder="Last Name" id="lName" name="lName" /> <br>

            <input type="submit" value="Submit" class="submit action-button" />
        </form>

    </section>
</div>
</body>
<script>
    let coachTable = document.getElementById('coachTable'), rIndex;
    for (let i = 0; i < coachTable.rows.length; i++){

        coachTable.rows[i].onclick = function () {

            rIndex = this.rowIndex;
            document.getElementById('cId').value = this.cells[0].innerHTML;
            document.getElementById('fName').value = this.cells[1].innerHTML;
            document.getElementById('lName').value = this.cells[2].innerHTML;
        }
    }

    function  closeWindow(form) {
        form.submit();
        window.close();
    }
</script>
</html>