package dog.sneaky.demo.controllers;


import dog.sneaky.demo.controllers.controller.dto.ForgotPasswordCommand;
import dog.sneaky.demo.controllers.controller.dto.RecoverPasswordCommand;
import dog.sneaky.demo.service.impl.UserServiceImpl;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.util.UUID;
import java.util.concurrent.TimeUnit;


@Controller
@RequiredArgsConstructor
public class RecoverPasswordController {
    private final UserServiceImpl userService;
    private final TemplateEngine templateEngine;
    private final RedisTemplate<Object, Object> redisTemplate;
    private final JavaMailSender javaMailSender;

    @Value("${spring.application.domain}")
    private String appDoamin;

    @Value("${spring.mail.username}")
    private String serviceEmailAccount;




    @GetMapping("/forgot-password.html")
    public String forgotPassword() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password.html")
    public String forgotPassword(ForgotPasswordCommand forgotPasswordCommand) throws Exception {
//        String tk = JwtUtils.createJWT(new HashMap<String, Object>(){{
//            put("test", forgotPasswordCommand.getUsername());
//        }});

        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        redisTemplate.opsForValue().set(uuid, forgotPasswordCommand.getUsername());
        redisTemplate.expire("uuid", 5L, TimeUnit.MINUTES);
//        String sendLink = String.format("https://demo.oauth2.sneaky.dog/recover-password.html?token=%s", jwtToken);
        String verifyUrl = String.format("%s/recover-password.html?t=%s", appDoamin, uuid);
        sendEmailVerifyURL(forgotPasswordCommand.getUsername(), verifyUrl);
        return "redirect:/login";
    }


    @Async
    public void sendEmailVerifyURL(String username, String verifyUrl) throws MessagingException {
        Context context = new Context();
        context.setVariable("verifyUrl", verifyUrl);
        String text = templateEngine.process("email", context);
        MimeMessage mailMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mailMessage);
        mimeMessageHelper.setSubject("Email test.");
        mimeMessageHelper.setFrom("517233020@qq.com");
        mimeMessageHelper.setTo(username);
        mimeMessageHelper.setText(text, true);
        javaMailSender.send(mailMessage);
    }




//    @PostMapping("/sendLink")
//    public String sendLink(ForgotDTO forgotDTO) throws Exception {
//        String jwtToken = generateJwtToken(forgotDTO);
//        String sendLink = String.format("https://demo.oauth2.sneaky.dog/reset?token=%s", jwtToken);
//
//        Context context = new Context();
//        context.setVariable("verifyUrl", sendLink);
//        String text = templateEngine.process("email", context);
//        MimeMessage mailMessage = javaMailSender.createMimeMessage();
//
//        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mailMessage);
//        mimeMessageHelper.setSubject("Email Verify...");
//        mimeMessageHelper.setFrom("sneakydog@yeah.net");
//        mimeMessageHelper.setTo(forgotDTO.getEmail());
//        mimeMessageHelper.setText(text, true);
//        javaMailSender.send(mailMessage);
//
//        return "redirect:/login";
//    }


    @GetMapping("/recover-password.html")
    public String recoverPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
        String tk = request.getParameter("t");
        if (tk != null && redisTemplate.hasKey(tk)) {
            model.addAttribute("uuid", tk);
            return "recover-password";
        } else {
//            return "404";
            throw new IllegalArgumentException("Param Error.");
        }
    }

    @PostMapping("/recover-password.html")
    public String recoverPassword(RecoverPasswordCommand recoverPasswordCommand) {
        userService.restPassword(recoverPasswordCommand);
        return "redirect:/login";
    }

}
