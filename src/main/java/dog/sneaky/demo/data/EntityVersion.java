package dog.sneaky.demo.data;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Version;



public abstract class EntityVersion extends EntityID<Long>{
    @Getter
    @Setter
    @Version
    private Integer version;
}
