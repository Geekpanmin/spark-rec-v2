<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../commons/taglibs.jsp" %>
<%@ include file="../commons/meta.jsp" %>
<html>
<head>
    <title>数据状态</title>
    <script src="${ctx}/static/js/echarts.min.js"></script>
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/css/sentiment/category.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/sentiment/Iframe.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css" type="text/css" media="screen"/>
</head>
<body>

<script type="text/javascript">
    setRowColor();

    //设置表格样式，改变index为偶数行的背景颜色
    function setRowColor() {
        $("tr:even").css("background-color", "#eff3f5");
    }

    //-----分页------
    //点击上一页，判断是否是第一页。currentpage是页面上显示的页数，从1 开始
    function prePage(currentPage) {
        window.location = "${ctx}/similar/getSimilarResData?pageNum=" + (currentPage - 1);
    }

    //点击下一页，判断是否是最后一页
    function nextPage(currentPage) {
        window.location = "${ctx}/similar/getSimilarResData?pageNum=" + (currentPage + 1);
    }

</script>
<div class="cp_title">数据状态</div>
<div class="table_con">

    <table>
        <tr class="tb_title">
            <td width="30%"><strong>用户</strong></td>
            <td width="30%"><strong>最相似用户</strong></td>
            <td width="40%"><strong>相似度</strong></td>
        </tr>
        <c:forEach items="${similarList}" var="similar">
            <tr>
                <td width="30%"><c:out value="${similar.userA}"/></td>
                <td width="30%"><c:out value="${similar.userB}"/></td>
                <td width="40%"><c:out value="${similar.similar}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
<div id="page_control">
    <span class="prePage" style="line-height: 21px;"><a href="javascript:void(0);" onclick="prePage(${pageNum})">上一页</a></span>
    <span class="s_space"></span>
    <span class="s_space"></span>
    第<span class="pageNo"><c:out value="${pageNum}"/></span>
    页/共<span class="totalPage"><fmt:formatNumber type="number" value="${totalPage}" maxFractionDigits="0"/></span>页
    <span class="s_space"></span>
    <span class="nextPage" style="line-height: 21px;"><a href="javascript:void(0);" onclick="nextPage(${pageNum})">下一页</a></span>
    <span class="s_space"></span>
</div>
</body>
</html>