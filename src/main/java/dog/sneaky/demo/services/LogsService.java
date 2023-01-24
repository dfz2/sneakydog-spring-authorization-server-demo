package dog.sneaky.demo.services;

import dog.sneaky.demo.data.eneity.UserLoginLog;

import java.util.List;

public interface LogsService {
    List<UserLoginLog> listLogs();
}
