package dog.sneaky.demo.database.dataobject;


import dog.sneaky.demo.database.DataObject;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RoleDO extends DataObject {
    private Long id;
    private String roleName;
    private String remark;
}
