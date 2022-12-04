package dog.sneaky.demo.userinterface.controller;


import dog.sneaky.demo.service.impl.MyUserDetailServiceImpl;
import dog.sneaky.demo.userinterface.controller.dto.CheckCAPTCHACommand;
import dog.sneaky.demo.userinterface.controller.dto.CheckCAPTCHADTO;
import dog.sneaky.demo.userinterface.controller.dto.RegisterDTO;
import dog.sneaky.demo.userinterface.controller.dto.UserRegisterCommand;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.concurrent.TimeUnit;


@AllArgsConstructor
//@Controller
public class RegisterController {
    private final MyUserDetailServiceImpl myUserDetailServiceImpl;
    private final RedisTemplate<Object, Object> redisTemplate;
    private final JavaMailSender javaMailSender;

    @GetMapping("/register.html")
    public String register(){
        return "register2";
    }

    @PostMapping("/register")
    public String register(UserRegisterCommand userRegisterCommand){
        RegisterDTO registerDTO = userRegisterCommand.getRegisterDTO();
        registerDTO.setUsername(userRegisterCommand.getUsername());
        myUserDetailServiceImpl.userRegister(registerDTO);
        return "redirect:/login";
    }


    @ResponseBody
    @GetMapping("/checkEmail.html")
    public boolean checkEmail(@RequestParam(name = "t", required = false, defaultValue = "n") String t, @RequestParam("username") String username){
        boolean checkResult = false;
        try {
            myUserDetailServiceImpl.loadUserByUsername(username);
        } catch (UsernameNotFoundException e) {
            checkResult = true;
        }
        return ("n".equals(t) == checkResult);
    }

    @ResponseBody
    @PostMapping("/sendEmailCAPTCHA.html")
    public boolean sendEmailCAPTCHA(CheckCAPTCHACommand checkCAPTCHACommand){
        CheckCAPTCHADTO checkCAPTCHADTO = checkCAPTCHACommand.getCheckCAPTCHADTO();
        if (checkCAPTCHADTO !=null) {
            String username = checkCAPTCHADTO.getUsername();
            String text = RandomStringUtils.randomAlphanumeric(6).toUpperCase();
            if (sendCAPTCHAEmail(username, text)){
                redisCacheCAPTCHA(username, text);
                return true;
            }
        } else {
            return false;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/checkCAPTCHA.html")
    public boolean checkCAPTCHA(CheckCAPTCHADTO checkCAPTCHADTO){
        if (checkCAPTCHADTO.getUsername() != null && checkCAPTCHADTO.getCAPTCHACode() != null) {
            String CAPTCHAKey = checkCAPTCHADTO.getUsername() + "_" + checkCAPTCHADTO.getCAPTCHACode().toUpperCase();
            return redisTemplate.hasKey(CAPTCHAKey);
        } else {
            return false;
        }
    }


    private void redisCacheCAPTCHA(String username, String text) {
        String CAPTCHAKey = username + "_" + text;
        redisTemplate.opsForValue().set(CAPTCHAKey, text);
        redisTemplate.expire(CAPTCHAKey, 5L, TimeUnit.MINUTES);
    }


    private boolean sendCAPTCHAEmail(String username, String text){
        if (username != null && text != null) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setSubject("这是一封测试邮件");
            message.setFrom("service@myhyh.com");
            message.setTo(username);
            message.setSentDate(new Date());
            message.setText(text);
            javaMailSender.send(message);
            return true;
        }  else {

            return false;
        }

    }

}
