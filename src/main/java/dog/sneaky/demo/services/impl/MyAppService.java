package dog.sneaky.demo.services.impl;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;


@Slf4j
@AllArgsConstructor
@Component
public class MyAppService {
//    private final UserClientDAO userClientDAO;
//    private final RegisteredClientsDAO registeredClientsDAO;
//
//    public RegisteredClientsDTO getRegisteredClientByUsername(String username) {
//        RegisteredClientsDTO registeredClientsDTO = new RegisteredClientsDTO();
//        UserClientDO userClient = userClientDAO.loadByUsername(username);
//        if (userClient != null){
//            RegisteredClientsDO registeredClients = registeredClientsDAO.loadById(userClient.getClientId());
//            if (registeredClients != null){
//                registeredClientsDTO.setClientId(registeredClients.getClientId());
//                registeredClientsDTO.setClientSecret(registeredClients.getClientSecret());
//            }
//        }
//        return registeredClientsDTO;
//    }
}
