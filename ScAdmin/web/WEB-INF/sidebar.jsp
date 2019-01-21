<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-01-03
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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


            <!--<li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard text-aqua"></i> <span>工作台</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="<%=ctxPath%>/AdminLTE-2.4.5/index.html"> </a></li>
                <li><a href="<%=ctxPath%>/AdminLTE-2.4.5/index2.html"> 人才管理</a></li>
                <li><a href="<%=ctxPath%>/AdminLTE-2.4.5/index2.html"> </a></li>
                <li><a href="<%=ctxPath%>/AdminLTE-2.4.5/index2.html"> </a></li>
                <li><a href="<%=ctxPath%>/AdminLTE-2.4.5/index2.html"> </a></li>
              </ul>
            </li>-->

            <li>
                <a href="<%=ctxPath %>/Studio?action=departmentList">
                    <i class="fa fa-building-o text-light-blue"></i> <span>单位部门管理</span>
                    <!--<span class="pull-right-container">
                      <small class="label pull-right bg-green">new</small>
                    </span>-->
                </a>
            </li>

            <li>
                <a href="<%=ctxPath %>/Studio?action=abilityPageData&regionId=${regionId}&audit=0&pageIndex=1&pageSize=15">
                    <i class="fa fa-black-tie text-red"></i> <span>人才管理</span>
                    <!--<span class="pull-right-container">
                      <small class="label pull-right bg-green">new</small>
                    </span>-->
                </a>
            </li>

            <li>
                <a href="<%=ctxPath %>/Studio?action=demandList&tid=01">
                    <i class="fa fa-exchange text-bold"></i> <span>技术需求管理</span>
                    <!--<span class="pull-right-container">
                      <small class="label pull-right bg-green">new</small>
                    </span>-->
                </a>
            </li>

            <li>
                <a href="<%=ctxPath %>/Studio?action=phmacPageData&fid=${regionId}&presult=0&pageIndex=1&pageSize=15">
                    <i class="fa fa-television text-green"></i> <span>登陆设备管理</span>
                    <!--<span class="pull-right-container">
                      <small class="label pull-right bg-green">new</small>
                    </span>-->
                </a>
            </li>

            <li>
                <a href="<%=ctxPath %>/Studio?action=newsList&readType=0&pageIndex=1">
                    <i class="fa fa-bullhorn text-orange"></i> <span>通知公告</span>
                    <!--<span class="pull-right-container">
                      <small class="label pull-right bg-green">new</small>
                    </span>-->
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


            <!--<li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>Layout Options</span>
                <span class="pull-right-container">
                  <span class="label label-primary pull-right">4</span>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                <li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                <li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                <li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
              </ul>
            </li>-->
            <li>
                <a href="<%=ctxPath%>/Work?action=workList&pageIndex=1">
                    <i class="fa fa-thumbs-up text-green"></i> <span>工作动态</span>
                    <!--<span class="pull-right-container">
                      <small class="label pull-right bg-green">new</small>
                    </span>-->
                </a>
            </li>

            <li>
                <a href="<%=ctxPath%>/Manage?action=manageList&region1=0&region2=0&region3=0">
                    <i class="fa fa-users text-light-blue"></i> <span>人才信息</span>
                    <!--<span class="pull-right-container">
                      <small class="label pull-right bg-green">new</small>
                    </span>-->
                </a>
            </li>






            <!--<li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Charts</span>
                <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
                <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>UI Elements</span>
                <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>Forms</span>
                <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="../forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
                <li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
                <li><a href="../forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
              </ul>
            </li>
            <li class="treeview active">
              <a href="#">
                <i class="fa fa-table"></i> <span>Tables</span>
                <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                <li class="active"><a href="data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
              </ul>
            </li>
            <li>
              <a href="../calendar.html">
                <i class="fa fa-calendar"></i> <span>Calendar</span>
                <span class="pull-right-container">
                  <small class="label pull-right bg-red">3</small>
                  <small class="label pull-right bg-blue">17</small>
                </span>
              </a>
            </li>
            <li>
              <a href="../mailbox/mailbox.html">
                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                <span class="pull-right-container">
                  <small class="label pull-right bg-yellow">12</small>
                  <small class="label pull-right bg-green">16</small>
                  <small class="label pull-right bg-red">5</small>
                </span>
              </a>
            </li>


            <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>-->
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>