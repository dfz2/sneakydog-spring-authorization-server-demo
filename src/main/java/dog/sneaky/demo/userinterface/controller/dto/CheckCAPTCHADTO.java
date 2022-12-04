package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CheckCAPTCHADTO {
    private String username;
    private String CAPTCHACode;
}
