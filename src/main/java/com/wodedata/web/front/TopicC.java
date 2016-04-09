package com.wodedata.web.front;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qiniu.util.StringUtils;
import com.wodedata.domin.*;
import com.wodedata.service.*;
import com.wodedata.web.helper.ReadData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static com.qiniu.util.StringUtils.isNullOrEmpty;

@Controller
@SessionAttributes("user")
@RequestMapping("/topics")
public class TopicC {

    @Autowired
    private TopicServ topicServ;

    @Autowired
    private NodeServ nodeServ;

    @Autowired
    private SectionServ sectionServ;

    @Autowired
    private CollectionServ collectionServ;

    @Autowired
    private CommentServ commentServ;

    @Autowired
    private UploadFileServ uploadFileServ;

    /**
     * 不能匹配话题，值作为显示话题公告使用
     *
     * @return
     */
    @RequestMapping("/")
    public String index() {
//		return "forward:/";
        return "redirect:/";
    }

    /**
     * 显示话题详细
     *
     * @param id
     * @return
     */
    @RequestMapping("/{id}")
    public String show(@PathVariable("id") int id, @RequestParam(value = "p", defaultValue = "1") int p, Model model,
                       HttpServletRequest request, HttpServletResponse response) {
        Topic topic = topicServ.getOne(id);
        User user = (User) request.getSession().getAttribute("user");
        boolean isCollected = collectionServ.isCollected(topic, user);
        model.addAttribute("isCollected", isCollected);
        if (topic != null) {
            Page<Comment> commentPage = commentServ.getByTopicWithLike(topic, p, user);// 按照话题查找
            model.addAttribute("page", commentPage);// 存在文章的时候才回复
            model.addAttribute("comments", commentPage.getContent());
            model.addAttribute("otherTopics", topicServ.getByUser(user, 1, 8).getContent());
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);// 抛出404
        }
        model.addAttribute("topic", topic);
        return "/topics/show";
    }

    /**
     * 发表评论
     *
     * @param topicId 话题id
     * @param comment 评论实体，还没有发表用户属性
     * @return
     */
    @RequestMapping("/comment")
    public String comment(@RequestParam(value = "topicId", required = true) int topicId,
                          @Validated Comment comment,
                          Errors result,
                          HttpServletRequest request,
                          RedirectAttributes attributes) {
        User user = (User) request.getSession().getAttribute("user");
        String contextPath = request.getContextPath();
        if (result.hasErrors() || user==null) {
            attributes.addFlashAttribute("error", result.getAllErrors());
            return "redirect:/topics/" + topicId;
        } else {
            comment.setUser(user);
            commentServ.create(comment, topicId, contextPath);
            attributes.addFlashAttribute("msg", "评论已经发表");
        }
        return "redirect:/topics/" + topicId;
    }

    /**
     * 新建话题页面
     *
     * @return
     */
    @RequestMapping("/create")
    public String newPage(Model model,User user,String errMsg,RedirectAttributes redirectAttrs) {
        if( user==null || "menber".equals(user.getRole()) || "".equals(user.getRole()) ){
            errMsg = "您还不是专栏发布者,暂时不能发表新话题,请联第管理员qq: 745054025";
            redirectAttrs.addFlashAttribute("errMsg",errMsg);
            return "redirect:/";
        }
        model.addAttribute("topicTemplate", ReadData.readTipsFromFile("TopicTemplate.md"));
        model.addAttribute("sections", sectionServ.getAll());
        return "/topics/create";
    }

    /**
     * 保存话题动作 post提交话题参数
     * String node 节点名
     *
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@Validated Topic topic, String sectionId, String nodeId, Errors resutlt, RedirectAttributes redirectAttrs,
                       HttpServletRequest requset) {
        User user = (User) requset.getSession().getAttribute("user");
        if (user==null || "menber".equals(user.getRole()) || "".equals(user.getRole()) ) {
            redirectAttrs.addFlashAttribute("error", resutlt.getAllErrors());
            redirectAttrs.addFlashAttribute("topic", topic);
            return "redirect:/topics/create";
        } else {
            Topic newTopic = topicServ.save(topic, new Integer(nodeId.trim()), user);

//            Section section = sectionServ.findById(new Integer(sectionId.trim()));
//            Node node = nodeServ.findById(new Integer(nodeId.trim()));
//
//            //保存图片文件信息
//            UpFileInfo imageFile = uploadFileServ.findByUrl(topic.getPreImage());
//            if(imageFile!=null){
//                imageFile.setSection(section);
//                imageFile.setNode(node);
//                imageFile.setTopic(newTopic);
//                uploadFileServ.saveFileInfo(imageFile);
//            }
//
//            //保存音频文件信息
//            UpFileInfo audioFile = uploadFileServ.findByUrl(topic.getPreAudio());
//            if(audioFile!=null){
//                audioFile.setSection(section);
//                audioFile.setNode(node);
//                audioFile.setTopic(newTopic);
//                uploadFileServ.saveFileInfo(audioFile);
//
//            }

            return "redirect:/topics/" + newTopic.getId();
        }

    }

    /**
     * 按照id进入到话题编辑页面
     *
     * @param id
     * @return
     */
    @RequestMapping("/{id}/edit")
    public String edit(@PathVariable int id, Model model,User user) {
        if( user==null || "menber".equals(user.getRole()) || "".equals(user.getRole()) ){
            return "redirect:/";
        }
        model.addAttribute("topic", topicServ.getOne(id));
        model.addAttribute("sections", sectionServ.getAll());
        return "/topics/edit";
    }

    /**
     * 处理更新动作 post提交话题参数
     *
     * @return
     */
    @RequestMapping("/update")
    public String update(@Validated @ModelAttribute Topic topic,
                         String sectionId, String nodeId, Errors error,
                         Model model,User user,
                         RedirectAttributes attributes) {
        if( user==null || "menber".equals(user.getRole()) || "".equals(user.getRole()) ){
            return "redirect:/";
        }

        if (error.hasErrors()) {
            model.addAttribute("error", error.getAllErrors());
            model.addAttribute("sections", sectionServ.getAll());
            return "/topics/edit";
        } else {
            Section section = sectionServ.findById(new Integer(sectionId.trim()));
            Node node = nodeServ.findById(new Integer(nodeId.trim()));
            node.setSection(section);
            topic.setNode(node);


            Topic oldTopic = topicServ.findById(topic.getId());
            //更新topic
            Topic newTopic = topicServ.update(topic);

//            // ------ 处理文件信息 -----
//            //删除图片
//            if (!isNullOrEmpty(topic.getPreImage())
//                    && !isNullOrEmpty(oldTopic.getPreImage())
//                    && !topic.getPreImage().equals(oldTopic.getPreImage())) {
//                //删除旧的文件记录与文件
//                uploadFileServ.deleteByUrl(oldTopic.getPreImage());
//                //更新新的文件记录
//                UpFileInfo upFileInfo = uploadFileServ.findByUrl(topic.getPreImage());
//                if (section != null)
//                    upFileInfo.setSection(section);
//                if (node != null)
//                    upFileInfo.setNode(node);
//                upFileInfo.setTopic(newTopic);
//                uploadFileServ.saveFileInfo(upFileInfo);
//            }
//            //删除音频
//            if (!isNullOrEmpty(topic.getPreAudio())
//                    && !isNullOrEmpty(oldTopic.getPreAudio())
//                    && !topic.getPreAudio().equals(oldTopic.getPreAudio())) {
//                //删除旧的文件记录与文件
//                uploadFileServ.deleteByUrl(oldTopic.getPreAudio());
//                //更新新的文件记录
//                UpFileInfo upFileInfo = uploadFileServ.findByUrl(topic.getPreAudio());
//                if (section != null)
//                    upFileInfo.setSection(section);
//                if (node != null)
//                    upFileInfo.setNode(node);
//                upFileInfo.setTopic(newTopic);
//                uploadFileServ.saveFileInfo(upFileInfo);
//            }

            attributes.addFlashAttribute("msg", "话题已更新");
            attributes.addFlashAttribute("topic", newTopic);
            return "redirect:/topics/" + topic.getId();
        }
    }

    @RequestMapping("/{id}/delete")
    @ResponseBody
    public boolean delete(@PathVariable("id") int id,User user) {
        if( user==null || "menber".equals(user.getRole()) || "".equals(user.getRole()) ){
            return false;
        }
        topicServ.softDelete(id);
        return true;
    }

    /**
     * 收藏
     *
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("/{id}/collect")
    @ResponseBody
    public int collect(@PathVariable("id") int id, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Topic topic = topicServ.getOne(id);
        if (user != null && topic != null) {
            return collectionServ.collect(topic, user) != null ? 1 : 0;
        } else {
            return 0;
        }
    }

    /**
     * 是否收藏
     *
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("/{id}/isCollected")
    @ResponseBody
    public int isCollected(@PathVariable("id") int id, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Topic topic = topicServ.getOne(id);
        if (user != null && topic != null) {
            return collectionServ.isCollected(topic, user) == true ? 1 : 0;
        } else {
            return 0;
        }
    }

    /**
     * 取消收藏
     *
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("/{id}/unCollect")
    @ResponseBody
    public int unCollect(@PathVariable("id") int id, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Topic topic = topicServ.getOne(id);
        if (user != null && topic != null) {
            collectionServ.unCollect(topic, user);
        }
        return 1;
    }
}
