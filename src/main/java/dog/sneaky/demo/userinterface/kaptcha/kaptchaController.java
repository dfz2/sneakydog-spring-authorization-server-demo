package dog.sneaky.demo.userinterface.kaptcha;

import dog.sneaky.demo.userinterface.BaseController;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;


@Slf4j
@AllArgsConstructor
//@Controller
//@RequestMapping("/kaptcha")
public class kaptchaController extends BaseController {
//    private final Producer kaptchaProducer;
//
//    @GetMapping("/code")
//    public void getKaptcha(HttpServletResponse response, HttpServletRequest request) {
//        String text = kaptchaProducer.createText();
//        BufferedImage image = kaptchaProducer.createImage(text);
//        request.getSession().setAttribute("KAPTCHA_SESSION_KEY_" + text.toUpperCase(), text);
//        response.setContentType("image/png");
//        try {
//            OutputStream os = response.getOutputStream();
//            ImageIO.write(image, "png", os);
//        } catch (IOException e) {
//            log.error("响应验证码失败:" + e.getMessage());
//        }
//    }
}
