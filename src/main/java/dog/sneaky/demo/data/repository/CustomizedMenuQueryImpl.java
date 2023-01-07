package dog.sneaky.demo.data.repository;

import dog.sneaky.demo.data.eneity.Menus;
import dog.sneaky.demo.data.rowmappers.MenusRowMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@Component
class CustomizedMenuQueryImpl implements CustomizedMenuQuery<Menus>{

    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Override
    public List<Menus> getAllByUsername(String username) {
        String sql = "SELECT menus.* " +
                "FROM users " +
                "INNER JOIN user_role ON users.id = user_role.userId " +
                "INNER JOIN role_menus ON user_role.roleId = role_menus.roleId " +
                "INNER JOIN menus ON menus.id = role_menus.menuId " +
                "WHERE menus.deleted = 'N' " +
                "  AND users.username = :username";
        return namedParameterJdbcTemplate.query(sql, Map.of("username", username), new MenusRowMapper());
    }

    @Override
    public List<Menus> getAll() {
        String sql = "SELECT menus.* FROM menus WHERE menus.deleted = 'N' ";
        return namedParameterJdbcTemplate.query(sql, Map.of(), new MenusRowMapper());
    }
}
