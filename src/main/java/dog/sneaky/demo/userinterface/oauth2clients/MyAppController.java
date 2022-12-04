package dog.sneaky.demo.userinterface.oauth2clients;


import dog.sneaky.demo.userinterface.oauth2clients.RegisteredClientsDTO;
import dog.sneaky.demo.service.impl.MyAppService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Slf4j
@Controller
@AllArgsConstructor
public class MyAppController {
    private final MyAppService myAppService;


    @PreAuthorize("hasAuthority('ROLE_MY_APP')")
    @GetMapping("/my-app.html")
    public String myapp(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        RegisteredClientsDTO registeredClientsDTO = myAppService.getRegisteredClientByUsername(username);
        model.addAttribute("registeredClientsDTO", registeredClientsDTO);
        return "my-app";
    }
}
