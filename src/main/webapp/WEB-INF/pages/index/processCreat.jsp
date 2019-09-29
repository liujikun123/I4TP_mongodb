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

        #popLayer {


            background-color: #B3B3B3;

            position: absolute;

            top: 0;

            right: 0;

            bottom: 0;

            left: 0;

            z-index: 10;

            -moz-opacity: 0.8;

            opacity: .80;

            filter: alpha(opacity=80); /* 只支持IE6、7、8、9 */

        }


        /*弹出层*/

        #popBox {


            background-color: #FFFFFF;

            z-index: 11;

            width: 400px;

            height: 300px;

            margin: auto;

            border-radius: 20px;

            position: fixed;

            top: 0;

            right: 0;

            left: 0;

            bottom: 0;


        }


        #popBox .close {
            height: 30px;
            width: 100px;

            text-align: center;

            margin-right: 5px;

            display: block;

            background-color: rgb(17, 91, 166);


            border-radius: 50px;


        }

        #popBox .close2 {
            height: 30px;
            width: 100px;

            text-align: center;

            margin-right: 5px;

            display: block;

            background-color: gray;
            color: white;


            border-radius: 50px;


        }


        /*关闭按钮*/

        #popBox .close a {

            text-decoration: none;

            color: rgb(255, 255, 255);

        }

        .contentK {

            padding: 20px 60px 60px;
            margin: auto;

        }

        /*显示动画*/
        .appear {
            display: block;
        }

        @keyframes appear2 {
            0% {
                opacity: 0;
            }
            50% {
                opacity: 50;
            }
            100% {
                opacity: 100;
            }

        }

        .hideK {
            display: none;
        }


    </style>
</head>
<body>

<div id="hd">
    <div class="inner">
        <div class="mod-head clearfix">
            <h1 id="logo"><img src="../../../files/logo.png" alt="LOGO"></h1>
            <div id="nav">
                <ul>
                    <li><a href="${basePath}/index/index">I4TP xxxxxxxxx 使能工具</a></li>
                </ul>

            </div>
            <div id="userbar">
                <span id="sysmenu" class="name s-dropdown">AMTC LOGO</span>
            </div>
        </div>

        <div class="mod-set-nav">
            <ul class="clearfix li-5">
                <li>
                    <a>
                        <i class="ico ico-1"></i>
                        <span>产品选择</span>
                    </a>
                </li>
                <li class="active">
                    <a>
                        <i class="ico ico-2"></i>
                        <span>工艺设定</span>
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
                        <span>确认生成</span>
                    </a>
                </li>
            </ul>
        </div>

    </div>
</div>

<div id="bd" style="height: 350px;width: 800px"><br>

    <div style="display: flex;justify-content: space-around;">
        <div>
            <div style="display: flex;justify-content: space-around;">
                <div class="processType2"><a href="${basePath}/index/processSelect2" style="display: block">选择已有工艺</a>
                </div>

                <div class="processType" style="position: relative;left: 10px">创建新工艺</div>
            </div>
            <br>
            <div style="display: flex;justify-content: space-around;">
                <div style="margin-bottom:15px;">
                    <button type="button" class="btn btn-primary btn-l" onclick="popBox()">
                        <span style="width: 180px">+  新增工艺步骤</span></button>
                </div>
                <div style="margin-bottom:15px;">
                    <button type="button" class="btn btn-primary btn-l" onclick="clearK()">
                        <span style="width: 180px">-  清空工艺步骤</span></button>
                </div>
            </div>

            <div>
                <img src="" alt="这是产品特征示意图" style="border: solid;width: 150px;height: 150px">
            </div>
            <div>
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
                    <form id="process" action="${basePath}/index/processSelect" method="post">
                        <pre id="p_inf" name="p_inf"></pre>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="hideK" id="show">
    <div id="popLayer"></div>
    <div id="popBox">
        <div class="contentK">
            <form>
                <p>特征编号：</p><input id="processNum"><br>
                <p>加工方式：</p><select id="processType"><br>
                <option>---加工方式---</option>
            </select>
                <p>加工尺寸：</p><input id="processSize"><br>
                </select>
            </form>
        </div>

        <div style="display: flex;justify-content: space-around;">
            <div class="close">
                <a href="javascript:void(0)" onclick="closeBox()" style="display: block">确定</a>

            </div>
            <div class="close2">
                <a href="javascript:void(0)" onclick="closeBox2()" style="display: block">关闭</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
</script>

</body>
</html>

<%--提交--%>
<script type="text/javascript">
    function doSubmitForm() {
        if (0)
            alert("error!");
        else
            document.getElementById("process").submit();
    }

</script>
<script>
    /*点击弹出按钮*/
    function popBox() {
        document.getElementById("show").setAttribute("class", "appear");
        document.getElementById("show").style.animation = "appear2 1s 1"
    }

    /*点击关闭按钮*/
    function closeBox() {
        document.getElementById("show").setAttribute("class", "hideK");
        document.getElementById("show").style.display;
        var oOpt0 = document.getElementById('p_inf').innerHTML;
        var oOpt1 = document.getElementById('processNum').value;
        var oOpt2 = document.getElementById('processType').value;
        var oOpt3 = document.getElementById('processSize').value;
        var oOpt = oOpt0 + "Num:" + oOpt1 + ",Type:" + oOpt2 + ",Size:" + oOpt3 + "\n";
        $("#p_inf").text(oOpt);
        $("#processNum").val("");
        $("#processType").val("");
        $("#processSize").val("");
    }


    function clearK() {
        $("#p_inf").text("");
    }
    function closeBox2() {
        document.getElementById("show").setAttribute("class", "hideK");

        document.getElementById("show").style.display;
        $("#processNum").val("");
        $("#processType").val("");
        $("#processSize").val("");
    }
</script>
