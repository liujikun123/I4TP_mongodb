<%--
  Created by IntelliJ IDEA.
  User: kunkun
  Date: 2019/9/22
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.krry.entity.material_type" %>
<%@ page import="com.krry.entity.Part" %>
<%@include file="../common/common.jsp" %>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>选择产品</title>
</head>
<body>
<form action="${basePath}/index/partSelect" method="post">
    零件选择：
    <select id="production" name="production"  onchange="myFunction()">
        <option value=NULL> ---请选择产品--- </option>
        <%

            List<Part> ls = (List<Part>)request.getSession().getAttribute("allPart");

            for (Part typeVo : ls) {%>

        <option value="<%=typeVo%>"> <%=typeVo.getPartName() %> </option>
        <%


            }
        %>
    </select><br>

    <input type="submit" value="下一步" onclick="selectProduct()" > <br>
</form>
<p>产品信息</p>
<pre id="p_inf"> </pre>

<script type="text/javascript" >
    function myFunction() {
        var oOpt = document.getElementById('production').value;
        $("#p_inf").text(oOpt);

    }
</script>

</body>
</html>
