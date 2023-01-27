package dog.sneaky.demo.controllers;


import dog.sneaky.demo.common.ZtreeDTO;
import dog.sneaky.demo.data.eneity.Menus;
import dog.sneaky.demo.data.eneity.Role;
import dog.sneaky.demo.data.eneity.RoleMenusRef;
import dog.sneaky.demo.data.repository.MenusRepository;
import dog.sneaky.demo.data.repository.RoleMenusRefRepository;
import dog.sneaky.demo.data.repository.RoleRepository;
import dog.sneaky.demo.services.RoleService;
import dog.sneaky.demo.services.impl.MenuService;
import groovy.util.logging.Slf4j;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Supplier;


@Slf4j
@RequiredArgsConstructor
@Controller
public class RoleController extends BaseController{
    private final RoleService roleService;
    private final MenuService menuService;
    private final MenusRepository menusRepository;
    private final RoleRepository roleRepository;
    private final RoleMenusRefRepository roleMenusRefRepository;

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
    public String add(Role role, Model model){
        model.addAttribute("role", new Role());
        return "role/add";
    }



    @PreAuthorize("hasAnyAuthority({'ROLE_USER_ROLES_ADD', 'ROLE_USER_ROLES_EDIT'})")
    @ResponseBody
    @GetMapping("/role/menus/ztrees")
    public List<ZtreeDTO> listMenusZtrees(){
        return menuService.listMenusZtrees();
    }

    @PreAuthorize("hasAuthority('ROLE_USER_ROLES_EDIT')")
    @GetMapping("/roles/{roleId}/edit")
    public String edit(@PathVariable("roleId") Long roleId, Model model){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();  // 正确方式
        List<Menus> menusList = menusRepository.getAllByUsername(username);

        List<Long> menusList2 = new ArrayList<>();
        for (Menus menus : menusList) {
            menusList2.add(menus.getId());
        }

        Optional<Role> roleOptional = roleRepository.findById(roleId);
        model.addAttribute("role", roleOptional.orElseThrow(() -> new RuntimeException("不存在")));
        model.addAttribute("menusList", menusList2);
        return "role/add";
    }



    @PreAuthorize("hasAuthority('ROLE_USER_ROLES_AUTHORIZE_VIEW')")
    @GetMapping("/roles/{roleId}/authorize/view")
    public String authorizeview(@PathVariable("roleId") Long roleId, Model model){
        List<RoleMenusRef> allByRoleId = roleMenusRefRepository.findAllByRoleId(roleId);
        List<Long> menusList2 = new ArrayList<>();
        for (RoleMenusRef menus : allByRoleId) {
            menusList2.add(menus.getMenuId());
        }
        model.addAttribute("menusList", menusList2);
        return "role/authorize";
    }




    @PreAuthorize("hasAuthority('ROLE_USER_ROLES_ADD')")
    @PostMapping("/role/save")
    public String save(Role role){
        roleRepository.save(role);
        return redirect("/role/index");
    }



}
