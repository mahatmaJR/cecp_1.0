<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en-US">
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<head>
    <title>Trainee Sign Up</title>
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
    <section id="content">
        <form id="msform" method="post" action="<%=request.getContextPath()%>/main/trainee/addTrainee">
            <h2 class="fs-title">Create your account</h2>
            <h2 class="fs-title">Personal Details</h2>
            <input type="text" id="fName" name="fName" placeholder="First Name" />
            <input type="text" id="surname" name="surname" placeholder="Surname" />
            <input type="text" id="lName" name="lName" placeholder="Last Name" />
            <input type="text" id="address" name="address" placeholder="Address" />
            <input type="text" id="email" name="email" placeholder="Email" />
            <input type="text" id="mobileNo" name="mobileNo" placeholder="Mobile Number" />
            <input type="text" id="certificationLevel" name="certificationLevel" placeholder="Level Interested in Pursuing" list="certLevel"/>
            <datalist id="certLevel">
                <option value="Basic_Coaching">Basic_Coaching</option>
                <option value="Advanced_Coaching">Advanced_Coaching</option>
                <option value="Master_Coaching">Master_Coaching</option>
                <option value="Soft_Skills">Soft_Skills</option>
            </datalist>
            <h2 class="fs-title">Login Detail</h2>
                <input type="text" id="username" name="username"placeholder="Username" required="" />
                <input type="password" id="pass" name="pass" placeholder="Password" required="" />
                <input type="password" id="confPass" name="confPass" placeholder="Confirm Password" required="" />
            <input type="submit" id="submitFromData" value="Submit" class="submit action-button" />

            <input type="hidden" id="alert" />

        </form>
    </section>
</div>
</body>
</html>