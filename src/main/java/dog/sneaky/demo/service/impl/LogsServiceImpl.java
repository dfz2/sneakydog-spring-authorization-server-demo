package dog.sneaky.demo.service.impl;

import dog.sneaky.demo.data.eneity.UserLoginLog;
import dog.sneaky.demo.data.repository.UserLoginLogRepository;
import dog.sneaky.demo.service.LogsService;
import dog.sneaky.demo.userinterface.controller.dto.UserLoginLogsDTO;
import dog.sneaky.demo.database.dao.LogsDAO;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Component
@RequiredArgsConstructor
public class LogsServiceImpl implements LogsService {
    private final LogsDAO logsDAO;
    private final UserLoginLogRepository userLoginLogRepository;

    @Override
    public List<UserLoginLog> listLogs() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return userLoginLogRepository.findByUsernameOrderByCreatedAtDesc(username);
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
