package dog.sneaky.demo.controllers;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;


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
