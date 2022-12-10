package dog.sneaky.demo.controllers.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ResetClientSecretCommand {
    private RegisteredClientsDTO registeredClientsDTO;
    private String password;
}
