<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<body>
<%@ include file="/WEB-INF/jsp/common/nav.jsp" %>
<div class="main-container container">
    <%@ include file="/WEB-INF/jsp/common/msg.jsp" %>
    <!-- Modal -->
    <div class="modal fade" id="preview" tabindex="-1" role="dialog"
         aria-labelledby="preview">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">预览</h4>
                </div>
                <div class="modal-body" id="preview-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <ol class="breadcrumb">
                <li><a href="${x}/">Topic</a></li>
                <li><a href="${x}/topics/${topic.id}">${topic.title}</a></li>
                <li class="active">编辑</li>
            </ol>
            <div class="panel panel-info">
                <div class="panel-heading">修改</div>
                <div class="panel-body">
                    <form role="form" action="${x}/topics/update" method="POST" data-toggle="validator">
                        <input type="hidden" value="${topic.id}" name="id">

                        <%--类型/结点选择--%>
                        <div class="form-group">
                            <label class="control-label">定位</label>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">分类</span>
                                        <select class="form-control" name="sectionId" id="sectionId">
                                            <c:forEach items="${sections}" var="section">
                                                <option value="${section.id}" <c:if
                                                        test="${topic.node.section.id eq section.id}"> selected </c:if> >${section.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">节点</span>
                                        <select class="form-control" name="nodeId" id="nodeId">
                                            <option value="${topic.node.id}">${topic.node.name}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--标题--%>
                        <div class="form-group">
                            <label>标题</label>
                            <input name="title" data-minlength="1" data-error="标题至少1个字" id="title"
                                   class="form-control" value="${topic.title}">

                            <div class="help-block with-errors"></div>
                        </div>

                        <%--图片--%>
                        <div id="image-upload" class="panel panel-default form-group container-fluid">
                            <div class="panel-heading row">
                                <h3 class="panel-title">图片</h3>
                            </div>

                            <div class="panel-body row-fluid">
                                <input id="preImage" name="preImage" type="hidden" value="${topic.preImage}"/>

                                <%--预览图片--%>
                                <div id="imagePreview" class="col-md-6 col-xs-12 text-center">
                                    <img class="img-responsive img-rounded" src="${topic.preImage}"/>
                                </div>

                                <%--dropzone的template--%>
                                <div id="image-previews" class="files col-md-6 col-xs-12 text-center">
                                    <div id="image-template" class="file-row row-fluid">
                                        <div class="col-xs-6 col-md-6">
                                            <span class="preview">
                                                <img data-dz-thumbnail
                                                     src="${topic.preImage}"/>
                                            </span>

                                            <p data-dz-name class="name"></p>
                                        </div>
                                        <div class="col-xs-6 col-md-6">
                                            <p data-dz-size class="size"></p>

                                            <div class="progress progress-striped active" role="progressbar"
                                                 aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                                <div class="progress-bar progress-bar-success" style="width:0%;"
                                                     data-dz-uploadprogress></div>
                                            </div>
                                            <strong data-dz-errormessage class="error text-danger"></strong>
                                        </div>
                                    </div>
                                </div>

                                <div id="imageActions" class="col-md-6 col-xs-12 text-center">
                                    <span class="btn btn-success dz-clickable fileinput-button">
                                        <i class="glyphicon glyphicon-upload"></i>
                                        <span>选择</span>
                                    </span>
                                    <span class="btn btn-primary dz-clickable start">
                                        <i class="glyphicon glyphicon-upload"></i>
                                        <span>上传</span>
                                    </span>
                                    <span data-dz-remove class="btn btn-danger dz-clickable delete">
                                        <i class="glyphicon glyphicon-trash"></i>
                                        <span>删除</span>
                                    </span>
                                </div>
                            </div>

                        </div>

                        <%--音频--%>
                        <div id="audio-upload" class="panel panel-default form-group container-fluid">
                            <div class="panel-heading row">
                                <h3 class="panel-title">音频</h3>
                            </div>

                            <div class="panel-body row-fluid">
                                <input id="preAudio" name="preAudio" type="hidden" value="${topic.preAudio}"/>

                                <%--预览音频--%>
                                <div id="audioPreview" class="col-md-6 col-xs-12 text-center">
                                    <audio controls style="width: 100%;">
                                        <source src="${topic.preAudio}">
                                    </audio>
                                    <%--<audio controls="controls" src="${topic.preAudio}"/>--%>
                                </div>

                                <%--dropzone的template--%>
                                <div id="audio-previews" class="files col-md-6 col-xs-12 text-center">
                                    <div id="audio-template" class="file-row row-fluid">
                                        <div class="col-xs-6 col-md-6">
                                        <span class="preview">
                                            <img data-dz-thumbnail
                                                 src="http://7xrtnb.com1.z0.glb.clouddn.com/images/logo/audio50x50.png"/>
                                        </span>

                                            <p data-dz-name class="name"></p>
                                        </div>
                                        <div class="col-xs-6 col-md-6">
                                            <p data-dz-size class="size"></p>

                                            <div class="progress progress-striped active" role="progressbar"
                                                 aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                                <div class="progress-bar progress-bar-success" style="width:0%;"
                                                     data-dz-uploadprogress></div>
                                            </div>
                                            <strong data-dz-errormessage class="error text-danger"></strong>
                                        </div>
                                    </div>
                                </div>

                                <div id="audioActions" class="col-md-6 col-xs-12 text-center">
                                    <span class="btn btn-success dz-clickable fileinput-button">
                                        <i class="glyphicon glyphicon-upload"></i>
                                        <span>选择</span>
                                    </span>
                                    <span class="btn btn-primary dz-clickable start">
                                        <i class="glyphicon glyphicon-upload"></i>
                                        <span>上传</span>
                                    </span>
                                    <span data-dz-remove class="btn btn-danger dz-clickable delete">
                                        <i class="glyphicon glyphicon-trash"></i>
                                        <span>删除</span>
                                    </span>
                                </div>
                            </div>

                        </div>


                        <%--正文--%>
                        <div class="form-group">
                            <label>正文</label>

                            <div class="btn-group pull-right">
                                <button type="button" id="btn-preview" class="btn btn-info"
                                        style="border-right-width: 2px; border-right-color: #555;"
                                        data-toggle="modal" data-target="#preview">预览
                                </button>
                            </div>
                            <textarea rows="30" class="form-control" name="content" id="content" data-minlength="6"
                                      data-error="正文不少于六个字">${topic.content}</textarea>

                            <div class="help-block with-errors"></div>
                        </div>

                        <%--标签--%>
                        <div class="form-group">
                            <label>标签</label>
                            <input placeholder="为什么填不了？因为这个多标签功能还没有做，按节点分吧"
                                   class="form-control" disabled="disabled">

                            <div class="help-block with-errors"></div>
                        </div>

                        <%--发送--%>
                        <div class="btn-group">
                            <button type="submit" class="btn btn-info">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3 sidebar">
            <div class="panel panel-info">
                <div class="panel-heading">须知</div>
                ${p.tip_topic.content}
            </div>
        </div>
    </div>
</div>
<script src="//cdn.bootcss.com/marked/0.3.5/marked.min.js"></script>
<script src="//cdn.bootcss.com/dropzone/4.2.0/min/dropzone.min.js"></script>
<script type="text/javascript">
    //设置结点的select
    $("#sectionId").on("change", function (e) {
        var sectionId = $("#sectionId").val();
        setupNodeSel(sectionId);
    });
    function setupNodeSel(sectionId) {
        if (sectionId == "") {
            $("#nodeId").html("<option value=''> -- -- </option>");
            return;
        }

        var url = "${x}/nodes/listBySectionId/" + sectionId;
        $.getJSON(url, function (nodes) {
            var optionStr = "";
            for (var i = 0; i < nodes.length; i++) {
                var selectedName = '${topic.node.name}';
                var selected = "";
                if (selectedName == nodes[i].name) {
                    selected = " selected ";
                }
                optionStr += "<option " + selected + "value=" + nodes[i].id + ">" + nodes[i].name + "</option>";
            }
            console.log(optionStr);
            $("#nodeId").html(optionStr);
        });
    }

    $("#btn-preview").on("click", function (e) {
        var content = $("#content").val();
        console.log(content);
        var content_marked = marked(content);
        $("#preview-body").html(content_marked);
    });

    //获得element的outerHTML
    function outerHTML(element) {
        var container = document.createElement("div");
        container.appendChild(element.cloneNode(true));
        return container.innerHTML;
    }

    //向父结点中插入第一个child
    function prependChild(parent, newFirstChild) {
        parent.insertBefore(newFirstChild, parent.firstChild)
    }

    // -----------------

    //图片上传
    var imgPreView = document.querySelector("#imagePreview");

    //dropzone文件结点模板
    var imagePreviewNode = document.querySelector("#image-template");
    var imagePreviewTemplate = imagePreviewNode.parentNode.innerHTML;

    var imgPreviewParentNode = imagePreviewNode.parentNode;
    imagePreviewNode.id = "";

    //移除模板
    imgPreviewParentNode.removeChild(imagePreviewNode);

    var imageDropzone = new Dropzone("#image-upload", { // Make the whole body a dropzone
        url: "${x}/back/content/upfile/upload",
        maxFiles: 1,
        maxFilesize: 5120,
        acceptedFiles: "image/*",

        thumbnailWidth: 80,
        thumbnailHeight: 80,
        parallelUploads: 20,
        previewTemplate: imagePreviewTemplate,
        autoQueue: false, // Make sure the files aren't queued until manually added
        previewsContainer: "#image-previews", // Define the container to display the previews
        clickable: "#imageActions .fileinput-button" // Define the element that should be used as click trigger to select files.
    });

    imageDropzone.on("addedfile", function (file) {
        console.log("addedfile called ....");
        if (imageDropzone.files.length > 1) {
            imageDropzone.removeFile(this.files[0]);
        }
        imgPreView.parentNode.removeChild(imgPreView);

        // Hookup the start button
        var startNode = document.querySelector("#imageActions .start");
        startNode.onclick = function () {
            imageDropzone.enqueueFile(file);
        };
        startNode.removeAttribute("disabled");
        file.previewElement.querySelector(".progress-bar").style.opacity = "1";
    });

    imageDropzone.on("maxfilesexceeded", function (file) {
        imageDropzone.removeAllFiles();
        imageDropzone.addFile(file);
    });

    document.querySelector("#imageActions .delete").onclick = function () {
        imageDropzone.removeAllFiles(true);
    };

    imageDropzone.on("sending", function (file, xhr, formData) {
        console.log("sending called ....");
        // And disable the start button
        document.querySelector("#imageActions .start").setAttribute("disabled", "disabled");
    });

    imageDropzone.on("processing", function (file) {
        console.log("processing called ....")
        var section = $('#sectionId').find('option:selected').val();
        var node = $('#nodeId').find('option:selected').val();
        var topic = '${topic.id}';

        var params = {
            name: file.name,
            type: file.type,
            size: file.size,
            sectionId: section,
            nodeId: node,
            topicId: topic
        };
        imageDropzone.options.url = "${x}/back/content/upfile/upload?" + $.param(params);
    });

    //单个文件上传进度
    imageDropzone.on("uploadprogress", function (file, progress, bytesSend) {
//        console.log("uploadprogress called .... progress:"+progress+"   bytesSend:"+bytesSend);
        file.previewElement.querySelector(".progress-bar").style.width = progress + "%";
    });


    //完成上传
    imageDropzone.on("complete", function () {

    });

    //文件上传成功
    imageDropzone.on("success", function (file, response) {
        console.log("success called ....");

        if (response != null || response != "" || response != "null") {
            file.key = response.key;
            file.url = response.url;
            file.hash = response.hash;

//            document.querySelector("#preImage").value = response.url;
            document.getElementById("preImage").value = response.url;

            //更新进度条
            var progressBar = file.previewElement.querySelector(".progress");
            var parentNode = progressBar.parentNode;

            $(progressBar).remove();
            $(parentNode).append("<span class='label label-success'>上传成功</span>");

        }
    });

    //移除文件
    imageDropzone.on("removedfile", function (file) {
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

        //再次添加原来的预览图,preImage设置成原来的
        prependChild(imgPreviewParentNode, imgPreView);
        document.getElementById("preImage").value = "${topic.preImage}";

    });


    // ----------------

    //音频上传
    var audioPreView = document.querySelector("#audioPreview");

    //dropzone文件结点模板
    var audioPreviewNode = document.querySelector("#audio-template");
    var audioPreviewTemplate = audioPreviewNode.parentNode.innerHTML;

    var audioPreviewParentNode = audioPreviewNode.parentNode;
    audioPreviewNode.id = "";

    audioPreviewParentNode.removeChild(audioPreviewNode);

    var audioDropzone = new Dropzone("#audio-upload", { // Make the whole body a dropzone
        url: "${x}/back/content/upfile/upload",
        maxFiles: 1,
        maxFilesize: 51200,
        acceptedFiles: "audio/*",

        thumbnailWidth: 80,
        thumbnailHeight: 80,
        parallelUploads: 20,
        previewTemplate: audioPreviewTemplate,
        autoQueue: false, // Make sure the files aren't queued until manually added
        previewsContainer: "#audio-previews", // Define the container to display the previews
        clickable: "#audioActions .fileinput-button" // Define the element that should be used as click trigger to select files.
    });

    audioDropzone.on("addedfile", function (file) {
        console.log("addedfile called ....");
        if (audioDropzone.files.length > 1) {
            audioDropzone.removeFile(this.files[0]);
        }
        audioPreView.parentNode.removeChild(audioPreView);

        // Hookup the start button
        var startNode = document.querySelector("#audioActions .start");
        startNode.onclick = function () {
            audioDropzone.enqueueFile(file);
        };
        startNode.removeAttribute("disabled");
        file.previewElement.querySelector(".progress-bar").style.opacity = "1";
    });

    audioDropzone.on("maxfilesexceeded", function (file) {
        audioDropzone.removeAllFiles();
        audioDropzone.addFile(file);
    });

    document.querySelector("#audioActions .delete").onclick = function () {
        audioDropzone.removeAllFiles(true);
    };

    audioDropzone.on("sending", function (file, xhr, formData) {
        console.log("sending called ....");
        // And disable the start button
        document.querySelector("#audioActions .start").setAttribute("disabled", "disabled");
    });

    audioDropzone.on("processing", function (file) {
        console.log("processing called ....")
        var section = $('#sectionId').find('option:selected').val();
        var node = $('#nodeId').find('option:selected').val();
        var topic = '${topic.id}';

        var params = {
            name: file.name,
            type: file.type,
            size: file.size,
            sectionId: section,
            nodeId: node,
            topicId: topic
        };
        audioDropzone.options.url = "${x}/back/content/upfile/upload?" + $.param(params);
    });

    //单个文件上传进度
    audioDropzone.on("uploadprogress", function (file, progress, bytesSend) {
//        console.log("uploadprogress called .... progress:"+progress+"   bytesSend:"+bytesSend);
        file.previewElement.querySelector(".progress-bar").style.width = progress + "%";
    });


    //完成上传
    audioDropzone.on("complete", function () {

    });

    //文件上传成功
    audioDropzone.on("success", function (file, response) {
        console.log("success called ....");

        if (response != null || response != "" || response != "null") {
            file.key = response.key;
            file.url = response.url;
            file.hash = response.hash;

//            document.querySelector("#preAudio").value = response.url;
            document.getElementById("preAudio").value = response.url;

            var progressBar = file.previewElement.querySelector(".progress");
            var parentNode = progressBar.parentNode;

            $(progressBar).remove();
            $(parentNode).append("<span class='label label-success'>上传成功</span>");

        }
    });

    //移除文件
    audioDropzone.on("removedfile", function (file) {
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

        //再次添加原来的预览图,preImage设置成原来的
        prependChild(audioPreviewParentNode, audioPreView);
        document.getElementById("preAudio").value = "${topic.preAudio}";

    });


</script>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>