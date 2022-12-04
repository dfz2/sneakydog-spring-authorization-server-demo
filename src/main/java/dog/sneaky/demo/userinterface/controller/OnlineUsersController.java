package dog.sneaky.demo.userinterface.controller;


import dog.sneaky.demo.userinterface.controller.dto.OnlineUsersDTO;
import dog.sneaky.demo.service.impl.OnlineUsersService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
@AllArgsConstructor
@RequestMapping("/user/online")
public class OnlineUsersController {
    private final OnlineUsersService onlineUsersService;

    @PreAuthorize("hasAuthority('ROLE_USER_ONLINE_LIST')")
    @GetMapping("/list")
    public String index(){
        return "user/online";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ONLINE_LIST')")
    @ResponseBody
    @PostMapping("/list")
    public OnlineUsersDTO list(){
        return onlineUsersService.listOnlineUsers();
    }

}
