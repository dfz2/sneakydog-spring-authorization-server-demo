package dog.sneaky.demo.controllers.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ForgotPasswordCommand {
    private String username;
}
