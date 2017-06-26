<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Registration</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="../res/layui/css/layui.css">
        <link rel="stylesheet" href="../res/css/global.css">
    </head>

    <body>

        <jsp:include page="header.jsp" />

        <div class="main layui-clear">

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-tab layui-tab-brief">
                    <ul class="layui-tab-title">
                        <li><a href="${pageContext.request.contextPath}/student/log.htm">Sign In</a></li>
                        <li class="layui-this">Sign Up</li>
                    </ul>
                    <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-form layui-form-pane">
                                <form method="post" action="${pageContext.request.contextPath}/student/register.htm">
                                    <div class="layui-form-item">
                                        <label for="L_stuid" class="layui-form-label">Student ID</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="L_stuid" name="stuid" required lay-verify="required" autocomplete="off" class="layui-input"
                                                   placeholder="digits only">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_stuname" class="layui-form-label">Name</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="L_stuname" name="stuname" required lay-verify="required" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_gender" class="layui-form-label">Gender</label>
                                        <div id="L_gender" class="layui-input-block">
                                            <input type="radio" name="sex" value="0" title="Male" checked>
                                            <input type="radio" name="sex" value="1" title="Female">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_pass" class="layui-form-label">Password</label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="L_pass" name="pass" required lay-verify="required|number" autocomplete="off" class="layui-input"
                                                   placeholder="digits only">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_repass" class="layui-form-label">Confirm</label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="L_repass" name="repass" required lay-verify="required|repass" autocomplete="off" class="layui-input"
                                                   placeholder="ReEnter your password">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <button class="layui-btn" lay-filter="*" lay-submit>Register</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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