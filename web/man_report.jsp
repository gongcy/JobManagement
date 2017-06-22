<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Manager|Report Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,huting">
        <link rel="stylesheet" href="res/layui/css/layui.css">
        <link rel="stylesheet" href="res/css/global.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <div class="main fly-user-main layui-clear">
            <ul class="layui-nav layui-nav-tree layui-inline">
                <li class="layui-nav-item ">
                    <a href="man_job.jsp"><i class="layui-icon">&#xe604;</i>Job Management</a>
                </li>
                <li class="layui-nav-item">
                    <a href="man_user.jsp"><i class="layui-icon">&#xe612;</i>User Management</a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="man_report.jsp"><i class="layui-icon">&#xe620;</i>Report Management</a>
                </li>
            </ul>

            <div class="site-tree-mobile layui-hide">
                <i class="layui-icon">&#xe602;</i>
            </div>
            <div class="site-mobile-shade"></div>

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-tab">
                    <ul class="layui-tab-title" id="LAY_mine">
                        <li class="layui-this">Placement History</li>
                        <li>Placement Summary</li>
                    </ul>
                    <div class="layui-tab-content" style="padding: 20px 0;">
                        <div class="layui-form layui-form-pane layui-tab-item layui-show">
                            Placement history
                        </div>


                        <div class="layui-form layui-form-pane layui-tab-item">
                            placement summary
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />

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