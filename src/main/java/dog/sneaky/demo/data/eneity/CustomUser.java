package dog.sneaky.demo.data.eneity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;


@Setter
@Getter
@Entity
@Table(name = "users")
public class CustomUser {
    @Id
    private Long id;
    private String username;
    private String password;
    @Transient
    private List<String> perms = new ArrayList<>();

}
