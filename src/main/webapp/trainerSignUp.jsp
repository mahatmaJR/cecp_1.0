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
    <title>Coach Sign Up</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/responsee.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/jamsol/jamsol.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/jamsol/jamsol.theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/lightcase.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userInputForm.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/template-style.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,700,900&amp;subset=latin-ext" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/userInputForm.js"></script>
</head>
<body>
<div class="container">
    <section id="content">
        <form id="msform"  method="post" action="/cecp/main/coach/addCoach">
            <h2 class="fs-title">Create your account</h2>
            <h2 class="fs-title">Personal Details</h2>
            <input type="text" id="fName" name="fName" placeholder="First Name" />
            <input type="text" id="surname" name="surname" placeholder="Surname" />
            <input type="text" id="lName" name="lName" placeholder="Last Name" />
            <input type="text" id="address" name="address" placeholder="Address" />
            <input type="text" id="email" name="email" placeholder="Email" />
            <input type="text" id="phone" name="phoneNumber" placeholder="Mobile Number" />
            <input type="text" id="certLevel" name="certLevel" value="Master_Coaching" />
            <input type="text" id="mcCertNo" name="mcCertNo" placeholder="MCC Cert Number" />
            <h2 class="fs-title">Login Detail</h2>
            <input type="text" placeholder="User Name" required="" id="userName" name=""/>
            <input type="password" placeholder="Password" required="" id="pass" name="" />
            <input type="password" placeholder="Confirm Password" required="" id="confPass" name="" />

            <input type="submit" name="submit" class="submit action-button" value="Submit"/>

        </form>
    </section>
</div>
</body>
</html>