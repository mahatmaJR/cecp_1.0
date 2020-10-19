<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EXAM PREVIEW</title>
</head>
<body>
<header class="section background-image text-center" style="background-image:url(<%=request.getContextPath()%>/img/img-05.jpg)">
    <h1 class="animated-element slow text-extra-thin text-white text-s-size-30 text-m-size-40 text-size-50 text-line-height-1 margin-bottom-30 margin-top-40">
        The Following Content Will be Saved With The Specified Details, Please Confirm.
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
                            <label id="examId">EXAM ID: <b><%=  %></b></label>
                        </h4>
                    </div>
                    <div class="col-xs-6 text-center ">
                        <h4 class="panel-title">
                            <label id="examName"> EXAM NAME: <b><%=  %></b></label>
                        </h4>
                    </div>
                    <div class="col-xs-3 text-right">
                        <div class="panel-title btn-group">
                            <a href="<%=request.getContextPath()%>/main/" class="btn btn-warning">CONFIRM</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-body" style="overflow: auto; max-height: 720px; min-height: 220px" >
                <table>
                    <tr>
                        <td>Question NO</td>
                        <td>Question</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Option A</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Option B</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Option C</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Option D</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
</html>
