<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.i4tp.entity.material_type" %>
<%@ page import="com.i4tp.entity.Part" %>
<%@ page import="com.i4tp.entity.process" %>
<%@ page import="org.apache.commons.lang3.ObjectUtils" %>
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
    <title>选择工艺</title>

    <%
        String cssPath = request.getContextPath();
        String cssBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <meta name="viewport" content="width=1200">
    <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
    <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">

    <style type="text/css">
        .processType {
            background-color: rgb(38, 115, 191);
            border-color: rgb(17, 91, 166);
            border-radius: 10px;
            border-image-repeat: stretch;
            border-image-source: none;
            border-width: 5px;
            color: rgb(255, 255, 255);
            cursor: pointer;
            font-family: "Microsoft Yahei", arial, helvetica, sans-serif;
            font-size: 12px;
            font-weight: 400;
            height: 21px;
            line-height: 15px;
            padding-top: 9px;
            text-align: center;
            transition-delay: 0s;
            transition-duration: 0.2s;
            transition-property: background;
            transition-timing-function: ease-in;
            white-space: nowrap;
            width: 200px;

        }

        .processType2 {
            border: solid;
            border-color: rgb(17, 91, 166);
            border-radius: 10px;
            border-image-repeat: stretch;
            border-image-source: none;
            border-width: 3px;
            color: rgb(0, 0, 0);
            cursor: pointer;
            font-family: "Microsoft Yahei", arial, helvetica, sans-serif;
            font-size: 12px;
            font-weight: 400;
            height: 21px;
            line-height: 21px;
            text-align: center;
            transition-delay: 0s;
            transition-duration: 0.2s;
            transition-property: background;
            transition-timing-function: ease-in;
            white-space: nowrap;
            width: 190px;
        }
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
                    <li class="active">
                        <a href="${basePath}/index/processCreat">
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
    <div id="bd" style="height:auto;width: 800px"><br>
        <div style="display: flex;justify-content: space-around;">
            <div>
                <div style="display: flex;justify-content: space-around;">
                    <div class="processType">选择已有工艺</div>

                    <div class="processType2" style="position: relative;left: 10px;"><a
                            href="${basePath}/index/processCreat" style="display: block">创建新工艺</a></div>
                </div>

                <form id="process" action="${basePath}/index/operatingSystemSelect" method="post">
                <div style="margin: 5px">
                    <select id="processSelect" name="processSelect" onchange="myFunction()"
                            style="height:38px; width: 330px ">
                        <option value="null"> ---请选择工艺---</option>
                        <%
                            List<process> ls = (List<process>) request.getSession().getAttribute("process");

                            if (ls.size() != 0) {%>
                        <option id="nProcess" name="nProcess" value="<%=ls%>"><%=ls.get(0).getName() %>
                        </option>

                        <input type='text' name='processName' value=<%=ls.get(0).getName()%> hidden>

                        <%
                            }
                        %>
                    </select>
                </div>
                </form>

                <div style="position: relative; top: 200px">
                    <div style="margin-bottom:15px;">
                        <button type="button" class="btn btn-primary btn-l" onclick=doSubmitForm()>
                            <span>下一步</span></button>
                    </div>
                </div>
            </div>
            <div>
                <div style="position: relative;left: 20px;border:solid; width:400px; height:350px ;border-radius:25px;color: #114d89">
                    <div style="padding:5px 10px 20px;">
                        <p style="font-size:150%;text-align:center;">工艺信息</p>

                <textarea id="p_inf2" style="border-style: none;width: 380px;height: 300px;color: #114d89">
                </textarea>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
</script>

</body>
</html>

<%--将选择工艺显示--%>
<script type="text/javascript">
    function myFunction() {
        var oOpt = document.getElementById('processSelect').value;
        console.log(oOpt);
        $("#p_inf2").text(oOpt);

    }
</script>

<%--提交--%>
<script type="text/javascript">
    function doSubmitForm() {
        if (0)
            alert("error!");
        else
            // sessionStorage.setItem("finalProcess", $("#nProcess").val());
            document.getElementById("process").submit();
    }

</script>
</html>

