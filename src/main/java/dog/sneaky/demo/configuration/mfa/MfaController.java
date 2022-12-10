package dog.sneaky.demo.configuration.mfa;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequiredArgsConstructor
public class MfaController {

    private final AuthenticationSuccessHandler successHandler;

    private final AuthenticationFailureHandler failureHandler;


    @GetMapping({"/second-factor", "/second-factor.html"})
    public String requestSecondFactor(HttpServletRequest request, HttpServletResponse response) {
        Object errorMessage = request.getSession().getAttribute("errorMessage");
        if (!ObjectUtils.isEmpty(errorMessage)){
            request.getSession().removeAttribute("errorMessage");
            request.setAttribute("errorMessage", errorMessage);
        }
        return "second-factor";
    }



    @PostMapping("/second-factor")
    public void processSecondFactor(@RequestParam("code") String code, MfaAuthentication authentication, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if ("123".equals(code)) {
            Authentication oldAuthentication = authentication.getAuthentication();
            SecurityContextHolder.getContext().setAuthentication(oldAuthentication);
            this.successHandler.onAuthenticationSuccess(request, response, oldAuthentication);
        } else {
            MfaAuthenticationHandler mfaAuthenticationHandler = new MfaAuthenticationHandler("/second-factor.html");
            request.getSession().setAttribute("errorMessage", "code error");
            mfaAuthenticationHandler.onAuthenticationFailure(request, response, new BadCredentialsException("bad credentials"));
        }
    }


//    @GetMapping("/third-factor")
//    public String requestThirdFactor() {
//        return "third-factor";
//    }

//    @PostMapping("/third-factor")
//    public void processThirdFactor(@RequestParam("answer") String answer, MfaAuthentication authentication,
//                                   HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String encodedAnswer = getAnswer(authentication);
//        if (this.encoder.matches(answer, encodedAnswer)) {
//            SecurityContextHolder.getContext().setAuthentication(authentication.getFirst());
//            this.successHandler.onAuthenticationSuccess(request, response, authentication.getFirst());
//        }
//        else {
//            this.failureHandler.onAuthenticationFailure(request, response,
//                    new BadCredentialsException("bad credentials"));
//        }
//    }

//    private String getSecret(MfaAuthentication authentication) throws Exception {
//        if (authentication.getPrincipal() instanceof CustomUser) {
//            CustomUser user = (CustomUser) authentication.getPrincipal();
////            byte[] bytes = Hex.decode(user.getSecret());
//            byte[] bytes = Hex.decode("123");
//            return new String(this.encryptor.decrypt(bytes));
//        }
//        // earlier factor failed
//        return this.failedAuthenticationSecret;
//    }

//    private String getAnswer(MfaAuthentication authentication) {
//        if (authentication.getPrincipal() instanceof CustomUser) {
//            CustomUser user = (CustomUser) authentication.getPrincipal();
//            return user.getAnswer();
//        }
//        // earlier factor failed
//        return this.failedAuthenticationSecurityAnswer;
//    }

//    private static String randomValue() {
//        SecureRandom random = new SecureRandom();
//        byte[] bytes = new byte[20];
//        random.nextBytes(bytes);
//        return new String(Hex.encode(bytes));
//    }
}
