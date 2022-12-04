package dog.sneaky.demo.database.dao;


import dog.sneaky.demo.database.dataobject.LogsDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LogsDAO {
    List<LogsDO> listLogsByUsername(String username);
    int insert(LogsDO logs);

    LogsDO loadLoginedByUsername(String username);
}
