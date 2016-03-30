package com.wodedata.web.back;

import com.wodedata.domin.UpFileInfo;
import com.wodedata.service.UploadFileServ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by NPHD on 16/3/30.
 */

@Controller
@RequestMapping("/back/content/upfile")
public class UpFileC {

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

}
