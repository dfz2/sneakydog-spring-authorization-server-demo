package dog.sneaky.demo.database.dao;


import com.github.pagehelper.Page;
import dog.sneaky.demo.database.dataobject.RoleDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoleDAO {
    Page<RoleDO> list(RoleDO role);
}
