package dog.sneaky.demo.controllers;


import dog.sneaky.demo.data.eneity.Role;
import dog.sneaky.demo.data.repository.RoleRepository;
import dog.sneaky.demo.services.RoleService;
import groovy.util.logging.Slf4j;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Slf4j
@RequiredArgsConstructor
@Controller
public class RoleController {
    private final RoleService roleService;

    private final RoleRepository roleRepository;

    @PreAuthorize("hasAuthority('ROLE_USER_ROLES')")
    @GetMapping("/role/index")
    public String role(){
        return "role/list";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ROLES')")
    @GetMapping("/role/list")
    @ResponseBody
    public Page<Role> roleList(Pageable pageable){
        return roleRepository.findAll(pageable);
//        return roleDTO;
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ROLES_ADD')")
    @GetMapping("/roles/add")
    public String add(Role role){
        return "role/add";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ROLW_ADD')")
    @PostMapping("/role/save")
    public void save(Role role){
        roleRepository.save(role);
    }
}
