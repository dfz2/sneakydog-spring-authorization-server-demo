package dog.sneaky.demo.data;


import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.*;

import java.io.Serializable;
import java.time.Instant;




/**
 * @author dfz
 */
@Getter
@Setter
public abstract class AbstractEntity extends Identifier<Long> implements Serializable  {

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





//    @Transient
//    @JsonIgnore
//    private boolean newEntity = true;
//
//    public void setNew(boolean newInstance) {
//        this.newEntity = newInstance;
//    }
//
//    @JsonIgnore
//    @Override
//    public final boolean isNew() {
//        return this.newEntity;
//    }
}
