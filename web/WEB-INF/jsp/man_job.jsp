<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Manager|Job Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,huting">
        <link rel="stylesheet" href="../res/layui/css/layui.css">
        <link rel="stylesheet" href="../res/css/global.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <div class="main fly-user-main layui-clear">
            <ul class="layui-nav layui-nav-tree layui-inline">
                <li class="layui-nav-item layui-this">
                    <a href="${pageContext.request.contextPath}/manager/job.htm"><i class="layui-icon">&#xe604;</i>Job Management</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/manager/studentDetails.htm"><i class="layui-icon">&#xe612;</i>User Management</a>
                </li>
                <li class="layui-nav-item ">
                    <a href="${pageContext.request.contextPath}/manager/report.htm"><i class="layui-icon">&#xe620;</i>Report Management</a>
                </li>
            </ul>

            <div class="site-tree-mobile layui-hide">
                <i class="layui-icon">&#xe602;</i>
            </div>
            <div class="site-mobile-shade"></div>

            <div class="fly-panel fly-panel-user" pad20>
                <div class="layui-tab">
                    <ul class="layui-tab-title" id="LAY_mine">
                        <li class="layui-this">Job</li>
                        <li>Student ToEmploy</li>
                    </ul>
                    <div class="layui-tab-content" style="padding: 20px 0;">

                        <div class="layui-form layui-form-pane layui-tab-item layui-show">
                            <!--job CRUD section-->
                            <form method="post" action="${pageContext.request.contextPath}/addJob.htm">
                                <div class="layui-form-item">
                                    <label for="L_jobid" class="layui-form-label">Job ID</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_jobid" name="jobid" required lay-verify="required|number" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="L_jobname" class="layui-form-label">Job Name</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_jobname" name="jobname" required lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="L_jobtype" class="layui-form-label">Job Type</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="L_jobtype" name="jobtype" required lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <button class="layui-btn" lay-filter="*" lay-submit>Add</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                                </div>
                            </form>
                        </div>

                        <div class="layui-form layui-form-pane layui-tab-item layui-show">
                            <table class="layui-table" lay-even lay-skin="nob">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lj}" var="job">
                                    <tr>
                                        <td>${job.jobNo}</td>
                                        <td>${job.jobName}</td>
                                        <td>${job.jobType}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="layui-form layui-form-pane layui-tab-item">
                            <table class="layui-table" lay-even lay-skin="nob">
                                <thead>
                                    <tr>
                                        <th>Employ No</th>
                                        <th>Student Name</th>
                                        <th>Job Name</th>
                                        <th>Company Name</th>
                                        <th>Active</th>
                                        <th>Status</th>
                                        <th>Apply Time</th>
                                        <th>Expected Salary</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lemp}" var="emp">
                                    <tr>
                                        <td>${emp.employNo}</td>
                                        <td>${emp.studentName}</td>
                                        <td>${emp.jobName}</td>
                                        <td>${emp.companyName}</td>
                                        <td>${emp.status}</td>
                                        <td>${emp.applyTime}</td>
                                        <td>${emp.expectedSalary}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script src="../res/layui/layui.js"></script>
        <script>
            layui.use('element', function () {
                //import element module
                var element = layui.element();

            });
        </script>
    </body>

</html>