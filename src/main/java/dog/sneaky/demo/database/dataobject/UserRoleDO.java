package dog.sneaky.demo.database.dataobject;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserRoleDO {
    private Long id;
    private Long userId;
    private Long roleId;
}
