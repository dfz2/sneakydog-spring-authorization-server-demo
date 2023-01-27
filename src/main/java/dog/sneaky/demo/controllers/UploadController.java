package dog.sneaky.demo.controllers;


import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UploadController extends BaseController{

    @PreAuthorize("hasAuthority('ROLE_DEMO_UPLOAD')")
    @GetMapping("/demo/upload")
    public String uploadindx(){
        return "demo/upload";
    }

    @PreAuthorize("hasAuthority('ROLE_DEMO_UPLOAD')")
    @PostMapping("/demo/upload")
    public String upload(MultipartFile file, Model model, RedirectAttributes redirectAttributes){

        System.out.println(file.getSize());
        return redirect("/demo/upload");
    }

}
