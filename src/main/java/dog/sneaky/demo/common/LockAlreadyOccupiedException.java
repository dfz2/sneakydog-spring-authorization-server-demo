package dog.sneaky.demo.common;


import com.google.common.collect.ImmutableMap;

public class LockAlreadyOccupiedException extends AppException {

    public LockAlreadyOccupiedException(String lockKey) {
        super(CommonErrorCode.LOCK_OCCUPIED, ImmutableMap.of("lockKey", lockKey));
    }
}
