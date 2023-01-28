package com.assessment.abc.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.abc.entity.Car;
import com.assessment.abc.entity.TestDrive;
import com.assessment.abc.entity.User;
import com.assessment.abc.service.CarService;
import com.assessment.abc.service.TestDriveService;
import com.assessment.abc.service.UserService;

@Controller
public class TestDriveController {
    
    @Autowired
    TestDriveService testDriveService;

    @Autowired
    UserService userService;

    @Autowired
    CarService carService;

    @PostMapping("/u/req-test-drive/{id}/process")
    ModelAndView reqTestDriveProcess(@AuthenticationPrincipal UserDetails userDetails, @PathVariable("id") Long id, 
    @RequestParam("date") Date date){
        User user = userService.getByUsername(userDetails.getUsername());
        Car car = carService.findCarById(id);
        TestDrive testDrive = new TestDrive();
        testDrive.setDate(date);
        testDrive.setCar(car);
        testDrive.setUser(user);
        testDrive.setStatus((long) 0);
        testDriveService.save(testDrive);
        return new ModelAndView("redirect:/u/car-details/"+id);
    }

    @GetMapping("/u/test-drive-list")
    ModelAndView testDriveList(@AuthenticationPrincipal UserDetails userDetails){
        User user = userService.getByUsername(userDetails.getUsername());
        List<TestDrive> testDrives = testDriveService.getByUser(user);
        ModelAndView mav = new ModelAndView();
        mav.addObject("testDrives", testDrives);
        mav.setViewName("test-drive-list");
        return mav;
    }

    @GetMapping("/u/test-drive-request")
    ModelAndView testDriveRequest(@AuthenticationPrincipal UserDetails userDetails){
        User user = userService.getByUsername(userDetails.getUsername());
        List<Car> cars = carService.listByUserId(user.getId());
        List<TestDrive> testDrives = new ArrayList<>();
        for(int i = 0; i < cars.size(); i++){
            testDrives.addAll(testDriveService.getByCar(cars.get(i)));
        }
        ModelAndView mav = new ModelAndView();
        if(testDrives!=null){
            mav.addObject("testDrives", testDrives);
        }
        mav.setViewName("test-drive-request");
        return mav;
    }

    @GetMapping("/u/manage-testdrive-status")
    ModelAndView manageTestdriveStatus(@RequestParam("id") Long id ,@RequestParam("value") Long value){
        TestDrive testDrive = testDriveService.get(id);
        testDrive.setStatus(value);
        testDriveService.save(testDrive);
        return new ModelAndView("redirect:/u/test-drive-request");
    }

    @GetMapping("/u/delete-testdrive")
    ModelAndView manageTestdriveStatus(@RequestParam("id") Long id){
        TestDrive testDrive = testDriveService.get(id);
        testDriveService.delete(testDrive);
        return new ModelAndView("redirect:/u/test-drive-request");
    }

}
