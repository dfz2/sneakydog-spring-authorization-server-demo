package dog.sneaky.demo.data.eneity;

import dog.sneaky.demo.data.EntityID;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.relational.core.mapping.Table;

import java.time.Instant;


@Getter
@Setter
@Table("logs")
@ToString(callSuper = true)
public class UserLoginLog extends EntityID<Long> {

    private String username;
    private String ipAddress;
    private String loginStatus;
    private String region;
    private String userAgent;
    @CreatedDate
    private Instant createdAt;

}
