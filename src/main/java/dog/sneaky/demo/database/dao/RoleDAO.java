package dog.sneaky.demo.database.dao;


import dog.sneaky.demo.database.dataobject.RoleDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleDAO {
    List<RoleDO> list(RoleDO role);
}
