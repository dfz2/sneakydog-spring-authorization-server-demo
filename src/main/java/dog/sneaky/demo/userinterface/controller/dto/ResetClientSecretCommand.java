package dog.sneaky.demo.userinterface.controller.dto;


import dog.sneaky.demo.userinterface.oauth2clients.RegisteredClientsDTO;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ResetClientSecretCommand {
    private RegisteredClientsDTO registeredClientsDTO;
    private String password;
}
