package dog.sneaky.demo.service.impl;

import dog.sneaky.demo.data.eneity.UserLoginLog;
import dog.sneaky.demo.data.repository.UserLoginLogRepository;
import dog.sneaky.demo.service.LogsService;
import groovy.util.logging.Slf4j;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class LogsServiceImpl implements LogsService {
    private final UserLoginLogRepository userLoginLogRepository;

    @Override
    public List<UserLoginLog> listLogs() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        List<UserLoginLog> userLoginLogs = userLoginLogRepository.getTop10ByUsernameOrderByCreatedAtDesc(username);
        return userLoginLogs;
//        return logsDAO
//                .listLogsByUsername(username)
//                .stream()
//                .map(r -> new UserLoginLogsDTO(
//                        r.getUsername(),
//                        r.getIpAddress(),
//                        r.getRegion(),
//                        r.getUserAgent(),
//                        r.getCreatedAt(),
//                        r.getLoginStatus())
//                )
//                .collect(Collectors.toList());
    }
}
