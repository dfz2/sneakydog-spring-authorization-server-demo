package dog.sneaky.demo.data.rowmappers;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SimpleGrantedAuthorityRowMapper implements RowMapper<SimpleGrantedAuthority> {
    @Override
    public SimpleGrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
        String perms = rs.getString("perms");
        return new SimpleGrantedAuthority(perms);
    }
}
