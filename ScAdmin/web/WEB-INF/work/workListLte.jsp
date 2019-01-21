<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-01-07
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="z" uri="http://www.js.com/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>工作动态</title>

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
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<%=ctxPath%>/AdminLTE-2.4.5/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Alexander Pierce</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

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
                        <li class="active"><a href="<%=ctxPath%>/Stat?action=cadreStat"><i class="fa fa-circle-o text-aqua"></i> 驻村干部</a></li>
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
                <li class="active">
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
            <div class="col-md-3"></div>
            <h1>
                工作动态
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">工作动态</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->

            <div class="row">
            </div>
            <!-- /.row -->


            <!-- Main row -->

            <c:forEach items="${workListDS}" var="work" varStatus="status">
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-3 connectedSortable"></section>
                    <section class="col-lg-6 connectedSortable">

                        <!-- Box Comment -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <div class="user-block">
                                    <img class="img-circle" src="${work.avatar}" alt="User Image">
                                    <span class="username"><a href="#">${work.name}</a></span>
                                    <span class="description">${work.rencai_type} - ${work.create_time}</span>
                                </div>
                                <!-- /.user-block -->
                                <div class="box-tools">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <c:forEach items="${work.do_ImageView}" var="img">
                                    <img style="margin: 10px" height="200px" class="" src="${img}" alt="Photo" onclick="member_show('图片查看','${img}',800,800)">
                                </c:forEach>


                                <p> ${work.work_content}</p>
                                <div>
                                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="color: lightskyblue"/>
                                        ${work.address}
                                </div>
                                <br/>
                                <c:if test="${work.dianzan_ed eq 'true'}">
                                    <button type="button" class="btn btn-default btn-xs" onclick="dianzan('<%=ctxPath%>/Work?action=dianzan&pid=${work.pid}&ptel=${work.ptel}&workid=${work.workid}')">
                                        <i class="fa fa-thumbs-o-up"></i>
                                        已点赞
                                    </button>
                                </c:if>
                                <c:if test="${work.dianzan_ed eq 'false'}">
                                    <button type="button" class="btn btn-default btn-xs" onclick="dianzan('<%=ctxPath%>/Work?action=dianzan&pid=${work.pid}&ptel=${work.ptel}&workid=${work.workid}')">
                                        <i class="fa fa-thumbs-o-up"></i>
                                        点赞
                                    </button>
                                </c:if>

                                <span class="pull-right text-muted">${work.dianzan} 赞 - ${work.comment} 评论</span>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer box-comments">

                                <c:forEach items="${comments[status.index].d}" var="comment">
                                    <c:if test="${comment.remark eq 'false'}">
                                        <a href="javascript:;" onclick="member_show('回复评论','<%=ctxPath%>/Work?action=commentAdd&name=${comment.pname}&workid=${comment.workid}&remark=1',0,600,500)">
                                                ${comment.pname}&nbsp;回复&nbsp;${comment.reservename}:${comment.content}<br>
                                        </a>
                                    </c:if>
                                    <c:if test="${comment.remark eq 'true'}">
                                        <a href="javascript:;" onclick="member_show('回复评论','<%=ctxPath%>/Work?action=commentAdd2&name=${comment.pname}&workid=${comment.workid}&remark=1',0,600,500)">
                                            &nbsp;&nbsp;&nbsp;${comment.pname}&nbsp;回复&nbsp;${comment.reservename}:${comment.content}<br>
                                        </a>
                                    </c:if>
                                </c:forEach>



                            </div>
                            <!-- /.box-footer -->
                            <div class="box-footer">
                                <button type="button" class="btn btn-block btn-primary" onclick="member_show('评论','<%=ctxPath%>/Work?action=commentAdd&reserver=${work.pid}&reservertel=${work.ptel}&workid=${work.workid}&remark=0',0,600,500)">评论</button>
                            </div>
                            <!-- /.box-footer -->
                        </div>
                        <!-- /.box -->

                    </section>
                    <!-- /.Left col -->
                </div>
                <!-- /.row (main row) -->
            </c:forEach>
            <div class="col-md-3"></div>
            <z:pager urlFormat="${ctxPath}/Work?action=workList&pageIndex={pageNum}" pageSize="10" totalCount="${totalCount }" currentPageNum="${pageNo }"/>
        </section>
        <!-- /.content -->
    </div>

    <%@include file="/WEB-INF/ControlSidebar.jsp"%>
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->



<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);

    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    function dianzan(url){

        $.ajax({
            type: 'POST',
            url: url,
            success: function(result){
                layer.msg('已点赞!',{icon:1,time:1000});
                //location.replace(location.href);
            },
            error:function(data) {
                console.log(data.msg);
            },
        });
    };

    $(function () {


    })
</script>





</body>
</html>

