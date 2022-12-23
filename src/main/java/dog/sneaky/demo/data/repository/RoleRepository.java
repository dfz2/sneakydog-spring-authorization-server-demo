package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface RoleRepository extends CrudRepository<Role, Long>, PagingAndSortingRepository<Role, Long> {



}
