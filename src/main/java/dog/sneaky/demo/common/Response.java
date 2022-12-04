package dog.sneaky.demo.common;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Response<T> {
    private boolean success;
    private String errCode;
    private String errMessage;
    private T data;
}
