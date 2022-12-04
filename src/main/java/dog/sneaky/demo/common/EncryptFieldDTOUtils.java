package dog.sneaky.demo.common;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class EncryptFieldDTOUtils {
    private EncryptFieldDTOUtils(){}

    public static String encode(String plainText){
        return Base64.getEncoder().encodeToString(plainText.getBytes(StandardCharsets.UTF_8));
    }

    public static String decode(String cipherText){
        return new String(Base64.getDecoder().decode(cipherText.getBytes(StandardCharsets.UTF_8)));
    }

}
