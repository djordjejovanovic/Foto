package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.repository.PricelistRepository;

import model.Pricelist;

@Controller
@RequestMapping(value = "pricelistcontroller")
public class PricelistController {
	
	@Autowired
	PricelistRepository pr;
	
	@RequestMapping(value = "getPricelist", method = RequestMethod.GET)
	public String getPricelist(HttpServletRequest request, Model m) {
		List<Pricelist> pl = null;
		pl = pr.findAll();
		
		if(pl != null) {
			request.setAttribute("pricelist", pl);
			
			return "pricelist/pricelist";
		}
		
		return "redirect:/";
	}

}
