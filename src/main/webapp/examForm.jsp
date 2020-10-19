<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
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
<head>
    <title>Exam</title>
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
<script type="text/javascript">
    function makeTableRow() {
        let maxRow = 4;

        let table = document.getElementById('coursesTable');
        let wrapper = table.parentNode;
        let rowsInTable = table.rows.length;
        let height =0;
        if (rowsInTable > maxRow){
            for (let i = 0; i < maxRow; i++){
                height += table.rows[i].clientHeight;
            }
            wrapper.style.height = height + "px";
        }
    }
</script>
    <style>
        .courseTableContent{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            border-radius: 5px 5px 0 0;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .courseTableContent thead tr {
            background-color: #00aeef;
            collapse: #ffffff;
            text-align: left;
            font-weight: bold;
        }
        .courseTableContent tbody tr {
            border-bottom: 1px solid #00aeef;
        }
    </style>
</head>

<body onload="makeTableRow()">
<div class="container">
    <%
        Statement st = null;
        ResultSet rs;
        try {
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM course_detail");

    %>
    <section id="content">

        <div style="max-height: 180px;overflow-y: auto">
            <h4>Courses...</h4>
            <table id="courseTable" class="courseTableContent" style="max-height: 250px;overflow: auto">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Course Name</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("course_id")%></td>
                    <td><%=rs.getString("course_name")%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <form id="msform" method="post" action="<%=request.getContextPath()%>/main/exam/addExam">
            <h2 class="fs-title">Create your account</h2>
            <h2 class="fs-title">Personal Details</h2>
            <input type="text" id="courseId" name="courseId" placeholder="Course ID" />
            <input type="text" id="courseName" name="courseName" placeholder="Course Name" />
            <input type="text" id="examName" name="examName" placeholder="Exam Name" />
            <input type="text" id="timeScheduled" name="timeScheduled" placeholder="Time Scheduled" />
            <input type="text" id="duration" name="duration" placeholder="Duration" />
            <input type="date" id="dateScheduled" name="dateScheduled" placeholder="Date Scheduled" />

            <input type="submit" name="submit" class="submit action-button" value="Submit" />

        </form>
    </section>
    <%
        } catch (Exception ignored) {

        } finally {
            st.close();
            assert con != null;
            con.close();
        }
    %>
</div>
</body>
<script>

    let tr3 = ($("#courseTable tr:eq(3)"))[0];
    let tr30OffsetTop = tr3.clientHeight + tr3.offsetTop;

    $('.courseWrapper').css('max-height', tr30OffsetTop);

    let courseTable = document.getElementById('courseTable'), rIndex;
    for (let i = 0; i < courseTable.rows.length; i++){

        courseTable.rows[i].onclick = function () {

            rIndex = this.rowIndex;
            document.getElementById('courseId').value = this.cells[0].innerHTML;
            document.getElementById('courseName').value = this.cells[1].innerHTML;

        }
    }

    function  closeWindow(form) {
        form.submit();
        window.close();
    }
</script>
</html>