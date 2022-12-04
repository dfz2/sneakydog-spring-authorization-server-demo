package dog.sneaky.demo.service.impl;


import dog.sneaky.demo.common.BizException;
import dog.sneaky.demo.userinterface.controller.dto.MenuDTO;
import dog.sneaky.demo.userinterface.controller.dto.MenuSaveORUpdateCommand;
import dog.sneaky.demo.userinterface.controller.dto.MenuSaveORUpdateDTO;
import dog.sneaky.demo.userinterface.controller.dto.ZtreeDTO;
import dog.sneaky.demo.database.dao.MyMenusDAO;
import dog.sneaky.demo.database.dataobject.MyMenusDO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component
@AllArgsConstructor
public class MenuService {
    private final MyMenusDAO myMenusDAO;

    public List<MenuDTO> listMenus(MenuDTO menuDTO) {
        MyMenusDO myMenus = new MyMenusDO();
//        Page<MyMenus> menusPage = myMenusDAO.listMenus(myMenus);
        return test();
    }


    @Transactional
    public void save(MenuSaveORUpdateCommand menuSaveORUpdateCommand) {
        Long menuId = menuSaveORUpdateCommand.getMenuId();
        if (menuId != null) {
            MenuSaveORUpdateDTO menuSaveORUpdateDTO = menuSaveORUpdateCommand.getMenuSaveORUpdateDTO();
            MyMenusDO myMenus = new MyMenusDO();
            myMenus.setId(menuId);
            myMenus.setParentId(menuSaveORUpdateDTO.getParentId());
            myMenus.setMenuName(menuSaveORUpdateDTO.getMenuName());
            myMenus.setMenuType(menuSaveORUpdateDTO.getMenuType());
            myMenus.setUrl(menuSaveORUpdateDTO.getPath());
            myMenus.setPerms("ROLE_" + menuSaveORUpdateDTO.getPerms());
            myMenusDAO.update(myMenus);


        } else {
            MenuSaveORUpdateDTO menuSaveORUpdateDTO = menuSaveORUpdateCommand.getMenuSaveORUpdateDTO();
            MyMenusDO myMenus = new MyMenusDO();
            myMenus.setParentId(menuSaveORUpdateDTO.getParentId());
            myMenus.setMenuName(menuSaveORUpdateDTO.getMenuName());
            myMenus.setMenuType(menuSaveORUpdateDTO.getMenuType());
            myMenus.setUrl(menuSaveORUpdateDTO.getPath());
            myMenus.setPerms("ROLE_" + menuSaveORUpdateDTO.getPerms());
            myMenusDAO.insert(myMenus);
        }
    }


    private List<MenuDTO> test() {
        List<MyMenusDO> myMenus = myMenusDAO.listMenus(null);
        List<MenuDTO> menuDTOS = new ArrayList<>();
        for (MyMenusDO myMenu : myMenus) {
            MenuDTO parentMenu = new MenuDTO();
            parentMenu.setMenuId(myMenu.getId());
            parentMenu.setMenuName(myMenu.getMenuName());
            parentMenu.setPerms(myMenu.getPerms());
            parentMenu.setUrl(myMenu.getUrl());
            parentMenu.setParentId(myMenu.getParentId());
            parentMenu.setIcon("fas fa-tachometer-alt");
            menuDTOS.add(parentMenu);
        }

//        for (MenuDTO menuDTO : menuDTOS) {
//            for (MyMenus myMenu : myMenus) {
//                if (menuDTO.getMenuId().equals(myMenu.getParentId())) {
//                    MenuDTO child = new MenuDTO();
//                    child.setParentName(menuDTO.getMenuName());
//                    child.setMenuName(myMenu.getMenuName());
//                    child.setMenuId(myMenu.getId());
//                    child.setParentId(menuDTO.getMenuId());
//                    child.setUrl(myMenu.getUrl());
//                    child.setIcon("far fa-circle");
//                    menuDTO.getChilds().add(child);
//                }
//            }
//        }

        return menuDTOS;
    }

    public List<ZtreeDTO> listMenusZtrees() {
        List<MyMenusDO> myMenus = myMenusDAO.listMenus(null);
        List<ZtreeDTO> ztreeDTOS = new ArrayList<>();
        for (MyMenusDO myMenu : myMenus) {
            ZtreeDTO ztreeDTO = new ZtreeDTO();
            ztreeDTO.setId(myMenu.getId());
            ztreeDTO.setPId(myMenu.getParentId());
            ztreeDTO.setName(myMenu.getMenuName());
            ztreeDTOS.add(ztreeDTO);
        }
        return ztreeDTOS;
    }


    public MenuSaveORUpdateDTO loadMenuByMenuId(String menuId) {
        List<MyMenusDO> myMenus = myMenusDAO.listMenus(null);
        MyMenusDO myMenu = myMenus.stream().filter(a -> (a.getId() + "").equals(menuId)).findFirst().orElseThrow(() -> new BizException("Menus[" + menuId + "] Not found"));
        MenuSaveORUpdateDTO menuSaveORUpdateDTO = new MenuSaveORUpdateDTO();
        menuSaveORUpdateDTO.setParentId(myMenu.getParentId());
        menuSaveORUpdateDTO.setMenuType(myMenu.getMenuType());
        menuSaveORUpdateDTO.setMenuName(myMenu.getMenuName());
        menuSaveORUpdateDTO.setPerms(myMenu.getPerms());
        menuSaveORUpdateDTO.setPath(myMenu.getUrl());
        return menuSaveORUpdateDTO;
    }
}
