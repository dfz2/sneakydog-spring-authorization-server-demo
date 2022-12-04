package dog.sneaky.demo.database.repository;


import org.springframework.security.core.userdetails.User;

public interface UserRepository {

    User loadUserByUsername(String username);

    void save(User user);

}
