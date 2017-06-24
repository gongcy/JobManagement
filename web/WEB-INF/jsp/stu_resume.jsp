<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Student|Resume</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,huting">
        <link rel="stylesheet" href="../res/layui/css/layui.css">
        <link rel="stylesheet" href="../res/css/global.css">
    </head>

    <body>
        <jsp:include page="../../header.jsp" />
        <div class="main fly-user-main layui-clear">
            <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
                <li class="layui-nav-item">
                    <a href="aboutme.htm"><i class="layui-icon">&#xe604;</i>About Me </a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="resume.htm"><i class="layui-icon">&#xe612;</i>Edit Resume</a>
                </li>
                <li class="layui-nav-item">
                    <a href="profile.htm"><i class="layui-icon">&#xe620;</i>Edit Profile</a>
                </li>
            </ul>

            <div class="site-tree-mobile layui-hide">
                <i class="layui-icon">&#xe602;</i>
            </div>
            <div class="site-mobile-shade"></div>

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-tab" lay-filter="resume-filter" lay-allowclose="true">
                    <ul class="layui-tab-title">
                        <li class="layui-this" lay-id="1">Resume A</li>
                    </ul>
                    <div class="layui-tab-content" style="padding: 20px 0;">
                        <div class="layui-form layui-form-pane layui-tab-item layui-show">
                            <form method="POST" action="student/editResume.htm">
                                <div class="layui-form-item layui-form-text">
                                    <label for="L_skill" class="layui-form-label">Skill</label>
                                    <div class="layui-input-block">
                                        <textarea placeholder="write your skill stack" id="skill" name="skill" autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-inline">
                                        <input type="checkbox" name="0" title="Java">
                                        <input type="checkbox" name="1" title="C++">
                                        <input type="checkbox" name="2" title="Python">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn">Submit</button>
                                </div>
                            </form>
                            <button class="layui-btn site-demo-active" data-type="tabAdd">Add Resume</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../footer.jsp" />
        <script src="../res/layui/layui.js"></script>
        <script>
            layui.use(['element', 'form'], function () {
                //import form module
                var form = layui.form();
                form.verify({
                    repass: function (value, item) {
                        if (document.getElementById('#L_pass').value !== value) {
                            return "Inconsistent Passwords";
                        }
                    }
                });
                //import element module
                var element = layui.element();
                var $ = layui.jquery;

                var active = {
                    tabAdd: function () {
                        //add a new tab for resume
                        element.tabAdd('resume-filter', {
                            title: 'Resume' + (Math.random() * 1000 | 0)
                            ,
                            content: 'content' + (Math.random() * 1000 | 0),
                            id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                        })
                    }
                };

                $('.site-demo-active').on('click', function () {
                    var othis = $(this),
                            type = othis.data('type');
                    active[type] ? active[type].call(this, othis) : '';
                });
            });
        </script>
    </body>

</html>