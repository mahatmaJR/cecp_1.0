<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exam</title>
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
        <form id="msform" action="">
            <h2 class="fs-title">Create your account</h2>
            <h2 class="fs-title">Personal Details</h2>
            <input type="text" id="courseId" placeholder="Course ID" />
            <input type="text" id="name" placeholder="Name" />
            <input type="text" id="level" placeholder="Level" />
            <input type="text" id="dateScheduled" placeholder="Date Scheduled" />
            <input type="text" id="timeScheduled" placeholder="Time Scheduled" />
            <input type="text" id="duration" placeholder="Duration" />
            <input type="text" id="file" placeholder="File" />

            <input type="submit" name="submit" class="submit action-button" value="Submit" />

        </form>
    </section>
</div>
</body>
</html>