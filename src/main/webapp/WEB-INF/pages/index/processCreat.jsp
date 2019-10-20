<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.i4tp.entity.*" %>
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

            width: 800px;

            height: 400px;

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
                    <li><a href="${basePath}/index/index">I4TP 系统配置与重构平台</a></li>
                </ul>

            </div>
            <div id="userbar">
                <img src="../../../files/amtc.png" alt="amtc">
            </div>
        </div>

        <div class="mod-set-nav">
            <ul class="clearfix li-5">
                <li>
                    <a href="${basePath}/index/gotoProduct">
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
                <form action="${basePath}/index/operatingSystemSelect" method="post" id="process">
                <div>
                    <p>工艺名称：</p><input id="process_name" name="process_name"><br>
                </div>
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
                    <textarea id="p_inf" name="p_inf" style="border-style: none;width: 380px;height: 300px;"></textarea>
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
            <form id="processInf">
                <div style="display: flex;justify-content: space-around;">
                    <div>
                        <p>特征类型：</p><select id="feature_type"><br>
                        <option>---特征类型---</option>
                        <%
                            List<product_feature_type> ls2 = (List<product_feature_type>) request.getSession().getAttribute("allFeatureType");

                            for (product_feature_type typeVo2 : ls2) {%>
                        <option value="<%=typeVo2.getProduct_feature_type()%>"><%=typeVo2.getProduct_feature_type() %>
                        </option>
                        <%
                            }
                        %>
                    </select>
                        <p>加工方式：</p><select id="process_type"><br>
                        <option>---加工方式---</option>
                        <%
                            List<process_type> ls = (List<process_type>) request.getSession().getAttribute("allProcessType");

                            for (process_type typeVo : ls) {%>
                        <option value="<%=typeVo.getProcess_type()%>"><%=typeVo.getProcess_type() %>
                        </option>
                        <%


                            }
                        %>
                    </select>

                        <p>特征编号：</p><input id="feature_number"><br>
                        <p>基准编号：</p><input id="base_plane_number"><br>
                    </div>

                    <div>
                        <p>精度：</p><input id="machining_accuracy_mm"><br>
                        <p>粗糙度：</p><input id="surface_roughness_um"><br>
                    </div>
                </div>
                <div>
                    <br>
                    <p>加工尺寸：</p><br>
                    <div style="display: flex;justify-content: space-around;">
                        <p>x：</p><br><input id="dimension_x">
                        <p>y：</p><br><input id="dimension_y">
                        <p>φ：</p><br><input id="dimension_phi">
                        <p>h：</p><br><input id="dimension_h">
                    </div>
                </div>


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


</body>
</html>

<%--提交--%>
<script type="text/javascript">

    function doSubmitForm() {
        var input1 = document.getElementById("process_name");
        if (!input1.value){
            alert("未输入工艺名称!");
            return;
        }
        else
    //        sessionStorage.setItem('process_name',  $("#process_name").val());
            document.getElementById("process").submit();
    }

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
        var feature_type = document.getElementById('feature_type').value;
        var process_type = document.getElementById('process_type').value;
        var feature_number = document.getElementById('feature_number').value;
        var base_plane_number = document.getElementById('base_plane_number').value;
        var dimension_x = document.getElementById('dimension_x').value;
        var dimension_y = document.getElementById('dimension_y').value;
        var dimension_phi = document.getElementById('dimension_phi').value;
        var dimension_h = document.getElementById('dimension_h').value;
        var machining_accuracy_mm = document.getElementById('machining_accuracy_mm').value;
        var surface_roughness_um = document.getElementById('surface_roughness_um').value;
        var oOpt = oOpt0 + "feature_type:" + feature_type + ",process_type:" + process_type + ",feature_number:" + feature_number
            + ",base_plane_number:" + base_plane_number + ",dimension_x:" + dimension_x + ",dimension_y:" + dimension_y + ",dimension_phi:" + dimension_phi
            + ",dimension_h:" + dimension_h + ",machining_accuracy_mm:" + machining_accuracy_mm + ",surface_roughness_um:" + surface_roughness_um + "\n";
        $("#p_inf").text(oOpt.replace(new RegExp(' ', 'g'), "_"));
        $("#feature_type").val("---特征类型---");
        $("#process_type").val("---加工方式---");
        $("#feature_number").val("");
        $("#base_plane_number").val("");
        $("#dimension_x").val("");
        $("#dimension_y").val("");
        $("#dimension_phi").val("");
        $("#dimension_h").val("");
        $("#machining_accuracy_mm").val("");
        $("#surface_roughness_um").val("");
    }


    function clearK() {
        $("#p_inf").text("");
    }

    function closeBox2() {
        document.getElementById("show").setAttribute("class", "hideK");

        document.getElementById("show").style.display;
        $("#feature_type").val("---特征类型---");
        $("#process_type").val("---加工方式---");
        $("#feature_number").val("");
        $("#base_plane_number").val("");
        $("#dimension_x").val("");
        $("#dimension_y").val("");
        $("#dimension_phi").val("");
        $("#dimension_h").val("");
        $("#machining_accuracy_mm").val("");
        $("#surface_roughness_um").val("");
    }
</script>
