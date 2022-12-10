package dog.sneaky.demo.common;


import lombok.extern.slf4j.Slf4j;

// Used directly by client code to run with distributed lock

@Slf4j
public class DistributedLockExecutor {
//
//    private static final Duration MAX_RUN_TIME = Duration.ofMinutes(5);
//
//    private final LockProvider lockProvider;
//
//    public DistributedLockExecutor(LockProvider lockProvider) {
//        this.lockProvider = lockProvider;
//    }
//
//    public <T> T execute(Supplier<T> supplier, LockConfiguration configuration) {
//        Optional<SimpleLock> lock = lockProvider.lock(configuration);
//        if (!lock.isPresent()) {
//            log.warn("Failed to obtain lock {}.", configuration.getName());
//            throw new LockAlreadyOccupiedException(configuration.getName());
//        }
//
//        log.debug("Obtained lock {}.", configuration.getName());
//
//        try {
//            log.debug("Run task inside lock {}.", configuration.getName());
//            return supplier.get();
//        } finally {
//            lock.get().unlock();
//            log.debug("Released lock {}.", configuration.getName());
//        }
//    }
//
//    public <T> T execute(Supplier<T> supplier, String lockKey) {
//        LockConfiguration lockConfiguration = new LockConfiguration(Instant.now(), lockKey, MAX_RUN_TIME, MAX_RUN_TIME);
//        return this.execute(supplier, lockConfiguration);
//
//    }
}
