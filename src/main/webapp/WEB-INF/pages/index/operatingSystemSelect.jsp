<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.i4tp.entity.material_type" %>
<%@ page import="com.i4tp.entity.Part" %>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh"><!--<![endif]-->
<head>
    <meta http-equiv="X-UA-Compatible" content="edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
        body {
            filter: none;
        }
    </style>
    <title>选择产品</title>

    <%
        String cssPath = request.getContextPath();
        String cssBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <meta name="viewport" content="width=1200">
    <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
    <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">

    <li hidden id="count" value=0></li>

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
                    <li>
                        <a href="${basePath}/index/gotoProduct">
                            <i class="ico ico-1"></i>
                            <span>产品参数</span>
                        </a>
                    </li>
                    <li>
                        <a href="${basePath}/index/processCreat">
                            <i class="ico ico-2"></i>
                            <span>工艺参数</span>
                        </a>
                    </li>
                    <li class="active">
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
    <div id="bd" style="height: auto;width: 800px">
        <br>


        <form action="${basePath}/index/mesSelect" method="post" id="systemSelect">
            <div style="zoom: 150%">操作系统选择：</div>
            <br>
            <%

                List<String> ls = (List<String>) request.getSession().getAttribute("allOperatingSystem");

                for (String typeVo : ls) {%>

            <input type="checkbox" name="operatingSystem" value=<%=typeVo.replace(" ", "")%>> <%=typeVo %> <br>
            <%
                }
            %>
            </select><br>

            <div style="margin-bottom:15px;">
                <button type="button" class="btn btn-primary btn-l" onclick=doSubmitForm()>
                    <span>下一步</span></button>
            </div>

        </form>


    </div>
</div>

<%--提交--%>
<script type="text/javascript">
    function doSubmitForm() {
        if (document.getElementById("count").value === 0)
            alert("未选择!");
        else
            document.getElementById("systemSelect").submit();
        //   console.log( document.getElementById("count").value);//false
    }

    $(":checkbox").click(function () {
        if ($(this).prop("checked") === true)
//当前为选中状态
            document.getElementById("count").value++;
        else

            document.getElementById("count").value--;
//当前为不选中状态

    })
</script>


</body>
</html>
