package dog.sneaky.demo.service;

import dog.sneaky.demo.data.eneity.UserLoginLog;
import dog.sneaky.demo.userinterface.controller.dto.UserLoginLogsDTO;

import java.util.List;

public interface LogsService {
    List<UserLoginLog> listLogs();
}
