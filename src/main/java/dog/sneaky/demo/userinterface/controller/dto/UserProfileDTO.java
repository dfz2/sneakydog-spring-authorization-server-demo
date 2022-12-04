package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserProfileDTO {
    private String username = "1231313";
    private String phone  = "1231313131231313";
    private PasswordDTO passwordDTO;
}
