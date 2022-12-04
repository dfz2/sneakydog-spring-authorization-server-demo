package dog.sneaky.demo.database.dataobject;


import dog.sneaky.demo.common.EncryptFieldDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TestEncryptDO {
    private int id;
    private EncryptFieldDTO name;
}
