package dog.sneaky.demo.controllers.controller.dto;


import dog.sneaky.demo.common.DTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString(callSuper = true)
public class OnlineUsersDTO extends DTO {
    private String username;
    private String ipAddress;
    private String region;
    private String userAgent;
    private Date createdAt;
    private String loginStatus;
}
