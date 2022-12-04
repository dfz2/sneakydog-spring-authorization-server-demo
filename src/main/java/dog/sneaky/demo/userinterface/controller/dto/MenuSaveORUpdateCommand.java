package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class MenuSaveORUpdateCommand {
    private Long menuId;
    private MenuSaveORUpdateDTO menuSaveORUpdateDTO;
}
