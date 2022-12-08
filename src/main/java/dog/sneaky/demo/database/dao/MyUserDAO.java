package dog.sneaky.demo.database.dao;


import dog.sneaky.demo.database.dataobject.MyUserDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MyUserDAO {
    MyUserDO loadByUsername(String username);
    List<MyUserDO> list(MyUserDO myUser);
    void insert(MyUserDO myUser);
    int resetPasswd(@Param("username") String username, @Param("newPassword")  String newPassword);
}
