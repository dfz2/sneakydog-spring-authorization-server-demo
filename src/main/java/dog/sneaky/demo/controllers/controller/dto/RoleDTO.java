package dog.sneaky.demo.controllers.controller.dto;


import dog.sneaky.demo.common.DTO;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RoleDTO extends DTO {

    private Long id;
    private String roleName;
    private String remark;
}
