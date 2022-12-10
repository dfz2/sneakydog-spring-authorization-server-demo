package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.CustomUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.ListPagingAndSortingRepository;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;


@Repository
public interface CustomUserRepository extends CrudRepository<CustomUser, Long>, ListPagingAndSortingRepository<CustomUser, Long> {

    Optional<CustomUser> getUserByUsername(String username);

    Set<SimpleGrantedAuthority> getAuthoritiesByUserId(Long userId);
}
