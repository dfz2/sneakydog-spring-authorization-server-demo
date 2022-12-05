package dog.sneaky.demo.data;


import lombok.Data;
import org.springframework.data.annotation.*;
import org.springframework.data.domain.Persistable;
import org.springframework.data.mapping.PersistentEntity;
import org.springframework.data.support.IsNewStrategy;

import java.time.Instant;




/**
 * @author dfz
 */
@Data
public abstract class AbstractEntity<T> implements Persistable<T> {
    @Id
    private T id;
    @CreatedDate
    private Instant createdAt;
    @CreatedBy
    private String createdBy;
    @LastModifiedDate
    private Instant modifiedAt;
    @LastModifiedBy
    private String modifiedBy;
    @Version
    private Integer version;




    @Transient
    @Override
    public final boolean isNew() {
        return true;
    }
}
