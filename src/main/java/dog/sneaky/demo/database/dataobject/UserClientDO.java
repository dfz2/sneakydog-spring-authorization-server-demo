package dog.sneaky.demo.database.dataobject;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserClientDO {
    private Long id;
    private String username;
    private String clientId;
}
