package dog.sneaky.demo.service.impl;

import dog.sneaky.demo.userinterface.controller.dto.RegisterDTO;
import dog.sneaky.demo.database.repository.UserRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Slf4j
@AllArgsConstructor
@Service
public class MyUserDetailServiceImpl implements UserDetailsService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User myUser = userRepository.loadUserByUsername(username);
        if (myUser != null && myUser.isEnabled()) {
            return myUser;
        } else {
            log.warn("用户["+username+"]不存在");
            throw new UsernameNotFoundException("123131");
        }
    }

    public void userRegister(RegisterDTO registerDTO){
        User user = new User(registerDTO.getUsername(),
                passwordEncoder.encode(registerDTO.getPassword()),
                new ArrayList<>());
        userRepository.save(user);
    }

}
