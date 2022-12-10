package dog.sneaky.demo.controllers;


import dog.sneaky.demo.configuration.MyUserDetailServiceImpl;
import dog.sneaky.demo.controllers.controller.dto.CheckCAPTCHACommand;
import dog.sneaky.demo.controllers.controller.dto.CheckCAPTCHADTO;
import dog.sneaky.demo.controllers.controller.dto.RegisterDTO;
import dog.sneaky.demo.controllers.controller.dto.UserRegisterCommand;
import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.service.UserService;
import dog.sneaky.demo.service.impl.EmailMessageServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.concurrent.TimeUnit;

@Controller
@RequiredArgsConstructor
public class RegisterController {
    private final MyUserDetailServiceImpl myUserDetailServiceImpl;
    private final RedisTemplate<Object, Object> redisTemplate;

    private final UserService userService;
    private final EmailMessageServiceImpl emailMessageService;


    @GetMapping({"/register.html", "/reg", "/register", "/reg.html"})
    public String register(){
        return "register2";
    }

    @PostMapping("/register")
    public String register(UserRegisterCommand userRegisterCommand){
        RegisterDTO registerDTO = userRegisterCommand.getRegisterDTO();
        registerDTO.setUsername(userRegisterCommand.getUsername());
//        springSecurityUserDetailService.userRegister(registerDTO);

        CustomUser customUser = new CustomUser();
        customUser.setUsername(userRegisterCommand.getUsername());
        customUser.setPassword(userRegisterCommand.getRegisterDTO().getPassword());
        userService.createUser(customUser);
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
            System.out.println("email code:" + text);
            emailMessageService.sendEmailMessage(username, text);
            redisCacheCAPTCHA(username, text);
        }
        return true;
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



    @Async
    public void redisCacheCAPTCHA(String username, String text) {
        String CAPTCHAKey = username + "_" + text;
        redisTemplate.opsForValue().set(CAPTCHAKey, text);
        redisTemplate.expire(CAPTCHAKey, 5L, TimeUnit.MINUTES);
    }



}
