package dog.sneaky.demo.common.util;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.UUID;



@Slf4j
@UtilityClass
public class AesCryptoUtil {

    private static final String KEY_ALGORITHM = "AES";
    private static final String DEFAULT_CIPHER_ALGORITHM = "AES/ECB/PKCS5Padding";

    // appKey,每隔一段时间进行替换即可
    // 可以设计成保存到数据库中或者那里，然后进行每隔一段时间进行替换，增加保密的安全性
    private static final String appKey = "fa8f92af-fa83-443a-9626-e32b64481325";


    public static String encryptToString(String content, String aesKey) {
        try {
            Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);
            byte[] byteContent = content.getBytes(StandardCharsets.UTF_8);
            cipher.init(Cipher.ENCRYPT_MODE, getSecretKey(aesKey));
            byte[] result = cipher.doFinal(byteContent);
            return Base64.encodeBase64String(result);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static String decryptToString(String content, String aesKey) {
        try {
            Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, getSecretKey(aesKey));
            byte[] result = cipher.doFinal(Base64.decodeBase64(content));
            return new String(result, StandardCharsets.UTF_8);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        }

        return null;
    }


    private static SecretKeySpec getSecretKey(String aesKey) {
        try {
            KeyGenerator keyGenerator = KeyGenerator.getInstance(KEY_ALGORITHM);
            SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
            secureRandom.setSeed(aesKey.getBytes());
            keyGenerator.init(128, secureRandom);
            SecretKey secretKey = keyGenerator.generateKey();
            return new SecretKeySpec(secretKey.getEncoded(), KEY_ALGORITHM);// 转换为AES专用密钥
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        // for (int i = 0; i < 10; i++) {
        // String userNo = "410725666659845865" + i;
        // System.out.println("未加密的身份证号码userNo: " + userNo);
        // String s1 = AESUtil.encrypt(userNo, AESUtil.appKey);
        // System.out.println("加密的身份证号码userNo: " + s1);
        // }

        String userNo = "410725666659845865";
        System.out.println("未加密的身份证号码userNo: " + userNo);
        String encryptUserNo = AesCryptoUtil.encryptToString(userNo, AesCryptoUtil.appKey);
        System.out.println("加密的身份证号码userNo: " + encryptUserNo);
        System.out.println("加密的身份证号码userNo: " + AesCryptoUtil.encryptToString(userNo, AesCryptoUtil.appKey));

        String decryptUserNo = AesCryptoUtil.decryptToString(encryptUserNo, AesCryptoUtil.appKey);
        System.out.println("解密的身份证号码userNo: " + decryptUserNo);

        System.out.println(UUID.randomUUID().toString());

        //
        // // 直接使用AESUtil类调用静态方法decrypt，将加密的身份证号码、密钥appKey传进去即可。
        // String decryptUserNo = AESUtil.decrypt(s1, appKey);
        // System.out.println("解密的身份证号码userNo:" + decryptUserNo);
    }

}
