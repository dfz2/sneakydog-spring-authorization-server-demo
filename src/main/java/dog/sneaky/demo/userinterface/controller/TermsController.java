package dog.sneaky.demo.userinterface.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/terms")
public class TermsController {


    @GetMapping("/privacy.html")
    public String privacy(){
        return "terms/privacy";
    }
}
