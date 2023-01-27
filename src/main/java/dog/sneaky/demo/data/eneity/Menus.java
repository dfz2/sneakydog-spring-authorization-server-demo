package dog.sneaky.demo.data.eneity;

import dog.sneaky.demo.data.EntityID;
import dog.sneaky.demo.data.dp.Deleted;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;


@Getter
@Setter
@Table("menus")
public class Menus extends EntityID<Long> {

    private Long parentId;
    private String menuName;
    private String menuType;
    private String perms;
    private String url;
    private Deleted deleted;

}
