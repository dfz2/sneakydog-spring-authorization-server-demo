package dog.sneaky.demo.service.impl;

import dog.sneaky.demo.common.util.RSAUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



public class MyDaoAuthenticationProvider extends DaoAuthenticationProvider {

    private final String privateKey;
    public MyDaoAuthenticationProvider(String privateKey) {
        this.privateKey = privateKey;
    }

    @Override
    protected void additionalAuthenticationChecks(
            UserDetails userDetails,
            UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {

        System.out.println("MyDaoAuthenticationProvider");

        // fuckkeys

        if (authentication.getCredentials() == null) {
            this.logger.debug("Failed to authenticate since no credentials provided");
            throw new BadCredentialsException(this.messages
                    .getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", "Bad credentials"));
        }


        ServletRequestAttributes servletRequestAttributes= (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request =  servletRequestAttributes.getRequest();
        HttpSession httpSession = request.getSession();

        String uuid = request.getParameter("uuid");
        String privatekey =  (String) httpSession.getAttribute("privatekey" + uuid);
        httpSession.removeAttribute("privatekey" + uuid);

        String presentedPassword = authentication.getCredentials().toString();
        try {
            presentedPassword = RSAUtil.decrypt(presentedPassword, privatekey);
        } catch (Exception e) {
            e.printStackTrace();
            this.logger.debug("用户密码解密失败");
            throw new BadCredentialsException(this.messages
                    .getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", "Bad credentials"));
        }


        if (!this.getPasswordEncoder().matches(presentedPassword, userDetails.getPassword())) {
            this.logger.debug("Failed to authenticate since password does not match stored value");
            throw new BadCredentialsException(this.messages
                    .getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", "Bad credentials"));
        }
    }
}
