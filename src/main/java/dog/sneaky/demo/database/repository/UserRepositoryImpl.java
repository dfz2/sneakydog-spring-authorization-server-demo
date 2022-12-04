package dog.sneaky.demo.database.repository;

import dog.sneaky.demo.database.dao.MyAuthorityDAO;
import dog.sneaky.demo.database.dao.MyUserDAO;
import dog.sneaky.demo.database.dao.UserRoleDAO;
import dog.sneaky.demo.database.dataobject.MyUserDO;
import dog.sneaky.demo.database.dataobject.UserRoleDO;
import lombok.AllArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;


@AllArgsConstructor
@Repository
public class UserRepositoryImpl implements UserRepository {
    private final MyUserDAO myUserDAO;
    private final MyAuthorityDAO myAuthorityDAO;
    private final UserRoleDAO userRoleDAO;

    @Override
    public User loadUserByUsername(String username) {
        MyUserDO myUser = myUserDAO.loadByUsername(username);
        if (myUser != null) {
            List<String> perms = myAuthorityDAO.loadPermsByUsername(username);
            return new User(
                myUser.getUsername(),
                myUser.getPassword(),
                "1".equals(myUser.getEnabled()),
                true,
                true,
                true,
                perms.stream().map(SimpleGrantedAuthority::new).collect(Collectors.toSet())
            );
        } else {
            return null;
        }
    }

    @Override
    public void save(User user) {
        MyUserDO myUser = new MyUserDO();
        myUser.setUsername(user.getUsername());
        myUser.setPassword(user.getPassword());
        myUser.setEnabled("0");
        myUserDAO.insert(myUser);

        UserRoleDO userRole = new UserRoleDO();
        userRole.setUserId(myUser.getId());
        userRole.setRoleId(2L);
        userRoleDAO.insert(userRole);
    }
}
