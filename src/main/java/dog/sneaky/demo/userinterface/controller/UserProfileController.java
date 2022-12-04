package dog.sneaky.demo.userinterface.controller;


import dog.sneaky.demo.service.LogsService;
import dog.sneaky.demo.userinterface.BaseController;
import dog.sneaky.demo.userinterface.controller.dto.UserProfileDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
@AllArgsConstructor
public class UserProfileController extends BaseController {
    private final LogsService logsService;

    @GetMapping("/profile")
    public String index(Model model){
        model.addAttribute("userProfileDTO", new UserProfileDTO());
        return "user/profile";
    }

    @ResponseBody
    @PostMapping("/renewPwd")
    public void renewPwd(UserProfileDTO userProfileDTO){
        System.out.println(userProfileDTO);
    }


    @GetMapping("/user_login_logs")
    public String logs(Model model){
        model.addAttribute("USER_LOGIN_LOGS", logsService.listLogs());
        return "user_login_logs";
    }

}
