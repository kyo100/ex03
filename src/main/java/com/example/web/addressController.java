package com.example.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.persistence.AddressDAO;

@Controller
public class addressController {
	@Inject
	AddressDAO dao;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Integer page, Model model,String key,String word){
		if(page==null) page=1;
		if(key==null) key="name";
		if(word==null) word="";
		
		int start = (page-1)*10;
		model.addAttribute("list", dao.list(start, key, word));
		
		int total=dao.total(key, word);
		int totpage=total/10;
		if(total % 10 != 0){
			totpage=totpage+1;
		}
		model.addAttribute("total", total);
		model.addAttribute("totpage", totpage);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		model.addAttribute("page", page);
		return "list";
	}
}
