<%-- 
    Document   : header
    Created on : Jun 18, 2017, 9:29:00 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header">
    <div class="main">
        <a class="logo" href="" title="Job-hunting">Job-hunting</a>
        <div class="nav">
            <!--class="nav-this"-->
            <a href="${pageContext.request.contextPath}/index.htm">
                <i class="iconfont icon-shouye"></i>Home
            </a>
            <a href="${pageContext.request.contextPath}/search.htm">
                <i class="iconfont icon-liulanyanjing"></i>Find a job     
            </a>
            <a href="${pageContext.request.contextPath}/postJob.htm">
                <i class="iconfont icon-tianjia"></i>Post a job
            </a>
        </div>

        <div class="nav-user">
            <%
                String sid = (String) session.getAttribute("sid");
                String mid = (String) session.getAttribute("mid");

                if (sid == null && mid == null) {
            %>
            <!-- before Login -->
            <a class="unlogin" href="${pageContext.request.contextPath}/student/log.htm"><i class="iconfont icon-touxiang"></i></a>
            <span><a href="${pageContext.request.contextPath}/student/log.htm">Login</a><a href="${pageContext.request.contextPath}/student/reg.htm">Register</a></span>

            <%
            } else if (sid != null) {
            %>
            <!-- Student Login -->
            <a class="avatar" href="${pageContext.request.contextPath}/student/aboutme.htm">
                <img src="">
                <cite><%=sid%></cite>
                <i>Student</i>
            </a>
            <div class="nav">
                <a href="${pageContext.request.contextPath}/student/profile.htm"><i class="iconfont icon-shezhi"></i>Settings</a>
                <a href="${pageContext.request.contextPath}/student/logout.htm"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>Log Out</a>
            </div> 

            <%
            } else {
            %>
            <!--Manager Login-->
            <a class="avatar" href="">
                <img src="../res/images/avatar/default.png">
                <cite><%=mid%></cite>
                <i>Manager</i>
            </a>
            <div class="nav">
                <!--<a href="manager/set/"><i class="iconfont icon-shezhi"></i>Settings</a>-->
                <a href="${pageContext.request.contextPath}/manager/logout.htm"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>Log Out</a>
            </div> 
            <%
                }
            %>
        </div>
    </div>
</div>