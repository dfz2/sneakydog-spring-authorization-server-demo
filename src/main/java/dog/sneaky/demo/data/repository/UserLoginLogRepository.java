package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.UserLoginLog;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserLoginLogRepository extends CrudRepository<UserLoginLog, Long> {

    List<UserLoginLog> getTop10ByUsernameOrderByCreatedAtDesc(String username);

}
