package dog.sneaky.demo.data.eneity;


import dog.sneaky.demo.data.Identifier;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import org.springframework.data.relational.core.mapping.Table;



@Getter
@AllArgsConstructor
@ToString
@Table("user_role")
public class UserRoleRef extends Identifier<Long> {
    private Long userId;
    private Long roleId;
}
