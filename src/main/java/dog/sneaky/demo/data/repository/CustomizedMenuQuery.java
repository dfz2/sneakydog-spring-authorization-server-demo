package dog.sneaky.demo.data.repository;

import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.data.eneity.Menus;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

interface CustomizedMenuQuery<T> {
    List<Menus> getAllByUsername(String username);

    List<Menus> getAll();
}
