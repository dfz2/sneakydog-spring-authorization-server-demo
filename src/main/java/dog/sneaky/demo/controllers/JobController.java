package dog.sneaky.demo.controllers;


import dog.sneaky.demo.data.eneity.Job;
import dog.sneaky.demo.data.repository.JobRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequiredArgsConstructor
public class JobController {
    private final JobRepository jobRepository;

    @PreAuthorize("hasAuthority('ROLE_JOB_LIST')")
    @GetMapping("/job/index")
    public String index(){
        return "job/list";
    }

    @PreAuthorize("hasAuthority('ROLE_JOB_LIST')")
    @GetMapping("/job/list")
    @ResponseBody
    public Page<Job> list(Pageable pageable){
        Page<Job> all = jobRepository.findAll(pageable);
        return all;
    }


}
