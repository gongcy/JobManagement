<%-- 
    Document   : 404
    Created on : Jun 18, 2017, 9:59:49 PM
    Author     : gongcy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Error - Job-hunting</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,huting">
        <link rel="stylesheet" href="../res/layui/css/layui.css">
        <link rel="stylesheet" href="../res/css/global.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="main">
            <div class="fly-panel">
                <div class="fly-none">
                    <h2><i class="iconfont icon-404"></i></h2>
                    <p>Oops..Something wrong,back to <a href="index.jsp">home</a>.</p>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
