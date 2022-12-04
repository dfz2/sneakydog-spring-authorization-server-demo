package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RoleSaveOrUpdateCommand {
    private Long roleId;
    private RoleSaveOrUpdateDTO roleSaveOrUpdateDTO;
}
