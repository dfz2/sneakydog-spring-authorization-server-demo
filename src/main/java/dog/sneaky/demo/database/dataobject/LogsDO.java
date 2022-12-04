package dog.sneaky.demo.database.dataobject;

import lombok.Data;
import lombok.ToString;

import java.util.Date;


@Data
@ToString
public class LogsDO {
    private String username;
    private String ipAddress;
    private String region;
    private String userAgent;
    private Date createdAt;
    private String loginStatus;

    public LogsDO() {
        this.createdAt = new Date();
    }
}
