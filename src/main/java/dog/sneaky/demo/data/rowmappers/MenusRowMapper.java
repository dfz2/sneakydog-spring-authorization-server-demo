package dog.sneaky.demo.data.rowmappers;

import dog.sneaky.demo.data.dp.Deleted;
import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.data.eneity.Menus;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MenusRowMapper implements RowMapper<Menus> {
    @Override
    public Menus mapRow(ResultSet rs, int rowNum) throws SQLException {
        Menus menus = new Menus();
        menus.setId(rs.getLong("id"));
        menus.setMenuType(rs.getString("menuType"));
        menus.setParentId(rs.getLong("parentId"));
        menus.setMenuName(rs.getString("menuName"));
        menus.setPerms(rs.getString("perms"));
        menus.setUrl(rs.getString("url"));
        menus.setDeleted(new Deleted(BooleanUtils.toBoolean(rs.getString("deleted"))));
        return menus;
    }
}
