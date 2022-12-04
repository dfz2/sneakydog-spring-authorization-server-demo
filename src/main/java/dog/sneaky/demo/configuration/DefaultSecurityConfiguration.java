package dog.sneaky.demo.configuration;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jose.jwk.source.ImmutableJWKSet;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import dog.sneaky.demo.service.impl.MyDaoAuthenticationProvider;
import dog.sneaky.demo.service.impl.MyUserDetailServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
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
import org.springframework.security.oauth2.server.authorization.settings.ConfigurationSettingNames;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfTokenRequestAttributeHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.security.web.session.SimpleRedirectSessionInformationExpiredStrategy;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.UUID;

@EnableWebSecurity
@Configuration(proxyBeanMethods = false)
@RequiredArgsConstructor
public class DefaultSecurityConfiguration {
    @Autowired
    private MyUserDetailServiceImpl myUserDetailService;
    //
    @Value("${spring.application.rsa.privateKey}")
    private String privateKey;

//    @Bean
//    public WebSecurityCustomizer webSecurityCustomizer() {
//        return (web) -> web.ignoring().requestMatchers("/js/*.js", "/favicon.ico", "/img/**", "/error**", "/webjars/**");
//    }
////

    @Bean
    @Order(1)
    public SecurityFilterChain authorizationServerSecurityFilterChain(HttpSecurity http)
            throws Exception {
        OAuth2AuthorizationServerConfiguration.applyDefaultSecurity(http);
        http.getConfigurer(OAuth2AuthorizationServerConfigurer.class);
        http
                // Redirect to the login page when not authenticated from the
                // authorization endpoint
                .exceptionHandling((exceptions) -> exceptions
                        .authenticationEntryPoint(
                                new LoginUrlAuthenticationEntryPoint("/login"))
                )
                // Accept access tokens for User Info and/or Client Registration
                .oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt);

        return http.build();
    }

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


        MyDaoAuthenticationProvider authenticationProvider = new MyDaoAuthenticationProvider(privateKey);
        authenticationProvider.setUserDetailsService(myUserDetailService);
        http.authenticationProvider(authenticationProvider);



        http.authorizeHttpRequests(a -> a.requestMatchers("/login/**", "/login.html",
                        "/register.html",
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
                                .usernameParameter("j_username")
                                .passwordParameter("j_password")
//                        .successHandler(new Custom2UrlAuthenticationSuccessHandler(applicationContext))
                                .successHandler(new SavedRequestAwareAuthenticationSuccessHandler())
                                .failureHandler(new Custom2SimpleUrlAuthenticationFailureHandler(applicationContext))
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


    static class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
        private final ObjectMapper objectMapper;

        private RequestCache requestCache = new HttpSessionRequestCache();

        CustomSuccessHandler(final ObjectMapper objectMapper) {
            this.objectMapper = objectMapper;
            setTargetUrlParameter("redirectUrl");
        }

        public void setRequestCache(RequestCache requestCache) {
            this.requestCache = requestCache;
        }

        @Override
        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
            SavedRequest savedRequest = this.requestCache.getRequest(request, response);
            if (savedRequest == null) {
                super.onAuthenticationSuccess(request, response, authentication);
                return;
            }

            String targetUrlParameter = getTargetUrlParameter();
            if (isAlwaysUseDefaultTargetUrl()
                    || (targetUrlParameter != null && StringUtils.hasText(request.getParameter(targetUrlParameter)))) {
                this.requestCache.removeRequest(request, response);
                super.onAuthenticationSuccess(request, response, authentication);
                return;
            }

            clearAuthenticationAttributes(request);
            // Use the DefaultSavedRequest URL
            String targetUrl = savedRequest.getRedirectUrl();

            response.setStatus(200);
            response.getWriter().write(objectMapper.writeValueAsString(new CustomAuthentication(authentication, targetUrl)));
        }
    }


    record CustomAuthentication(Authentication authentication, String redirectUrl) {
    }
//
//    @Bean
//    public UserDetailsService userDetailsService() {
//        UserDetails userDetails = User.withDefaultPasswordEncoder()
//                .username("user")
//                .password("password")
//                .roles("USER")
//                .build();
//
//        return new InMemoryUserDetailsManager(userDetails);
//    }

    @Bean
    public RegisteredClientRepository registeredClientRepository() {
        RegisteredClient registeredClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId("messaging-client")
                .clientSecret("{noop}secret")
                .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .authorizationGrantType(AuthorizationGrantType.REFRESH_TOKEN)
                .authorizationGrantType(AuthorizationGrantType.CLIENT_CREDENTIALS)
                .redirectUri("http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc")
                .redirectUri("http://127.0.0.1:8080/authorized")
                .scope(OidcScopes.OPENID)
                .scope(OidcScopes.PROFILE)
                .scope("message.read")
                .scope("message.write")
                .clientSettings(ClientSettings.builder().requireAuthorizationConsent(true).build())
                .build();

        return new InMemoryRegisteredClientRepository(registeredClient);
    }

    @Bean
    public JWKSource<SecurityContext> jwkSource() {
        KeyPair keyPair = generateRsaKey();
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
        RSAKey rsaKey = new RSAKey.Builder(publicKey)
                .privateKey(privateKey)
                .keyID(UUID.randomUUID().toString())
                .build();
        JWKSet jwkSet = new JWKSet(rsaKey);
        return new ImmutableJWKSet<>(jwkSet);
    }

    private static KeyPair generateRsaKey() {
        KeyPair keyPair;
        try {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(2048);
            keyPair = keyPairGenerator.generateKeyPair();
        } catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
        return keyPair;
    }

    @Bean
    public JwtDecoder jwtDecoder(JWKSource<SecurityContext> jwkSource) {
        return OAuth2AuthorizationServerConfiguration.jwtDecoder(jwkSource);
    }

    @Bean
    public AuthorizationServerSettings authorizationServerSettings() {
        return AuthorizationServerSettings.builder().build();
    }
}
