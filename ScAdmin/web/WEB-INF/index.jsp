<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-8
  Time: 下午4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>admin</title>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="<%=ctxPath%>/Index?action=index">    admin</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="<%=ctxPath%>/Index?action=index">admin</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs"></span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>

            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li><a href="#">毕节市</a></li>
                </ul>
            </nav>

            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>超级管理员</li>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
                            <li><a href="#">切换账户</a></li>
                            <li><a href="#">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-msg"> <a href="javascript:void(0);" onclick="product_add('通知公告','<%=ctxPath %>/Studio?action=newsList&readType=1&pageIndex=1')" title="消息"><span class="badge badge-danger">${newsNum}</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 工作台<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<%=ctxPath %>/Studio?action=departmentList" data-title="单位部门管理" href="javascript:void(0)">单位部门管理</a></li>
                    <li><a data-href="<%=ctxPath %>/Studio?action=abilityPageData&regionId=${regionId}&audit=0&pageIndex=1&pageSize=15" data-title="人才管理" href="javascript:void(0)">人才管理</a></li>
                    <li><a data-href="<%=ctxPath %>/Studio?action=demandList&tid=01" data-title="技术需求管理" href="javascript:void(0)">技术需求管理</a></li>
                    <li><a data-href="<%=ctxPath %>/Studio?action=phmacPageData&fid=${regionId}&presult=0&pageIndex=1&pageSize=15" data-title="登录设备管理" href="javascript:void(0)">登录设备管理</a></li>
                    <li><a data-href="<%=ctxPath %>/Studio?action=newsList&readType=0&pageIndex=1" data-title="通知通告" href="javascript:void(0)">通知通告</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 人才统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<%=ctxPath%>/Stat?action=scienceStat" data-title="科技人才联乡帮村" href="javascript:void(0)">科技人才联乡帮村</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=createStat" data-title="领创项目示范引领" href="javascript:void(0)">领创项目示范引领</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=localStat" data-title="乡土人才扶贫带富" href="javascript:void(0)">乡土人才扶贫带富</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=returnStat" data-title="情系毕节人才回归" href="javascript:void(0)">情系毕节人才回归</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=dreamStat" data-title="圆梦小康专家行动" href="javascript:void(0)">圆梦小康专家行动</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=cadreStat" data-title="驻村干部" href="javascript:void(0)">驻村干部</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe61a;</i> 统计分析<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <%--<li><a data-href="<%=ctxPath%>/Stat?action=statIndex" data-title="人才统计" href="javascript:void(0)">数据分析</a></li>--%>
                    <li><a data-href="<%=ctxPath%>/Stat?action=areaStat" data-title="区域人才数量" href="javascript:void(0)">区域人才数量</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=typeStat" data-title="分类管理" href="javascript:void(0)">人才类型数量</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=proStat" data-title="专家组成员" href="javascript:void(0)">专家组成员</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=logStat" data-title="日志数量" href="javascript:void(0)">日志数量</a></li>
                    <li><a data-href="<%=ctxPath%>/Stat?action=trainTypeStat" data-title="培训类型" href="javascript:void(0)">培训类型</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe622;</i> 工作动态<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<%=ctxPath%>/Work?action=workList&pageIndex=1" data-title="工作动态" href="javascript:;">工作动态</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 人才管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<%=ctxPath%>/Manage?action=manageList&region1=0&region2=0&region3=0" data-title="人才管理" href="javascript:;">人才管理</a></li>
                </ul>
            </dd>
        </dl>

        <%--<dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="system-base.html" data-title="系统设置" href="javascript:void(0)">系统设置</a></li>
                    <li><a data-href="system-category.html" data-title="栏目管理" href="javascript:void(0)">栏目管理</a></li>
                    <li><a data-href="system-data.html" data-title="数据字典" href="javascript:void(0)">数据字典</a></li>
                    <li><a data-href="system-shielding.html" data-title="屏蔽词" href="javascript:void(0)">屏蔽词</a></li>
                    <li><a data-href="system-log.html" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
                </ul>
            </dd>
        </dl>--%>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="<%=ctxPath%>/Manage?action=manageList&region1=0&region2=0&region3=0">我的桌面</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="<%=ctxPath%>/Manage?action=manageList&region1=0&region2=0&region3=0"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>



<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
    $(function(){

    });
    /*个人信息*/
    function myselfinfo(){
        layer.open({
            type: 1,
            area: ['300px','200px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: '查看信息',
            content: '<div>管理员信息</div>'
        });
    }

    /*资讯-添加*/
    function article_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*产品-添加*/
    function product_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }


</script>
</body>
</html>
