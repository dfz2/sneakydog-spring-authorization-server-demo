package dog.sneaky.demo.controllers.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserRegisterCommand {
    private String username;
    private RegisterDTO registerDTO;
}
