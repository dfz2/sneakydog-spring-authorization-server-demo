package dog.sneaky.demo.controllers;


import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.data.repository.CustomUserRepository;
import dog.sneaky.demo.service.UserService;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@AllArgsConstructor
@Controller
public class UserController extends BaseController {
    private final UserService userService;
    private final CustomUserRepository customUserRepository;


    @PreAuthorize("hasAuthority('ROLE_USER_LIST')")
    @GetMapping("/user/index")
    public String list(){
        return "user/list";
    }



    @PreAuthorize("hasAuthority('ROLE_USER_LIST')")
    @ResponseBody
    @GetMapping(value = "/user/list")
    public Page<CustomUser> list(Pageable pageable){
        return customUserRepository.findAll(pageable);
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ADD')")
    @GetMapping("/user/add")
    public String addUser(){
        return "user/add";
    }


}
