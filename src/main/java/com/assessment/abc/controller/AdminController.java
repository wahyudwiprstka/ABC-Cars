package com.assessment.abc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.abc.entity.Role;
import com.assessment.abc.entity.User;
import com.assessment.abc.service.CarService;
import com.assessment.abc.service.UserService;

@Controller
public class AdminController {
    
    @Autowired
    UserService userService;

    @Autowired
    CarService carService;

    @GetMapping("/admin/user")
    public ModelAndView admin(){
        ModelAndView mav = new ModelAndView("admin-user");
        List<User> users = userService.getAll();
        mav.addObject("users", users);
        return mav;
    }

    @GetMapping("/admin/give-admin-role/{id}")
    public ModelAndView giveAdminRole(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("redirect:/admin/user");
        User u = userService.findById(id);
        Role roleAdmin = new Role();
        roleAdmin.setId((long) 2);
        Role roleUser = new Role();
        roleUser.setId((long) 1);
        List<Role> roles = new ArrayList<>();
        roles.add(roleUser);
        roles.add(roleAdmin);
        u.setRoles(roles);
        userService.save(u);
        return mav;
    }

    @GetMapping("/admin/delete-admin-role/{id}")
    public ModelAndView deleteAdminRole(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("redirect:/admin/user");
        User u = userService.findById(id);
        Role role = new Role();
        role.setId((long) 1);
        List<Role> roles = new ArrayList<>();
        roles.add(role);
        u.setRoles(roles);
        userService.save(u);
        return mav;
    }

}
