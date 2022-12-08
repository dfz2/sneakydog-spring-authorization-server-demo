package dog.sneaky.demo.userinterface.oauth2clients;


import dog.sneaky.demo.common.UuidGenerator;
import dog.sneaky.demo.common.ValidForm;
import dog.sneaky.demo.userinterface.BaseController;
import dog.sneaky.demo.userinterface.controller.dto.ResetClientSecretCommand;
import dog.sneaky.demo.service.impl.RegisteredClientsService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@AllArgsConstructor
//@Controller
@RequestMapping("/registered/clients")
public class RegisteredClientsController extends BaseController {
    private final RegisteredClientsService registeredClientsService;

    @PreAuthorize("hasAuthority('ROLE_REGISTERED_CLIENT')")
    @GetMapping("/index")
    public String index(){
        return "clients/registered-clients";
    }

    @PreAuthorize("hasAuthority('ROLE_REGISTERED_CLIENTS_ADD')")
    @GetMapping("/add")
    public String add(Model model){
        RegisteredClientsDTO registeredClientsDTO = new RegisteredClientsDTO();
        registeredClientsDTO.setClientId(UuidGenerator.newUuid());
        model.addAttribute("registeredClientsDTO", registeredClientsDTO);
        return "clients/add-registered-clients";
    }

    @PreAuthorize("hasAuthority('ROLE_REGISTERED_CLIENTS_ADD')")
    @PostMapping("/add")
    public String add(RegisteredClientsDTO registeredClientsDTO, Model model){
        registeredClientsService.save(registeredClientsDTO);
        return redirect("/registered/clients/add");
    }

    @PreAuthorize("hasAuthority('ROLE_MY_APP')")
    @ValidForm(viewName = "/my-app.html")
    @PostMapping("/secret/reset")
    public String resetClientSecret(ResetClientSecretCommand resetClientSecretCommand, Model model, RedirectAttributes redirectAttributes){
        registeredClientsService.save(resetClientSecretCommand);
        return redirect("/my-app.html");
    }

    @ResponseBody
    @GetMapping("/list")
    public RegisteredClientsDTO list(RegisteredClientsDTO registeredClientsDTO){
        return registeredClientsService.list(registeredClientsDTO);
    }
}
