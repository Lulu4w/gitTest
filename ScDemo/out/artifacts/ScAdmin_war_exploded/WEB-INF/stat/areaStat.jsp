<%--
  Created by IntelliJ IDEA.
  User: 51121
  Date: 2018/9/13
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>一览</title>
    <style>
        .highcharts-data-label {
            font-weight: normal;
        }
        .highlight .highcharts-data-label-box {
            fill: red;
            stroke-width: 2px;
            stroke: black;
        }
        .highlight.highcharts-data-label text {
            font-weight: bold;
            fill: white;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页<span class="c-gray en">&gt;</span> 统计分析 <span class="c-gray en">&gt;</span> 区域人才数量<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container"><div class="f-14 c-error"/></div>
<div id="container" style="min-width:700px;height:400px;margin-top: 10%;" class="highcharts-data-label">
</div>

<!--_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript">



    $(function () {
        $('#container').highcharts({
            lang: {
                printChart:"打印图表",
                downloadJPEG: "下载JPEG 图片" ,
                downloadPDF: "下载PDF文档"  ,
                downloadPNG: "下载PNG 图片"  ,
                downloadSVG: "下载SVG 矢量图" ,
                exportButtonTitle: "导出图片"
            },
            chart: {
                type: 'column'
            },
            title: {
                text: '人才总数'
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [
                    <c:forEach items="${pnumByRegionDs}" var="reg">
                    '${reg.regionname}',
                    </c:forEach>
                ]

            },
            yAxis: {
                min: 0,
                title: {
                    text: ''
                }
            },
            // tooltip: {
            //     headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            //     pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            //         '<td style="padding:0"><b>{point.y:.1f} 人</b></td></tr>',
            //     footerFormat: '</table>',
            //     shared: true,
            //     useHTML: true
            // },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'none',
                            color: '#222'
                        }
                    }
                }
            },
            series: [{
                name: '人才总数 ',
                data: [
                    <c:forEach items="${pnumByRegionDs}" var="reg">
                    ${reg.pnum},
                    </c:forEach>
                ]
            }
            ]
        });
    });
</script>
</body>
</html>