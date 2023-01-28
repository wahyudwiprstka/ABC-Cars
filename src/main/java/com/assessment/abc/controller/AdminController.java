package com.assessment.abc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.abc.entity.Car;
import com.assessment.abc.entity.Role;
import com.assessment.abc.entity.TestDrive;
import com.assessment.abc.entity.User;
import com.assessment.abc.entity.UserProfile;
import com.assessment.abc.service.CarService;
import com.assessment.abc.service.ProfileService;
import com.assessment.abc.service.TestDriveService;
import com.assessment.abc.service.UserService;

@Controller
public class AdminController {
    
    @Autowired
    UserService userService;

    @Autowired
    ProfileService profileService;

    @Autowired
    CarService carService;

    @Autowired
    TestDriveService testDriveService;

    @GetMapping("/admin/user")
    public ModelAndView adminUser(){
        ModelAndView mav = new ModelAndView("admin-user");
        List<User> users = userService.getAll();
        mav.addObject("users", users);
        return mav;
    }

    @GetMapping("/admin/car")
    public ModelAndView adminCar(){
        ModelAndView mav = new ModelAndView("admin-car");
        List<Car> cars = carService.getAll();
        mav.addObject("cars", cars);
        return mav;
    }

    @GetMapping("/admin/test-drive")
    public ModelAndView adminTestDrive(){
        ModelAndView mav = new ModelAndView("admin-test-drive");
        List<TestDrive> testDrives = testDriveService.getAll();
        mav.addObject("testDrives", testDrives);
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

    @GetMapping("/admin/delete-user/{id}")
    public ModelAndView deleteUser(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("redirect:/admin/user");
        User user = userService.findById(id);
        userService.delete(user);
        return mav;
    }

    @GetMapping("/admin/update-user/{id}")
    public ModelAndView adminUpdateUser(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("admin-update-profile");
        User user = userService.findById(id);
		UserProfile profile = user.getProfile();
        mav.addObject("user", user);
		mav.addObject("profile", profile);
		return mav;
    }

    @PostMapping("/admin/update-profile-process/{id}")
    public ModelAndView adminUpdateUserProcess(@PathVariable("id") Long id, @ModelAttribute("update-profile") UserProfile profile){
        ModelAndView mav = new ModelAndView("redirect:/admin/user");
        User user = userService.findById(id);
        UserProfile uProfile = user.getProfile();
        uProfile.setFirstname(profile.getFirstname());
        uProfile.setLastname(profile.getLastname());
        uProfile.setAddress(profile.getAddress());
        uProfile.setContact(profile.getContact());
        profileService.save(uProfile);
        return mav;
    }

    @GetMapping("/admin/manage-car-status")
    public ModelAndView adminCarStatus(@RequestParam("id")Long id, @RequestParam("value")int value){
        ModelAndView mav = new ModelAndView("redirect:/admin/car");
        Car car = carService.findCarById(id);
        car.setStatus(value);
        carService.save(car);
        return mav;
    }

    @GetMapping("/admin/delete-car")
    public ModelAndView deleteCar(@RequestParam("id") Long id) throws IOException{
        ModelAndView mav = new ModelAndView("redirect:/admin/car");
        Car car = carService.findCarById(id);
        try{
            String path = "D:\\Dev\\abc\\src\\main\\resources\\static\\images\\carImg";
            Path p = Paths.get(path, car.getImage());
            Files.delete(p);
        }catch(IOException ioe){
            ioe.getStackTrace();
        }
        carService.delete(car);
        return mav;
    }

    @GetMapping("/admin/manage-testdrive-status")
    ModelAndView manageTestdriveStatus(@RequestParam("id") Long id ,@RequestParam("value") Long value){
        TestDrive testDrive = testDriveService.get(id);
        testDrive.setStatus(value);
        testDriveService.save(testDrive);
        return new ModelAndView("redirect:/admin/test-drive");
    }

    @GetMapping("/admin/delete-testdrive")
    ModelAndView manageTestdriveStatus(@RequestParam("id") Long id){
        TestDrive testDrive = testDriveService.get(id);
        testDriveService.delete(testDrive);
        return new ModelAndView("redirect:/admin/test-drive");
    }

}
