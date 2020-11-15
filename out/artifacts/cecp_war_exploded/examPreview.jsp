<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    String URL = "jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_dea154609e26f08";
    String USER = "bf29111e8d842e";
    String PASS = "98fd5583";
    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, USER, PASS);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Exam Preview</title>
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
<body>
<%
    try {
        int examId = Integer.parseInt(request.getParameter("examID"));

%>
<header class="section background-image text-center" style="background-image:url(<%=request.getContextPath()%>/img/img-05.jpg)">
    <h1 class="animated-element slow text-extra-thin text-white text-s-size-30 text-m-size-40 text-size-50 text-line-height-1 margin-bottom-30 margin-top-40">
        The Following Content Will be Saved, Please Confirm.
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
                            <label id="examId">EXAM ID:<%= examId %> <b></b></label>
                        </h4>
                    </div>

                    <div class="col-xs-3 text-right">
                        <div class="panel-title btn-group">
                            <a class="btn btn-warning">CONFIRM</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-body" style="overflow: auto; max-height: 720px; min-height: 220px" >
                <table>
                    <col width="15%">
                    <col width="85%">
                    <%
                        Statement st = con.createStatement();
                        ResultSet rs1 = st.executeQuery("SELECT * FROM question_detail WHERE exam_ref = " + examId + "");
                        while (rs1.next()){
                    %>
                    <tr>
                        <td><%= rs1.getString("question_number") %></td>
                        <td>
                            <%= rs1.getString("actual_question") %><br>
                            A. <%= rs1.getString("option_a") %><br>
                            B. <%= rs1.getString("option_b") %><br>
                            C. <%= rs1.getString("option_c") %><br>
                            D. <%= rs1.getString("option_d") %><br>
                        </td>
                    </tr>
                    <%
                        }
                        rs1.close();
                        st.close();
                    %>
                </table>
            </div>
        </div>
    </div>
</section>
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
