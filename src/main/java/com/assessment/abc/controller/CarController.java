package com.assessment.abc.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.abc.entity.Car;
import com.assessment.abc.entity.PostCar;
import com.assessment.abc.entity.User;
import com.assessment.abc.service.CarService;
import com.assessment.abc.service.UserService;

@Controller
public class CarController {

    @Autowired
    CarService carService;

    @Autowired
    UserService userService;

    @GetMapping("/post-car")
    public ModelAndView postCar(){
        ModelAndView mav = new ModelAndView("post-car");
        return mav;
    }

    @PostMapping("/postCarProcess")
    public ModelAndView postCarProcess(@ModelAttribute("postCar") PostCar postCar, 
        @AuthenticationPrincipal UserDetails userDetails) throws IOException{

        ModelAndView mav = new ModelAndView("redirect:/cars");

        MultipartFile img = postCar.getImage();

        // Get last image id to name the image
        String id;
        try{
            Car lastCar = carService.getLastCar();
            id = String.valueOf(lastCar.getId()+1);
        }catch(Exception e){
            id = "1";
        }

        // Set filename
        String filename = id + "." +img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf(".") + 1);;
            
        // Image Save
        try {
            // Please adjust the directory
            // My directory for windows
            String windowsFolder = "D:\\Dev\\abc\\src\\main\\resources\\static\\images\\carImg";
            // My directory for linux
            // String linuxFolder = "/mnt/2C1474C414749316/Dev/abc/src/main/resources/static/images/carImg/";
            byte[] bytes = img.getBytes();
            Path path = Paths.get(windowsFolder, filename);
            Files.write(path, bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // Database Car Save
        Car car = new Car();
        User user = userService.getByUsername(userDetails.getUsername());
        System.out.println(user);
        car.setMake(postCar.getMake());
        car.setModel(postCar.getModel());
        car.setPrice(postCar.getPrice());
        car.setYear(postCar.getYear());
        car.setImage(filename);
        car.setUser(user);
        carService.save(car);

        return mav;
    }

    @GetMapping("/post-car-list")
    public ModelAndView postCarList(){
        ModelAndView mav = new ModelAndView("post-car-list");
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if(principal instanceof UserDetails){
            username = ((UserDetails) principal).getUsername();
        }else{
            username = principal.toString();
        }
        User user = userService.getByUsername(username);
        List<Car> cars = carService.listByUserId(user.getId());
        mav.addObject("cars", cars);
        return mav;
    }

    @GetMapping("/cars")
    public ModelAndView cars(){
        ModelAndView mav = new ModelAndView("cars");
        List<Car> cars = carService.listActiveCars();
        // BidModel bid = carBidService.findCurrentBidPrice((long) 1);
        mav.addObject("cars", cars);
        return mav;
    }

    @GetMapping("/cars/search")
    public ModelAndView searchCarByKeyword(@RequestParam(value="keyword", required=false) String keyword, 
    @RequestParam(value="min", required=false) Long min, @RequestParam(value="max", required=false) Long max){
        ModelAndView mav = new ModelAndView("cars");
        List<Car> cars;
        if(keyword!=null){
            cars = carService.searchByKeyword(keyword);
        }else if(min!=null || max!=null){
            cars = carService.searchByPriceRange(min, max);
        }else{
            cars = carService.listActiveCars();
        }
        
        mav.addObject("cars", cars);
        return mav;
    }


    @GetMapping("/manage-car-status")
    public ModelAndView manageStatus(@RequestParam("id")Long id, @RequestParam("value")int value){
        ModelAndView mav = new ModelAndView("redirect:/post-car-list");
        Car car = carService.findCarById(id);
        car.setStatus(value);
        carService.save(car);
        return mav;
    }

    @GetMapping("/delete-car")
    public ModelAndView deleteCar(@RequestParam("id") Long id){
        ModelAndView mav = new ModelAndView("redirect:/post-car-list");
        carService.delete(carService.findCarById(id));
        return mav;
    }

    @GetMapping("/car-details/{id}")
    public ModelAndView carDetails(@PathVariable("id") Long id, @RequestParam(value = "bidError", required = false) String bidError, @RequestParam(value = "bidSuccess", required = false) String bidSuccess){
        ModelAndView mav = new ModelAndView("car-details");
        Car car = carService.findCarById(id);
        mav.addObject("car", car);
        if(bidError != null && bidSuccess == null){
            mav.addObject("bidError", bidError);
        }else if(bidError == null && bidSuccess != null){
            mav.addObject("bidSuccess", bidSuccess);
        }
        return mav;
    }

    @GetMapping("/car-details/{id}/bid")
    public ModelAndView bidCar(@PathVariable("id") Long id, @RequestParam("bid") Long bid, @AuthenticationPrincipal UserDetails userDetails, HttpSession session){
        ModelAndView mav = new ModelAndView("redirect:/car-details/"+id);
        Car car = carService.findCarById(id);
        User user = userService.getByUsername(userDetails.getUsername());
        if(bid > car.getBidprice() && bid > car.getPrice()){
            car.setBidder(user);
            car.setBidprice(bid);
            carService.save(car);
            mav.addObject("bidSuccess", "Your bid is done successfuly");
        }else{
            mav.addObject("bidError", "Your bid is lower than current bid!");
        }
        return mav;
    }

    
}
