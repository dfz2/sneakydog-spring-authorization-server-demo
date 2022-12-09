package dog.sneaky.demo.data.dao;

import dog.sneaky.demo.common.EncryptFieldDTO;
import dog.sneaky.demo.database.dataobject.TestEncryptDO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;


@SpringBootTest
class TestEncryptDAOTest {


    @Autowired
    private TestEncryptDAO testEncryptDAO;

    @Test
    void insert() {
        TestEncryptDO testEncrypt = new TestEncryptDO();
        testEncrypt.setName(new EncryptFieldDTO().withPlainText("1231131333"));
        testEncryptDAO.insert(testEncrypt);
    }

    @Test
    void list() {
        TestEncryptDO r = new TestEncryptDO();
        r.setName(new EncryptFieldDTO().withPlainText("1231313131"));
        List<TestEncryptDO> testEncrypts = testEncryptDAO.list(r);
        testEncrypts.forEach(System.out::println);
    }
}
