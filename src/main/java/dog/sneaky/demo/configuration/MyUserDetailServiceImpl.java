package dog.sneaky.demo.configuration;

import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.data.repository.CustomUserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Set;


@Slf4j
@RequiredArgsConstructor
@Component
public class MyUserDetailServiceImpl implements UserDetailsService {
    private final CustomUserRepository customUserRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomUser customUser = customUserRepository.getUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("用户[" + username + "]不存在"));
        Collection<SimpleGrantedAuthority> authorities = customUserRepository.getAuthoritiesByUserId(customUser.getId());
        return new User(username, customUser.getPassword(), authorities);
    }



}
