package dog.sneaky.demo.controllers.controller.dto;


import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
public class MenuDTO extends DTO implements Serializable {


    @JsonSerialize(using = ToStringSerializer.class)
    private Long menuId;
    private String menuName;
    private String parentName;
    @JsonSerialize(using = ToStringSerializer.class)
    private Long parentId;
    private String orderNum;
    private String url;
    private String perms;
    private String target;
    private String menuType;
    private String visible;
    private String icon;
    private List<MenuDTO> childs = new ArrayList<>();
}
