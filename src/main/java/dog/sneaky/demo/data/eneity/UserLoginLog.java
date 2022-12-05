package dog.sneaky.demo.data.eneity;

import dog.sneaky.demo.data.AbstractEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;



@Getter
@Setter
@Table("logs")
public class UserLoginLog  extends AbstractEntity<Long> {


    private String username;
    private String ipAddress;
    private String loginStatus;
    private String region;
    private String userAgent;


}
