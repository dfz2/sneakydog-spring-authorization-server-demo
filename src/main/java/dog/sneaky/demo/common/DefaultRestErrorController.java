package dog.sneaky.demo.common;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import java.util.Map;

import static com.google.common.collect.ImmutableMap.of;
import static dog.sneaky.demo.common.CommonErrorCode.SYSTEM_ERROR;

@Slf4j
//@RestController
public class DefaultRestErrorController {

    private static final String PATH = "/error";

    @Autowired
    private ErrorAttributes errorAttributes;

    @RequestMapping(value = PATH)
    public ResponseEntity<?> handleError(WebRequest webRequest) {
        Map<String, Object> errorAttributes = getErrorAttributes(webRequest);
        String error = (String) errorAttributes.get("error");
        int status = (int) errorAttributes.get("status");
        String message = (String) errorAttributes.get("message");
        String path = (String) errorAttributes.get("path");
        log.error("Error occurred while access[{}]:{}", path, error);
        ErrorRepresentation.ErrorDetail errorDetail = new ErrorRepresentation.ErrorDetail(SYSTEM_ERROR.getCode(),
                status,
                error,
                path,
                of("detail", message));

        return new ResponseEntity<>(new ErrorRepresentation(errorDetail), new HttpHeaders(), HttpStatus.valueOf(status));
    }

//    @Override
//    public String getErrorPath() {
//        return PATH;
//    }

    private Map<String, Object> getErrorAttributes(WebRequest webRequest) {
        return errorAttributes.getErrorAttributes(webRequest, ErrorAttributeOptions.of(ErrorAttributeOptions.Include.STACK_TRACE));
    }

//    @Override
//    public String getErrorPath() {
//        return null;
//    }
}
