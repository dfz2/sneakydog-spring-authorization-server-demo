package dog.sneaky.demo.configuration;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class CustomPasswordEncoder extends BCryptPasswordEncoder {

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        encodedPassword = "123131313";
        return super.matches(rawPassword, encodedPassword);
    }
}
