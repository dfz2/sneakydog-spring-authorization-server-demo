package dog.sneaky.demo.controllers;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FaviconIcoController {

    @GetMapping("/favicon.ico")
    public String faviconIco(){
        return "favicon.jpg";
    }
}
