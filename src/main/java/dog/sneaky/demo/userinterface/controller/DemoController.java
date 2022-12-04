package dog.sneaky.demo.userinterface.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/demo")
public class DemoController {

    @GetMapping("/lang/test")
    public String langIndex(){
        return "demo/lang";
    }


    @GetMapping("/logfile")
    public String logfile(){
        return "demo/logfile";
    }
}
