<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-01-07
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>人才类型数量</title>

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
           <%-- <div class="user-panel">
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
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-bar-chart text-aqua"></i> <span>人才统计</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<%=ctxPath%>/Stat?action=scienceStat"><i class="fa fa-circle-o text-blue"></i> 科技人才联乡帮村</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=createStat"><i class="fa fa-circle-o text-orange"></i> 领创项目示范引领</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=localStat"><i class="fa fa-circle-o text-green"></i> 乡土人才扶贫带富</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=returnStat"><i class="fa fa-circle-o text-gray"></i> 情系毕节人才回归</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=dreamStat"><i class="fa fa-circle-o text-red"></i> 圆梦小康专家行动</a></li>
                        <li><a href="<%=ctxPath%>/Stat?action=cadreStat"><i class="fa fa-circle-o text-aqua"></i> 驻村干部</a></li>
                    </ul>
                </li>

                <li class="treeview active">
                    <a href="#">
                        <i class="fa fa-pie-chart text-orange"></i> <span>统计分析</span>
                        <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<%=ctxPath%>/Stat?action=areaStat"><i class="fa fa-circle-o text-green"></i> 区域人才数量</a></li>
                        <li class="treeview active">
                            <a href="#"><i class="fa fa-circle-o text-orange"></i> 人才类型数量
                                <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="<%=ctxPath%>/Stat?action=typeStat&type=kjfz"><i class="fa fa-circle-o text-green"></i> 科技副职</a></li>
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
                统计分析
                <small>人才类型数量</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">人才类型数量</li>
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
                <section class="col-lg-12 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->

                    <!-- BAR CHART -->
                    <div class="box box-primary">

                        <div class="box-header">
                            <div class="box-header with-border">
                                <h3 class="box-title">科技副职</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="box-body" style="height: 385px">
                            <div class="col-md-6">
                                <div class="chart">
                                    <canvas id="barChart" style="height:365px"></canvas>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="chart">
                                    <canvas id="areaChart" style="height:365px"></canvas>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>

                        <div class="box-footer no-border">
                            <div class="row">


                                <div class="col-md-12">

                                    <div class="col-md-6">
                                        <div class="with-border">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div style="height: 20px;width: 20px; background-color: #f56954;float: left"></div>
                                                    <label>&nbsp;&nbsp;&nbsp;省科技副职(人)</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div style="height: 20px;width: 20px; background-color: #00a65a;float: left"></div>
                                                    <label>&nbsp;&nbsp;&nbsp;市科技副职(个)</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div style="height: 20px;width: 20px; background-color: #00c0ef;float: left"></div>
                                                    <label>&nbsp;&nbsp;&nbsp;县科技副职(个)</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="with-border">

                                        </div>
                                    </div>


                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th width="15%"></th>
                                                <th>省</th>
                                                <th>市</th>
                                                <th>县</th>

                                            </tr>
                                            <tr>
                                                <th >科技副职(人)</th>
                                                <%--<c:forEach items="${regionD}" var="reg">
                                                    <th>${reg.lbcbry}</th>
                                                </c:forEach>--%>
                                                <th>${cityTotal.skjfz}</th>
                                                <th>${cityTotal.ckjfz}</th>
                                                <th>${cityTotal.xkjfz}</th>
                                            </tr>

                                        </table>
                                        <br/>

                                        <table class="table table-bordered">

                                            <tr>
                                                <th></th>
                                                <c:forEach items="${regionD}" var="reg">
                                                    <th>${reg.regionname}</th>
                                                </c:forEach>

                                            </tr>
                                            <tr>
                                                <th width="15%">科技副职(个)</th>
                                                <c:forEach items="${regionD}" var="reg">
                                                    <th>${reg.kjfz}</th>
                                                </c:forEach>

                                            </tr>
                                        </table>
                                    </div>
                                    <!-- /.box-body -->




                                </div>
                                <!-- /.col -->

                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->
                </section>
                <!-- /.Left col -->









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

        //-------------
        //- BAR CHART -
        //-------------
        var barChartCanvas                   = $('#barChart').get(0).getContext('2d')
        var barChart                         = new Chart(barChartCanvas)
        var barChartData                     = [
            {
                value    : ${cityTotal.skjfz},
                color    : '#f56954',
                highlight: '#f56954',
                label    : '省科技副职'
            },
            {
                value    : ${cityTotal.ckjfz},
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : '市科技副职'
            },
            {
                value    : ${cityTotal.xkjfz},
                color    : '#00c0ef',
                highlight: '#00c0ef',
                label    : '县科技副职'
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



        //--------------
        //- AREA CHART -
        //--------------

        // Get context with jQuery - using jQuery's .get() method.
        var areaChartCanvas = $('#areaChart').get(0).getContext('2d')
        // This will get the first returned node in the jQuery collection.
        var areaChart       = new Chart(areaChartCanvas)

        var areaChartData = [
            {
                value    : ${regionD[0].kjfz},
                color    : '#f56954',
                highlight: '#f56954',
                label    : '${regionD[0].regionname}'
            },
            {
                value    : ${regionD[1].kjfz},
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : '${regionD[1].regionname}'
            },
            {
                value    : ${regionD[2].kjfz},
                color    : '#00c0ef',
                highlight: '#00c0ef',
                label    : '${regionD[2].regionname}'
            },
            {
                value    : ${regionD[3].kjfz},
                color    : '#efea4a',
                highlight: '#efea4a',
                label    : '${regionD[3].regionname}'
            },
            {
                value    : ${regionD[4].kjfz},
                color    : '#ef9cd9',
                highlight: '#ef9cd9',
                label    : '${regionD[4].regionname}'
            },
            {
                value    : ${regionD[5].kjfz},
                color    : '#0909ef',
                highlight: '#0909ef',
                label    : '${regionD[5].regionname}'
            },
            {
                value    : ${regionD[6].kjfz},
                color    : '#dfefe3',
                highlight: '#dfefe3',
                label    : '${regionD[6].regionname}'
            },
            {
                value    : ${regionD[7].kjfz},
                color    : '#ef771a',
                highlight: '#ef771a',
                label    : '${regionD[7].regionname}'
            },
            {
                value    : ${regionD[8].kjfz},
                color    : '#7700ef',
                highlight: '#7700ef',
                label    : '${regionD[8].regionname}'
            },
            {
                value    : ${regionD[9].kjfz},
                color    : '#ef0c00',
                highlight: '#ef0c00',
                label    : '${regionD[9].regionname}'
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

    })
</script>





</body>
</html>

