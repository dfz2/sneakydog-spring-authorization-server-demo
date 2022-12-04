package dog.sneaky.demo.database.dataobject;


import dog.sneaky.demo.database.DataObject;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyMenusDO extends DataObject {
    private Long id;
    private Long parentId;
    private String menuName;
    private String menuType;
    private String perms;
    private String url;
}
