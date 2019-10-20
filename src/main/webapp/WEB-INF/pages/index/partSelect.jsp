
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.i4tp.entity.material_type" %>
<%@ page import="com.i4tp.entity.Part" %>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh"><!--<![endif]--><head>
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
        String cssBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <meta name="viewport" content="width=1200">
    <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
    <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">

    <style type="text/css">

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
                <li class="active">
                    <a>
                        <i class="ico ico-1"></i>
                        <span>产品选择</span>
                    </a>
                </li>
                <li>
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

<div id="bd" style="height: 350px;width: 800px">
    <br>
    <form id="partSelect"  action="${basePath}/index/process" method="post">

        <div style="height: 50px">
        零件选择：
        <select id="production" name="production"  onchange="myFunction()" style="height:34px; width: 300px ">
            <option value="null"> ---请选择产品--- </option>
            <%
                List<Part> ls = (List<Part>)request.getSession().getAttribute("allPart");
                for (Part typeVo : ls) {%>
            <option value="<%=typeVo%>"> <%=typeVo.getPartName() %> </option>
            <%


                }
            %>
        </select>
    </div>

    </form>
        <div style="border:solid; width:400px; height:250px ;border-radius:25px;color: #114d89" >
            <div style="padding:5px 10px 20px;">
                <p style="font-size:150%;text-align:center;">产品信息</p>
                <pre id="p_inf"> </pre>
            </div>
        </div>
<div style="position: relative; left: 450px; bottom: 200px">
        <div style="margin-bottom:15px;"><button type="button" class="btn btn-primary btn-l" onclick=doSubmitForm()>
            <span>下一步</span></button></div>
</div>




</div>

<script type="text/javascript" >
    function myFunction() {
        var oOpt = document.getElementById('production').value;
        $("#p_inf").text(oOpt);

    }
</script>
<script type="text/javascript" >
    function doSubmitForm() {
        if(document.getElementById('production').value == null ||document.getElementById('production').value == "null")
            alert("error!");
        else
            document.getElementById("partSelect").submit();
    }
</script>

</body>
</html>
