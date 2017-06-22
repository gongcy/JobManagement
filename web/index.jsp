<%-- 
    Document   : index
    Created on : Jun 17, 2017, 10:47:15 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Job-hunting Website</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="job,huting">
        <link rel="stylesheet" href="res/layui/css/layui.css">
        <link rel="stylesheet" href="res/css/global.css">
    </head>
    <body>

        <jsp:include page="header.jsp"/>
        <div class="main layui-clear">
            <div class="wrap">
                <div class="content">
                    <div class="fly-tab fly-tab-index">
                        <span>
                            <a href="jie/index.html">All</a>
                            <a href="jie/index.html">Software Engineer</a>
                            <a href="jie/index.html">Product</a>
                            <a href="jie/index.html">Designer</a>
                        </span>

                        <form action="http://cn.bing.com/search" class="fly-search">
                            <input class="layui-input" autocomplete="off" placeholder="Search job" type="text" name="q">
                            <i class="iconfont icon-sousuo"></i>
                        </form>  
                    </div>
                    <ul class="layui-nav layui-nav-tree" lay-filter="nav_click">
                        <li class="layui-nav-item">
                            <a href="javascript:;">Front End</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;">Web FrontEnd</a></dd>
                                <dd><a href="javascript:;">JavaScript</a></dd>
                                <dd><a href="javascript:;">U3D</a></dd>
                                <dd><a href="javascript:;">COCOS2D-X</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">Back End</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;">Java</a></dd>
                                <dd><a href="javascript:;">Python</a></dd>
                                <dd><a href="javascript:;">C#</a></dd>
                                <dd><a href="javascript:;">Linux C/C++</a></dd>
                            </dl>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="edge">
                <dl class="fly-panel fly-list-one">
                    <dt class="fly-panel-title">Trending Jobs
                    </dt>
                    <dd>
                        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
                        <span><i class="iconfont icon-shouye"></i> 6087</span>
                    </dd>
                </dl>
                <dl class="fly-panel fly-list-one">
                    <dt class="fly-panel-title">Recently Posted</dt>
                    <dd>
                        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
                        <span><i class="iconfont">&#xe60c;</i> 96</span>
                    </dd>
                </dl>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
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