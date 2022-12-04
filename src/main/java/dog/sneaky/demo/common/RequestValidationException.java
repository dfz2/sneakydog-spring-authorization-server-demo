package dog.sneaky.demo.common;


import java.util.Map;

public class RequestValidationException extends AppException {

    public RequestValidationException(Map<String, Object> data) {
        super(SpringCommonErrorCode.REQUEST_VALIDATION_FAILED, data);
    }
}
