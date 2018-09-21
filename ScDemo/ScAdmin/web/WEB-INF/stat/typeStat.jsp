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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页<span class="c-gray en">&gt;</span> 统计分析 <span class="c-gray en">&gt;</span> 人才类型数量<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container"><div class="f-14 c-error"/></div>
<div id="container" style="min-width:700px;height:400px;margin-top: 10%;" class="highcharts-data-label"></div>
    <div id="container2" style="min-width:700px;height:400px;margin-top: 10%;" class="highcharts-data-label"></div>
        <div id="container3" style="min-width:700px;height:400px;margin-top: 10%;" class="highcharts-data-label"></div>
            <div id="container4" style="min-width:700px;height:400px;margin-top: 10%;" class="highcharts-data-label"></div>

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
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '人才类型'
            },
            subtitle: {
                text: '单位(人/个)'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        // 通过 format 或 formatter 来格式化数据标签显示
                        //format: '值: {point.y} 占比 {point.percentage} %',
                        formatter: function() {
                            //this 为当前的点（扇区）对象，可以通过  console.log(this) 来查看详细信息
                            return '<span style="color: ' + this.point.color + '"> 值：' + this.y + '，占比' + this.percentage.toFixed(0) + '%</span>';
                        }
                    },
                    showInLegend: true  // 显示在图例中
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['科技副职',   ${cityTotal.kjfz}],
                    ['科技特派员',  ${cityTotal.kjtpy}],
                    {
                        name: '农业辅导员',
                        y: ${cityTotal.nyfdy},
                        sliced: true,
                        selected: true
                    },
                    ['重点学科、重点产业人才团队帮扶情况',${cityTotal.rctd}],
                    ['驻村干部', ${cityTotal.zcgb}],
                    ['领办创办人员',${cityTotal.lbcbry}],
                    ['回乡创业',${cityTotal.hxcy}],
                    ['乡土人才', ${cityTotal.xtrc}],
                    ['专家服务团',${cityTotal.zjfwt}],
                    ['医院',${cityTotal.hospital}],
                    ['学校', ${cityTotal.school}],
                    ['领办创办项目',${cityTotal.project}]
                ]
            }]
        });
    });

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
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '科技副职'
            },
            subtitle: {
                text: '单位(人)'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        // 通过 format 或 formatter 来格式化数据标签显示
                        //format: '值: {point.y} 占比 {point.percentage} %',
                        formatter: function() {
                            //this 为当前的点（扇区）对象，可以通过  console.log(this) 来查看详细信息
                            return '<span style="color: ' + this.point.color + '"> 值：' + this.y + '，占比' + this.percentage.toFixed(0) + '%</span>';
                        }
                    },
                    showInLegend: true  // 显示在图例中
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['省派科技副职',   ${cityTotal.skjfz}],
                    ['市派科技副职',  ${cityTotal.ckjfz}],
                    {
                        name: '县派科技副职',
                        y: ${cityTotal.xkjfz},
                        sliced: true,
                        selected: true
                    }
                ]
            }]
        });
    });
    $(function () {
        $('#container3').highcharts({
            lang: {
                printChart:"打印图表",
                downloadJPEG: "下载JPEG 图片" ,
                downloadPDF: "下载PDF文档"  ,
                downloadPNG: "下载PNG 图片"  ,
                downloadSVG: "下载SVG 矢量图" ,
                exportButtonTitle: "导出图片"
            },
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '科技特派员'
            },
            subtitle: {
                text: '单位(人)'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        // 通过 format 或 formatter 来格式化数据标签显示
                        //format: '值: {point.y} 占比 {point.percentage} %',
                        formatter: function() {
                            //this 为当前的点（扇区）对象，可以通过  console.log(this) 来查看详细信息
                            return '<span style="color: ' + this.point.color + '"> 值：' + this.y + '，占比' + this.percentage.toFixed(0) + '%</span>';
                        }
                    },
                    showInLegend: true  // 显示在图例中
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['省派科技特派员',   ${cityTotal.skjtpy}],
                    ['市派科技特派员',  ${cityTotal.ckjtpy}],
                    {
                        name: '县派科技特派员',
                        y: ${cityTotal.xkjtpy},
                        sliced: true,
                        selected: true
                    }
                ]
            }]
        });
    });
    $(function () {
        $('#container4').highcharts({
            lang: {
                printChart:"打印图表",
                downloadJPEG: "下载JPEG 图片" ,
                downloadPDF: "下载PDF文档"  ,
                downloadPNG: "下载PNG 图片"  ,
                downloadSVG: "下载SVG 矢量图" ,
                exportButtonTitle: "导出图片"
            },
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '农业辅导员'
            },
            subtitle: {
                text: '单位(人)'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        // 通过 format 或 formatter 来格式化数据标签显示
                        //format: '值: {point.y} 占比 {point.percentage} %',
                        formatter: function() {
                            //this 为当前的点（扇区）对象，可以通过  console.log(this) 来查看详细信息
                            return '<span style="color: ' + this.point.color + '"> 值：' + this.y + '，占比' + this.percentage.toFixed(0) + '%</span>';
                        }
                    },
                    showInLegend: true  // 显示在图例中
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['省派农业辅导员',   ${cityTotal.snyfdy}],
                    ['市派农业辅导员',  ${cityTotal.cnyfdy}],
                    {
                        name: '县派农业辅导员',
                        y: ${cityTotal.xnyfdy},
                        sliced: true,
                        selected: true
                    }
                ]
            }]
        });
    });
</script>
</body>
</html>