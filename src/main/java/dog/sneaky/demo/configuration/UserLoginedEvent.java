package dog.sneaky.demo.configuration;

import lombok.Getter;
import org.springframework.context.ApplicationEvent;



@Getter
public class UserLoginedEvent extends ApplicationEvent {
    private final LoginInfoDTO loginInfoDTO;
    public UserLoginedEvent(Object source, LoginInfoDTO loginInfoDTO) {
        super(source);
        this.loginInfoDTO = loginInfoDTO;
    }
}
