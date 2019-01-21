<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-01-07
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>科技人才联乡帮村</title>

    <%@include file="/WEB-INF/headerLte.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="/WEB-INF/navbar.jsp"%>
    <%--sidebar start--%>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <%--<div class="user-panel">
                <div class="pull-left image">
                    <img src="<%=ctxPath%>/AdminLTE-2.4.5/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Alexander Pierce</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>--%>

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">工作台</li>
                <li>
                    <a href="<%=ctxPath %>/Studio?action=departmentList">
                        <i class="fa fa-building-o text-light-blue"></i> <span>单位部门管理</span>
                    </a>
                </li>

                <li>
                    <a href="<%=ctxPath %>/Studio?action=abilityPageData&regionId=${regionId}&audit=0&pageIndex=1&pageSize=15">
                        <i class="fa fa-black-tie text-red"></i> <span>人才管理</span>
                    </a>
                </li>

                <li>
                    <a href="<%=ctxPath %>/Studio?action=demandList&tid=01">
                        <i class="fa fa-exchange text-bold"></i> <span>技术需求管理</span>
                    </a>
                </li>

                <li>
                    <a href="<%=ctxPath %>/Studio?action=phmacPageData&fid=${regionId}&presult=0&pageIndex=1&pageSize=15">
                        <i class="fa fa-television text-green"></i> <span>登陆设备管理</span>
                    </a>
                </li>

                <li>
                    <a href="<%=ctxPath %>/Studio?action=newsList&readType=0&pageIndex=1">
                        <i class="fa fa-bullhorn text-orange"></i> <span>通知公告</span>
                    </a>
                </li>

                <li class="header">工作信息</li>
                <li class="treeview active">
                    <a href="#">
                        <i class="fa fa-bar-chart text-aqua"></i> <span>人才统计</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li  class="active"><a href="<%=ctxPath%>/Stat?action=scienceStat"><i class="fa fa-circle-o text-blue"></i> 科技人才联乡帮村</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=createStat"><i class="fa fa-circle-o text-orange"></i> 领创项目示范引领</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=localStat"><i class="fa fa-circle-o text-green"></i> 乡土人才扶贫带富</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=returnStat"><i class="fa fa-circle-o text-gray"></i> 情系毕节人才回归</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=dreamStat"><i class="fa fa-circle-o text-red"></i> 圆梦小康专家行动</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=cadreStat"><i class="fa fa-circle-o text-aqua"></i> 驻村干部</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-pie-chart text-orange"></i> <span>统计分析</span>
                        <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<%=ctxPath%>/Stat?action=areaStat"><i class="fa fa-circle-o text-green"></i> 区域人才数量</a></li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-circle-o text-orange"></i> 人才类型数量
                                <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<%=ctxPath%>/Stat?action=typeStat&type=kjfz"><i class="fa fa-circle-o text-green"></i> 科技副职</a></li>
                                <li><a href="<%=ctxPath%>/Stat?action=typeStat&type=kjtpy"><i class="fa fa-circle-o text-gray"></i> 科技特派员</a></li>
                                <li><a href="<%=ctxPath%>/Stat?action=typeStat&type=nyfdy"><i class="fa fa-circle-o text-aqua"></i> 农业辅导员</a></li>
                                <li><a href="<%=ctxPath%>/Stat?action=typeStat&type=zcgb"><i class="fa fa-circle-o text-orange"></i> 驻村干部</a></li>
                                <li><a href="<%=ctxPath%>/Stat?action=typeStat&type=lbcbry"><i class="fa fa-circle-o text-blue"></i> 领办创办人员</a></li>
                                <li><a href="<%=ctxPath%>/Stat?action=typeStat&type=hxcy"><i class="fa fa-circle-o text-danger"></i> 回乡创业</a></li>
                                <li><a href="<%=ctxPath%>/Stat?action=typeStat&type=xtrc"><i class="fa fa-circle-o text-primary"></i> 乡土人才</a></li>
                            </ul>
                        </li>
                        <li><a href="<%=ctxPath%>/Stat?action=proStat"><i class="fa fa-circle-o text-green"></i> 专家组成员</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=logStat"><i class="fa fa-circle-o text-gray"></i> 日志数量</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=trainTypeStat"><i class="fa fa-circle-o text-blue"></i> 培训类型</a></li>
                    </ul>
                </li>
                <li>
                    <a href="<%=ctxPath%>/Work?action=workList&pageIndex=1">
                        <i class="fa fa-thumbs-up text-green"></i> <span>工作动态</span>
                    </a>
                </li>

                <li>
                    <a href="<%=ctxPath%>/Manage?action=manageList&region1=0&region2=0&region3=0">
                        <i class="fa fa-users text-light-blue"></i> <span>人才信息</span>
                    </a>
                </li>
            </ul>
        </section>
    </aside>
    <%--sidebar end--%>




    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                人才统计
                <small>科技人才联乡帮村</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">科技人才联乡帮村</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->

            <div class="row">
            </div>
            <!-- /.row -->


            <!-- Main row -->
            <div class="row">

                <!-- Left col -->
                <section class="col-lg-4 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->

                    <!-- BAR CHART -->
                    <div class="box box-danger">

                        <div class="box-header">
                            <div class="box-header with-border">
                                <h3 class="box-title">省级</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="box-body" style="height: 385px">
                            <div class="chart">
                                <canvas id="areaChart" style="height:365px"></canvas>
                            </div>
                            <!-- /.box-body -->
                        </div>

                        <div class="box-footer no-border">
                            <div class="row">
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-max="${cityTotalD.skjfz + cityTotalD.skjtpy + cityTotalD.snyfdy}" data-readonly="true" value="${cityTotalD.skjfz}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">
                                    <div class="knob-label">科技副职</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-max="${cityTotalD.skjfz + cityTotalD.skjtpy + cityTotalD.snyfdy}" data-readonly="true" data-readonly="true" value="${cityTotalD.skjtpy}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">
                                    <div class="knob-label">科技特派员</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center">
                                    <input type="text" class="knob" data-max="${cityTotalD.skjfz + cityTotalD.skjtpy + cityTotalD.snyfdy}" data-readonly="true" data-readonly="true" value="${cityTotalD.snyfdy}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">
                                    <div class="knob-label">农业辅导员</div>
                                </div>
                                <!-- ./col -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->





                </section>
                <!-- /.Left col -->




                <section class="col-lg-4 connectedSortable">

                    <!-- DONUT CHART -->
                    <div class="box box-primary">

                        <div class="box-header">
                            <div class="box-header with-border">
                                <h3 class="box-title">市级</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="box-body" style="height: 385px">
                            <div class="chart">
                                <canvas id="pieChart" style="height:365px"></canvas>
                            </div>
                            <!-- /.box-body -->
                        </div>

                        <div class="box-footer no-border">
                            <div class="row">
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-max="${cityTotalD.ckjfz + cityTotalD.ckjtpy + cityTotalD.cnyfdy}" data-readonly="true" value="${cityTotalD.ckjfz}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">

                                    <div class="knob-label">科技副职</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-max="${cityTotalD.ckjfz + cityTotalD.ckjtpy + cityTotalD.cnyfdy}" data-readonly="true" value="${cityTotalD.ckjtpy}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">

                                    <div class="knob-label">科技特派员</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center">
                                    <input type="text" class="knob" data-max="${cityTotalD.ckjfz + cityTotalD.ckjtpy + cityTotalD.cnyfdy}" data-readonly="true" value="${cityTotalD.cnyfdy}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">

                                    <div class="knob-label">农业辅导员</div>
                                </div>
                                <!-- ./col -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->
                </section>



                <!-- right col (We are only adding the ID to make the widgets sortable)-->
                <section class="col-lg-4 connectedSortable">
                    <!-- solid sales graph -->
                    <div class="box box-success">
                        <div class="box-header">
                            <div class="box-header with-border">
                                <h3 class="box-title">县级</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="box-body" style="height: 385px">
                            <div class="chart">
                                <canvas id="barChart" style="height:365px"></canvas>
                                <%--<canvas id="areaChart" style="height:250px"></canvas>--%>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer no-border">
                            <div class="row">
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-max="${cityTotalD.xkjfz + cityTotalD.xkjtpy + cityTotalD.xnyfdy}" data-readonly="true" value="${cityTotalD.xkjfz}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">

                                    <div class="knob-label">科技副职</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-max="${cityTotalD.xkjfz + cityTotalD.xkjtpy + cityTotalD.xnyfdy}" data-readonly="true" value="${cityTotalD.xkjtpy}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">

                                    <div class="knob-label">科技特派员</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center">
                                    <input type="text" class="knob" data-max="${cityTotalD.xkjfz + cityTotalD.xkjtpy + cityTotalD.xnyfdy}" data-readonly="true" value="${cityTotalD.xnyfdy}" data-width="60" data-height="60"
                                           data-fgColor="#39CCCC">

                                    <div class="knob-label">农业辅导员</div>
                                </div>
                                <!-- ./col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->
                </section>
                <!-- right col -->
            </div>
            <!-- /.row (main row) -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <<%--footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.4.0
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
        reserved.
    </footer>--%>

    <!-- Control Sidebar -->
    <%@include file="/WEB-INF/ControlSidebar.jsp"%>
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->



<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);

    $(function () {
        /* ChartJS
         * -------
         * Here we will create a few charts using ChartJS
         */

        //--------------
        //- AREA CHART -
        //--------------

        // Get context with jQuery - using jQuery's .get() method.
        var areaChartCanvas = $('#areaChart').get(0).getContext('2d')
        // This will get the first returned node in the jQuery collection.
        var areaChart       = new Chart(areaChartCanvas)

        var areaChartData = [
            {
                value    : ${cityTotalD.skjfz},
                color    : '#f56954',
                highlight: '#f56954',
                label    : '科技副职'
            },
            {
                value    : ${cityTotalD.skjtpy},
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : '科技特派员'
            },
            {
                value    : ${cityTotalD.snyfdy},
                color    : '#00c0ef',
                highlight: '#00c0ef',
                label    : '农业辅导员'
            },

        ]

        var areaChartOptions = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke    : true,
            //String - The colour of each segment stroke
            segmentStrokeColor   : '#fff',
            //Number - The width of each segment stroke
            segmentStrokeWidth   : 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps       : 100,
            //String - Animation easing effect
            animationEasing      : 'easeOutBounce',
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate        : true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale         : false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive           : true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio  : true,
            //String - A legend template
        }

        //Create the line chart
        areaChart.Doughnut(areaChartData, areaChartOptions)


        //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        var pieChart       = new Chart(pieChartCanvas)
        var PieData        = [
            {
                value    : ${cityTotalD.ckjfz},
                color    : '#f56954',
                highlight: '#f56954',
                label    : '科技副职'
            },
            {
                value    : ${cityTotalD.ckjtpy},
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : '科技特派员'
            },
            {
                value    : ${cityTotalD.cnyfdy},
                color    : '#00c0ef',
                highlight: '#00c0ef',
                label    : '农业辅导员'
            },

        ]
        var pieOptions     = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke    : true,
            //String - The colour of each segment stroke
            segmentStrokeColor   : '#fff',
            //Number - The width of each segment stroke
            segmentStrokeWidth   : 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps       : 100,
            //String - Animation easing effect
            animationEasing      : 'easeOutBounce',
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate        : true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale         : false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive           : true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio  : true,
            //String - A legend template
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart.Doughnut(PieData, pieOptions)




        //-------------
        //- BAR CHART -
        //-------------
        var barChartCanvas                   = $('#barChart').get(0).getContext('2d')
        var barChart                         = new Chart(barChartCanvas)
        var barChartData                     = [
            {
                value    : ${cityTotalD.xkjfz},
                color    : '#f56954',
                highlight: '#f56954',
                label    : '科技副职'
            },
            {
                value    : ${cityTotalD.xkjtpy},
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : '科技特派员'
            },
            {
                value    : ${cityTotalD.xnyfdy},
                color    : '#00c0ef',
                highlight: '#00c0ef',
                label    : '农业辅导员'
            },
        ]

        var barChartOptions                  = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke    : true,
            //String - The colour of each segment stroke
            segmentStrokeColor   : '#fff',
            //Number - The width of each segment stroke
            segmentStrokeWidth   : 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps       : 100,
            //String - Animation easing effect
            animationEasing      : 'easeOutBounce',
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate        : true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale         : false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive           : true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio  : true,
            //String - A legend template
        }

        barChart.Doughnut(barChartData, barChartOptions)

    })
</script>





</body>
</html>

