package dog.sneaky.demo.controllers.controller.dto;


import dog.sneaky.demo.common.DTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
public class UserDTO extends DTO {
    private String username;
    private String sex;
    private int age;
    private String email;


}
