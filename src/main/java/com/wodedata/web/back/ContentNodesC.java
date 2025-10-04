package com.wodedata.web.back;

import com.wodedata.domin.Node;
import com.wodedata.domin.Section;
import com.wodedata.service.NodeServ;
import com.wodedata.service.SectionServ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by luowei on 16/3/28.
 */

@Controller
@RequestMapping("/back/content/nodes")
public class ContentNodesC {

    @Autowired
    private SectionServ sectionServ;

    @Autowired
    private NodeServ nodeServ;

    @RequestMapping("/{id}/getAllNode")
    @ResponseBody
    public List<Node> getAllNodeBy(@PathVariable("id") Integer id) throws Exception {
        return nodeServ.getAllBySectionId(id);
    }

    @RequestMapping("")
    public String index(@RequestParam(value="p",defaultValue="1") int p,
                        Model model){
        Page<Node> nodePage=nodeServ.getNode(p);
        model.addAttribute("nodes",nodePage.getContent());
        model.addAttribute("page",nodePage);
        model.addAttribute("sections",sectionServ.getAll());
        return "/BACK/content/nodes/index";
    }

    @RequestMapping("/{id}/delete")
    public String delete(@PathVariable("id") int id,
                         HttpServletRequest request){
        nodeServ.deleteById(id);
        String redirectUrl=request.getHeader("Referer");
        return "redirect:"+redirectUrl;
    }

    @RequestMapping("/{id}/edit")
    public String edit(@PathVariable("id") int id,
                       Model model){
        Node node=nodeServ.getOneNode(id);
        List<Section> sections=sectionServ.getAll();
        model.addAttribute("node",node);
        model.addAttribute("sections",sections);
        return "/BACK/content/nodes/edit";
    }


    @RequestMapping("/new")
    public String newNode(Model model){
        List<Section> sections=sectionServ.getAll();
        model.addAttribute("sections",sections);
        return "/BACK/content/nodes/new";
    }

    @RequestMapping(value="/save")
    public String save(Node node,
                       String sectionName,
                       RedirectAttributes attributes){
        Section section=sectionServ.getOne(sectionName);
        node.setSection(section);
        nodeServ.save(node);
        List<Section> sections=sectionServ.getAll();
        attributes.addFlashAttribute("node",node);
        attributes.addFlashAttribute("sections",sections);
        attributes.addFlashAttribute("msg","已保存");
        return "redirect:/back/content/nodes/"+node.getId()+"/edit";
    }

    @RequestMapping(value="/update")
    public String update(Node node,
                         String sectionName,
                         RedirectAttributes attributes){
        Section section=sectionServ.getOne(sectionName);
        node.setSection(section);
        nodeServ.update(node);
        List<Section> sections=sectionServ.getAll();
        attributes.addFlashAttribute("node",node);
        attributes.addFlashAttribute("sections",sections);
        attributes.addFlashAttribute("msg","已保存");
        return "redirect:/back/content/nodes/"+node.getId()+"/edit";
    }


}
