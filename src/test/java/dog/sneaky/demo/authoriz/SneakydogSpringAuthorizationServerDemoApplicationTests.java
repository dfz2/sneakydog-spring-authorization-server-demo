package dog.sneaky.demo.authoriz;

import dog.sneaky.demo.common.EncryptFieldDTO;
import dog.sneaky.demo.common.UuidGenerator;
import dog.sneaky.demo.database.dao.TestEncryptDAO;
import dog.sneaky.demo.database.dataobject.TestEncryptDO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.core.oidc.OidcScopes;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
//import org.springframework.security.oauth2.server.authorization.config.ClientSettings;
//import org.springframework.security.oauth2.server.authorization.config.TokenSettings;

import java.util.Set;
import java.util.UUID;


@SpringBootTest
class SneakydogSpringAuthorizationServerDemoApplicationTests {


    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private PasswordEncoder passwordEncoder;
//    @Autowired
//    @Qualifier("MyRegisteredClientRepository")


    @Autowired
    private TestEncryptDAO testEncryptDAO;

    @Test
    public void testENC() {
        TestEncryptDO testEncrypt = new TestEncryptDO();
        testEncrypt.setName(new EncryptFieldDTO().withPlainText("1231313131"));
        testEncryptDAO.insert(testEncrypt);
    }


    @Autowired
    private RegisteredClientRepository registeredClientRepository;


    @Test
    public void testRegisteredClient() {
        RegisteredClient registeredClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId(UuidGenerator.newUuid())
                .clientSecret("123456")
                .clientName("sneakydog-spring-cloud-gateway-demo")
                .clientAuthenticationMethods(clientAuthenticationMethods -> {
                            clientAuthenticationMethods.add(ClientAuthenticationMethod.CLIENT_SECRET_POST);
                            clientAuthenticationMethods.add(ClientAuthenticationMethod.CLIENT_SECRET_BASIC);
                            clientAuthenticationMethods.add(ClientAuthenticationMethod.CLIENT_SECRET_JWT);
                            clientAuthenticationMethods.add(ClientAuthenticationMethod.PRIVATE_KEY_JWT);
                        }

                )
                .authorizationGrantTypes(authorizationGrantTypes -> {
                    authorizationGrantTypes.add(AuthorizationGrantType.AUTHORIZATION_CODE);
                    authorizationGrantTypes.add(AuthorizationGrantType.REFRESH_TOKEN);
                    authorizationGrantTypes.add(AuthorizationGrantType.CLIENT_CREDENTIALS);
                })
//                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
//                .authorizationGrantType(AuthorizationGrantType.REFRESH_TOKEN)
//                .authorizationGrantType(AuthorizationGrantType.PASSWORD)
//                .authorizationGrantType(AuthorizationGrantType.CLIENT_CREDENTIALS)
                .redirectUri("https://www.baidu.com")
                .scope(OidcScopes.OPENID)
//                .tokenSettings(TokenSettings.builder().build())
//                .clientSettings(ClientSettings.builder().requireAuthorizationConsent(true).build())
                .build();


        registeredClientRepository.save(registeredClient);
    }

    @Test
    void contextLoads() {
        System.out.println(passwordEncoder.encode("sneakydogTestPasswod12"));
//        System.out.println(passwordEncoder.encode("123456"));
    }


    @Test
    public void testQueryByClientId() {
        RegisteredClient registeredClient = registeredClientRepository.findByClientId("sneakydogTestPasswod12");

        System.out.println(registeredClient);
    }


    @Test
    public void testSession() {
        Set<String> sessionIds = stringRedisTemplate.keys("spring:session:index:org.springframework.session.FindByIndexNameSessionRepository.PRINCIPAL_NAME_INDEX_NAME:*");
        System.out.println(sessionIds.size());
    }
}
