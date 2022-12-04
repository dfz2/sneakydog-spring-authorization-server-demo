package dog.sneaky.demo.userinterface.controller.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class DTO {
    private Integer pageNum;
    private Integer pageSize;
    private long total;
    private List<?> rows;
}
