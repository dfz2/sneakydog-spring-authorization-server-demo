package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RegisterDTO {
    private String nickname;
    private String username;
    private String password;
    private String retypePassword;
    private String terms;
}
