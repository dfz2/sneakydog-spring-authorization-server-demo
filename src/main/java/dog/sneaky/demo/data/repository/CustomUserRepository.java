package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.CustomUser;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CustomUserRepository extends CrudRepository<CustomUser, Long> {

    @Query("select * from users where enabled = '1' and username = :username")
    CustomUser loadUserByUsername(String username);

}
