<%@ page import="model.CoachModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Course Registration</title>
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
<div class="container">
    <% CoachModel admin = (CoachModel) request.getAttribute("loggedAdmin"); %>
    <% request.setAttribute("loggedAdmin", admin); %>
    <section id="content">
        <form action="<%=request.getContextPath()%>/main/course/addCourse" method="post" >
            <h1>Login Form</h1>
            <div>
                <input type="text" placeholder="Course Name" required="" id="courseName" name="courseName" />
            </div>
            <div>
                <input type="text" placeholder="Certification Level" required="" id="certLevel" name="certLevel" />
            </div>
            <div>
                <textarea placeholder="Course Description" required="" id="courseDescription" name="courseDescription" ></textarea>
            </div>
            <div>
                <input type="submit" value="Submit"/>
            </div>
        </form>
    </section>
</div>
</body>
</html>

