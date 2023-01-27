package dog.sneaky.demo.configuration.login4;


import dog.sneaky.demo.common.MenuDTO;
import dog.sneaky.demo.configuration.mfa.CodeErrorAuthenticationException;
import dog.sneaky.demo.configuration.mfa.MfaAuthentication;
import dog.sneaky.demo.configuration.mfa.MfaAuthenticationHandler;
import dog.sneaky.demo.configuration.mfa.MfaService;
import dog.sneaky.demo.controllers.BaseController;
import dog.sneaky.demo.data.eneity.Menus;
import dog.sneaky.demo.data.repository.MenusRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequiredArgsConstructor
@ConditionalOnProperty(prefix = "spring.security.login" , name = "type", havingValue = "login4")
public class Login4MfaController extends BaseController {
    private final AuthenticationSuccessHandler successHandler;
    private final MfaService mfaService;

    private final MenusRepository menusRepository;

    private final StringRedisTemplate stringRedisTemplate;


    @GetMapping({"/second-factor4", "/second-factor4.html"})
    public String requestSecondFactor(HttpServletRequest request, HttpServletResponse response) {
        Object errorMessage = request.getSession().getAttribute("errorMessage");
        if (!ObjectUtils.isEmpty(errorMessage)){
            request.getSession().removeAttribute("errorMessage");
            request.setAttribute("errorMessage", errorMessage);
        }
        return "second-factor4";
    }



    @PostMapping("/second-factor4")
    public void processSecondFactor(@RequestParam("code") String code, MfaAuthentication authentication, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = authentication.getName();
        if (Boolean.TRUE.equals(stringRedisTemplate.hasKey(name))) {
            String s = stringRedisTemplate.opsForValue().get(name);
            if (s != null && s.equals(code)) {
                Authentication oldAuthentication = authentication.getAuthentication();
                SecurityContextHolder.getContext().setAuthentication(oldAuthentication);
                request.getSession().setAttribute("menuDTOS", test());
                this.successHandler.onAuthenticationSuccess(request, response, oldAuthentication);
            } else {
                MfaAuthenticationHandler mfaAuthenticationHandler = new MfaAuthenticationHandler("/second-factor4.html?error=asdgadgandgioasdjnsadgosadndgoa");
                request.getSession().setAttribute("errorMessage", " Email Verify Code Error");
                request.getSession().setAttribute("errorUsername", name);
                mfaAuthenticationHandler.onAuthenticationFailure(request, response, new CodeErrorAuthenticationException("bad credentials", authentication.getAuthentication()));
            }
        } else {
            SecurityContextHolder.clearContext();
            response.sendRedirect("/login.html");
            // 如果是过期
//            MfaAuthenticationHandler mfaAuthenticationHandler = new MfaAuthenticationHandler("/second-factor.html");
//            request.getSession().setAttribute("errorMessage", " Email Verify Code Error");
//            request.getSession().setAttribute("errorUsername", name);
//            mfaAuthenticationHandler.onAuthenticationFailure(request, response, new BadCredentialsException("bad credentials"));
        }
    }




    private List<MenuDTO> test(){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();  // 正确方式
        List<Menus> menusList = menusRepository.getAllByUsername(username);
        List<MenuDTO> menuDTOS = new ArrayList<>();

        for (Menus myMenu : menusList) {
            if (!"B".equals(myMenu.getMenuType())){
                if (myMenu.getParentId() == 0L) {
                    MenuDTO parentMenu = new MenuDTO();
                    parentMenu.setMenuId(myMenu.getId());
                    parentMenu.setMenuName(myMenu.getMenuName());
                    parentMenu.setIcon("fas fa-tachometer-alt");
                    menuDTOS.add(parentMenu);
                }
            }
        }

        for (MenuDTO menuDTO : menuDTOS) {
            for (Menus myMenu : menusList) {
                if (menuDTO.getMenuId().equals(myMenu.getParentId())) {
                    MenuDTO child = new MenuDTO();
                    child.setParentName(menuDTO.getMenuName());
                    child.setMenuName(myMenu.getMenuName());
                    child.setMenuId(myMenu.getId());
                    child.setParentId(menuDTO.getMenuId());
                    child.setUrl(myMenu.getUrl());
                    child.setIcon("far fa-circle");
                    menuDTO.getChilds().add(child);
                }
            }
        }

        return menuDTOS;
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
