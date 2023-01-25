package dog.sneaky.demo.data.repository;

import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.data.rowmappers.CustomUserRowMapper;
import dog.sneaky.demo.data.rowmappers.SimpleGrantedAuthorityRowMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Map;
import java.util.Optional;


@Slf4j
@Component
@RequiredArgsConstructor
class CustomizedCustomUserQueryImpl implements CustomizedCustomUserQuery<CustomUser>{

    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    private final JdbcTemplate jdbcTemplate;


    @Override
    public Optional<CustomUser> getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE enabled = '1' AND username = :username";
        try {
            CustomUser customUser = namedParameterJdbcTemplate.queryForObject(sql, Map.of("username", username), new CustomUserRowMapper());
            return Optional.ofNullable(customUser);
        } catch (EmptyResultDataAccessException e){
            log.debug("username["+username+"] not found!!");
            return Optional.empty();
        }
    }

    @Override
    public Collection<SimpleGrantedAuthority> getAuthoritiesByUserId(Long userId) {

        String sql = "SELECT menus.perms FROM user_role " +
                "INNER JOIN role_menus ON user_role.roleId = role_menus.roleId " +
                "INNER JOIN menus ON menus.id = role_menus.menuId " +
                "WHERE user_role.userId = :userId";

        return namedParameterJdbcTemplate.query(sql, Map.of("userId", userId), new SimpleGrantedAuthorityRowMapper());
    }





}
