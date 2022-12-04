package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.CustomUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CustomUserRepository extends CrudRepository<CustomUser, Long> {

    CustomUser findCustomUserByUsername(String username);

}
