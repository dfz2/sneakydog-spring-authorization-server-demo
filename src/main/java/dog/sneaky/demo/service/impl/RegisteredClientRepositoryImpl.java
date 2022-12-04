package dog.sneaky.demo.service.impl;

import dog.sneaky.demo.common.DefaultObjectMapper;
import dog.sneaky.demo.common.ClientNotFoundException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;

import java.util.Map;

import static com.google.common.collect.ImmutableMap.of;


//@Slf4j
//@Component("MyRegisteredClientRepository")
public class RegisteredClientRepositoryImpl implements RegisteredClientRepository {

    private final DefaultObjectMapper objectMapper = new DefaultObjectMapper();
    private final NamedParameterJdbcTemplate jdbcTemplate;

    public RegisteredClientRepositoryImpl(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void save(RegisteredClient registeredClient) {

    }

    @Override
    public RegisteredClient findById(String id) {
       throw new RuntimeException("不支持");
    }


    @Override
    public RegisteredClient findByClientId(String clientId) {
        try {
            String sql = "SELECT JSON_CONTENT FROM REGISTERED_CLIENT WHERE CLIENT_ID=:clientId;";
            RegisteredClient myRegisteredClient = jdbcTemplate.queryForObject(sql, of("clientId", clientId), (rs, rowNum) -> objectMapper.readValue(rs.getString("JSON_CONTENT"), MyRegisteredClient.class));
            RegisteredClient registeredClient = myRegisteredClient;
            return registeredClient;
//            return registeredClient;
        } catch (EmptyResultDataAccessException e) {
            throw new ClientNotFoundException(clientId);
        }
    }


    public void save(MyRegisteredClient registeredClient) {
        String sql = "INSERT INTO REGISTERED_CLIENT (ID, CLIENT_ID, CLIENT_SECRET, JSON_CONTENT) " +
                "VALUES (:id, :clientId, :clientSecret, :json) ON DUPLICATE KEY UPDATE CLIENT_SECRET=:clientSecret, JSON_CONTENT=:json;";
        Map<String, String> paramMap = of("id", registeredClient.getId(), "clientId", registeredClient.getClientId(), "clientSecret", registeredClient.getClientSecret(), "json", objectMapper.writeValueAsString(registeredClient));
        jdbcTemplate.update(sql, paramMap);
    }

}
