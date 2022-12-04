package dog.sneaky.demo.data;


import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import lombok.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.Instant;




@Getter
@Setter
@RequiredArgsConstructor
@EntityListeners(AuditingEntityListener.class)
@MappedSuperclass
public abstract class BaseEntity {
    @Id
    private Long id;
    @CreatedDate
    private Instant createAt;
    @CreatedBy
    private String createBy;
    @LastModifiedDate
    private Instant updateAt;
    @LastModifiedBy
    private String updateBy;
}
