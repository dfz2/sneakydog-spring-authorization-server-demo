package dog.sneaky.demo.sneakydogspringauthorizationserverdemo.configuration;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @GetMapping("/index")
    public String index(Model model){
        model.addAttribute("test", "1231321313");
        return "index";
    }

}
