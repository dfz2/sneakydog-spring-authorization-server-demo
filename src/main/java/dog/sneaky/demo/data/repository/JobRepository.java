package dog.sneaky.demo.data.repository;

import dog.sneaky.demo.data.eneity.Job;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface JobRepository extends CrudRepository<Job, Long>, PagingAndSortingRepository<Job, Long> {
}
