<%--
  Created by IntelliJ IDEA.
  User: 51121
  Date: 2018/9/13
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>一览</title>

</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计分析 <span class="c-gray en">&gt;</span> 人才统计 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="f-14 c-error"/> </div>
<div id="container row" style="min-width:700px;height:400px;text-align: center;font-size: 1.2ex;" >
    <div class="col-md-4 col-sm-6" style="margin-top: 5%"><input class="btn btn-danger-outline radius " style="height: 40px"  type="button" value="科技人才联乡帮村" onclick="javascript:window.location.href='<%=ctxPath%>/Stat?action=scienceStat'" >
    </div>
    <div class="col-md-4 col-sm-6" style="margin-top: 5%"><input class="btn btn-secondary-outline radius"  style="height: 40px" type="button" value="领创项目示范引领" onclick="javascript:window.location.href='<%=ctxPath%>/Stat?action=createStat'">
    </div>
    <div class="col-md-4 col-sm-6" style="margin-top: 5%"><input class="btn btn-success-outline radius" style="height: 40px" type="button" value="乡土人才扶贫带富" onclick="javascript:window.location.href='<%=ctxPath%>/Stat?action=localStat'">
    </div>
    <div class="col-md-4 col-sm-6" style="margin-top: 5%"><input class="btn btn-warning-outline radius"  style="height: 40px" type="button" value="情系毕节人才回归" onclick="javascript:window.location.href='<%=ctxPath%>/Stat?action=returnStat'">
    </div>
    <div class="col-md-4 col-sm-6" style="margin-top: 5%"><input class="btn btn-danger-outline radius"  style="height: 40px" type="button" value="圆梦小康专家行动" onclick="javascript:window.location.href='<%=ctxPath%>/Stat?action=dreamStat'">
    </div>
    <div class="col-md-4 col-sm-6" style="margin-top: 5%"><input class="btn btn-secondary-outline radius " style="height: 40px" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;驻&nbsp;&nbsp;村&nbsp;&nbsp;干&nbsp;&nbsp;部&nbsp;&nbsp;&nbsp;&nbsp;" onclick="javascript:window.location.href='<%=ctxPath%>/Stat?action=cadreStat'">
    </div>
</div>

<!--_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript">


    // $(function () {
    //     Highcharts.chart('container', {
    //         title: {
    //             text: 'Monthly Average Temperature',
    //             x: -20 //center
    //         },
    //         subtitle: {
    //             text: 'Source: WorldClimate.com',
    //             x: -20
    //         },
    //         xAxis: {
    //             categories: ['一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月']
    //         },
    //         yAxis: {
    //             title: {
    //                 text: 'Temperature (°C)'
    //             },
    //             plotLines: [{
    //                 value: 0,
    //                 width: 1,
    //                 color: '#808080'
    //             }]
    //         },
    //         tooltip: {
    //             valueSuffix: '°C'
    //         },
    //         legend: {
    //             layout: 'vertical',
    //             align: 'right',
    //             verticalAlign: 'middle',
    //             borderWidth: 0
    //         },
    //         series: [{
    //             name: 'Tokyo',
    //             data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
    //         }, {
    //             name: 'New York',
    //             data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
    //         }, {
    //             name: 'Berlin',
    //             data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
    //         }, {
    //             name: 'London',
    //             data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
    //         }]
    //     });
    // });
</script>
</body>
</html>
