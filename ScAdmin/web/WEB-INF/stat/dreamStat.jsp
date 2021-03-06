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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页<span class="c-gray en">&gt;</span> 统计分析 <span class="c-gray en">&gt;</span>圆梦小康专家行动<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container"><div class="f-14 c-error"/></div>
<div class="btn-group">
    <span id="b1" class="btn btn-primary radius" onclick="document.getElementById('report1').style.display='none';document.getElementById('report2').style.display='none';document.getElementById('container').style.display='block';document.getElementById('container2').style.display='block'">图表</span>
    <span id="b2" class="btn btn-default radius" onclick="document.getElementById('report1').style.display='block';document.getElementById('report2').style.display='block';document.getElementById('container').style.display='none';document.getElementById('container2').style.display='none'">报表</span>
</div>
<div id="report1" style="display: none;" >人才类型:<table class="table table-border table-bordered table-hover table-bg">
    <thead class="text-c">
    <tr>
        <th>人才类型</th>
        <th>数量</th>
    </tr>
    </thead>
    <tbody>
    <tr class="text-c">
        <td>重点学科、重点产业人才团队(人)</td>
        <td>${cityTotalD.rctd}</td>
    </tr>
    <tr class="text-c">
        <td>专家服务团</td>
        <td>${cityTotalD.zjfwt}</td>
    </tr >
    <tr class="text-c">
        <td>医院</td>
        <td>${cityTotalD.hospital}</td>
    </tr>
    <tr class="text-c">
        <td>学校</td>
        <td>${cityTotalD.school}</td>
    </tr>
    </tbody>
</table></div>
<div  id="report2" style="display: none;">区域人才:<table class="table table-border table-bordered table-hover table-bg" >
    <thead class="text-c">
    <tr>
        <th>区域</th>
        <th>重点学科、重点产业人才团队(人)</th>
        <th>专家服务团(人)</th>
        <th>医院</th>
        <th>学校</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${regionD}" var="reg">
    <tr class="text-c">
        <td>${reg.regionname}</td>
        <td>${reg.rctd}</td>
        <td>${reg.zjfwt}</td>
        <td>${reg.hospital}</td>
        <td>${reg.school}</td>
    </tr>
    </c:forEach>

    </tbody>
</table></div>

<div id="container" style="min-width:700px;height:400px;"class="highcharts-data-label"></div>
<div id="container2" style="min-width:700px;height:400px;margin-top: 10%;" class="highcharts-data-label">
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
                text: '人才类型'
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [
                    '毕节'
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
                name: '重点学科、重点产业人才团队(人)',
                data: [${cityTotalD.rctd}]

            }, {
                name: '专家服务团(人)',
                data: [${cityTotalD.zjfwt}]

            },{
                name: '医院(个)',
                data: [${cityTotalD.hospital}]

            },{
                name: '学校(个)',
                data: [${cityTotalD.school}]

            }]
        });
    });


    //第二张表
    $(function () {
        $('#container2').highcharts({
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
                text: '区域人才'
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [
                    <c:forEach items="${regionD}" var="reg">
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
                name: '重点学科、重点产业人才团队(人)',
                data: [
                    <c:forEach items="${regionD}" var="reg">
                    ${reg.rctd},
                    </c:forEach>
                ]

            }, {
                name: '专家服务团(人)',
                data: [
                    <c:forEach items="${regionD}" var="reg">
                    ${reg.zjfwt},
                    </c:forEach>
                ]

            },{
                name: '医院(个)',
                data: [
                    <c:forEach items="${regionD}" var="reg">
                    ${reg.hospital},
                    </c:forEach>
                ]

            },{
                name: '学校(个)',
                data: [
                    <c:forEach items="${regionD}" var="reg">
                    ${reg.school},
                    </c:forEach>
                ]

            }]
        });
    });
</script>
</body>
</html>