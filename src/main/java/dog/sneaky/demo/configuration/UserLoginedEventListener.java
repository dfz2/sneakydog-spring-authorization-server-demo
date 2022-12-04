package dog.sneaky.demo.configuration;


import dog.sneaky.demo.common.IPUtil;
import dog.sneaky.demo.database.dao.LogsDAO;
import dog.sneaky.demo.database.dataobject.LogsDO;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Slf4j
@Component
@AllArgsConstructor
public class UserLoginedEventListener {
    private final LogsDAO logsDAO;

    @EventListener
    // 可以使用 AuthenticationSuccessEvent
    public void userLoginedEvent(UserLoginedEvent userLoginedEvent) {
        LogsDO logs = new LogsDO();
        logs.setUsername(userLoginedEvent.getLoginInfoDTO().getUsername());
        logs.setUserAgent(userLoginedEvent.getLoginInfoDTO().getUserAgent());
        logs.setIpAddress(userLoginedEvent.getLoginInfoDTO().getIpAddress());
        logs.setRegion(userLoginedEvent.getLoginInfoDTO().getRegion());
        logs.setLoginStatus(userLoginedEvent.getLoginInfoDTO().getLoginStatus());
        logsDAO.insert(logs);
    }


    @EventListener
    // AuthenticationFailureBadCredentialsEvent 可以使用
    public void authenticationFailureBadCredentialsEvent(AuthenticationFailureBadCredentialsEvent authenticationFailureBadCredentialsEvent) {
        LogsDO logs = new LogsDO();
        Authentication authentication = authenticationFailureBadCredentialsEvent.getAuthentication();
        String username = authentication.getName();
//        if (authentication.getPrincipal() instanceof User) {
//            username = ((User) authentication.getPrincipal()).getUsername();
//        }
        ServletRequestAttributes ra= (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request =  ra.getRequest();

        String remoteAddr = IPUtil.getClientIP(request);
        String region = IPUtil.getAddressByIP(remoteAddr);

        logs.setUsername(username);
        logs.setUserAgent(request.getHeader("User-Agent"));
        logs.setIpAddress(remoteAddr);
        logs.setRegion(region);
        logs.setLoginStatus("n");
        logsDAO.insert(logs);
    }



}
