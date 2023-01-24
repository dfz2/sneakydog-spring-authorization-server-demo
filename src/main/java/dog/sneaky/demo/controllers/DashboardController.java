package dog.sneaky.demo.controllers;


import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@Slf4j
@RequiredArgsConstructor
@Validated
public class DashboardController {

    @GetMapping("/console/dashboard")
    public String dashboard(){
        return "admin/dashboard";
    }


    @PostMapping("/console/postTest")
    public void postTest(@Valid @RequestBody PostTestRequest postTestRequest){
        throw new RuntimeException("test error message");
    }


    @GetMapping("/console/postTest")
    public void postTest22(){
        throw new RuntimeException("test error message");
    }


    @Data
    static class PostTestRequest{
        @NotEmpty
        private String hello;
    }
}
