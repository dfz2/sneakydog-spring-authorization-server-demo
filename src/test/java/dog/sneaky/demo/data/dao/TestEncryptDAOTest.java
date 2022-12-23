package dog.sneaky.demo.data.dao;

import dog.sneaky.demo.data.eneity.Role;
import dog.sneaky.demo.data.repository.RoleRepository;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;


@SpringBootTest
class TestEncryptDAOTest {


    @Resource
    private RoleRepository roleRepository;



    @Test
    public void test2(){

        Role entity = new Role();
        entity.setRoleName("testasdagagd");
        roleRepository.save(entity);



        List<String> roleTestList = roleRepository.getRoleTestList();
        System.out.println(roleTestList.size());

    }

}
