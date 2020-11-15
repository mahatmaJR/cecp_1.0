<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <title>CECP</title>
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

<body class="size-1280">
<a id="loginHangingLink" target="_blank" class="hide-s text-dark text-size-25 text-m-size-15 text-dark-hover" href="/login" style="position:fixed;top:120px;right:-14px;z-index:10;">Login/Join Us....</a>
<script>
    <%
        HttpSession currentSession = request.getSession();
        if(currentSession.getAttribute("loggedTrainee") != null){%>
            let linkPortal = document.getElementById('loginHangingLink');
            linkPortal.innerHTML = "Back to Your Portal....";
            linkPortal.href = "/traineePortal";
    <%} else if (currentSession.getAttribute("loggedCoach") != null){%>
            let linkPortal = document.getElementById('loginHangingLink');
            linkPortal.innerHTML = "Back to Your Portal....";
            linkPortal.href = "/coachPortal";
    <%} else if (currentSession.getAttribute("loggedAdmin") != null){%>
            let linkPortal = document.getElementById('loginHangingLink');
            linkPortal.innerHTML = "Back to Your Portal....";
            linkPortal.href = "/adminPanel";
    <%}%>
</script>
<header role="banner" class="position-absolute">
    <nav class="background-transparent background-primary-dott full-width sticky">
        <div class="logo hide-l hide-xl hide-xxl">
            <a href="<%=request.getContextPath()%>/index" class="logo">
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
    <header class="section-top-padding background-image text-center" style="background-image:url(<%=request.getContextPath()%>/img/img-05.jpg)">
        <h1 class="text-extra-thin text-white text-s-size-30 text-m-size-40 text-size-50 text-line-height-1 margin-bottom-40 margin-top-130">
            CENTER OF ETIQUETTE, CIVILITY & PROTOCOL
        </h1>
        <i class="slow icon-sli-arrow-down text-white margin-top-20 text-size-16"></i>
        <img class="margin-top-20 center" src="<%=request.getContextPath()%>/img/Classroom-Audience-Etiquette.jpeg" alt="">

        <img class="arrow-object" src="<%=request.getContextPath()%>/img/arrow-object-dark.svg" alt="">
    </header>

    <section class="section-small-padding background-dark text-center">
        <div class="line">
            <div class="m-10 l-6 xl-4 center">
                <div class="margin">
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section class="section-top-padding background-white">
        <div class="line">
            <div class="margin2x">
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left">
                        <i class="icon-sli-equalizer text-primary text-size-40 text-line-height-1"></i>
                    </div>
                    <div class="margin-left-60">


                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20">Etiquette</h3>
                        <p>Good manners can open doors the best education can not</p>
                        <a class="text-more-info text-primary" href="/cecp/index">Read more</a>
                    </div>
                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left">
                        <i class="icon-sli-layers text-primary text-size-40 text-line-height-1"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20">Civility</h3>
                        <p>There is a plausible case that civility is a prerequisite of the emergence and sustenance of social capital in the community</p>
                        <a class="text-more-info text-primary" href="/cecp/index">Read more</a>
                    </div>
                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left">
                        <i class="icon-sli-share text-primary text-size-40 text-line-height-1"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20">Protocol</h3>
                        <p>Establishing the correct, formal & polite behaviour that should be maintained by government and international officials</p>
                        <a class="text-more-info text-primary" href="/cecp/index">Read more</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section background-white">
        <div class="line text-center">
            <h2 class="text-dark text-size-50 text-m-size-40">Courses <b>Available</b></h2>
            <i class="icon-chevron_down text-primary margin-bottom-50 text-size-20"></i>
        </div>

        <div class="l-12 xl-7 center">
            <div class="margin">
                <div class="s-12 m-12 l-4 text-right">
                    <div class="margin-right-50">
                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20">BASIC COACHING CERTIFICATION (BCC)</h3>
                        <p>
                            Introduction to public speaking<br>
                            Introduction to business etiquette<br>
                            <a class="text-primary-hover" href="<%=request.getContextPath()%>/enrollmentForm">Enroll Now!!</a>
                        </p>
                    </div>


                    <div class="margin-right-50"><br>
                        <br>
                        <br>
                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20">ADVANCED COACHING CERTIFICATION (ACC)</h3>
                        <p>
                            Personal Branding<br>
                            Etiquette of protocol<br>
                            <a class="text-primary-hover" href="<%=request.getContextPath()%>/enrollmentForm">Enroll Now!!</a>
                        </p>
                    </div>
                </div>

                <div class="s-12 m-12 l-4">
                    <div class="margin-m-top-bottom-50" >
                        <div class="item">
                            <img src="<%=request.getContextPath()%>/img/Etiquette.jpg"/>
                        </div>
                    </div>
                </div>

                <div class="s-12 m-12 l-4">
                    <div class="margin-left-50">
                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20">MASTER COACHING CERTIFICATION (MCC)</h3>
                        <p>
                            Choose a single unit of specialization<br>
                            or<br>
                            Pursue a full MCC course<br>
                            <a class="text-primary-hover" href="<%=request.getContextPath()%>/enrollmentForm">Enroll Now!!</a>
                        </p>
                    </div>

                    <div class="margin-left-50"><br>
                        <br>
                        <br>
                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20">Soft Skills Training Programs</h3>
                        <p>
                            Color Psychology<br>
                            Professional Appearance<br>
                            Apply Knowledge of Self to Make Decisions<br>
                            <a class="text-primary-hover" href="<%=request.getContextPath()%>/enrollmentForm">Enroll Now!!</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="background-primary full-width">
        <div class="m-12 l-6 xl-5 xxl-4">
            <img class="full-img" src="<%=request.getContextPath()%>/img/img-02.jpg"/>
        </div>
        <div class="m-12 l-6 xl-7 xxl-8">
            <div class="l-12 xl-11 xxl-8 padding-2x">
                <h2 class="text-l-size-40 text-size-50 text-white">WE Offer <b>CORPORATE</b> Training</h2>
                <p class="margin-bottom">
                    Businesses are driven by customer demand, but customers preferences and expectations are changing.
                    Customers expect a personalized experience tailored to meet their needs. In the organization every
                    human interaction your customer makes or come in contact with your representative, must give him a
                    feel of perfection. <br>
                    We will train your employees to distinguish themselves; develop and maintain business relationships
                    with a cutting-edge difference, strengthen your business presence, project a positive, confident,
                    3professional image and reputation and thrive in any situation with finesse and polish.<br>
                    <a class="text-strong text-primary-hover" href="<%=request.getContextPath()%>/corporateTraining">Click Here For More Info</a>
                </p>
                <p>After training with <b>US, YOU </b>will</p>
                <img class="margin-left-20 margin-top-30 margin-bottom-60" src="<%=request.getContextPath()%>/img/start-your-business.svg" alt="">
            </div>
        </div>
    </section>

    <section class="section-small-padding background-dark text-center">
        <div class="line">
            <h2 class="text-white text-size-25 text-m-size-40 margin-bottom-20">Have a chat with us about your specific requirements<b></b></h2>
            <div class="m-10 l-6 xl-4 center">
                <div class="margin">
                </div>
            </div>
        </div>
    </section>

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
                <p class="text-size-12">Etiquette Opens Doors</p>
            </div>
        </div>
    </section>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-scripts.js"></script>
</body>
</html>