package dog.sneaky.demo.common;


import com.fasterxml.jackson.annotation.JsonProperty;
import dog.sneaky.demo.common.DTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
public class ZtreeDTO extends DTO {
    private Long id;
    @JsonProperty("pId")
    private Long pId;
    private String name;
}
