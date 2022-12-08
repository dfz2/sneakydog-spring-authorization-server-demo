package dog.sneaky.demo.data.eneity;

import dog.sneaky.demo.data.Identifier;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.relational.core.mapping.Table;

import java.util.ArrayList;
import java.util.List;


@Data
@Table("users")
public class CustomUser extends Identifier<Long> {

    private String username;
    private String password;

    @Transient
    private List<String> perms = new ArrayList<>();

}
