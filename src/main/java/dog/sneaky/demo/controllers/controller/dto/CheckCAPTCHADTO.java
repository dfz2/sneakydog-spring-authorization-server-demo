package dog.sneaky.demo.controllers.controller.dto;


import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.ToString;
import org.springframework.validation.annotation.Validated;

@Data
@ToString
@Validated
public class CheckCAPTCHADTO {

    @NotEmpty
    @Email
    private String username;
    private String CAPTCHACode;
}
