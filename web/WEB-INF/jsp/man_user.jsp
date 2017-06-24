<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Manager|User Management</title>
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
                    <a href="job.htm"><i class="layui-icon">&#xe604;</i>Job Management</a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="user.htm"><i class="layui-icon">&#xe612;</i>User Management</a>
                </li>
                <li class="layui-nav-item ">
                    <a href="report.htm"><i class="layui-icon">&#xe620;</i>Report Management</a>
                </li>
            </ul>

            <div class="site-tree-mobile layui-hide">
                <i class="layui-icon">&#xe602;</i>
            </div>
            <div class="site-mobile-shade"></div>

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-tab">
                    <ul class="layui-tab-title" id="LAY_mine">
                        <li class="layui-this">Student Details</li>
                        <li>Add Users</li>
                    </ul>
                    <div class="layui-tab-content" style="padding: 20px 0;">
                        <div class="layui-form layui-form-pane layui-tab-item layui-show">
                            <table class="layui-table" lay-even lay-skin="nob">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Status</th>
                                        <th>Active</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${ls}" var="stu">
                                        <tr>
                                            <td>${stu.studentNo}</td>
                                            <td>${stu.studentName}</td>
                                            <td>${stu.gender}</td>
                                            <td>${stu.status}</td>
                                            <td>${stu.active}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <div class="layui-form layui-form-pane layui-tab-item">
                            <form method="post" action="register.htm">
                                <div class="layui-form-item">
                                    <label for="L_manid" class="layui-form-label">Manager ID</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_manid" name="manid" required lay-verify="required|number" autocomplete="off" class="layui-input"
                                               placeholder="digits only">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="L_stuname" class="layui-form-label">Name</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_stuname" name="manname" required lay-verify="required" autocomplete="off" class="layui-input">
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