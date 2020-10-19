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
<a id="loginHangingLink" target="_blank" class="hide-s text-dark text-size-25 text-m-size-15 text-primary-hover" href="/cecp/login" style="position:fixed;top:120px;right:-14px;z-index:10;">Login/Join Us....</a>
<script>
    <%
        HttpSession currentSession = request.getSession();
        if(currentSession.getAttribute("loggedTrainee") != null){ %>
            let linkPortal = document.getElementById('loginHangingLink');
            linkPortal.innerHTML = "Back to Your Portal....";
            linkPortal.href = "/cecp/traineePortal";
    <% } else if (currentSession.getAttribute("loggedCoach") != null){ %>
            let linkPortal = document.getElementById('loginHangingLink');
            linkPortal.innerHTML = "Back to Your Portal....";
             linkPortal.href = "/cecp/coachPortal";
    <% } else if (currentSession.getAttribute("loggedAdmin") != null){ %>
            let linkPortal = document.getElementById('loginHangingLink');
            linkPortal.innerHTML = "Back to Your Portal....";
            linkPortal.href = "/cecp/adminPanel";
    <% } %>
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
    </header>

    <section class="section-top-padding background-white">
        <div class="line text-center">
            <h2 class="text-dark text-size-50 text-m-size-40"><b>CECP</b> Team</h2>
            <hr class="break background-primary break-dotted-double break-center margin-bottom-50">
        </div>
        <div class="line">
            <div class="margin2x">
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left" style="max-height: 250px; max-width: 350px; overflow: hidden">
                        <img src="<%=request.getContextPath()%>/img/portfolio/Pst_Irene_Wambui.JPG" height="50" width="50">
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-primary text-size-20 text-line-height-1 margin-bottom-20"><i>Pastor Irene Wambui</i></h3>
                        <p>Quote</p>
                    </div>
                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">

                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left" style="max-height: 250px; max-width: 350px; overflow: hidden">
                        <img src="<%=request.getContextPath()%>/img/portfolio/Coach_Beth.JPG" title="Beth is a renown etiquette and image consultant, an author and a mentor. Elizabeth has carried out a successful coaching in professional image and etiquette since 2007. She is a lead trainer, teaching innovative training programs for image, etiquette and communication coaches, at the center of etiquette, civility and protocol.">
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-primary text-size-20 text-line-height-1 margin-bottom-20" title="She advises executives and professionals as well as non-professionals on image management and Business Etiquette, helping them in their transformation and ascension process. She enjoys imparting these often neglected but very crucial soft skills to the current generation of professionals.">
                            <i>Coach Beth</i>
                        </h3>
                        <p>Quote</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="line">
            <div class="margin2x">
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left" style="max-height: 250px; max-width: 350px; overflow: hidden">
                        <img src="<%=request.getContextPath()%>/img/portfolio/Coach_Belinda.jpg" title="">
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-primary text-size-20 text-line-height-1 margin-bottom-20"><i>Coach Belinda</i></h3>
                        <p>Quote</p>
                    </div>
                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left" style="max-height: 250px; max-width: 350px; overflow: hidden">
                        <img src="<%=request.getContextPath()%>/img/portfolio/Blakx.JPG"
                             title="Blax is a communication coach, publicist and published author. He has carried out successful trainings for over nine years to different groups and individuals.">
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-strong text-size-20 text-line-height-1 margin-bottom-20" title="His bias being in public speaking, pressers, speech writing and print media communication. He is a highly  sort after publicity strategist around east Africa">
                            <i>Nelson Blax Oduor</i>
                        </h3>
                        <p>Quote</p>
                    </div>
                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left" style="max-height: 250px; max-width: 350px; overflow: hidden">
                        <img src="<%=request.getContextPath()%>/img/portfolio/Diana_Bosibori.JPG" >
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-primary text-size-20 text-line-height-1 margin-bottom-20"><i>Diana Bosibori</i></h3>
                        <p>Quote</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="line">
            <div class="margin2x">
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left" style="max-height: 250px; max-width: 350px; overflow: hidden">
                        <i class="text-primary text-size-40 text-line-height-1"></i>
                        <img src="<%=request.getContextPath()%>/img/portfolio/448ec2ac-47bb-4efe-8ba3-f8e5ecfaeb14.JPG" >
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-primary text-size-20 text-line-height-1 margin-bottom-20"><i>Miss ...</i></h3>
                        <p>Quote</p>
                    </div>
                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">

                </div>
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left" style="max-height: 250px; max-width: 350px; overflow: hidden">
                        <img src="<%=request.getContextPath()%>/img/portfolio/a61ee3a7-f08f-4301-a1ff-56c8e656d2b6.JPG" >
                    </div>
                    <div class="margin-left-60">
                        <h3 class="text-primary text-size-20 text-line-height-1 margin-bottom-20"><i>Miss ...</i></h3>
                        <p>Quote</p>
                    </div>
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
                    <a class="text-primary-hover" href="/cecp/contactUs">Contact Us</a><br>
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
                <p class="text-size-12">Power to Your Image</p>
            </div>
        </div>
    </section>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/response.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-scripts.js"></script>
</body>
</html>