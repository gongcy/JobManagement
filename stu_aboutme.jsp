<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Student|About Me</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="job,huting">
    <link rel="stylesheet" href="res/layui/css/layui.css">
    <link rel="stylesheet" href="res/css/global.css">
</head>

<body>
    <div class="main fly-user-main layui-clear">
        <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
            <li class="layui-nav-item layui-this">
                <a href="stu_aboutme.html"><i class="layui-icon">&#xe604;</i>About Me </a>
            </li>
            <li class="layui-nav-item">
                <a href="stu_resume.html"><i class="layui-icon">&#xe612;</i>Edit Resume</a>
            </li>
            <li class="layui-nav-item">
                <a href="stu_profile.html"><i class="layui-icon">&#xe620;</i>Basic Setting</a>
            </li>
        </ul>

        <div class="site-tree-mobile layui-hide">
            <i class="layui-icon">&#xe602;</i>
        </div>
        <div class="site-mobile-shade"></div>

        <div class="fly-panel fly-panel-user" pad20>
            <div class="layui-inline">
                <img src="res/images/logo-2.png" class="layui-circle">
            </div>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>Name</legend>
                <div class="layui-field-box">
                    <!--student name-->
                </div>
            </fieldset>

            <fieldset class="layui-elem-field layui-field-title">
                <legend>Gender</legend>
                <div class="layui-field-box">
                    <!--student gender-->
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>E-mail</legend>
                <div class="layui-field-box">
                    <!--student email-->
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>Education</legend>
                <div class="layui-field-box">
                    <!--student education-->
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>Skill</legend>
                <div class="layui-field-box">
                    <!--student skill-->
                </div>
            </fieldset>

        </div>
        <script src="res/layui/layui.js"></script>
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