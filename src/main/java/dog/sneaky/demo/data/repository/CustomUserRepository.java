package dog.sneaky.demo.data.repository;


import dog.sneaky.demo.data.eneity.CustomUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.ListPagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CustomUserRepository extends CustomizedCustomUserQuery<CustomUser>, CrudRepository<CustomUser, Long>, ListPagingAndSortingRepository<CustomUser, Long> {

//    Optional<CustomUser> getUserByUsername(String username);
//
//
//    Set<SimpleGrantedAuthority> getAuthoritiesByUserId(Long userId);
}
