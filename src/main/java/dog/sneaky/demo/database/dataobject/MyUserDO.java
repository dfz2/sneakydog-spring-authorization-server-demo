package dog.sneaky.demo.database.dataobject;


import dog.sneaky.demo.database.DataObject;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MyUserDO extends DataObject {
    private Long id;
    private String username;
    private String password;
    private String enabled;
}
