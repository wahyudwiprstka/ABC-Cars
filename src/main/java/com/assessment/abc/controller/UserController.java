package com.assessment.abc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.abc.entity.Car;
import com.assessment.abc.entity.Registration;
import com.assessment.abc.entity.Role;
import com.assessment.abc.entity.User;
import com.assessment.abc.entity.UserProfile;
import com.assessment.abc.service.CarService;
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
	CarService carService;
	
	@Autowired
	RoleService roleService;
	
	@GetMapping("/registration")
	public ModelAndView registration() {
		ModelAndView mav = new ModelAndView("redirect:/");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth == null || auth instanceof AnonymousAuthenticationToken){
			mav.setViewName("register");
		}
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
		ModelAndView mav = new ModelAndView("redirect:/");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
            mav.setViewName("/login");
        }
 
		return mav;
	}
	
	@GetMapping("/profile")
	public ModelAndView profile(@AuthenticationPrincipal UserDetails userDetails) {
		ModelAndView mav = new ModelAndView("profile");
		User user = userService.getByUsername(userDetails.getUsername());
		mav.addObject("user", user);
		return mav;
	}
	
	@GetMapping("/update-profile")
	public ModelAndView updateProfile(@AuthenticationPrincipal UserDetails userDetails) throws Exception {
		ModelAndView mav = new ModelAndView("update-profile");
		User user = userService.getByUsername(userDetails.getUsername());
		UserProfile profile = user.getProfile();
		mav.addObject("profile", profile);
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

	@GetMapping("/bidding-list")
	public ModelAndView biddingList(@AuthenticationPrincipal UserDetails userDetails) throws Exception{
		ModelAndView mav = new ModelAndView("bidding-list");
		User user = userService.getByUsername(userDetails.getUsername());
		List<Car> myBid = new ArrayList<>();
		List<Car> cars = carService.listActiveCars();
		try{
			for(int i = 0; i < cars.size(); i++){
				if(cars.get(i).getBidder().getId() == user.getId()){
					myBid.add(cars.get(i));
				}
			}
			mav.addObject("myBid", myBid);
		}catch(Exception e){
			mav.setViewName("redirect:/cars");
		}
		return mav;
	}

	
	
}
