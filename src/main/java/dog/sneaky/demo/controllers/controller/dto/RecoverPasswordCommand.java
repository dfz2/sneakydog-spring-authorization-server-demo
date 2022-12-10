package dog.sneaky.demo.controllers.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RecoverPasswordCommand {
    private String uuid;
    private RecoverPasswordDTO recoverPasswordDTO;
}
