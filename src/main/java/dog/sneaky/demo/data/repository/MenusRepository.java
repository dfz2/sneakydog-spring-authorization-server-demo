package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.Menus;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MenusRepository extends CrudRepository<Menus, Long> {


    List<Menus> getAllByUsername(String username);

}
