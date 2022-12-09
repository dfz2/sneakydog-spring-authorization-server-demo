package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.CustomUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;


@Repository
public interface CustomUserRepository extends CrudRepository<CustomUser, Long> {

    Optional<CustomUser> getUserByUsername(String username);

    Set<SimpleGrantedAuthority> getAuthoritiesByUserId(Long userId);
}
