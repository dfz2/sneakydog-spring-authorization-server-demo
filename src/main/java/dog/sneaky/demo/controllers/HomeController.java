package dog.sneaky.demo.controllers;


import dog.sneaky.demo.controllers.controller.dto.MenuDTO;
import dog.sneaky.demo.data.eneity.Menus;
import dog.sneaky.demo.data.repository.MenusRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {

    private final MenusRepository menusRepository;


    @GetMapping({"/index", "", "/", "/index.html"})
    public String index() {
        return "redirect:/console/home";
    }


    @GetMapping("/console/home")
    public String main(Model model, HttpServletRequest request){
        String name = SecurityContextHolder.getContext().getAuthentication().getName();  // 正确方式
        System.out.println("登录用户：" + name);
        model.addAttribute("menuDTOS", test());
        request.getSession().setAttribute("menuDTOS", test());
//        return "iframe";
        return "home";
    }



    private List<MenuDTO> test(){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();  // 正确方式
        List<Menus> menusList = menusRepository.getAllByUsername(username);
        List<MenuDTO> menuDTOS = new ArrayList<>();

        for (Menus myMenu : menusList) {
            if (!"B".equals(myMenu.getMenuType())){
                if (myMenu.getParentId() == 0L) {
                    MenuDTO parentMenu = new MenuDTO();
                    parentMenu.setMenuId(myMenu.getId());
                    parentMenu.setMenuName(myMenu.getMenuName());
                    parentMenu.setIcon("fas fa-tachometer-alt");
                    menuDTOS.add(parentMenu);
                }
            }
        }

        for (MenuDTO menuDTO : menuDTOS) {
            for (Menus myMenu : menusList) {
                if (menuDTO.getMenuId().equals(myMenu.getParentId())) {
                    MenuDTO child = new MenuDTO();
                    child.setParentName(menuDTO.getMenuName());
                    child.setMenuName(myMenu.getMenuName());
                    child.setMenuId(myMenu.getId());
                    child.setParentId(menuDTO.getMenuId());
                    child.setUrl(myMenu.getUrl());
                    child.setIcon("far fa-circle");
                    menuDTO.getChilds().add(child);
                }
            }
        }

        return menuDTOS;
    }

    private List<MenuDTO>  getMenus(){
//        MenuDTO dshParent = new MenuDTO();
//        dshParent.setMenuId(1L);
//        dshParent.setMenuName("Dashboard");
//        dshParent.setIcon("fas fa-tachometer-alt");
//
//        MenuDTO dsh = new MenuDTO();
//        dsh.setParentId(1L);
//        dsh.setParentName("Dashboard");
//        dsh.setMenuId(11L);
//        dsh.setMenuName("Dashboard v1");
//        dsh.setUrl("/console/dashboard");
//        dsh.setIcon("far fa-circle");
//
//        MenuDTO dsh2 = new MenuDTO();
//        dsh.setParentId(1L);
//        dsh.setParentName("Dashboard");
//        dsh2.setMenuId(12L);
//        dsh2.setMenuName("Dashboard v2");
//        dsh2.setUrl("/dashboard/v2");
//        dsh2.setIcon("far fa-circle");

//        dshParent.getChilds().add(dsh);
//        dshParent.getChilds().add(dsh2);

        // table

//        MenuDTO tabParent = new MenuDTO();
//        tabParent.setMenuId(2L);
//        tabParent.setMenuName("Table");
//        tabParent.setIcon("fas fa-table");


//
//        MenuDTO tab1 = new MenuDTO();
//        tab1.setParentId(2L);
//        tab1.setParentName("Table");
//        tab1.setMenuId(21L);
//        tab1.setMenuName("Table1 v1");
//        tab1.setUrl("/table/v1");
//        tab1.setIcon("far fa-circle");
//
//        MenuDTO tab2 = new MenuDTO();
//        tab2.setParentId(2L);
//        tab2.setParentName("Table");
//        tab2.setMenuId(22L);
//        tab2.setMenuName("Table2 v2");
//        tab2.setUrl("/table/v2");
//        tab2.setIcon("far fa-circle");

//        tabParent.getChilds().add(tab2);
//        tabParent.getChilds().add(tab1);


//        MenuDTO widgets = new MenuDTO();
//        widgets.setMenuId(3L);
//        widgets.setMenuName("Widgets");
//        widgets.setUrl("/widgets/index");
//        widgets.setIcon("fas fa-th");




        MenuDTO userParent = new MenuDTO();
        userParent.setMenuId(3L);
        userParent.setMenuName("User");
        userParent.setIcon("fas fa-tachometer-alt");

        MenuDTO user1 = new MenuDTO();
        user1.setParentId(3L);
        user1.setParentName("User");
        user1.setMenuId(31L);
        user1.setMenuName("User v1");
        user1.setUrl("/user/index");
        user1.setIcon("far fa-circle");
        userParent.getChilds().add(user1);


        MenuDTO menuss = new MenuDTO();
        menuss.setParentId(3L);
        menuss.setParentName("User");
        menuss.setMenuId(32L);
        menuss.setMenuName("Menus");
        menuss.setUrl("/user/menus/list");
        menuss.setIcon("far fa-circle");
        userParent.getChilds().add(menuss);

        MenuDTO user_login_logs = new MenuDTO();
        user_login_logs.setParentId(3L);
        user_login_logs.setMenuId(33L);
        user_login_logs.setMenuName("Logs");
        user_login_logs.setUrl("/user/user_login_logs");
        user_login_logs.setIcon("fas fa-tachometer-alt");
        userParent.getChilds().add(user_login_logs);

        MenuDTO roleParent = new MenuDTO();
        roleParent.setMenuId(4L);
        roleParent.setMenuName("Role Management");
        roleParent.setIcon("fas fa-tachometer-alt");

        MenuDTO role = new MenuDTO();
        role.setParentId(4L);
        role.setParentName("User");
        role.setMenuId(41L);
        role.setMenuName("Role v1");
        role.setUrl("/role/index");
        role.setIcon("far fa-circle");
        roleParent.getChilds().add(role);



        List<MenuDTO> menuDTOS = new ArrayList<>();
//        menuDTOS.add(dshParent);
//        menuDTOS.add(widgets);
//        menuDTOS.add(tabParent);
        menuDTOS.add(userParent);
        menuDTOS.add(roleParent);

        return menuDTOS;
    }



//    @RequestMapping("/home")
//    public String home(Authentication authentication) {
//        String name = SecurityContextHolder.getContext().getAuthentication().getName();  // 正确方式
//        System.out.println("登录用户：" + name);
//        return "index";
//    }


}
