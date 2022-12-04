package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
public class ZtreeDTO extends DTO{
    private Long id;
    private Long pId;
    private String name;
}
