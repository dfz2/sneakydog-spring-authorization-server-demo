package dog.sneaky.demo.configuration.defaultlogin;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jose.jwk.source.ImmutableJWKSet;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import dog.sneaky.demo.configuration.AbstractSecurityConfiguration;
import dog.sneaky.demo.configuration.CustomWebAuthenticationDetailsSource;
import dog.sneaky.demo.configuration.MyDaoAuthenticationProvider;
import dog.sneaky.demo.configuration.MyUserDetailServiceImpl;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.core.oidc.OidcScopes;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.server.authorization.client.InMemoryRegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.config.annotation.web.configuration.OAuth2AuthorizationServerConfiguration;
import org.springframework.security.oauth2.server.authorization.config.annotation.web.configurers.OAuth2AuthorizationServerConfigurer;
import org.springframework.security.oauth2.server.authorization.settings.AuthorizationServerSettings;
import org.springframework.security.oauth2.server.authorization.settings.ClientSettings;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.session.SimpleRedirectSessionInformationExpiredStrategy;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.UUID;

@EnableWebSecurity
@Configuration(proxyBeanMethods = false)
@RequiredArgsConstructor
@EnableMethodSecurity(securedEnabled = true)
@ConditionalOnProperty(prefix = "spring.security.login" , name = "type", havingValue = "defaults")
public class DefaultSecurityConfiguration2 extends AbstractSecurityConfiguration {
    @Resource
    private MyUserDetailServiceImpl myUserDetailService;


//    @Bean
//    public WebSecurityCustomizer webSecurityCustomizer() {
//        return (web) -> web.ignoring().requestMatchers("/js/*.js", "/favicon.ico", "/img/**", "/error**", "/webjars/**");
//    }
////


    @Bean
    @Order(2)
    public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http, final ObjectMapper objectMapper, final ApplicationContext applicationContext)
            throws Exception {

//        http
//                .csrf(csrf -> csrf.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
//                        .csrfTokenRequestHandler(new CsrfTokenRequestAttributeHandler()))
////                .exceptionHandling(eh-> eh.authenticationEntryPoint(new AuthenticationEntryPoint() {
////                    @Override
////                    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
////                        response.setStatus(401);
////                    }
////                }))
//                .authorizeHttpRequests(authorize -> authorize.requestMatchers("/index").permitAll().anyRequest().authenticated())
//                .formLogin(formlogin -> formlogin.loginPage("/login").permitAll()
//                        .successHandler(new CustomSuccessHandler(objectMapper))
//                        .failureHandler(new SimpleUrlAuthenticationFailureHandler(){
//                            @Override
//                            public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
//                                response.setStatus(400);
//                            }
//                        })
//                )
//                .requestCache(rc -> rc.requestCache(new HttpSessionRequestCache()));

        // iframe
//        http.headers().frameOptions().disable();
//
//        http.csrf().ignoringAntMatchers("/h2-console/**");
//        // customCsrfFilter
//        http.addFilterBefore(customCsrfFilter, CsrfFilter.class);
//        // verifyCode
//        http.addFilterBefore(verifyCodeFilter, UsernamePasswordAuthenticationFilter.class);
//        //.antMatchers(HttpMethod.GET,"/hello").access("#oauth2.hasScope('read')")
//
////        http.mvcMatcher("/actuator/**")
////                .authorizeRequests()
////                .mvcMatchers("/actuator/**")
////                .access("hasAuthority('SCOPE_authServer.actuator')")
////                .and()
////                .oauth2ResourceServer()
////                .jwt();


        MyDaoAuthenticationProvider authenticationProvider = new MyDaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(myUserDetailService);
        http.authenticationProvider(authenticationProvider);


        http.authorizeHttpRequests(a -> a.requestMatchers("/login/**", "/login.html",
                        "/register.html",
                        "/reg.html",
                        "/reg",
                        "/register",
                        "/js/*.js", "/favicon.ico", "/img/**", "/error**", "/webjars/**",
                        "/redission/**",
                        "/checkEmail.html",
                        "/sendEmailCAPTCHA.html",
                        "/recover-password.html",
                        "/checkCAPTCHA.html",
                        "/kaptcha/code",
                        "/invalidate",
                        "/reset/**",
                        "/terms/**",
                        "/forgot-password.html",
                        "/sendLink",
                        "/actuator/**",
                        "/h2-console/**",
//                "/actuator/**",
                        "/favicon.ico").permitAll().anyRequest().authenticated())
                .formLogin(l -> l.loginPage("/login")
                                .authenticationDetailsSource(new CustomWebAuthenticationDetailsSource())
                                .usernameParameter("j_username")
                                .passwordParameter("j_password")
//                        .successHandler(new Custom2UrlAuthenticationSuccessHandler(applicationContext))
                                .successHandler(new SavedRequestAwareAuthenticationSuccessHandler())
                                .failureHandler(new SimpleUrlAuthenticationFailureHandler("/login?error"))
                )
                .rememberMe(
                        rm -> rm.rememberMeParameter("customerDTO[remember]")
                                .tokenValiditySeconds(3600)
                                .userDetailsService(myUserDetailService)
//                        .tokenRepository(persistentTokenRepository())
                )
                .csrf(c -> c.csrfTokenRepository(new CookieCsrfTokenRepository()))
                .logout(lo -> lo.logoutSuccessUrl("/login")
                        .deleteCookies("authorization-server-session-id")
                        .clearAuthentication(true)
                        .invalidateHttpSession(true))
                .sessionManagement()
                .invalidSessionUrl("/invalidate")
                .maximumSessions(1)
                .maxSessionsPreventsLogin(false) // / 当达到最大值时，是否保留已经登录的用户
                .expiredSessionStrategy(new SimpleRedirectSessionInformationExpiredStrategy("/login?maximumSessions"))
                .expiredUrl("/login");

        return http.build();
    }


}
