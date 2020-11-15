<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Corporate Engagement</title>
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
    <style>
        .clientButton {
            background-color: #00aeef;
            color: white;
            font-size: 17px;
            font-style: italic;
        }
    </style>
</head>
<body class="size-1280">
<header role="banner" class="position-absolute">
    <nav class="background-transparent background-primary-dott full-width sticky">
        <div class="logo hide-l hide-xl hide-xxl">
            <a href="/cecp/index" class="logo">
                <img class="logo-dark" src="<%=request.getContextPath()%>/img/cecp-02.png" alt="">
            </a>
        </div>

        <div class="top-nav">


            <div class="top-nav left-menu">
                <ul class="right top-ul chevron">
                    <li><a href="<%=request.getContextPath()%>/index">Home</a></li>
                    <li>
                        <a>Our Programs</a>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/enrollmentForm">Coaching Certification</a></li>
                            <li><a href="<%=request.getContextPath()%>/corporateTraining">Corporate Training</a></li>
                            <li><a href="<%=request.getContextPath()%>/enrollmentForm">Soft Skills</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <!-- logo -->
                        <ul class="logo-menu">
                            <a href="<%=request.getContextPath()%>/index" class="logo">
                                <!-- Logo White Version -->
                                <img class="logo-white" src="<%=request.getContextPath()%>/img/cecp-02.png" alt="">
                                <!-- Logo Dark Version -->
                                <img class="logo-dark" src="<%=request.getContextPath()%>/img/cecp-02.png" alt="">
                            </a>
                        </ul>


            <div class="top-nav right-menu">
                <ul class="top-ul chevron">
                    <li><a href="<%=request.getContextPath()%>/aboutUs">About Us</a></li>
                    <li><a href="<%=request.getContextPath()%>/contactUs">Contact Us</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<main role="main">
    <article>
        <header class="section background-image text-center" style="background-image:url(<%=request.getContextPath()%>/img/img-05.jpg)">
            <h1 class="animated-element slow text-extra-thin text-white text-s-size-30 text-m-size-40 text-size-50 text-line-height-1 margin-bottom-30 margin-top-130">
                Provide <b>US</b> with the following details:-
            </h1>
            <p class="animated-element text-white"></p>

            <img class="arrow-object" src="<%=request.getContextPath()%>/img/arrow-object-white.svg" alt="">
        </header>

        <section class="section-small-padding background-white text-center">
            <div class="line">
            </div>
        </section>

        <section class="full-width">
            <div class="m-12 l-6">
                <div>
                    <h3 class="text-size-30 margin-bottom-40 text-center"><b>Contact Form</b></h3>
                    <form class="customform text-white" method="post" action="<%=request.getContextPath()%>/main/corporate/saveCorporateInfo">
                        <div class="line">
                            <div class="margin">
                                <div class="s-12 m-12 l-6">
                                    <input id="companyName" name="companyName" placeholder="Company Name" type="text" />
                                </div>
                                <div class="s-12 m-12 l-6">
                                    <input id="companyEmail" name="companyEmail" placeholder="Company Email" type="email" />
                                </div>
                            </div>
                        </div>
                        <div class="line">
                            <div class="margin">
                                <div class="s-12 m-12 l-6">
                                    <input id="contactPerson" name="contactPerson" placeholder="Your Full Name" type="text" />
                                </div>
                                <div class="s-12 m-12 l-6">
                                    <input id="phoneNumber" name="phoneNumber" placeholder="Phone Number" type="text" />
                                </div>
                            </div>
                        </div>
                        <div class="line">
                            <div class="s-12">
                                <textarea id="clientRequirement" name="clientRequirement" placeholder="A brief descriptions of your requirements e.g number of people attending the sessions, topics to cover, duration allocated for this training...etc" rows="3"></textarea>
                            </div>
                            <div class="s-12"><input class="btn btn-primary btn-lg btn-block text-strong text-primary text-s-size-30" type="submit" value="Submit"/></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="m-12 l-6">
                <%--                question to clients --%>
            </div>
        </section>


        <section class="section background-dark">
        </section>
    </article>
</main>


<footer>
    <div class="background-primary padding text-center">
        <a href="/"><i class="icon-facebook_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-twitter_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-google_plus_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-instagram_circle text-size-25 text-dark"></i></a>
        <a href="/"><i class="icon-linked_in_circle text-size-25 text-dark"></i></a>
    </div>

    <section class="section background-dark">
        <div class="line">
            <div class="margin2x">
                <div class="s-12 m-6 l-3 xl-5">
                    <h4 class="text-white text-strong">Our Mission</h4>
                    <p>
                        <b class="text-size-20">Giving POWER,</b><b class="text-size-20"> POLISH & POISE</b> to your Image.</p>
                    </p>
                </div>
                <div class="s-12 m-6 l-3 xl-2">
                    <h4 class="text-white text-strong margin-m-top-30">Useful Links</h4>
                    <a class="text-primary-hover" href="">FAQ</a><br>
                    <a class="text-primary-hover" href="<%=request.getContextPath()%>/contactUs">Contact Us</a><br>
                    <a class="text-primary-hover" href="">Blog</a>
                </div>
                <div class="s-12 m-6 l-3 xl-2">
                    <h4 class="text-white text-strong margin-m-top-30">Term of Use</h4>
                    <a class="text-primary-hover" href="">Terms and Conditions</a><br>
                    <a class="text-primary-hover" href="">Refund Policy</a><br>
                    <a class="text-primary-hover" href="">Disclaimer</a>
                </div>
                <div class="s-12 m-6 l-3 xl-3">
                    <h4 class="text-white text-strong margin-m-top-30">Contact Us</h4>
                    <p>
                        <i class="icon-sli-screen-smartphone text-primary">+254 765 038 370<br></i>
                        <i class="icon-sli-screen-smartphone text-primary">+254 739 999 409</i>
                    </p>
                    <a class="text-primary-hover" href="mailto:contact@cecp.com"><i class="icon-sli-mouse text-primary"></i> contact@cecp.com</a><br>
                    <a class="text-primary-hover" href="mailto:info@cecp.com"><i class="icon-sli-mouse text-primary"></i> info@cecp.com</a>
                </div>
            </div>
        </div>
    </section>
    <div class="background-dark">
        <div class="line">
            <hr class="break margin-top-bottom-0" style="border-color: #777;">
        </div>
    </div>
    <section class="padding-2x background-dark full-width">
        <div class="line">
            <div class="s-12 l-6">
                <p class="text-size-12">Copyright 2020, Centre of Etiquette, Civility & Protocol</p>
                <p class="text-size-12">Improving Relations</p>
            </div>
        </div>
    </section>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-scripts.js"></script>
</body>
</html>
