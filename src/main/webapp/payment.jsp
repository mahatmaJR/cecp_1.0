<%@ page import="model.CoachModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    CoachModel admin = (CoachModel) request.getAttribute("loggedAdmin");
    request.setAttribute("loggedAdmin", admin);
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<head>
    <title>Payments</title>
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
        <form action="/cecp/main/payment/paymentRecord" method="post" >
            <h1>Login Form</h1>
            <div>
                <input type="text" placeholder="Transaction Code" required="" id="transactionCode" name="transactionCode" />
            </div>
            <div>
                <input type="text" placeholder="Amount Paid" required="" id="paidAmount" name="paidAmount" />
            </div>
            <div>
                <input type="text" placeholder="Trainee ID" required="" id=traineeMakingPayment"" name="traineeMakingPayment" />
            </div>
            <div>
                <input type="text" placeholder="Enrollment ID" required="" id=enrollmentPaymentReference"" name="enrollmentPaymentReference" />
            </div>
            <div>
                <input type="submit" value="Submit"/>
            </div>
        </form>
    </section>
</div>
</body>
</html>
