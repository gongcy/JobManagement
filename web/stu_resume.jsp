<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Student|Resume</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="job,huting">
    <link rel="stylesheet" href="res/layui/css/layui.css">
    <link rel="stylesheet" href="res/css/global.css">
</head>

<body>
    <div class="main fly-user-main layui-clear">
        <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
            <li class="layui-nav-item">
                <a href="stu_aboutme.html">
        <i class="layui-icon">&#xe604;</i>
        About Me 
      </a>
            </li>
            <li class="layui-nav-item layui-this">
                <a href="stu_resume.html"><i class="layui-icon">&#xe612;</i>Edit Resume</a>
            </li>
            <li class="layui-nav-item">
                <a href="stu_profile.html"><i class="layui-icon">&#xe620;</i>Basic Setting</a>
            </li>
        </ul>

        <div class="site-tree-mobile layui-hide">
            <i class="layui-icon">&#xe602;</i>
        </div>
        <div class="site-mobile-shade"></div>

        <div class="fly-panel fly-panel-user" pad20>
            <div class="layui-tab" lay-allowClose="true">
                <ul class="layui-tab-title" id="LAY_mine">
                    <li class="layui-this" lay-id="Resume A">Resume A</li>
                </ul>
                <div class="layui-tab-content" style="padding: 20px 0;">

                    <div class="layui-form layui-form-pane layui-tab-item layui-show">
                        <div class="layui-form-item layui-form-text">
                            <label for="L_skill" class="layui-form-label">Skill</label>
                            <div class="layui-input-block">
                                <textarea placeholder="write your skill stack" id="L_skill" name="skill" autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-inline">
                                <input type="checkbox" name="" title="Java" >
                                <input type="checkbox" name="" title="C++">
                                <input type="checkbox" name="" title="Python">
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
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