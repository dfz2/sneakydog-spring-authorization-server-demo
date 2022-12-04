package dog.sneaky.demo.database.dao;


import dog.sneaky.demo.database.dataobject.UserRoleDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRoleDAO {

    void insert(UserRoleDO userRole);
}
