<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh"><!--<![endif]--><head>
  <meta http-equiv="X-UA-Compatible" content="edge">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="renderer" content="webkit">
  <style>
    body {
      filter: none;
    }
  </style>
  <title>首页</title>

  <%
    String cssPath = request.getContextPath();
    String cssBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <meta name="viewport" content="width=1200">
  <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
  <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">

  <style type="text/css">
  .gotoPartSelect{
  position:relative;
  clear:left;
  float:left;
  margin-bottom:15px;
  zoom:1;
  left:160px;
  }
  .gotoPartCreat{
  position:relative;
  clear:left;
  float:left;
  margin-bottom:15px;
  zoom:1;
  left:160px;
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
            <li><a>I4TP xxxxxxxxx 使能工具</a></li>
          </ul>

        </div>
        <div id="userbar">
          <span id="sysmenu" class="name s-dropdown">AMTC LOGO</span>
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

  <div id="bd" style="height: 100px;width: 800px">
    <br>

    <div class="gotoPartCreat">

        <div style="margin-bottom:15px;"><button type="button" class="btn btn-primary btn-l" onclick=gotoPartCreat()><span>新建产品</span></button></div>

    </div>

    <div class="gotoPartSelect">
        <div style="margin-bottom:15px;"><button type="button" class="btn btn-primary btn-l" onclick=gotoPartSelect()><span>选择产品</span></button></div>
  </div>
  </div>
  </body>

<script type="text/javascript" >
  function gotoPartCreat(){
    window.location.href="${basePath}/index/gotoPartCreat";
  }
</script>
<script type="text/javascript" >
  function gotoPartSelect(){
    window.location.href="${basePath}/index/gotoPartSelect";
  }
</script>
</html>