<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Set Exam Question</title>
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

</head>
<%
    String eId = request.getParameter("examId");
    int examId = Integer.parseInt(eId);
    request.setAttribute("examId", examId);
    String URL = "jdbc:mysql://localhost:3306/cecp";
    String USER = "cecp";
    String PASS = "qwertyuiop.01";
    Connection con = null;
    Statement st;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, USER, PASS);
%>
<body>
<div>
    <%
        st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT exam_name FROM exam_detail WHERE exam_id = " + examId + "");
        while (rs.next()) {
    %>

    <p>

        Exam Name: <input type="text" placeholder="<%=rs.getString("exam_name")%>" required="" id="examName" name="examName" />
    </p>
    <%
        }
        st.close();
        rs.close();

    %>
</div>

        <form id="setExamQuestion" action="<%=request.getContextPath()%>/main/exam/setQuestion" method="post">

            <div>
                Exam ID: <input type="text" placeholder="<%=examId%>" value="<%=examId%>" required="" id="examid" name="examid" /> <br>
            </div>
            <table>
                <tbody>
                <tr>
                    <td>Question No.</td>
                    <td><textarea class="dataField" id="questionNumber" name="questionNumber"></textarea></td>
                </tr>
                <tr>
                    <td>Question</td>
                    <td><textarea class="dataField" id="actualQuestion" name="actualQuestion"></textarea></td>
                </tr>
                <tr>
                    <td>Option A</td>
                    <td><textarea class="dataField" id="optionA" name="optionA"></textarea></td>
                </tr>
                <tr>
                    <td>Option B</td>
                    <td><textarea class="dataField" id="optionB" name="optionB"></textarea></td>
                </tr>
                <tr>
                    <td>Option C</td>
                    <td><textarea class="dataField" id="optionC" name="optionC"></textarea></td>
                </tr>
                <tr>
                    <td>Option D</td>
                    <td><textarea class="dataField" id="optionD" name="optionD"></textarea></td>
                </tr>
                <tr>
                    <td>Correct Answer</td>
                    <td>
                        <input list="correctOption" type="text" id="correctAnswer" name="correctAnswer">
                        <datalist id="correctOption">
                            <option value="option_a"></option>
                            <option value="option_b"></option>
                            <option value="option_c"></option>
                            <option value="option_d"></option>
                        </datalist>
                    </td>
                </tr>
                </tbody>
            </table>
            <br>
            <div><input type="submit" value="Add Question" class="submit action-button" onclick="document.getElementById('setExamQuestion').reset();" /></div>
            <br>
        </form>
<div><button class="action-button" onclick= "window.open('<%=request.getContextPath()%>/examPreview.jsp?examID='+ <%= examId %> +'')">Preview</button></div>
</body>
<%
    }catch (Exception ignored){

    } finally {
        assert con != null;
        con.close();
    }
%>
</html>
