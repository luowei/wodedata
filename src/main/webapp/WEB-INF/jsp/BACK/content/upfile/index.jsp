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
                                                        <img src="${file.url}" style="width:40px;height:40px;">
                                                    </a>
                                                </td>
                                                    <%--<td><a class="label label-success" href="${file.url}" target="_blank">--%>
                                                    <%--${file.url}--%>
                                                    <%--<c:choose>--%>
                                                    <%--<c:when test="${fn:length(file.url) > 2}">--%>
                                                    <%--<c:out value="${fn:substring(file.url, 0, 100)}"/> . . .--%>
                                                    <%--</c:when>--%>
                                                    <%--<c:otherwise>--%>
                                                    <%--<c:out value="${file.url}"/>--%>
                                                    <%--</c:otherwise>--%>
                                                    <%--</c:choose>--%>
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
                                    <div class="panel-footer container-fluid">
                                        <div class="row-fluid">

                                            <div class="col-md-2">
                                                <div class="input-group">
                                                    <span class="input-group-addon">分类</span>
                                                    <select id="section" name="section" class="form-control"
                                                            onchange="appendAllNodes($(this).val())">
                                                        <option value="" selected="selected"> -- --</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="input-group">
                                                    <span class="input-group-addon">结点</span>
                                                    <select id="node" name="node" class=" form-control"
                                                            onchange="appendAllTopics($(this).val())">
                                                        <option value="" selected="selected"> -- --</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="input-group">
                                                    <span class="input-group-addon">话题</span>
                                                    <select id="topic" name="topic" class="form-control">
                                                        <option value="" selected="selected"> -- --</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-1 col-md-offset-5 text-center">
                                                <button type="button" class="btn btn-info" id="btn-upload">上传
                                                </button>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="panel-body">
                                        <form action="${x}/back/content/upfile/uploadForm" class="dropzone"></form>
                                        <div class="media">
                                            <div class="media-body">
                                                <img alt="" src="" style="max-height: 640px; width: auto"
                                                     id="file-preview">
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


    //append对应的话题
    var appendAllTopics = function (id) {
        //append section option
        $.ajax({
            url: "${x}/back/content/topics/" + id + "/getAllTopic",
            dataType: "json",
            cache: true,
            success: function (list) {
                $('#topic').find('option:gt(0)').remove();
                $.each(list, function (i, item) {
                    $('#topic').append($('<option>', {
                        value: item.id,
                        text: item.title
                    }));
                })
            }
        })

    };


    //append对应的结点
    var appendAllNodes = function (id) {
        //append section option
        $.ajax({
            url: "${x}/back/content/nodes/" + id + "/getAllNode",
            dataType: "json",
            cache: true,
            success: function (list) {
                $('#topic').find('option:gt(0)').remove();
                $('#node').find('option:gt(0)').remove();
                $.each(list, function (i, item) {
                    $('#node').append($('<option>', {
                        value: item.id,
                        text: item.name
                    }));
                })
            }
        })

    };

    //页面加载完成就执行
    $(function () {
        //append section option
        $.ajax({
            url: "${x}/back/content/sections/getAllSection",
            dataType: "json",
            cache: true,
            success: function (list) {
                $('#section').find('option:gt(0)').remove();
                $.each(list, function (i, item) {
                    $('#section').append($('<option>', {
                        value: item.id,
                        text: item.name
                    }));
                })
            }
        })

    });

    Dropzone.options.dropzone = {
        autoProcessQueue: false,
        url: "${x}/upload",
        addRemoveLinks: true,
        dictRemoveLinks: "x",
        dictCancelUpload: "x",
        maxFiles: 10,
        maxFilesize: 51200,
        acceptedFiles: "audio/*,image/*,video/*,.psd,.pdf", //".jpg,.jpeg,.png,.gif,.psd,.pdf,.mp3,.wma,.mp4,.ogg,.mov.avi"
        init: function () {
            var submitButton = document.querySelector("#btn-upload");
            dropzone = this; // closure

            submitButton.addEventListener("click", function () {
                dropzone.processQueue(); // Tell Dropzone to process all queued file.
            });
            this.on("success", function (file, response) {

                var jsonData = JSON.stringify({name:file.name,type:file.type,size:file.size,key:response.key,url:response.url,hash:response.hash});
                //保存上传的文件信息
                $.ajax({
                    url: '${x}/saveFileInfo',
                    type: "post",
                    data: jsonData,
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (dat) {
                        console.log(dat);
                    }
                });


            });
            this.on("addedfile", function () {
                console.log("add!");
            });
            this.on('drop', function(file) {
//                alert('file');
            });
        }

    };

</script>
</body>
</html>