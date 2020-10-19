<%@ page import="java.sql.*" %>
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
    <title>Select A Center</title>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/userInputForm.js"></script>

    <style>
        .centerTableContent{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            border-radius: 5px 5px 0 0;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .centerTableContent thead tr {
            background-color: #00aeef;
            collapse: #ffffff;
            text-align: left;
            font-weight: bold;
        }
        .centerTableContent tbody tr {
            border-bottom: 1px solid #00aeef;
        }
    </style>
</head>
<body>
<div class="container">
    <section id="content">
        <% String cId = request.getParameter("cecpID"); %>

        <% request.setAttribute("coachId", cId);%>

        <%
            Statement st = null;
            Connection con = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cecp", "cecp", "qwertyuiop.01");
                st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM center_detail");%>

        <h4>Available Centers...</h4>
        <table id="centerTable" class="centerTableContent" width="100">
            <thead>
            <tr>
                <th>Center ID</th>
                <th>Name</th>
                <th>Location</th>
            </tr>
            </thead>
            <tbody>
            <%while (rs.next()) { %>
            <tr>
                <td><%=rs.getString("center_id")%></td>
                <td><%=rs.getString("center_name")%></td>
                <td><%=rs.getString("center_location")%></td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <%
            } catch (Exception ignored) {
            } finally {
                try {
                    assert st != null;
                    st.close();
                } catch (SQLException ignored) {
                }
                try {
                    con.close();
                } catch (SQLException ignored) {
                }
            }
        %>
        <form action="<%=request.getContextPath()%>/main/select/centerDetail" method="post" onsubmit="return closeWindow(this)">
            <p>Your CECP ID: <%=request.getParameter("cecpID")%></p> <br>
            <input name="sessionCoachId" type="hidden" value="<%= cId %>">
            <h3>SELECT A CENTER</h3> <br>
            <h6>Click from the above table and the below form will be automatically filled</h6>
            <br>
            <input type="text" required="" placeholder="Center ID" id="centerId" name="centerId"/>
            <input type="text" required="" placeholder="Center Name" id="centerName" name="centerName" />
            <input type="text" required="" placeholder="Center Location" id="centerLocation"  name="centerLocation" /> <br>

            <input type="submit" value="Submit" class="submit action-button" />
        </form>
        <script>
            let tr3 = ($("#centerTable tr:eq(3)"))[0];
            let tr30OffsetTop = tr3.clientHeight + tr3.offsetTop;

            $('.coachWrapper').css('max-height', tr30OffsetTop);

let centerTable = document.getElementById('centerTable'), rIndex;
            for (let i = 0; i < centerTable.rows.length; i++){

                centerTable.rows[i].onclick = function () {

                    rIndex = this.rowIndex;
                    document.getElementById('centerId').value = this.cells[0].innerHTML;
                    document.getElementById('centerName').value = this.cells[1].innerHTML;
                    document.getElementById('centerLocation').value = this.cells[2].innerHTML;
                }



            }


            function  closeWindow(form) {
                form.submit();
                window.close();
            }
        </script>
    </section>
</div>
</body>
</html>