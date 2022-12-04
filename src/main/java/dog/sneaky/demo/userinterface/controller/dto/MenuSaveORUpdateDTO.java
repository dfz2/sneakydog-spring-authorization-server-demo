package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class MenuSaveORUpdateDTO {
    private Long parentId;
    private String menuType;
    private String menuName;
    private String path;
    private String perms;
}
