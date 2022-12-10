package dog.sneaky.demo.controllers;


import com.nimbusds.jose.JWSObject;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.MACVerifier;
import dog.sneaky.demo.controllers.controller.dto.ResetDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ResetController {

    @GetMapping("/reset")
    public String reset(@RequestParam("token") String token) throws Exception{
        JWSObject jwsObject = JWSObject.parse(token);
        JWSVerifier jwsVerifier = new MACVerifier("devtest");
        if (!jwsObject.verify(jwsVerifier)){
            throw new RuntimeException("链接错误错误");
        }
        return "reset";
    }

    @PostMapping("/reset")
    public String reset(ResetDTO resetDTO){
        return "redirect:/login";
    }
}
