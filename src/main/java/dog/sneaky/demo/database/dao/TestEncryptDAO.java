package dog.sneaky.demo.database.dao;


import dog.sneaky.demo.database.dataobject.TestEncryptDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TestEncryptDAO {
    int insert(TestEncryptDO testEncrypt);
    List<TestEncryptDO> list(TestEncryptDO testEncrypt);
}
