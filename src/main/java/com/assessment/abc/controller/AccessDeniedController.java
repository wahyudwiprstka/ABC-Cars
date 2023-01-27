package com.assessment.abc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccessDeniedController {
    
    public ModelAndView accessDenied(){
        ModelAndView mav = new ModelAndView("access-denied");
        return mav;
    }

}
