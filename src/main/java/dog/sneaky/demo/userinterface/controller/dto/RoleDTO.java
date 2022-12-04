package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RoleDTO extends DTO{

    private Long id;
    private String roleName;
    private String remark;
}
