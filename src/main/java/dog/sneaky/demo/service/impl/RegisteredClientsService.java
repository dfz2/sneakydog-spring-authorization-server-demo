package dog.sneaky.demo.service.impl;


import com.github.pagehelper.Page;
import dog.sneaky.demo.common.UuidGenerator;
import dog.sneaky.demo.userinterface.oauth2clients.RegisteredClientsDTO;
import dog.sneaky.demo.userinterface.controller.dto.ResetClientSecretCommand;
import dog.sneaky.demo.database.dao.MyUserDAO;
import dog.sneaky.demo.database.dao.RegisteredClientsDAO;
import dog.sneaky.demo.database.dataobject.MyUserDO;
import dog.sneaky.demo.database.dataobject.RegisteredClientsDO;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.core.oidc.OidcScopes;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;


@AllArgsConstructor
@Component
public class RegisteredClientsService {
    private final RegisteredClientRepository registeredClientRepository;
    private final RegisteredClientsDAO registeredClientsDAO;
    private final MyUserDAO myUserDAO;
    private final PasswordEncoder passwordEncoder;

    public RegisteredClientsDTO list(RegisteredClientsDTO registeredClientsDTO) {

        RegisteredClientsDO rcQuery = new RegisteredClientsDO();
        rcQuery.setPageNum(registeredClientsDTO.getPageNum());
        rcQuery.setPageSize(registeredClientsDTO.getPageSize());
        Page<RegisteredClientsDO> registeredClients = registeredClientsDAO.list(rcQuery);

        List<RegisteredClientsDTO> registeredClientsDTOs = registeredClients.stream().map(this::convert).collect(Collectors.toList());
        RegisteredClientsDTO rCDTO = new RegisteredClientsDTO();
        rCDTO.setTotal(registeredClients.getTotal());
        rCDTO.setRows(registeredClientsDTOs);
        return rCDTO;
    }

    public void save(ResetClientSecretCommand resetClientSecretCommand) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        MyUserDO myUser =  myUserDAO.loadByUsername(username);
        if (myUser != null) {
            String userPassword = resetClientSecretCommand.getPassword();
            if (!passwordEncoder.matches(userPassword, myUser.getPassword())){
                throw new RuntimeException("Password Error.");
            } else {
                RegisteredClientsDTO registeredClientsDTO = resetClientSecretCommand.getRegisteredClientsDTO();
                RegisteredClientsDO dbRc = registeredClientsDAO.loadById(registeredClientsDTO.getClientId());
                if (dbRc != null && registeredClientsDTO.getClientSecret() != null) {
                    dbRc.setClientSecret(passwordEncoder.encode(registeredClientsDTO.getClientSecret()));
                    registeredClientsDAO.update(dbRc);
                }
            }
        }
    }

    private RegisteredClientsDTO convert(RegisteredClientsDO registeredClient) {
        RegisteredClientsDTO registeredClientsDTO = new RegisteredClientsDTO();
        BeanUtils.copyProperties(registeredClient, registeredClientsDTO);
        return registeredClientsDTO;
    }

    public void save(RegisteredClientsDTO registeredClientsDTO) {
        RegisteredClient registeredClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId(UuidGenerator.newUuid())
                .clientSecret(passwordEncoder.encode(registeredClientsDTO.getClientSecret()))
                .clientName(registeredClientsDTO.getClientName())
                .clientAuthenticationMethods(cam->{
                    cam.add(ClientAuthenticationMethod.CLIENT_SECRET_BASIC);
                    cam.add(ClientAuthenticationMethod.CLIENT_SECRET_POST);
                })
                .authorizationGrantTypes(authorizationGrantTypes -> {
                    authorizationGrantTypes.add(AuthorizationGrantType.AUTHORIZATION_CODE);
                    authorizationGrantTypes.add(AuthorizationGrantType.REFRESH_TOKEN);
                    authorizationGrantTypes.add(AuthorizationGrantType.CLIENT_CREDENTIALS);
                })
                .redirectUri(registeredClientsDTO.getRedirectUris())
                .scope(OidcScopes.OPENID)
//                .tokenSettings(tokenSettings -> new TokenSettings() )
//                .clientSettings(clientSettings -> clientSettings.requireUserConsent(true))
                .build();
        registeredClientRepository.save(registeredClient);
    }
}
