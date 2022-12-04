package dog.sneaky.demo.database.dao;


import com.github.pagehelper.Page;
import dog.sneaky.demo.database.dataobject.MyUserDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MyUserDAO {
    MyUserDO loadByUsername(String username);
    Page<MyUserDO> list(MyUserDO myUser);
    void insert(MyUserDO myUser);
    int resetPasswd(@Param("username") String username, @Param("newPassword")  String newPassword);
}
