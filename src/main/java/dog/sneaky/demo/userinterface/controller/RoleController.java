package dog.sneaky.demo.userinterface.controller;


import dog.sneaky.demo.service.RoleService;
import dog.sneaky.demo.userinterface.controller.dto.RoleDTO;
import dog.sneaky.demo.userinterface.controller.dto.RoleSaveOrUpdateCommand;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Slf4j
@AllArgsConstructor
@Controller
public class RoleController {
    private final RoleService roleService;

    @PreAuthorize("hasAuthority('ROLE_USER_ROLES')")
    @GetMapping("/role/index")
    public String role(){
        return "role/list";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ROLES')")
    @GetMapping("/role/list")
    @ResponseBody
    public RoleDTO roleList(RoleDTO roleDTO){
        return roleService.list(roleDTO);
//        return roleDTO;
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ROLES_ADD')")
    @GetMapping("/roles/add")
    public String add(RoleDTO roleDTO){
        return "role/add";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ROLW_ADD')")
    @PostMapping("/role/save")
    public void save(RoleSaveOrUpdateCommand roleSaveOrUpdateCommand){

    }
}
