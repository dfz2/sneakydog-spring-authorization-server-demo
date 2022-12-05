package dog.sneaky.demo.data;

import org.springframework.data.jdbc.core.JdbcAggregateOperations;
import org.springframework.data.jdbc.core.convert.JdbcConverter;
import org.springframework.data.jdbc.repository.support.SimpleJdbcRepository;
import org.springframework.data.mapping.PersistentEntity;
import org.springframework.transaction.annotation.Transactional;



@Transactional(readOnly = true)
public class BaseRepositoryImpl<T, ID>  extends SimpleJdbcRepository<T, ID> {

    public BaseRepositoryImpl(JdbcAggregateOperations entityOperations, PersistentEntity<T, ?> entity, JdbcConverter converter) {
        super(entityOperations, entity, converter);
    }


//    @Transactional
//    public <S extends T> S save(S entity) {
//        // implementation goes here
//        System.out.println(123131);
//        return null;
//    }




}
