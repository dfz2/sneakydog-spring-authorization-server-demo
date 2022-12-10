package dog.sneaky.demo.controllers;


import dog.sneaky.demo.configuration.KeyGeneratorUtils;
import dog.sneaky.demo.controllers.controller.dto.LocalLoginDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Key;
import java.security.KeyPair;
import java.util.UUID;


@Slf4j
@Controller
public class LoginController {

    @Value("${spring.captcha.enabled:false}")
    private boolean springSecurityCaptchaEnabled;
    @Autowired
    private LocalLoginDTO localLoginDTO;



    @GetMapping({"/login", "/login.html"})
    public String login(Model model, HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && !(authentication instanceof AnonymousAuthenticationToken)) {
            log.info("用户[" + authentication.getName() + "]已经登录");
            return "redirect:/";
        } else {

            request.setAttribute("localLoginDTO", localLoginDTO);

            HttpSession session = request.getSession();
            Object springSecurityLastUsername = session.getAttribute("SPRING_SECURITY_LAST_USERNAME");
            if (springSecurityLastUsername != null) {
                session.removeAttribute("SPRING_SECURITY_LAST_USERNAME");
                model.addAttribute("SPRING_SECURITY_LAST_USERNAME", springSecurityLastUsername);
            }

            KeyPair keyPair = KeyGeneratorUtils.generateRsaKey();
            Key publicKey = keyPair.getPublic();
            Key privateKey = keyPair.getPrivate();
            byte[] publicKeyBytes = publicKey.getEncoded();
            byte[] privateKeyBytes = privateKey.getEncoded();
            String publicKeyBase64 = Base64.encodeBase64String(publicKeyBytes);
            String privateKeyBase64 = Base64.encodeBase64String(privateKeyBytes);

            String uuid = UUID.randomUUID().toString();
            model.addAttribute("uuid", uuid);
            model.addAttribute("publicKey", publicKeyBase64);
            model.addAttribute("SPRING_SECURITY_CAPTCHA_ENABLED", springSecurityCaptchaEnabled);
            session.setAttribute(publicKeyBase64, privateKeyBase64);

            return "login2";

        }

    }


}
