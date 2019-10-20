
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
    <title>创建产品</title>

    <%
        String cssPath = request.getContextPath();
        String cssBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <meta name="viewport" content="width=1200">
    <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
    <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">

    <style type="text/css">
        .input{
            width: 308px;
            height: 24px;
            padding: 7px 10px;
            line-height: 24px;
            background: #fff;
            border: 1px #d9d9d9 solid;
            font-size: 14px;
            color: #000;
            border-radius: 4px;
        }
        .inputName{
            width: 100px;
            height: 25px;
        }
        .checkboxHere{
            zoom:150%;
        padding: 7px 10px;
        line-height: 24px;
        background: #fff;
        border: 1px #d9d9d9 solid;
        font-size: 14px;
        color: #000;
        border-radius: 4px;
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

<form action="${basePath}/index/process2" method="post" id="partCreat">
   <div class="inputName"> 零件名：</div><input type="text" name="partName" class="input"/><br>
    <div class="inputName"> 零件x尺寸：</div><input type="text" name="part_x" class="input"/><br>
    <div class="inputName"> 零件y尺寸：</div><input type="text" name="part_y" class="input"/><br>
    <div class="inputName"> 零件z尺寸：</div><input type="text" name="part_z" class="input"/><br>
    <div style="position: relative; left: 450px; bottom: 260px">
    <div class="inputName">  零件材料：</div>
    <select id="material" name="material_type"  onchange="myFunction()"  class="input" style="height:38px; width: 330px ">
        <option value=null> ---请选择材料--- </option>
        <%

            List<material_type> ls = (List<material_type>)request.getSession().getAttribute("material_type");

            for (material_type typeVo : ls) {%>

        <option value="<%=typeVo.getMaterial_type()%>"> <%=typeVo.getMaterial_type() %> </option>

        <%

            }

        %>

    </select>
    <br>

        <div class="inputName">零件质量：</div><input type="text" name="workpiece_weight_kg" class="input" /><br>
        <div class="inputName"> 多面：</div><input name="multiaspect" type="checkbox" value="true" class="checkboxHere" />
        <div class="inputName"> 旋转体：</div><input name="rotation" type="checkbox" value="true"class="checkboxHere" /><br>
    </div>

    <div style="position: relative; left: 450px; bottom: 200px">
        <div style="margin-bottom:15px;"><button type="button" class="btn btn-primary btn-l" onclick=doSubmitForm()>
            <span>下一步</span></button>
        </div>
    </div>
</form>


</div>
</body>

<script type="text/javascript" >
    function doSubmitForm() {
        if(document.getElementById('material').value == "null"|| document.getElementById('material').value == null)
            alert("error!");
        else
            document.getElementById("partCreat").submit();
    }
</script>
</html>
