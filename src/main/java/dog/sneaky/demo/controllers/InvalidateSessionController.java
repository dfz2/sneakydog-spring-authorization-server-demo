package dog.sneaky.demo.controllers;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@Slf4j
public class InvalidateSessionController {

    @RequestMapping("/invalidate")
    public void invalidateSession(HttpServletRequest request, HttpServletResponse response) {
        if (isAjax(request)) {
            response.setStatus(401);
        } else {
            try {
                response.sendRedirect("/login.html");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    public boolean isAjax(HttpServletRequest request) {
        return (request.getHeader("X-Requested-With") != null &&
                "XMLHttpRequest".equals(request.getHeader("X-Requested-With").toString()));
    }

}
