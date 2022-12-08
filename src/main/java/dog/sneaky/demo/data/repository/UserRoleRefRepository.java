package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.UserRoleRef;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface UserRoleRefRepository extends CrudRepository<UserRoleRef, Long> {


}
