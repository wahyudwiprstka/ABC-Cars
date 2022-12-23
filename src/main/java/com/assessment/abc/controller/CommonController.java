package com.assessment.abc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	
	@GetMapping("/about-us")
	public ModelAndView aboutUs() {
		ModelAndView mav = new ModelAndView("about-us");
		return mav;
	}
	
	@GetMapping("/contact-us")
	public ModelAndView contactUs() {
		ModelAndView mav = new ModelAndView("contact-us");
		return mav;
	}
	
}
