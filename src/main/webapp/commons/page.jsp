<%@ page pageEncoding="UTF-8" %>
<%@ include file="inc.jsp" %>
<style>
    .p{
        font-size: 14px;
        display: inline-block;
        width: 45px;
        height: 45px;
        border-radius: 40px;
        letter-spacing: -0.38px;
        line-height: 45px;
        border: 1px solid #e2e2e2;
        color: #666666;
        text-align: center;
        -webkit-transition: all 0.25s ease;
        -moz-transition: all 0.25s ease;
        transition: all 0.25s ease;
    }
    .p:hover{
        text-decoration: none;
        background-color: #ffb661;
        color: #fff;
        border-color: #ffb661;
    }
    .active {
        color: #f00;
    }
</style>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script>
    $(function () {
        var form = $('#form');
        $('#submit').click(function () {
            form.attr('action', form.attr('action') + $('#page').val() + '.action');
            form.submit();
        });
        $('a.p').each(function () {
            if ($(this).text() == ${sessionScope.pagination.currentPage}) {
                $(this).addClass('active');
            } else {
                $(this).removeClass('active');
            }
        });
    });
</script>
<c:set var="p" value="${sessionScope.pagination}"/>
<c:choose>
    <c:when test="${p.totalRows eq 0}">
        <em>没有记录</em>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${p.currentPage eq 1}">
                首页
                上一页
            </c:when>
            <c:otherwise>
                <a class="p" href="${ctx}/${param.path}/1.action">首页</a>
                <a class="p" href="${ctx}/${param.path}/${p.currentPage - 1}.action"><i class="fa fa-chevron-left"></i></a>
            </c:otherwise>
        </c:choose>
        <c:if test="${p.currentPage < 7}">
            <c:if test="${p.totalPages <= 7}">
                <c:forEach var="page" begin="1" end="${p.totalPages}">
                    <a class="p" href="${ctx}/${param.path}/${page}.action">${page}</a>
                </c:forEach>
            </c:if>
            <c:if test="${p.totalPages > 7}">
                <c:forEach var="page" begin="1" end="7">
                    <a class="p" href="${ctx}/${param.path}/${page}.action">${page}</a>
                </c:forEach>
                ...
            </c:if>
        </c:if>
        <c:if test="${p.currentPage >= 7}">
            <a class="p" href="${ctx}/${param.path}/1.action">1</a>
            <a class="p" href="${ctx}/${param.path}/2.action">2</a>
            ...
            <a class="p"
               href="${ctx}/${param.path}/${p.currentPage-2}">${p.currentPage-2}.action</a>
            <a class="p"
               href="${ctx}/${param.path}/${p.currentPage-1}">${p.currentPage-1}.action</a>
            <a class="p"
               href="${ctx}/${param.path}/${p.currentPage}">${p.currentPage}.action</a>
            <c:if test="${p.totalPages - p.currentPage > 2}">
                <a class="p"
                   href="${ctx}/${param.path}/${p.currentPage+1}">${p.currentPage+1}.action</a>
                <a class="p"
                   href="${ctx}/${param.path}/${p.currentPage+2}">${p.currentPage+2}.action</a>
                ...
            </c:if>
            <c:if test="${p.totalPages - p.currentPage <= 2}">
                <c:forEach var="page" begin="${p.currentPage+1}"
                           end="${p.totalPages}">
                    <a class="p" href="${ctx}/${param.path}/${page}">${page}</a>
                </c:forEach>
            </c:if>
        </c:if>
        <c:choose>
            <c:when test="${p.currentPage eq p.totalPages}">
                下一页
                尾页
            </c:when>
            <c:otherwise>
                <a class="p" href="${ctx}/${param.path}/${p.currentPage + 1}.action"><i class="fa fa-chevron-right"></i></a>
                <a class="p" href="${ctx}/${param.path}/${p.totalPages}.action">尾页</a>
            </c:otherwise>
        </c:choose>
        共 ${p.totalPages} 页
        <form id="form" action="${ctx}/${param.path}/" method="post" style="display: inline-block">
            到第
            <select id="page">
                <c:forEach var="i" begin="1" end="${p.totalPages}">
                <option value="${i}">${i}
                    </c:forEach>
            </select>
            页
            <a id="submit" href="#">确定</a>
        </form>
    </c:otherwise>
</c:choose>