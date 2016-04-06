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

                        <div class="form-group">
                            <label class="control-label">定位</label>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">分类</span>
                                        <select class="form-control" name="sectionId" id="sectionId">
                                            <c:forEach items="${sections}" var="section">
                                                <option value="${section.id}" <c:if test="${topic.node.section.id eq section.id}"> selected </c:if> >${section.name}</option>
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
                        <div class="form-group">
                            <label>标题</label>
                            <input name="title" data-minlength="6" data-error="标题至少六个字" id="title"
                                                     class="form-control" value="${topic.title}">

                            <div class="help-block with-errors"></div>
                        </div>
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
                        <div class="form-group">
                            <label>标签</label>
                            <input placeholder="为什么填不了？因为这个多标签功能还没有做，按节点分吧"
                                   class="form-control" disabled="disabled">

                            <div class="help-block with-errors"></div>
                        </div>
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
                optionStr += "<option " + selected + "value="+nodes[i].id+">" + nodes[i].name + "</option>";
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



</script>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>