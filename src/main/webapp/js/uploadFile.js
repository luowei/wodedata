
/*
Dropzone.options.dropzone = {
     url: "${x}/uploadFile/upload",
     autoProcessQueue: false,
     addRemoveLinks: true,
     dictRemoveLinks: "删除文件",
     dictCancelUpload: "取消上传",
     dictCancelUploadConfirmation: "取消上传确认",
     dictRemoveFile: "删除文件",
    maxFiles: 10,
    maxFilesize: 51200,
    acceptedFiles: "audio/!*,image/!*,video/!*,.psd,.pdf", //".jpg,.jpeg,.png,.gif,.psd,.pdf,.mp3,.wma,.mp4,.ogg,.mov.avi"
    init: function () {
        var submitButton = document.querySelector("#btn-upload");
        dropzone = this; // closure

        submitButton.addEventListener("click", function () {
            dropzone.processQueue(); // Tell Dropzone to process all queued file.
        });
        this.on("success", function (file, response) {

            var jsonData = JSON.stringify({
                name: file.name,
                type: file.type,
                size: file.size,
                key: response.key,
                url: response.url,
                hash: response.hash
            });
            //保存上传的文件信息
            $.ajax({
                url: '${x}/uploadFile/saveFileInfo',
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
        this.on('drop', function (file) {
//                alert('file');
        });
    }

};
*/


