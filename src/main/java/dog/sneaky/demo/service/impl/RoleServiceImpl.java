package dog.sneaky.demo.service.impl;

import dog.sneaky.demo.service.RoleService;
import dog.sneaky.demo.userinterface.controller.dto.RoleDTO;
import dog.sneaky.demo.database.dao.RoleDAO;
import dog.sneaky.demo.database.dataobject.RoleDO;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@AllArgsConstructor
@Slf4j
@Service
class RoleServiceImpl implements RoleService {
    private final RoleDAO roleDAO;

    @Override
    public RoleDTO list(RoleDTO roleDTO) {
        RoleDO role = new RoleDO();
        role.setPageNum(roleDTO.getPageNum());
        role.setPageSize(roleDTO.getPageSize());
        role.setRoleName(roleDTO.getRoleName());
        List<RoleDO> rolePage = roleDAO.list(role);

        RoleDTO r = new RoleDTO();
//        r.setTotal(rolePage.getTotal());
        r.setRows(rolePage.stream().map(this::convert).collect(Collectors.toList()));
        return r;
    }


    private RoleDTO convert(RoleDO role) {
        RoleDTO r = new RoleDTO();
        r.setId(role.getId());
        r.setRoleName(role.getRoleName());
        r.setRemark(role.getRemark());
        return r;
    }

}
