package dog.sneaky.demo.userinterface.controller;


import dog.sneaky.demo.service.UserService;
import dog.sneaky.demo.userinterface.BaseController;
import dog.sneaky.demo.userinterface.controller.dto.UserDTO;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@AllArgsConstructor
@Controller
public class UserController extends BaseController {
    private final UserService userService;

    @GetMapping("/user/index")
    public String list(){
        return "user/list";
    }

    @ResponseBody
    @GetMapping("/user/list")
    public UserDTO list(UserDTO userDTO){
        return userService.listsUser(userDTO);
    }

    @GetMapping("/user/add")
    public String addUser(){
        return "user/add";
    }


}
