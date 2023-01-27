package dog.sneaky.demo.data.eneity;


import dog.sneaky.demo.data.EntityID;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;

@Getter
@Setter
@Table("role_menus")
public class RoleMenusRef extends EntityID<Long> {
    private Long roleId;
    private Long menuId;
}
