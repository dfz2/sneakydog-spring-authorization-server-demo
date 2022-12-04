package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PasswordDTO {
    private String oldPwd;
    private String newPwd;
}
