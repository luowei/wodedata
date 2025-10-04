package com.wodedata.web.back;

import com.wodedata.domin.Node;
import com.wodedata.domin.Section;
import com.wodedata.domin.Topic;
import com.wodedata.domin.UpFileInfo;
import com.wodedata.service.NodeServ;
import com.wodedata.service.SectionServ;
import com.wodedata.service.TopicServ;
import com.wodedata.service.UploadFileServ;
import com.wodedata.web.helper.Qiniu.QiniuResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by NPHD on 16/3/30.
 */

@Controller
@RequestMapping("/back/content/upfile")
public class UpFileC {
    @Autowired
    private SectionServ sectionServ;
    @Autowired
    private NodeServ nodeServ;
    @Autowired
    private TopicServ topicServ;

    @Autowired
    private UploadFileServ uploadFileServ;

    @RequestMapping(value={"","/"})
    public String index(@RequestParam(value="p",defaultValue="1",required=false) int p,
                        @CookieValue(value="username",required=false) String username,
                        @CookieValue(value="title",required=false) String title,
                        Model model){
        Page<UpFileInfo> filePage=uploadFileServ.getAllUpFile(p);
        model.addAttribute("files",filePage.getContent());
        model.addAttribute("page",filePage);
        return "/BACK/content/upfile/index";
    }

    @RequestMapping("/{id}/delete")
    public String delete(@PathVariable("id") int id,
                         HttpServletRequest request,
                         RedirectAttributes attribute){
        uploadFileServ.deleteById(id);
        attribute.addFlashAttribute("msg","已删除");
        String redirectUrl=request.getHeader("Referer");
        return "redirect:"+redirectUrl;
    }

    //提交上传表单
    @RequestMapping("/upload")
    @ResponseBody
    public QiniuResponse uploadForm(HttpServletRequest request, RedirectAttributes attribute,
                             MultipartFile file, UpFileInfo fileInfo, String sectionId,String nodeId,String topicId){

        QiniuResponse response = null;
        try {
            response = uploadFileServ.upload(file);

            fileInfo.setKey(response.key);
            fileInfo.setUrl(response.url);
            fileInfo.setHash(response.hash);

            if(sectionId != null && !"".equals(sectionId)){
                Section section = sectionServ.findById(new Integer(sectionId));
                fileInfo.setSection(section);
            }
            if(nodeId != null && !"".equals(nodeId)){
                Node node = nodeServ.findById(new Integer(nodeId));
                fileInfo.setNode(node);
            }
//            if(topicId != null && !"".equals(topicId)){
//                Topic topic = topicServ.findById(new Integer(topicId));
//                fileInfo.setTopic(topic);
//            }
            uploadFileServ.saveFileInfo(fileInfo);

            return response;
        } catch (Exception e) {
            response = null;
            e.printStackTrace();
            return null;
        }

//        String redirectUrl=request.getHeader("Referer");
//        return "redirect:"+redirectUrl;
    }

}
