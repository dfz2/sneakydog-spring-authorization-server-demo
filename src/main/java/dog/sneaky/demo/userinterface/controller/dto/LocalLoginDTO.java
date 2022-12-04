package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@ToString
@ConfigurationProperties(prefix = "spring.security")
@Component
public class LocalLoginDTO {

    private String username;
    private String password;
}
