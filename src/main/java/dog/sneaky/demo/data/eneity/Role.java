package dog.sneaky.demo.data.eneity;

import dog.sneaky.demo.data.EntityID;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;


@Getter
@Setter
@Table("roles")
public class Role extends EntityID<Long> {

    private String roleName;
    private String remark;
}
