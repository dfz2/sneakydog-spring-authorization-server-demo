package dog.sneaky.demo.userinterface.controller;


import dog.sneaky.demo.userinterface.controller.dto.MenuDTO;
import dog.sneaky.demo.userinterface.controller.dto.MenuSaveORUpdateCommand;
import dog.sneaky.demo.userinterface.controller.dto.MenuSaveORUpdateDTO;
import dog.sneaky.demo.userinterface.controller.dto.ZtreeDTO;
import dog.sneaky.demo.service.impl.MenuService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/user/menus")
public class MenuController {
    private final MenuService menuService;

    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_LIST')")
    @GetMapping("/list")
    public String list(){
        return "menu/menu";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_LIST')")
    @ResponseBody
    @PostMapping("")
    public List<MenuDTO> list(MenuDTO menuDTO){
       return menuService.listMenus(menuDTO);
    }

    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_ADD')")
    @ResponseBody
    @GetMapping("/ztrees")
    public List<ZtreeDTO> listMenusZtrees(){
        return menuService.listMenusZtrees();
    }


    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_ADD')")
    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("menuId", "");
        model.addAttribute("menuSaveORUpdateDTO", new MenuSaveORUpdateDTO());
        return "menu/add";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_EDIT')")
    @GetMapping("/{menuId}")
    public String edit(@PathVariable("menuId") String menuId, Model model){
        model.addAttribute("menuId", menuId);
        MenuSaveORUpdateDTO menuSaveORUpdateDTO = menuService.loadMenuByMenuId(menuId);
        model.addAttribute("menuSaveORUpdateDTO", menuSaveORUpdateDTO);
        return "menu/add";
    }


    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_SAVE')")
    @PostMapping("/save")
    public String add(MenuSaveORUpdateCommand menuSaveORUpdateCommand){
        menuService.save(menuSaveORUpdateCommand);
        return "redirect:/user/menus/list";
    }

}
