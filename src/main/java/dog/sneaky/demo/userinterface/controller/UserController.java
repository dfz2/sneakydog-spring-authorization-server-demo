package dog.sneaky.demo.userinterface.controller;


import dog.sneaky.demo.service.UserService;
import dog.sneaky.demo.userinterface.BaseController;
import dog.sneaky.demo.userinterface.controller.dto.UserDTO;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@AllArgsConstructor
@Controller
public class UserController extends BaseController {
    private final UserService userService;

    @PreAuthorize("hasAuthority('ROLE_USER_LIST')")
    @GetMapping("/user/index")
    public String list(){
        return "user/list";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_LIST')")
    @ResponseBody
    @GetMapping("/user/list")
    public UserDTO list(UserDTO userDTO){
        return userService.listsUser(userDTO);
    }


    @PreAuthorize("hasAuthority('ROLE_USER_ADD')")
    @GetMapping("/user/add")
    public String addUser(){
        return "user/add";
    }


}
