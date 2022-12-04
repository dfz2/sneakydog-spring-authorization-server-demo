package dog.sneaky.demo.configuration;

import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.data.repository.CustomUserRepository;
import dog.sneaky.demo.database.dao.MyAuthorityDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;


@Slf4j
@RequiredArgsConstructor
@Component
public class MyUserDetailServiceImpl implements UserDetailsService {
    private final CustomUserRepository customUserRepository;
    private final MyAuthorityDAO myAuthorityDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomUser customUser = customUserRepository.findCustomUserByUsername(username);
        if (ObjectUtils.isEmpty(customUser)){
            log.error("用户["+username+"]不存在");
            throw new UsernameNotFoundException("123131");
        }

        if (customUser.isDisabled()) {
            log.error("用户["+username+"]不存在");
            throw new UsernameNotFoundException("123131");
        }

        List<String> perms = myAuthorityDAO.loadPermsByUsername(username);
        if (!ObjectUtils.isEmpty(perms)){
            customUser.setPerms(perms);
        }

        return new User(username, customUser.getPassword(), customUser.getAuthorities());
    }


}
