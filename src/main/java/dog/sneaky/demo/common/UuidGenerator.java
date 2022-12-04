package dog.sneaky.demo.common;

import java.nio.ByteBuffer;
import java.util.Base64;
import java.util.UUID;

public class UuidGenerator {

    private static final Base64.Encoder ENCODER = Base64.getUrlEncoder();

    public static String newBase64Uuid() {
        UUID uuid = UUID.randomUUID();
        byte[] src = ByteBuffer.wrap(new byte[16])
                .putLong(uuid.getMostSignificantBits())
                .putLong(uuid.getLeastSignificantBits())
                .array();
        return ENCODER.encodeToString(src).substring(0, 22);
    }

    public static String newUuid() {
        return UUID.randomUUID().toString();
    }

}
