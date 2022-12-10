package dog.sneaky.demo.controllers.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginLogsDTO {
    private String username;
    private String ipAddress;
    private String region;
    private String userAgent;
    private Date createdAt;
    private String loginStatus;
}
