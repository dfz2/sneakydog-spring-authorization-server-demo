package dog.sneaky.demo.data.rowmappers;

import dog.sneaky.demo.data.eneity.CustomUser;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomUserRowMapper implements RowMapper<CustomUser> {
    @Override
    public CustomUser mapRow(ResultSet rs, int rowNum) throws SQLException {
        CustomUser customUser = new CustomUser();
        customUser.setId(rs.getLong("id"));
        customUser.setUsername(rs.getString("username"));
        customUser.setPassword(rs.getString("password"));
        return customUser;
    }
}
