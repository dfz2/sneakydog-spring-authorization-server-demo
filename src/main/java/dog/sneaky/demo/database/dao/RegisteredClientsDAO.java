package dog.sneaky.demo.database.dao;

import com.github.pagehelper.Page;
import dog.sneaky.demo.database.dataobject.RegisteredClientsDO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface RegisteredClientsDAO {
    int deleteById(String id);
    RegisteredClientsDO loadById(String id);
    int update(RegisteredClientsDO record);
    Page<RegisteredClientsDO> list(RegisteredClientsDO rcQuery);
}
