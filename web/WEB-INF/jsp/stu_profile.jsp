<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Student|Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,huting">
        <link rel="stylesheet" href="../res/layui/css/layui.css">
        <link rel="stylesheet" href="../res/css/global.css">
    </head>

    <body>
        <jsp:include page="../../header.jsp" />
        <div class="main fly-user-main layui-clear">
            <ul class="layui-nav layui-nav-tree layui-inline">
                <li class="layui-nav-item">
                    <a href="aboutme.htm"><i class="layui-icon">&#xe604;</i>About Me </a>
                </li>
                <li class="layui-nav-item">
                    <a href="editResume.htm"><i class="layui-icon">&#xe612;</i>Edit Resume</a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="editProfile.htm"><i class="layui-icon">&#xe620;</i>Edit Profile</a>
                </li>
            </ul>

            <div class="site-tree-mobile layui-hide">
                <i class="layui-icon">&#xe602;</i>
            </div>
            <div class="site-mobile-shade"></div>

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-tab">
                    <ul class="layui-tab-title" id="LAY_mine">
                        <li class="layui-this" lay-id="info">Profile</li>
                        <li lay-id="avatar">Avatar</li>
                        <li lay-id="pass">Password</li>
                    </ul>
                    <div class="layui-tab-content" style="padding: 20px 0;">
                        <div class="layui-form layui-form-pane layui-tab-item layui-show">
                            <form method="post" action="editProfile.htm">
                                <div class="layui-form-item">
                                    <label for="L_email" class="layui-form-label">E-Mail</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_email" name="email" required lay-verify="email" autocomplete="off" value="" class="layui-input">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">If you have changed the e-mail address,<a href="activate.htm" style="font-size: 12px; color: #4f99cf;">Re-validate e-mail address</a></div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="L_stuage" class="layui-form-label">Age</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_stuage" name="stuage" required lay-verify="required|number" autocomplete="off" value="" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="L_stuedu" class="layui-form-label">Education</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_stuedu" name="stuedu" autocomplete="off" value="" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>Confirm</button>
                                </div>
                            </form>
                        </div>


                        <div class="layui-form layui-form-pane layui-tab-item">
                            <div class="layui-form-item">
                                <div class="avatar-add">
                                    <p>Suggested Size:168*168，jpg,png,gif supported</p>
                                    <div class="upload-img">
                                        <input type="file" name="file" id="LAY-file" lay-title="Upload Avatar">
                                    </div>
                                    <span class="loading"></span>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form layui-form-pane layui-tab-item">
                            <form method="post" action="changePassword.htm">
                                <div class="layui-form-item">
                                    <label for="L_nowpass" class="layui-form-label">Current</label>
                                    <div class="layui-input-inline">
                                        <input type="password" id="L_nowpass" name="nowpass" required lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="L_pass" class="layui-form-label">New</label>
                                    <div class="layui-input-inline">
                                        <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="L_repass" class="layui-form-label">Confirm</label>
                                    <div class="layui-input-inline">
                                        <input type="password" id="L_repass" name="repass" required lay-verify="required|repass" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>Update Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../footer.jsp" />
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