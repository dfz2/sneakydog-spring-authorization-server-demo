package dog.sneaky.demo.configuration.mfa;


import com.fasterxml.jackson.databind.ObjectMapper;
import dog.sneaky.demo.configuration.*;
import dog.sneaky.demo.configuration.mfa.MfaAuthentication;
import dog.sneaky.demo.configuration.mfa.MfaAuthenticationHandler;
import dog.sneaky.demo.configuration.mfa.MfaTrustResolver;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.authorization.AuthorizationManager;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.ExceptionTranslationFilter;
import org.springframework.security.web.access.intercept.RequestAuthorizationContext;
import org.springframework.security.web.authentication.*;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfTokenRequestHandler;
import org.springframework.security.web.csrf.XorCsrfTokenRequestAttributeHandler;
import org.springframework.security.web.session.RequestedUrlRedirectInvalidSessionStrategy;
import org.springframework.security.web.session.SimpleRedirectSessionInformationExpiredStrategy;


@Slf4j
@EnableWebSecurity
@Configuration(proxyBeanMethods = false)
@RequiredArgsConstructor
@EnableMethodSecurity(securedEnabled = true)
@ConditionalOnProperty(prefix = "spring.security.login" , name = "type", havingValue = "mfa")
public class DefaultSecurityConfiguration2fa extends AbstractSecurityConfiguration {
    @Resource
    private MyUserDetailServiceImpl myUserDetailService;

//    @Bean
//    public WebSecurityCustomizer webSecurityCustomizer() {
//        return (web) -> web.ignoring().requestMatchers("/js/*.js", "/favicon.ico", "/img/**", "/error**", "/webjars/**");
//    }
////


    @Bean
    @Order(2)
    public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http,
                                                          AuthorizationManager<RequestAuthorizationContext> mfaAuthorizationManager,
                                                          final ObjectMapper objectMapper, final ApplicationContext applicationContext)
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

        CookieCsrfTokenRepository tokenRepository = CookieCsrfTokenRepository.withHttpOnlyFalse();
        XorCsrfTokenRequestAttributeHandler delegate = new XorCsrfTokenRequestAttributeHandler();
        // set the name of the attribute the CsrfToken will be populated on
        delegate.setCsrfRequestAttributeName("_csrf");
        // Use only the handle() method of XorCsrfTokenRequestAttributeHandler and the
        // default implementation of resolveCsrfTokenValue() from CsrfTokenRequestHandler
        http
                .csrf((csrf) -> csrf
                        .csrfTokenRepository(tokenRepository)
                        .csrfTokenRequestHandler(delegate)
                );


        MyDaoAuthenticationProvider authenticationProvider = new MyDaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(myUserDetailService);
        http.authenticationProvider(authenticationProvider);


        MfaAuthenticationHandler mfaAuthenticationHandler = new MfaAuthenticationHandler("/second-factor.html");

        http.authorizeHttpRequests(a -> a.requestMatchers("/login/**", "/login.html",
                        "/register.html",
                        "/reg.html",
                        "/console/postTest",
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
                        "/favicon.ico").permitAll()
                        .requestMatchers("/second-factor.html", "/second-factor").access(mfaAuthorizationManager)
                        .anyRequest().authenticated())
                .formLogin(l -> l.loginPage("/login")
                                .authenticationDetailsSource(new CustomWebAuthenticationDetailsSource())
                                .usernameParameter("j_username")
                                .passwordParameter("j_password")
//                        .successHandler(new Custom2UrlAuthenticationSuccessHandler(applicationContext))
//                                .successHandler(new SavedRequestAwareAuthenticationSuccessHandler())
//                                .failureHandler(new SimpleUrlAuthenticationFailureHandler("/login?error"))
                                .successHandler(mfaAuthenticationHandler)
                                .failureHandler(mfaAuthenticationHandler)
                ).requestCache(rc -> rc.requestCache(new CustomRequestCache()))
                .exceptionHandling((exceptions) -> exceptions
                        .withObjectPostProcessor(new ObjectPostProcessor<ExceptionTranslationFilter>() {
                            @Override
                            public <O extends ExceptionTranslationFilter> O postProcess(O filter) {
                                filter.setAuthenticationTrustResolver(new MfaTrustResolver());
                                return filter;
                            }
                        })
                )
                .securityContext((context) -> context.requireExplicitSave(false))
                .rememberMe(
                        rm -> rm.rememberMeParameter("customerDTO[remember]")
                                .tokenValiditySeconds(3600)
                                .userDetailsService(myUserDetailService)
//                        .tokenRepository(persistentTokenRepository())
                )
//                .csrf(c -> c.csrfTokenRepository(new CookieCsrfTokenRepository()))
                .logout(lo -> lo.logoutSuccessUrl("/login?logout")
                        .deleteCookies("authorization-server-session-id")
                        .clearAuthentication(true)
                        .invalidateHttpSession(true))
                .sessionManagement()
//                .invalidSessionUrl("/invalidate?invalidate")
                .invalidSessionStrategy(new RequestedUrlRedirectInvalidSessionStrategy())
                .maximumSessions(1)
                .maxSessionsPreventsLogin(false) // / 当达到最大值时，是否保留已经登录的用户
                .expiredSessionStrategy(new SimpleRedirectSessionInformationExpiredStrategy("/login?maximumSessions"))
                .expiredUrl("/login?expiredUrl");

        return http.build();
    }

    @Bean
    AuthenticationSuccessHandler successHandler() {
        SavedRequestAwareAuthenticationSuccessHandler successHandler = new SavedRequestAwareAuthenticationSuccessHandler();
        successHandler.setTargetUrlParameter("continue");
        return successHandler;
    }

    @Bean
    AuthenticationFailureHandler failureHandler() {
        return new SimpleUrlAuthenticationFailureHandler("/login?error");
    }

    @Bean
    AuthorizationManager<RequestAuthorizationContext> mfaAuthorizationManager() {
        return (authentication, context) -> new AuthorizationDecision(authentication.get() instanceof MfaAuthentication);
    }



}
