<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>CECP</title>
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

<body class="size-1280">
<header role="banner" class="position-absolute">

</header>

<main role="main">
    <header class="section-block-2x background-image text-center" style="background-image:url(<%=request.getContextPath()%>/img/img-05.jpg)">
        <br>
        <br>
        <br>
        <% Object msg = request.getAttribute("msg"); %>
        <p>
            <%=msg%>
            <br>
            <br>
            <br>
            <input type="submit" value="Return To Previous Page!" onclick="history.back(-1)" class="submit action-button" />
        </p>
    </header>
</main>
</body>
</html>
<%--            <%--%>
<%--                Enumeration eNames = request.getHeaderNames();--%>
<%--                while (eNames.hasMoreElements()) {--%>
<%--                    String name = (String) eNames.nextElement();--%>
<%--                    String value = request.getHeader(name);--%>
<%--            %>--%>
<%--                    <tr><td><%= name %></td><td><%= value %></td></tr>--%>
<%--                <%}%>--%>

<%--    <%--%>
<%--        Cookie cookie = null;--%>
<%--        Cookie[] cookies = null;--%>

<%--        cookies = request.getCookies();--%>

<%--        if( cookies != null ) {--%>
<%--            out.println("<h2> Found Cookies Name and Value</h2>");--%>

<%--            for (int i = 0; i < cookies.length; i++) {--%>
<%--                cookie = cookies[i];--%>
<%--                out.print("Name : " + cookie.getName( ) + ",  ");--%>
<%--                out.print("Value: " + cookie.getValue( )+" <br/>");--%>
<%--            }--%>
<%--        } else {--%>
<%--            out.println("<h2>No cookies founds</h2>");--%>
<%--        }--%>
<%--    %>--%>
