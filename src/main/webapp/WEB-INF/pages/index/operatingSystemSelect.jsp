<%--
  Created by IntelliJ IDEA.
  User: kunkun
  Date: 2019/9/22
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.i4tp.entity.material_type" %>
<%@ page import="com.i4tp.entity.Part" %>
<%@include file="../common/common.jsp" %>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>选择操作系统</title>
</head>
<body>
<form action="${basePath}/index/operatingSystem" method="post">
    操作系统选择：<br>
        <%

            List<String> ls = (List<String>)request.getSession().getAttribute("allOperatingSystem");

            for (String typeVo : ls) {%>

    <input type="checkbox" name=<%=typeVo %> value=<%=typeVo %>><%=typeVo %><br>
        <%


            }
        %>
    </select><br>

    <input type="submit" value="下一步"  > <br>
</form>
</body>
</html>
