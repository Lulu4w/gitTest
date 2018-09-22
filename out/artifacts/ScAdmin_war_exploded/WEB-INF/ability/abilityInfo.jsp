<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-12
  Time: 下午10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
    <img class="avatar size-XL l" src="${ability.d.picPath}">
    <dl style="margin-left:80px; color:#fff">
        <dt>
            <span class="f-18">${ability.d.PNAME}</span>
            <span class="pl-10 f-12"></span>
        </dt>
        <dd class="pt-10 f-12" style="margin-left:0">人才类别：${ability.d.PTYPE}</dd>
    </dl>
</div>
<div class="pd-20">
    <table class="table">
        <tbody>
        <tr>
            <th class="text-r" width="80">性别：</th>
            <td>${ability.d.PSEX}</td>
        </tr>
        <tr>
            <th class="text-r" width="80">民族：</th>
            <td>${ability.d.PNATION}</td>
        </tr>
        <tr>
            <th class="text-r">手机：</th>
            <td>${ability.d.PTEL}</td>
        </tr>
        <tr>
            <th class="text-r">生日：</th>
            <td>${ability.d.PBIRTH}</td>
        </tr>
        <tr>
            <th class="text-r">政治面貌：</th>
            <td>${ability.d.PPOLICE}</td>
        </tr>
        <tr>
            <th class="text-r">身份证号：</th>
            <td>${ability.d.PCARD}</td>
        </tr>
        <tr>
            <th class="text-r">籍贯：</th>
            <td>${ability.d.PNATIVE}</td>
        </tr>
        <tr>
            <th class="text-r">毕业院校：</th>
            <td>${ability.d.PSCHOOL}</td>
        </tr>
        <tr>
            <th class="text-r">专业：</th>
            <td>${ability.d.PMAJOR}</td>
        </tr>
        <tr>
            <th class="text-r">学历：</th>
            <td>${ability.d.PEDU}</td>
        </tr>
        <tr>
            <th class="text-r">学位：</th>
            <td>${ability.d.PDEGREE}</td>
        </tr>
        <tr>
            <th class="text-r">研究方向：</th>
            <td>${ability.d.PDIRECTION}</td>
        </tr>
        <tr>
            <th class="text-r">工作单位：</th>
            <td>${ability.d.PJOBPLACE}</td>
        </tr>
        <tr>
            <th class="text-r">职务：</th>
            <td>${ability.d.PPOST}</td>
        </tr>
        <tr>
            <th class="text-r">职称：</th>
            <td>${ability.d.PTECHTITLE}</td>
        </tr>

        </tbody>
    </table>
</div>

</body>
</html>
