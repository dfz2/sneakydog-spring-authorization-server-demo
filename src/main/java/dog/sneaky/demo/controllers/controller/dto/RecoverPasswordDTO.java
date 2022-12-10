package dog.sneaky.demo.controllers.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RecoverPasswordDTO {
    private String password;
    private String retypePassword;
}
