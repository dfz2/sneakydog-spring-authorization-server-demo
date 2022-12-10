package dog.sneaky.demo.controllers;


import dog.sneaky.demo.controllers.controller.dto.MenuDTO;
import dog.sneaky.demo.controllers.controller.dto.ZtreeDTO;
import dog.sneaky.demo.data.eneity.Menus;
import dog.sneaky.demo.data.repository.MenusRepository;
import dog.sneaky.demo.service.impl.MenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/menus")
public class MenuController {
    private final MenuService menuService;

    private final MenusRepository menusRepository;

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
        model.addAttribute("menuSaveORUpdateDTO", new Menus());
        return "menu/add";
    }

    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_EDIT')")
    @GetMapping("/{menuId}/edit")
    public ModelAndView edit(@PathVariable("menuId") Long menuId, Model model){
//        model.addAttribute("menuId", menuId);
        Menus menus = menusRepository.findById(menuId).orElseThrow(()->new RuntimeException("menuId不存在"));
//        model.addAttribute("menuSaveORUpdateDTO", menus);

        ModelAndView modelAndView = new ModelAndView("menu/add");
        modelAndView.addObject("menuId", menuId);
        modelAndView.addObject("menuSaveORUpdateDTO", menus);
        return modelAndView;
    }


    @PreAuthorize("hasAuthority('ROLE_USER_MENUS_SAVE')")
    @PostMapping("/save")
    public String add(Menus menus){
        String perms = menus.getPerms();
        boolean b = perms.startsWith("ROLE_");
        if (!b) {
            perms = String.format("ROLE_%s", perms);
            menus.setPerms(perms);
        }

        menusRepository.save(menus);
        return "redirect:/user/menus/list";
    }

}
