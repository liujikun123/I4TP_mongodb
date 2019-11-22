<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh"><!--<![endif]-->
<head>
    <meta http-equiv="X-UA-Compatible" content="edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <style>
        body {
            filter: none;
        }
    </style>
    <title>新建工程</title>

    <%
        String cssPath = request.getContextPath();
        String cssBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <meta name="viewport" content="width=1200">
    <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
    <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">

    <style type="text/css">

    </style>
</head>
<body>

<div id="hd0">
    <div class="mod-head clearfix">
        <h1 id="logo"><img src="../../../files/logo.png" alt="LOGO"></h1>
        <div id="nav">
            <ul>
                <li><a href="${basePath}/index/index">I4TP 系统配置与重构平台</a></li>
            </ul>

        </div>
        <div id="userbar">
            <img src="../../../files/amtc.png" alt="amtc">
        </div>
    </div>
</div>

<div id="allPage">
    <div id="hd">
        <div class="inner">

            <div class="mod-set-nav">
                <ul class="clearfix li-5">
                    <li class="active">
                        <a href="${basePath}/index/gotoProduct">
                            <i class="ico ico-1"></i>
                            <span>产品参数</span>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="ico ico-2"></i>
                            <span>工艺参数</span>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="ico ico-3"></i>
                            <span>操作系统选择</span>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="ico ico-4"></i>
                            <span>MES选择</span>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="ico ico-5"></i>
                            <span>用户需求</span>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="ico ico-6"></i>
                            <span>明细浏览</span>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="ico ico-7"></i>
                            <span>配置生成</span>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
    <div id="bd" style="height:auto;width: 800px">
        <div style="margin: 25px;text-align: center;">
            <div style="margin: 25px;">

                <div style="margin-bottom:15px;">
                    <button type="button" class="btn btn-primary btn-l" onclick=gotoPartCreat()><span>新建产品</span>
                    </button>
                </div>

            </div>

            <div style="margin: 25px;">
                <div style="margin-bottom:15px;">
                    <button type="button" class="btn btn-primary btn-l" onclick=gotoPartSelect()><span>选择产品</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    function gotoPartCreat() {
        window.location.href = "${basePath}/index/gotoPartCreat";
    }
</script>
<script type="text/javascript">
    function gotoPartSelect() {
        window.location.href = "${basePath}/index/gotoPartSelect";
    }
</script>
</html>