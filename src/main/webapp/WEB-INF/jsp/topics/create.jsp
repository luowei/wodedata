<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<body>
<%@ include file="/WEB-INF/jsp/common/nav.jsp" %>


<style type="text/css">
    li.borderless {
        border:0 none;
        /*border-top: 0 none;*/
        /*border-bottom: 0 none;*/
        /*border-left: 0 none;*/
        /*border-right: 0 none;*/
    }

</style>

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
                                        <select class="form-control" name=sectionId id="sectionId">
                                            <%--<option value=""> -- --</option>--%>
                                            <c:forEach items="${sections}" var="section">
                                                <option value="${section.id}">${section.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">专辑</span>
                                        <select class="form-control" id="nodeId" name="nodeId">
                                            <option value="Spring Framework"> -- --</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--标题--%>
                        <div class="form-group">
                            <label>标题</label>
                            <input name="title" data-minlength="1" data-error="标题至少1个字" id="title" class="form-control">
                            <div class="help-block with-errors"></div>
                        </div>

                        <%--图片--%>
                        <div id="image-upload" class="panel panel-default form-group container-fluid">
                            <div class="panel-heading row">
                                <h3 class="panel-title">图片</h3>
                            </div>

                            <div class="panel-body row-fluid">
                                <div class="col-md-12 text-center">
                                    <div class="thumbnail text-center" style="border: 0 none; width: 100%;">
                                        <img class="img-responsive img-rounded" id="imgPlacehold" src=""/>
                                        <div class="caption">
                                            <div class="input-group text-center">
                                                <input id="preImage" name="preImage" type="text" class="form-control"
                                                       value=""/>
                                               <span class="input-group-btn">
                                                  <a id="setPreImage" class="btn btn-success">OK</a>
                                               </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <%--音频--%>
                        <div id="audio-upload" class="panel panel-default form-group container-fluid">
                            <div class="panel-heading row">
                                <h3 class="panel-title">音频</h3>
                            </div>
                            <div class="panel-body row-fluid">
                                <div class="col-md-12">
                                    <div id="topic-preAudio">
                                        <audio id="audioPlacehold" controls style="width: 100%;" src=""/>
                                    </div>
                                    <div class="input-group" style="width: 100%;">
                                        <input id="preAudio" name="preAudio" type="text" class="form-control" value=""/>
                                        <span class="input-group-btn">
                                            <a id="setPreAudio" class="btn btn-success">OK</a>
                                        </span>
                                    </div>
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
<script type="text/javascript">

//    //设置结点的select
//    $("#sectionId").on("change", function (e) {
//        var sectionId = $("#sectionId").val();
//        setupNodeSel(sectionId);
//    });

    $(function(){
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

    $("#setPreImage").on("click",function(e){
        var imgSrc = $("#preImage").val();
        $("#imgPlacehold").attr("src",imgSrc);
    });
    $("#setPreAudio").on("click",function(e){
        var audioSrc = $("#preAudio").val();
        $("#audioPlacehold").attr("src",audioSrc);
    });


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