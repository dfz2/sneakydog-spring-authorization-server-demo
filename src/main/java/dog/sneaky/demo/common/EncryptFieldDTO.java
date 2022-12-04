package dog.sneaky.demo.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class EncryptFieldDTO implements Serializable {
    private static final long serialVersionUID = 642849411883768653L;
    private String plainText;
    private String cipherText;
    private String maskText;

    public EncryptFieldDTO withPlainText(String plainText) {
        this.plainText = plainText;
        return this;
    }

}
