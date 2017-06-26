<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // Check if login or not
    if (session.getAttribute("id") == null) {
//        response.sendRedirect("index.jsp");
    }
%>

<html>

    <head>
        <meta charset="utf-8">
        <title>Student|About Me</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,hunting">
        <link rel="stylesheet" href="../res/layui/css/layui.css">
        <link rel="stylesheet" href="../res/css/global.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <div class="main fly-user-main layui-clear">
            <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
                <li class="layui-nav-item layui-this">
                    <a href="${pageContext.request.contextPath}/student/aboutme.htm"><i class="layui-icon">&#xe604;</i>About Me </a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/student/resume.htm"><i class="layui-icon">&#xe612;</i>Edit Resume</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/student/profile.htm"><i class="layui-icon">&#xe620;</i>Edit Profile</a>
                </li>
            </ul>

            <div class="site-tree-mobile layui-hide">
                <i class="layui-icon">&#xe602;</i>
            </div>
            <div class="site-mobile-shade"></div>

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-inline">
                    <img src="../res/images/logo-2.png" class="layui-circle">
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>Name</legend>
                    <div class="layui-field-box">
                        <!--student name-->
                        ${name}
                    </div>
                </fieldset>

                <fieldset class="layui-elem-field layui-field-title">
                    <legend>Gender</legend>
                    <div class="layui-field-box">
                        <!--student gender-->
                        ${gender}
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>E-mail</legend>
                    <div class="layui-field-box">
                        <!--student email-->
                        ${email}
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>Education</legend>
                    <div class="layui-field-box">
                        <!--student education-->
                        ${education}
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>Skill</legend>
                    <div class="layui-field-box">
                        <!--student skill-->
                        ${skills}
                    </div>
                </fieldset>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script src="../res/layui/layui.js"></script>
        <script>
            layui.use(['element', 'form'], function () {
                //import element module
                var element = layui.element();
                //import form module
                var form = layui.form();
                form.verify({
                    repass: function (value, item) {
                        if (document.getElementById('#L_pass').value !== value) {
                            return "Inconsistent Passwords";
                        }
                    }
                });
            });
        </script>
    </body>

</html>