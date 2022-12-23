package com.assessment.abc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.abc.entity.Registration;
import com.assessment.abc.entity.Role;
import com.assessment.abc.entity.User;
import com.assessment.abc.entity.UserProfile;
import com.assessment.abc.service.ProfileService;
import com.assessment.abc.service.RoleService;
import com.assessment.abc.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	ProfileService profileService;
	
	@Autowired
	RoleService roleService;
	
	@GetMapping("/registration")
	public ModelAndView registration() {
		ModelAndView mav = new ModelAndView("register");
		
		return mav;
	}
	
	@PostMapping("/registrationProcess")
	public ModelAndView registrationProcess(@ModelAttribute("registration") Registration regis) {
		ModelAndView mav = new ModelAndView("redirect:/registration");
		User user = new User();
		UserProfile profile = new UserProfile();
		Role role = roleService.get((long) 1);
		List<Role> roles = new ArrayList<>();
		
		roles.add(role);
		
		profile.setFirstname(regis.getFirstname());
		profile.setLastname(regis.getLastname());
		profile.setAddress(regis.getAddress());
		profile.setContact(regis.getContact());
		
		profileService.save(profile);
		
		UserProfile savedProfile = profileService.getByContact(regis.getContact());
		
		user.setUsername(regis.getUsername());
		user.setPassword(regis.getPassword());
		user.setProfile(savedProfile);
		user.setRoles(roles);
		
		userService.save(user);
		
		return mav;
	}
	
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@GetMapping("/profile")
	public ModelAndView profile() {
		ModelAndView mav = new ModelAndView("profile");
		return mav;
	}
	
	@GetMapping("/update-profile")
	public ModelAndView updateProfile(@AuthenticationPrincipal UserDetails userDetails) throws Exception {
		ModelAndView mav = new ModelAndView("update-profile");
		User user = userService.getByUsername(userDetails.getUsername());
		UserProfile profile = user.getProfile();
		mav.addObject("profile", profile);
		System.out.println(user);
		return mav;
	}

	@PostMapping("/update-profile-process")
	public ModelAndView updateProfileProcess(@ModelAttribute("update-profile") UserProfile profile, @AuthenticationPrincipal UserDetails userDetails) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/profile");
		User user = userService.getByUsername(userDetails.getUsername());
		UserProfile p = user.getProfile();
		profile.setId(p.getId());
		profileService.save(profile);
		return mav;
	}
	
}
