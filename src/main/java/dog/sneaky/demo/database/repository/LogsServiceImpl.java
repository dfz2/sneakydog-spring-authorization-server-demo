package dog.sneaky.demo.database.repository;

import dog.sneaky.demo.service.LogsService;
import dog.sneaky.demo.userinterface.controller.dto.UserLoginLogsDTO;
import dog.sneaky.demo.database.dao.LogsDAO;
import groovy.util.logging.Slf4j;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Component
@AllArgsConstructor
public class LogsServiceImpl implements LogsService {
    private final LogsDAO logsDAO;

    @Override
    public List<UserLoginLogsDTO> listLogs() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return logsDAO
                .listLogsByUsername(username)
                .stream()
                .map(r -> new UserLoginLogsDTO(
                        r.getUsername(),
                        r.getIpAddress(),
                        r.getRegion(),
                        r.getUserAgent(),
                        r.getCreatedAt(),
                        r.getLoginStatus())
                )
                .collect(Collectors.toList());
    }
}
