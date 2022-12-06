package dog.sneaky.demo.data;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;



@Getter
@Setter
@ToString
public abstract class AbstractId<T> {
    @Id
    private T id;

}
