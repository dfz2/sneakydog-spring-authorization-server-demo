package dog.sneaky.demo.service.impl;


import dog.sneaky.demo.controllers.controller.dto.OnlineUsersDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Component
@Slf4j
@AllArgsConstructor
public class OnlineUsersService {
    private final StringRedisTemplate stringRedisTemplate;

    public OnlineUsersDTO listOnlineUsers(){
        Set<String> sessionIds = stringRedisTemplate.keys("spring:session:index:org.springframework.session.FindByIndexNameSessionRepository.PRINCIPAL_NAME_INDEX_NAME:*");
        OnlineUsersDTO onlineUsersDTO = new OnlineUsersDTO();
        if (sessionIds != null) {
            List<OnlineUsersDTO> onlineUsersDTOS = new ArrayList<>();
            for (String sessionId : sessionIds) {
                String username = sessionId.replace("spring:session:index:org.springframework.session.FindByIndexNameSessionRepository.PRINCIPAL_NAME_INDEX_NAME:", "");
//                LogsDO logs = logsDAO.loadLoginedByUsername(username);
                OnlineUsersDTO obj = new OnlineUsersDTO();
//                obj.setUsername(logs.getUsername());
//                obj.setIpAddress(logs.getIpAddress());
//                obj.setCreatedAt(logs.getCreatedAt());
//                obj.setUserAgent(logs.getUserAgent());
//                obj.setRegion(logs.getRegion());
                onlineUsersDTOS.add(obj);
            }
//            onlineUsersDTO.setRows(onlineUsersDTOS);
        }
        return onlineUsersDTO;
    }

}
