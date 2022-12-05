package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.UserLoginLog;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserLoginLogRepository extends CrudRepository<UserLoginLog, Long> {

    @Query("select * from logs where username=:username order by created_at desc limit 10")
    List<UserLoginLog> listTop10ByUsername(String username);

}
