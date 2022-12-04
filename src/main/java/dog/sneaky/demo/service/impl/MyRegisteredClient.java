package dog.sneaky.demo.service.impl;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;

import java.util.Set;
import java.util.stream.Collectors;


@Getter
@Setter
public class MyRegisteredClient extends RegisteredClient {

    private String id;
    private String clientId;
    private String clientSecret;
    private Set<String> methods;
    private Set<String> grantTypes;
    private Set<String> redirectUris;
    private Set<String> scopes;
//    private ClientSettings clientSettings;
//    private TokenSettings tokenSettings;


    @JsonIgnore
    @Override
    public Set<ClientAuthenticationMethod> getClientAuthenticationMethods() {
        return methods.stream().map(ClientAuthenticationMethod::new).collect(Collectors.toSet());
    }


    //
//    @JsonIgnore
//    public RegisteredClient createMyRegisteredClient(){
//        RegisteredClient registeredClient = RegisteredClient
//                .withId(getId())
//                .clientId(getClientId())
//                .clientSecret(getClientSecret())
//                .clientAuthenticationMethods(r -> r = myClientAuthenticationMethods.stream().map(ClientAuthenticationMethod::new).collect(Collectors.toSet()))
//                .authorizationGrantTypes(r-> r = myAuthorizationGrantTypes.stream().map(AuthorizationGrantType::new).collect(Collectors.toSet()))
//                .redirectUris(r->r = getRedirectUris())
//                .scopes(r-> r= getScopes())
//                .clientSettings(Settings::settings)
//                .tokenSettings(TokenSettings::settings)
//                .build();
//        return  registeredClient;
//    }

}
