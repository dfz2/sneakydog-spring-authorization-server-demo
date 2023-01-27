package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.RoleMenusRef;
import dog.sneaky.demo.data.eneity.UserRoleRef;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RoleMenusRefRepository extends CrudRepository<RoleMenusRef, Long> {

    List<RoleMenusRef> findAllByRoleId(Long roleId);
}
