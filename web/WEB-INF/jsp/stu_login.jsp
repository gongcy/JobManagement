<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Student|Log In</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="../res/layui/css/layui.css">
        <link rel="stylesheet" href="../res/css/global.css">
        <script language="javascript" type="text/javascript">
            function validateCode() {
                document.getElementById('getCode').src = "../vcode.jsp?" + Math.ceil(Math.random() * 1000);
            }
        </script>
    </head>

    <body>

        <jsp:include page="header.jsp" />

        <div class="main layui-clear">

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-tab layui-tab-brief">
                    <ul class="layui-tab-title">
                        <li class="layui-this">Sign In</li>
                        <li><a href="reg.htm">Sign Up</a></li>
                    </ul>
                    <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-form layui-form-pane">
                                <form method="post" action="${pageContext.request.contextPath}/student/login.htm">
                                    <div class="layui-form-item">
                                        <label for="L_stuid" class="layui-form-label">Student ID</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="L_stuid" name="stuid" required lay-verify="required" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_pass" class="layui-form-label">Password</label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="L_pass" name="pass" required lay-verify="required|number" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_vcode" class="layui-form-label">Verify Code</label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="L_vcode" name="vcode" required lay-verify="required|number" autocomplete="off" class="layui-input">
                                        </div>
                                        <img src="vcode.jsp" id="getCode"/> 
                                        <a href="#" onclick="javasrcipt:validateCode()">Change another</a>  
                                        <br/>
                                    </div>
                                    <div class="layui-form-item">
                                        <button class="layui-btn" lay-filter="*" lay-submit>Sign In</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                                    </div>
                                    <a style="color: blue" href="${pageContext.request.contextPath}/manager/log.htm">Manager Login</a>
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
                        });
        </script>

    </body>
</html>