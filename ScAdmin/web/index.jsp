<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-8-30
  Time: 下午5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>小窗口</title>
</head>
<body>
  <%
    response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
    response.sendRedirect(request.getContextPath() + "/Index?action=login");
  %>
</body>
</html>