package com.wodedata.web.back;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wodedata.domin.Node;
import com.wodedata.domin.Section;
import com.wodedata.service.NodeServ;
import com.wodedata.service.SectionServ;

@Controller
@RequestMapping("/back/content/sections")
public class ContentSectionsC {
	
	@Autowired
	private SectionServ sectionServ;
	
	@Autowired
	private NodeServ nodeServ;
	
	
	@RequestMapping("")
	public String index(@RequestParam(value="p",defaultValue="1") int p,
			Model model){
		model.addAttribute("sections",sectionServ.getAll());
		return "/BACK/content/sections/index";
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
		Section section=sectionServ.getOneNode(id);
		model.addAttribute("section",section);

		return "/BACK/content/sections/edit";
	}
	
	
	@RequestMapping("/new")
	public String newNode(Model model){
		return "/BACK/content/sections/new";
	}
	
	@RequestMapping(value="/save")
	public String save(String sectionName,
			RedirectAttributes attributes){
		Section section=sectionServ.getOne(sectionName);
		if(section==null||sectionName.equals("")){
			section=new Section();
			section.setName(sectionName);
			sectionServ.save(section);
		}

		List<Section> sections=sectionServ.getAll();
		attributes.addFlashAttribute("sections",sections);
		attributes.addFlashAttribute("msg","已保存");
		return "redirect:/back/content/sections";
	}
	
	@RequestMapping(value="/update")
	public String update(String sectionName,
			RedirectAttributes attributes){
		Section section=sectionServ.getOne(sectionName);
		if(section==null||sectionName.equals("")){
			section=new Section();
			section.setName(sectionName);
			sectionServ.save(section);
		}
		List<Section> sections=sectionServ.getAll();
		attributes.addFlashAttribute("sections",sections);
		attributes.addFlashAttribute("msg","已保存");
		return "redirect:/back/content/sections";
	}
}
