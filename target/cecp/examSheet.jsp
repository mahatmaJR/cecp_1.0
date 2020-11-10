<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exam</title>
    <link rel="icon" href="<%=request.getContextPath()%>/img/cecp-02.png">
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
<header role="banner" class="position-absolute">
    <nav class="background-transparent background-primary-dott full-width sticky">
    </nav>
</header>

<main role="main">
<div>
    <header class="section-top-padding background-image" style="background-image:url(<%=request.getContextPath()%>/img/exam-back-2.jpg)"></header>
</div>
</main>
<form>
    <section class="section background-grey" >
        <div class="col-sm-2 col-lg-2 col-md-2 "></div>
        <div class="col-sm-8 col-lg-8 col-md-8">
            <div class="line text-center">
                <div class="panel panel-primary">
                    <div class="panel-heading custom-header-panel">
                        <div class="container-fluid panel-container">
                            <div class="col-xs-3 col-md-3 col-lg-3 text-left">
                                <h4 class="panel-title">
                                    <label id="traineeId">CECP ID: <b></b></label>
                                </h4>
                            </div>
                            <div class="col-xs-6 col-md-6 col-lg-6 text-center ">
                                <h4 class="panel-title">
                                    <label id="traineeUsername">Good Luck! <b>Candidate Name</b></label>
                                </h4>
                            </div>
                            <div class="col-xs-3 col-md-3 col-lg-3 text-right">
                                <div class="panel-title btn-group">
                                    <a href="/" class="btn btn-success">SUBMIT</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel-body" style="background-image:url(<%=request.getContextPath()%>/img/background-5.jpg); overflow: auto; min-height: 420px" >
                        <table>
                            <col width="15%">
                            <col width="85%">
                            <tr>
                                <td>Question No.</td>
                                <td>The Question Appears hear</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="radio" name="question_id" value="option_a">A. blah!blah!blah!blah!blah!blah!blah!blah!blah!blah!</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="radio" name="question_id" value="option_b">B. blah!blah!blah!blah!blah!blah!blah!blah!blah!blah!</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="radio" name="question_id" value="option_c">C. blah!blah!blah!blah!blah!blah!blah!blah!blah!blah!</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="radio" name="question_id" value="option_d">D. blah!blah!blah!blah!blah!blah!blah!blah!blah!blah!</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
</body>
</html>
