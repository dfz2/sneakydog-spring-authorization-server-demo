package dog.sneaky.demo.configuration;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LoginInfoDTO {
    private String username;
    private String ipAddress;
    private String region;
    private String userAgent;
    private String loginStatus;
}
