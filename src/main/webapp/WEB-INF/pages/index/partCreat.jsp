<%--
  Created by IntelliJ IDEA.
  User: kunkun
  Date: 2019/9/19
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/common.jsp" %>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <title>注册界面</title>

</head>

<body>
<form action="${basePath}/index/partCreat" method="post">
    零件名：<input type="text" name="partName"/><br>
    零件x尺寸：<input type="text" name="part_x"/><br>
    零件y尺寸：<input type="text" name="part_y"/><br>
    零件z尺寸：<input type="text" name="part_z"/><br>
    <input type="submit" value="下一步">
</form>
</body>
</html>
