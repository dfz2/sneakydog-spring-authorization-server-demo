package dog.sneaky.demo.controllers;


import dog.sneaky.demo.services.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@Slf4j
@AllArgsConstructor
@RestController
public class RedissionDemoController {
    private final UserService userService;

    @GetMapping("/redission/demo")
    public String insert(){
        userService.create();
        return "ok";
    }

}
