package dog.sneaky.demo.common;

import static com.google.common.collect.ImmutableMap.of;

public class SystemException extends AppException {
    public SystemException(Throwable cause) {
        super(CommonErrorCode.SYSTEM_ERROR, of("detail", cause.getMessage()), cause);
    }
}
