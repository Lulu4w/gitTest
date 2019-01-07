
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计分析 <span class="c-gray en">&gt;</span> 科技人才联乡帮村 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container"><div class="f-14 c-error"/></div>
<div class="btn-group">
    <span id="b1" class="btn btn-primary radius" onclick="document.getElementById('report1').style.display='none';document.getElementById('report2').style.display='none';document.getElementById('container').style.display='block';document.getElementById('container2').style.display='block'">图表</span>
    <span id="b2" class="btn btn-default radius" onclick="document.getElementById('report1').style.display='block';document.getElementById('report2').style.display='block';document.getElementById('container').style.display='none';document.getElementById('container2').style.display='none'">报表</span>
</div>
<div id="report1" style="display: none;" >人才类型:<table class="table table-border table-bordered table-hover table-bg">
    <thead class="text-c">
    <tr>
        <th>人才来源</th>
        <th>人才类型</th>
        <th>人数(人)</th>
    </tr>
    </thead>
    <tbody>
    <tr class="text-c">
        <td>省派</td>
        <td>科技副职</td>
        <td>${cityTotalD.skjfz}</td>
    </tr>
    <tr class="text-c">
        <td>市派</td>
        <td>科技副职</td>
        <td>${cityTotalD.ckjfz}</td>
    </tr >
    <tr class="text-c">
        <td>县派</td>
        <td>科技副职</td>
        <td>${cityTotalD.xkjfz}</td>
    </tr>

    <tr class="text-c">
        <td>省派</td>
        <td>科技特派员</td>
        <td>${cityTotalD.skjtpy}</td>
    </tr>
    <tr class="text-c">
        <td>市派</td>
        <td>科技特派员</td>
        <td>${cityTotalD.ckjtpy}</td>
    </tr >
    <tr class="text-c">
        <td>县派</td>
        <td>科技特派员</td>
        <td>${cityTotalD.xkjtpy}</td>
    </tr>

    <tr class="text-c">
        <td>省派</td>
        <td>农业辅导员</td>
        <td>${cityTotalD.snyfdy}</td>
    </tr>
    <tr class="text-c">
        <td>市派</td>
        <td>农业辅导员</td>
        <td>${cityTotalD.cnyfdy}</td>
    </tr >
    <tr class="text-c">
        <td>县派</td>
        <td>农业辅导员</td>
        <td>${cityTotalD.xnyfdy}</td>
    </tr>
    </tbody>
</table></div>
<div  id="report2" style="display: none;">区域人才:<table class="table table-border table-bordered table-hover table-bg" >
    <thead class="text-c">
    <tr>
        <th>区域</th>
        <th>科技副职</th>
        <th>科技特派员</th>
        <th>农业辅导员</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${regionD}" var="reg">
        <tr class="text-c">
            <td>${reg.regionname}</td>
            <td>${reg.kjfz}</td>
            <td>${reg.kjtpy}</td>
            <td>${reg.nyfdy}</td>
        </tr>
    </c:forEach>

    </tbody>
</table></div>

<div id="container" style="min-width:700px;height:400px;"class="highcharts-data-label" ></div>

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
                    '科技副职',
                    '科技特派员',
                    '农业辅导员'
                ]

            },
            yAxis: {
                min: 0,
                title: {
                    text: '单位(人)'
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
                name: '省派',
                data: [${cityTotalD.skjfz}, ${cityTotalD.skjtpy}, ${cityTotalD.snyfdy}]

            }, {
                name: '市派',
                data: [${cityTotalD.ckjfz}, ${cityTotalD.ckjtpy}, ${cityTotalD.cnyfdy}]

            }, {
                name: '县派',
                data: [${cityTotalD.xkjfz}, ${cityTotalD.xkjtpy}, ${cityTotalD.xnyfdy}]

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
                    text: '单位(人)'
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
                name: '科技副职',
                data: [
                    <c:forEach items="${regionD}" var="reg">
                        ${reg.kjfz},
                    </c:forEach>
                ]

            }, {
                name: '科技特派员',
                data: [
                    <c:forEach items="${regionD}" var="reg">
                    ${reg.kjtpy},
                    </c:forEach>
                ]

            }, {
                name: '农业辅助员',
                data: [
                    <c:forEach items="${regionD}" var="reg">
                    ${reg.nyfdy},
                    </c:forEach>
                ]

            }]
        });
    });
    // window.onload=function () {
    //     var b1=document.getElementById("b1");
    //     var b2=document.getElementById("b2");
    //     var c1=document.getElementById("container1");
    //     var c2=document.getElementById("container2");
    //     var r1=document.getElementById("report1");
    //     var r1=document.getElementById("report2");
    //
    //     b1.onclick=function(){
    //     c1.style.display="block";
    //     c2.style.display="block";
    //     r1.style.display="none";
    //     r1.style.display="none";
    // }
    //     b2.onclick=function() {
    //         c1.style.display = "none";
    //         c2.style.display = "none";
    //         r1.style.display = "block";
    //         r1.style.display = "block";
    //     }
    // }

</script>
</body>
</html>