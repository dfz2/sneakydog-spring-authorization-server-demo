package dog.sneaky.demo.services.impl;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
@RequiredArgsConstructor
public class EmailMessageServiceImpl {
    private final JavaMailSender javaMailSender;


    @Async
    public void sendEmailMessage(String username, String text){
        if (username != null && text != null) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setSubject("这是一封测试邮件");
            message.setFrom("517233020@qq.com");
            message.setTo(username);
            message.setSentDate(new Date());
            message.setText(text);
            javaMailSender.send(message);
        }
    }

}
