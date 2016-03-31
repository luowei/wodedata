<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../common/head.jsp" %>


<body>

<div id="wrapper">
    <%@ include file="../../common/nav.jsp" %>
    <div id="page-wrapper" style="min-height: 243px;">
        <div class="modal  fade" id="modal-delete" tabindex="-1"
             role="dialog">
            <div class="modal-dialog modal-danger modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="modal-header">
                            确定要删除？
                        </div>
                    </div>
                    <div class="modal-body">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">取消
                        </button>
                        <button type="button" class="btn btn-danger btn-sure">删除</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="margin-top: 30px">
                <%@ include file="../../common/msg.jsp" %>
                <div class="panel panel-info">
                    <div class="panel-heading">文件列表</div>

                    <div class="panel-body">
                        <ul class="nav nav-tabs">
                            <li role="presentation" class="active"><a href="#list"
                                                                      aria-controls="list" role="tab" data-toggle="tab">列表</a>
                            </li>
                            <li class=""><a href="#upload" aria-controls="upload"
                                            role="tab" data-toggle="tab">上传文件</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="list">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>文件名</th>
                                            <th>类型</th>
                                            <th>大小</th>
                                            <th>综略图</th>
                                            <%--<th>url</th>--%>
                                            <th>key</th>
                                            <th>hash码</th>
                                            <th>创建时间</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${files}" var="file">
                                            <tr>
                                                <td>${file.id}</td>
                                                <td>${file.name}
                                                        <%--<c:choose>--%>
                                                        <%--<c:when test="${fn:length(topic.title) > 2}">--%>
                                                        <%--<c:out value="${fn:substring(topic.title, 0, 20)}" /> . . .--%>
                                                        <%--</c:when>--%>
                                                        <%--<c:otherwise>--%>
                                                        <%--<c:out value="${topic.title}" />--%>
                                                        <%--</c:otherwise>--%>
                                                        <%--</c:choose>--%>
                                                </td>
                                                <td>
                                                        ${file.type}
                                                        <%--${fn:substring(topic.user.nick, 0, 100)}--%>
                                                </td>
                                                <td>
                                                        ${file.size/1000}KB
                                                        <%--<fmt:formatDate value="${topic.createAt}" type="both"/>--%>
                                                </td>
                                                <td>
                                                    <a href="${file.url}" class="thumbnail" target="_blank">
                                                        <img src="${file.url}">
                                                    </a>
                                                </td>
                                                    <%--<td><a class="label label-success" href="${file.url}" target="_blank">--%>
                                                    <%--${file.url}--%>
                                                    <%--<%--<c:choose>--%>--%>
                                                    <%--<%--<c:when test="${fn:length(file.url) > 2}">--%>--%>
                                                    <%--<%--<c:out value="${fn:substring(file.url, 0, 100)}"/> . . .--%>--%>
                                                    <%--<%--</c:when>--%>--%>
                                                    <%--<%--<c:otherwise>--%>--%>
                                                    <%--<%--<c:out value="${file.url}"/>--%>--%>
                                                    <%--<%--</c:otherwise>--%>--%>
                                                    <%--<%--</c:choose>--%>--%>
                                                    <%--</a>--%>
                                                    <%--</td>--%>
                                                <td><span class="label label-default">${file.key}</span></td>
                                                <td><span class="label label-default">${file.hash}</span></td>
                                                <td><span class="label label-default"><fmt:formatDate
                                                        value="${file.createAt}" pattern="yyyy-MM-dd HH:mm:ss"
                                                        type="both"/></span></td>
                                                <td>
                                                        <%--<a class="btn btn-info btn-xs" href="${x}/back/content/file/${file.id}/edit" target="_blank">编辑</a>--%>
                                                    <button class="btn btn-danger btn-xs btn-delete"
                                                            data-url="${x}/back/content/upfile/${file.id}/delete">删除
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>

                            <div role="tabpanel" class="tab-pane" id="upload">

                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <form action="/upload-target" class="dropzone"></form>
                                        <div class="media">
                                            <div class="media-body">
                                                <img alt="" src="" style="max-height: 640px; width: auto"
                                                     id="file-preview">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer container-fluid">
                                        <div class="row-fluid">

                                            <div class="label label-default col-md-1">分类
                                                <select id="section" name="section" class="input">
                                                    <option value="" selected="selected"> -- -- </option>
                                                </select>
                                            </div>
                                            <div class="label label-default col-md-1 col-md-offset-1">结点
                                                <select id="node" name="node" class="input">
                                                    <option value="" selected="selected"> -- -- </option>
                                                </select>
                                            </div>
                                            <div class="label label-default col-md-1 col-md-offset-1">话题
                                                <select id="topic" name="topic" class="input">
                                                    <option value="" selected="selected"> -- -- </option>
                                                </select>
                                            </div>
                                            <div class="col-md-1 col-md-offset-6">
                                                <button type="button" class="btn btn-info" id="btn-upload">上传</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                    <div class="panel-footer">
                        <%@ include file="/WEB-INF/jsp/common/pagination.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->

</div>
<script src="${x}/js/bootstrap.min.js"></script>
<script src="${x}/js/metisMenu.min.js"></script>
<script src="${x}/js/sb-admin-2.js"></script>
<script src="//cdn.bootcss.com/dropzone/4.2.0/min/dropzone.min.js"></script>
<script type="text/javascript">
    $(".btn-delete").on("click", function (e) {
        var url = $(this).attr("data-url");
        $("#modal-delete").modal('show');
        $(".btn-sure").on("click", function (e) {
            location.href = url;
        })
    })


</script>
</body>
</html>