package dog.sneaky.demo.database.dao;


import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyAuthorityDAO {

    List<String> loadPermsByUsername(String username);

}
