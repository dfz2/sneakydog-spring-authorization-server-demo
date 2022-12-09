package dog.sneaky.demo.data.eneity;

import dog.sneaky.demo.data.Identifier;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;


@Getter
@Setter
@Table("users")
public class CustomUser extends Identifier<Long> {
    private String username;
    private String password;
    private String enabled;
}


