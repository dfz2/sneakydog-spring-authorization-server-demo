package dog.sneaky.demo.database.dao;


import dog.sneaky.demo.database.dataobject.UserClientDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserClientDAO {
    UserClientDO loadByUsername(String username);
}
