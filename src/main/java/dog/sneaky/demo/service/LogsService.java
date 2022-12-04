package dog.sneaky.demo.service;

import dog.sneaky.demo.userinterface.controller.dto.UserLoginLogsDTO;

import java.util.List;

public interface LogsService {
    List<UserLoginLogsDTO> listLogs();
}
