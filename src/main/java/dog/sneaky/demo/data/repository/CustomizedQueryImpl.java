package dog.sneaky.demo.data.repository;

import dog.sneaky.demo.data.eneity.Role;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;


@Slf4j
@Repository
@RequiredArgsConstructor
public class CustomizedQueryImpl implements CustomizedQuery<Role> {

    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<String> getRoleTestList() {
        return jdbcTemplate.queryForList("select roleName from roles", String.class);
    }
}
