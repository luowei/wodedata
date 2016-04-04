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
                <li class="active">新建</li>
            </ol>
            <div class="panel panel-info">
                <div class="panel-heading">创建</div>
                <div class="panel-body">
                    <form role="form" action="${x}/topics/save" method="POST" data-toggle="validator">
                            <%--分类 及 结点--%>
                        <div class="form-group">
                            <label class="control-label">定位</label>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">分类</span>
                                        <select class="form-control" id="section">
                                            <option value=""> -- -- </option>
                                        <c:forEach items="${sections}" var="section">
                                            <option value="${section.name}">${section.name}</option>
                                        </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">节点</span>
                                        <select class="form-control" id="topicNodeName" name="topicNodeName">
                                            <option value="Spring Framework"> -- --  </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                            <%--标题--%>
                        <div class="form-group">
                            <label>标题</label>
                            <input name="title" data-minlength="6" data-error="标题至少六个字" id="title" class="form-control">
                            <div class="help-block with-errors"></div>
                        </div>

                            <%--图片--%>
                        <div class="form-group">
                            <label>图片</label>
                            <div class="row">
                                <div class="col-md-2">
                                    <div id="upload-image-preview-template" style="display: none;">
                                        <input name = "preImage" type="hidden" value=""/>
                                        <a href="#" class="thumbnail">
                                            <img src="http://7xrtnb.com1.z0.glb.clouddn.com/images/logo/wodedata50x50.png" alt="通用的占位符缩略图">
                                        </a>
                                    </div>
                                </div>
                                <div id="image-actions" class="col-md-10">
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

                            <%--音频--%>
                        <div class="form-group">
                            <label>音频</label>
                            <div class="row">
                                <div class="col-md-2">
                                    <div id="upload-audio-preview-template" style="display: none;">
                                        <input name = "preAudio" type="hidden" value=""/>
                                        <a href="#" class="thumbnail">
                                            <img src="http://7xrtnb.com1.z0.glb.clouddn.com/images/logo/wodedata50x50.png" alt="通用的占位符缩略图">
                                        </a>
                                    </div>
                                </div>
                                <div id="audio-actions" class="col-md-10">
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

                            <%--正文--%>
                        <div class="form-group">
                            <label>正文</label>

                            <div class="btn-group pull-right">
                                <button type="button" id="btn-preview" class="btn btn-info"
                                        style="border-right-width: 2px; border-right-color: #555;"
                                        data-toggle="modal" data-target="#preview">预览
                                </button>

                            </div>
                            <textarea rows="30" class="form-control" name="content"
                                      id="content" data-minlength="6" data-error="正文不少于六个字">${topicTemplate}</textarea>

                            <div class="help-block with-errors"></div>
                        </div>

                            <%--标签--%>
                        <div class="form-group">
                            <label>标签</label>
                            <input class="form-control" disabled="disabled" placeholder="为什么填不了？因为这个多标签功能还没有做，按节点分吧">
                            <div class="help-block with-errors"></div>
                        </div>

                            <%--发送--%>
                        <div class="btn-group">
                            <button type="submit" class="btn btn-info">
                                发 送
                            </button>
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

    //设置分类的select
    $("#section").on("change", function (e) {
        var sectionName = $("#section").val();
        setupNodeSel(sectionName);
    });
    function setupNodeSel(sectionName){
        if(sectionName == ""){
            $("#topicNodeName").html("<option value=''> -- -- </option>");
            return ;
        }

        var url = "${x}/nodes/list/" + sectionName;
        $.getJSON(url, function (nodeNames) {
            var optionStr = "";
            for (var i = 0; i < nodeNames.length; i++) {
                var selectedName = '${topic.node.name}';
                var selected = "";
                if(selectedName == nodeNames[i]){
                    selected = " selected ";
                }
                optionStr += "<option "+selected+">" + nodeNames[i] + "</option>";
            }
            console.log(optionStr);
            $("#topicNodeName").html(optionStr);
        });
    }

    //预览
    $("#btn-preview").on("click", function (e) {
        var content = $("#content").val();
        console.log(content);
        var content_marked = marked(content);
        $("#preview-body").html(content_marked);
    });


</script>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>