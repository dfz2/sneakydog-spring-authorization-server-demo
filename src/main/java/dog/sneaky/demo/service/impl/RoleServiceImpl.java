package dog.sneaky.demo.service.impl;

import dog.sneaky.demo.controllers.controller.dto.RoleDTO;
import dog.sneaky.demo.data.repository.RoleRepository;
import dog.sneaky.demo.service.RoleService;
import groovy.util.logging.Slf4j;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Slf4j
@Service
@RequiredArgsConstructor
class RoleServiceImpl implements RoleService {

    private final RoleRepository roleRepository;


    @Override
    public RoleDTO list(RoleDTO roleDTO) {
//        RoleDO role = new RoleDO();
////        role.setPageNum(roleDTO.getPageNum());
////        role.setPageSize(roleDTO.getPageSize());
//        role.setRoleName(roleDTO.getRoleName());
//        List<RoleDO> rolePage = roleDAO.list(role);

//        RoleDTO r = new RoleDTO();
//        r.setTotal(rolePage.getTotal());
//        r.setRows(rolePage.stream().map(this::convert).collect(Collectors.toList()));
        return null;
    }

//
//    private RoleDTO convert(RoleDO role) {
//        RoleDTO r = new RoleDTO();
//        r.setId(role.getId());
//        r.setRoleName(role.getRoleName());
//        r.setRemark(role.getRemark());
//        return r;
//    }

}
