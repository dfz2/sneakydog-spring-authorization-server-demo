package dog.sneaky.demo.configuration.login4;


import dog.sneaky.demo.configuration.KeyGeneratorUtils;
import dog.sneaky.demo.configuration.mfa.MfaAuthentication;
import dog.sneaky.demo.controllers.BaseController;
import dog.sneaky.demo.controllers.controller.dto.LocalLoginDTO;
import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.data.repository.CustomUserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Key;
import java.security.KeyPair;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@Controller
@RequiredArgsConstructor
@ConditionalOnProperty(prefix = "spring.security.login" , name = "type", havingValue = "login4")
public class Login4Controller extends BaseController {
    @Value("${spring.captcha.enabled:false}")
    private boolean springSecurityCaptchaEnabled;
    @Autowired
    private LocalLoginDTO localLoginDTO;

    private final CustomUserRepository customUserRepository;

    @GetMapping({"/login", "/login.html"})
    public String login3(Model model, HttpServletRequest request){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && !(authentication instanceof AnonymousAuthenticationToken)&& !(authentication instanceof MfaAuthentication)) {
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

            return "login4";

        }
    }

    @PostMapping({"/login4", "/login4.html"})
    public String login333(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        String jUsername = request.getParameter("j_username");
        Optional<CustomUser> userByUsername = customUserRepository.getUserByUsername(jUsername);
        if (userByUsername.isEmpty()){
            return redirect("login?error");
        }

        redirectAttributes.addFlashAttribute("login4", "asetataett");
        redirectAttributes.addFlashAttribute("lgoinuid", jUsername);
        return redirect("login?preparelogin=12315ngdnsodssdagnllkaskdnlgasndlnagkjasndmgalsndgalsdngaldgnaslgnaldgk");
    }

    @GetMapping("/pwderror")
    public String pwderror(HttpServletRequest request,RedirectAttributes redirectAttributes){
        String jUsername = request.getParameter("j_username");
        redirectAttributes.addFlashAttribute("lgoinuid", jUsername);
        return redirect("login?error");
    }
}
