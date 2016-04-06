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
                            <li role="presentation" class="active">
                                <a href="#list" aria-controls="list" role="tab" data-toggle="tab">列表</a>
                            </li>
                            <li class="">
                                <a href="#upload" aria-controls="upload" role="tab" data-toggle="tab">上传文件</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="list">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>文件名</th>
                                            <th>综略图</th>
                                            <th>分类</th>
                                            <th>结点</th>
                                            <th>话题</th>
                                            <th>类型</th>
                                            <th>大小</th>
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
                                                <td>
                                                    <span class="label label-default">${file.name}</span>
                                                    <button name="copyBtn" class="btn btn-xs" data-clipboard-text="${file.url}">复制链接地址</button>
                                                </td>
                                                <td>
                                                    <div class="controls">
                                                        <c:if test="${fn:substring(file.type, 0, 5) eq 'audio'}">
                                                            <audio controls style="width: 80%;">
                                                                <source src="${file.url}">
                                                            </audio>
                                                        </c:if>
                                                        <%--<c:if test="${fn:substring(file.type, 0, 5) eq 'image'}"></c:if>--%>
                                                        <c:if test="${fn:substring(file.type, 0, 5) ne 'audio'}">
                                                            <a href="${file.url}" class="thumbnail" target="_blank">
                                                                <img src="${file.url}" style="width:40px;height:40px;">
                                                            </a>
                                                        </c:if>
                                                    </div>
                                                </td>
                                                <td><span class="label label-default">${file.section.name}</span></td>
                                                <td><span class="label label-default">${file.node.name}</span></td>
                                                <td><span class="label label-default">
                                                <c:choose>
                                                    <c:when test="${fn:length(file.topic.title) > 10}">
                                                        <c:out value="${fn:substring(file.topic.title, 0, 10)}"/> . . .
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="$${file.topic.title}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                                </span></td>
                                                <td>${file.type}</td>
                                                <td>${file.size/1000}KB</td>
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
                                            <%--<div class="col-md-1 col-md-offset-5 text-center">--%>
                                            <%--<button type="button" class="btn btn-info" id="btn-upload">上传--%>
                                            <%--</button>--%>
                                            <%--</div>--%>
                                            <div id="actions" class="col-lg-6 text-center">
                                                <!-- The fileinput-button span is used to style the file input field as button -->
                                                <span class="btn btn-success fileinput-button dz-clickable">
                                                    <i class="glyphicon glyphicon-plus"></i>
                                                    <span>添加文件</span>
                                                </span>
                                                <button type="submit" class="btn btn-primary start">
                                                    <i class="glyphicon glyphicon-upload"></i>
                                                    <span>开始上传</span>
                                                </button>
                                                <button type="reset" class="btn btn-warning cancel">
                                                    <i class="glyphicon glyphicon-ban-circle"></i>
                                                    <span>取消上传</span>
                                                </button>
                                            </div>

                                        </div>
                                    </div>

                                    <%--//参考:http://www.dropzonejs.com/bootstrap.html--%>
                                    <div class="panel-body">

                                        <div class="row-fluid">
                                            <div class="col-lg-12">
                                                <!-- The global file processing state -->
                                                <span class="fileupload-process">
                                                  <div id="total-progress" class="progress progress-striped active"
                                                       role="progressbar" aria-valuemin="0"
                                                       aria-valuemax="100" aria-valuenow="0" style="opacity: 0;">
                                                      <div class="progress-bar progress-bar-success"
                                                           style="width: 100%;" data-dz-uploadprogress=""></div>
                                                  </div>
                                                </span>
                                            </div>
                                        </div>

                                    </div>

                                    <%--<div class="table-responsive">--%>
                                    <div class="table table-striped table-hover files" id="previews">
                                        <div id="template" class="row file-row"
                                             style="margin-top: 1em;border-width: medium;border-color: #4d5256">
                                            <!-- This is used as the file preview template -->
                                            <div class="col-lg-2 text-center">
                                                <span class="preview"><img
                                                        src="http://7xrtnb.com1.z0.glb.clouddn.com/images/logo/wodedata50x50.png"
                                                        data-dz-thumbnail/></span>
                                            </div>
                                            <div class="col-lg-2 text-center">
                                                <p class="name" data-dz-name></p>
                                                <strong class="error text-danger" data-dz-errormessage></strong>
                                            </div>
                                            <div class="col-lg-4 text-center">
                                                <p class="size" data-dz-size></p>
                                                <div class="progress progress-striped active" role="progressbar"
                                                     aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                                    <div class="progress-bar progress-bar-success" style="width:0%;"
                                                         data-dz-uploadprogress></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 text-center">
                                                <button class="btn btn-primary start">
                                                    <i class="glyphicon glyphicon-upload"></i>
                                                    <span>上传</span>
                                                </button>
                                                <button data-dz-remove class="btn btn-warning cancel">
                                                    <i class="glyphicon glyphicon-ban-circle"></i>
                                                    <span>取消</span>
                                                </button>
                                                <button data-dz-remove class="btn btn-danger delete">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                    <span>删除</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <%--</div>--%>


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
<script src="//cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.8/clipboard.min.js"></script>
<%--<script src="${x}/js/uploadFile.js"></script>--%>
<script type="text/javascript">

    var btns = document.getElementsByName("copyBtn");
    var clipboard = new Clipboard(btns);

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


    //------- 文件上传模块 -------
    // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
    var previewNode = document.querySelector("#template");
    previewNode.id = "";
    var previewTemplate = previewNode.parentNode.innerHTML;
    previewNode.parentNode.removeChild(previewNode);

    var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
        url: "${x}/back/content/upfile/upload",
        //autoProcessQueue: false,
        //addRemoveLinks: true,
        //dictRemoveLinks: "删除文件",
        //dictCancelUpload: "取消上传",
        //dictCancelUploadConfirmation: "取消上传确认",
        //dictRemoveFile: "删除文件",
        //maxFiles: 10,
        //maxFilesize: 51200,
        //acceptedFiles: "audio/!*,image/!*,video/!*,.psd,.pdf",

        thumbnailWidth: 80,
        thumbnailHeight: 80,
        parallelUploads: 20,
        previewTemplate: previewTemplate,
        autoQueue: false, // Make sure the files aren't queued until manually added
        previewsContainer: "#previews", // Define the container to display the previews
        clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
    });

    myDropzone.on("addedfile", function (file) {
        console.log("addedfile called ....");
        // Hookup the start button
        file.previewElement.querySelector(".start").onclick = function () {
            myDropzone.enqueueFile(file);
        };
    });

    myDropzone.on("accept", function (file, done) {
        console.log("accept called ....")
    });

    // Update the total progress bar
    myDropzone.on("totaluploadprogress", function (progress) {
        console.log("totaluploadprogress called .... progress:" + progress);
        document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
    });

    myDropzone.on("selectedfiles", function (files) {
        console.log("selectedfiles called ....");
    });

    myDropzone.on("sending", function (file, xhr, formData) {
        console.log("sending called ....");
        // Show the total progress bar when upload starts
        document.querySelector("#total-progress").style.opacity = "1";
        // And disable the start button
        file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
    });

    myDropzone.on("processing", function (file) {
        console.log("processing called ....")
        var section = $('#section').find('option:selected').val();
        var node = $('#node').find('option:selected').val();
        var topic = $('#topic').find('option:selected').val();

        var params = {
            name: file.name,
            type: file.type,
            size: file.size,
            sectionId: section,
            nodeId: node,
            topicId: topic
        };
        myDropzone.options.url = "${x}/back/content/upfile/upload?" + $.param(params);
    });

    //单个文件上传进度
    myDropzone.on("uploadprogress", function (file, progress, bytesSend) {
//        console.log("uploadprogress called .... progress:"+progress+"   bytesSend:"+bytesSend);
        file.previewElement.querySelector(".progress-bar").style.width = progress + "%";
    });


    //完成上传
    myDropzone.on("complete", function () {

    });

    //文件上传成功
    myDropzone.on("success", function (file, response) {
        console.log("success called ....");

        if (response != null || response != "" || response != "null") {
            file.key = response.key;
            file.url = response.url;
            file.hash = response.hash;
        }

        var progressBar = file.previewElement.querySelector(".progress");
        var parentNode = progressBar.parentNode;

        $(progressBar).remove();
        $(parentNode).append("<span class='label label-success'>上传成功</span>");
    });

    //移除文件
    myDropzone.on("removedfile", function (file) {
        console.log("removedfile called ....");
        if (file.key == null || file.key == undefined) {
            return;
        }

        var jsonData = JSON.stringify({key: file.key, url: file.url, hash: file.hash});
        //保存上传的文件信息
        $.ajax({
            url: '${x}/uploadFile/removeFile',
            type: "post",
            data: jsonData,
            cache: false,
            async: false,    //同步
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (dat) {
                console.log(dat);
            }
        });

    });


    // Hide the total progress bar when nothing's uploading anymore
    myDropzone.on("queuecomplete", function (progress) {
        console.log("queuecomplete called ....");
        document.querySelector("#total-progress").style.opacity = "0";
    });

    // Setup the buttons for all transfers
    // The "add files" button doesn't need to be setup because the config
    // `clickable` has already been specified.
    document.querySelector("#actions .start").onclick = function () {
        myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
    };
    document.querySelector("#actions .cancel").onclick = function () {
        myDropzone.removeAllFiles(true);
    };


</script>
</body>
</html>