package dog.sneaky.demo.configuration;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jose.jwk.source.ImmutableJWKSet;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import dog.sneaky.demo.configuration.mfa.MfaAuthentication;
import dog.sneaky.demo.configuration.mfa.MfaAuthenticationHandler;
import dog.sneaky.demo.configuration.mfa.MfaTrustResolver;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
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
import org.springframework.security.web.access.ExceptionTranslationFilter;
import org.springframework.security.web.access.intercept.RequestAuthorizationContext;
import org.springframework.security.web.authentication.*;
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
public class DefaultSecurityConfiguration {
    @Resource
    private MyUserDetailServiceImpl myUserDetailService;

    @Bean
    public PasswordEncoder passwordEncoder(){
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

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


        MyDaoAuthenticationProvider authenticationProvider = new MyDaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(myUserDetailService);
        http.authenticationProvider(authenticationProvider);


        MfaAuthenticationHandler mfaAuthenticationHandler = new MfaAuthenticationHandler("/second-factor.html");

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
                )
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

    @Bean
    AuthenticationSuccessHandler successHandler() {
        return new SavedRequestAwareAuthenticationSuccessHandler();
    }

    @Bean
    AuthenticationFailureHandler failureHandler() {
        return new SimpleUrlAuthenticationFailureHandler("/login?error");
    }

    @Bean
    AuthorizationManager<RequestAuthorizationContext> mfaAuthorizationManager() {
        return (authentication, context) -> new AuthorizationDecision(authentication.get() instanceof MfaAuthentication);
    }


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
