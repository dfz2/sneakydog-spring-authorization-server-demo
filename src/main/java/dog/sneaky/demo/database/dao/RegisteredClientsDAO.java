package dog.sneaky.demo.database.dao;

import dog.sneaky.demo.database.dataobject.RegisteredClientsDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface RegisteredClientsDAO {
    int deleteById(String id);
    RegisteredClientsDO loadById(String id);
    int update(RegisteredClientsDO record);
    List<RegisteredClientsDO> list(RegisteredClientsDO rcQuery);
}
