package dog.sneaky.demo.data.repository;

import dog.sneaky.demo.data.eneity.CustomUser;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Collection;
import java.util.Optional;
import java.util.Set;

public interface CustomizedCustomUserQuery<T> {

    Optional<CustomUser> getUserByUsername(String username);

    Collection<SimpleGrantedAuthority> getAuthoritiesByUserId(Long userId);
}
