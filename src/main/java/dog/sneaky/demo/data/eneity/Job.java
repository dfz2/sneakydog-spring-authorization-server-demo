package dog.sneaky.demo.data.eneity;

import dog.sneaky.demo.data.EntityID;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;


@Getter
@Setter
@Table("jobs")
public class Job extends EntityID<Long> {
    private String jobName;
    private String jobGroup;
    private String invokeTarget;
    private String cronExpression;
    private String misfirePolicy;
    private String concurrent;
    private String status;
}
