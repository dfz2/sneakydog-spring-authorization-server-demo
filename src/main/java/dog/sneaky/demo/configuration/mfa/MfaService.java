package dog.sneaky.demo.configuration.mfa;
import java.security.GeneralSecurityException;


import org.springframework.stereotype.Service;

@Service
public class MfaService {

    public boolean check(String hexKey, String code) {

        return false;
    }

}
