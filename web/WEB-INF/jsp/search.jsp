<%-- 
    Document   : search
    Created on : 2017-6-24, 21:31:01
    Author     : LocalUser
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,huting">
        <link rel="stylesheet" href="res/layui/css/layui.css">
        <link rel="stylesheet" href="res/css/global.css">
    </head>
    <body>
        <jsp:include page="../../header.jsp" />
        <div class="main layui-clear">
            <div class="wrap">
                <div class="content">
                    <div class="fly-tab fly-tab-index">
                        <span>
                            <a href="">All</a>
                            <a href="">Software Engineer</a>
                            <a href="">Product</a>
                            <a href="">Designer</a>
                        </span>
                        <form action="searchJob.htm" method="get" class="fly-search">
                            <input class="layui-input" autocomplete="off" placeholder="Search job" type="text" name="q">
                            <i class="iconfont icon-sousuo"></i>
                        </form>
                    </div>
                    <table class="layui-table" lay-even lay-skin="nob">
                        <colgroup>
                            <col width="150">
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>Job Name</th>
                                <th>Company</th>
                                <th>Skill Required</th>
                                <th>Deadline</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${lr}" var="rec">
                            <tr>
                                <td>${rec.jobName}</td>
                                <td>${rec.companyName}</td>
                                <td>${rec.skillRequired}</td>
                                <td>${rec.deadLine}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="../../footer.jsp" />
        <script src="res/layui/layui.js"></script>
        <script>
            layui.use('element', function () {
                var element = layui.element(); //import element module

                //listener for navigation click
                element.on('nav(nav_click)', function (elem) {

                    layer.msg(elem.text());
                });
            });
        </script>
    </body>
</html>
