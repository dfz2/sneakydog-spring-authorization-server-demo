package dog.sneaky.demo.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/console/dashboard")
    public String dashboard(){
        return "admin/dashboard";
    }
}
