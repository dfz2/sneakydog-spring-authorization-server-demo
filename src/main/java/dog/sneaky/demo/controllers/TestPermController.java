package dog.sneaky.demo.controllers;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestPermController {

    @PreAuthorize("hasRole('admin')")
    @GetMapping("/getresrt")
    public String gets(){
        return "12312";
    }
}
