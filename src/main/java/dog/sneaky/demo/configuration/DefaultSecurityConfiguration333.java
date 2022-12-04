package dog.sneaky.demo.configuration;

import dog.sneaky.demo.service.impl.MyDaoAuthenticationProvider;
import dog.sneaky.demo.service.impl.MyUserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.session.SimpleRedirectSessionInformationExpiredStrategy;

import javax.sql.DataSource;

//@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
//@EnableWebSecurity
public class DefaultSecurityConfiguration333 {
//
//    @Value("${spring.application.rsa.privateKey}")
//    private String privateKey;
//    @Autowired
//    private MyUserDetailServiceImpl myUserDetailService;
//    @Autowired
////    @Qualifier("myPasswordEncoder")
//    private PasswordEncoder passwordEncoder;
//    @Autowired
//    private ApplicationContext applicationContext;
//    @Autowired
//    private DataSource dataSource;
//    @Autowired
//    private VerifyCodeFilter verifyCodeFilter;
//    @Autowired
//    private CustomCsrfFilter customCsrfFilter;
//
//
////    @Bean("MyDaoAuthenticationProvider")
////    public DaoAuthenticationProvider daoAuthenticationProvider(@Qualifier("jdbcUserDetailsManager") JdbcUserDetailsManager jdbcUserDetailsManager){
////        MyDaoAuthenticationProvider provider = new MyDaoAuthenticationProvider();
////        provider.setPasswordEncoder(new BCryptPasswordEncoder());
////        provider.setUserDetailsService(jdbcUserDetailsManager);
////        return provider;
////    }
//
//
//    // @formatter:off
//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth.authenticationProvider(buildDaoAuthenticationProvider());
////        auth.jdbcAuthentication()
////                .dataSource(dataSource).passwordEncoder(new BCryptPasswordEncoder());
//    }
//    // @formatter:on
//
//    @Bean
//    public PersistentTokenRepository persistentTokenRepository(){
//        JdbcTokenRepositoryImpl  jdbcTokenRepository = new JdbcTokenRepositoryImpl();
//        jdbcTokenRepository.setDataSource(dataSource);
////        jdbcTokenRepository.setCreateTableOnStartup(true);
//        return jdbcTokenRepository;
//    }
//
//    //     formatter:off
//    @Bean
//    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
//        // iframe
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
//
//        http.authorizeRequests(a -> a.antMatchers("/login/**", "/login.html",
//                "/register.html",
//                "/register",
//                "/redission/**",
//                "/checkEmail.html",
//                "/sendEmailCAPTCHA.html",
//                "/recover-password.html",
//                "/checkCAPTCHA.html",
//                "/kaptcha/code",
//                "/invalidate",
//                "/reset/**",
//                "/terms/**",
//                "/forgot-password.html",
//                "/sendLink",
//                "/actuator/**",
//                "/h2-console/**",
////                "/actuator/**",
//                "/favicon.ico").permitAll().anyRequest().authenticated())
//                .formLogin(l -> l.loginPage("/login")
//                        .usernameParameter("customerDTO[username]")
//                        .passwordParameter("customerDTO[password]")
////                        .successHandler(new Custom2UrlAuthenticationSuccessHandler(applicationContext))
////                        .failureHandler(new Custom2SimpleUrlAuthenticationFailureHandler(applicationContext))
//                )
//                .rememberMe(
//                        rm -> rm.rememberMeParameter("customerDTO[remember]")
//                         .tokenValiditySeconds(3600)
//                         .userDetailsService(myUserDetailService)
//                        .tokenRepository(persistentTokenRepository())
//                )
//                .csrf(c -> c.csrfTokenRepository(new CookieCsrfTokenRepository()))
//                .logout(lo -> lo.logoutSuccessUrl("/login")
//                        .deleteCookies("authorization-server-session-id")
//                        .clearAuthentication(true)
//                        .invalidateHttpSession(true))
//                .sessionManagement()
//                .invalidSessionUrl("/invalidate")
//                .maximumSessions(1)
//                .maxSessionsPreventsLogin(false) // / 当达到最大值时，是否保留已经登录的用户
//                .expiredSessionStrategy(new SimpleRedirectSessionInformationExpiredStrategy("/login?maximumSessions"))
//                .expiredUrl("/login");
//
//        return http.build();
//    }
////     formatter:on
//
//    @Bean
//    public WebSecurityCustomizer webSecurityCustomizer() {
//        return (web) -> web.ignoring().antMatchers("/js/*.js", "/favicon.ico", "/img/**", "/error**", "/webjars/**");
//    }
//
//
////    @Bean
////    UserDetailsService userDetailsService(DataSource dataSource){
////        return new JdbcUserDetailsManager(dataSource);
////    }
//
//    // @formatter:off
////    @Bean
////    UserDetailsService users() {
////        UserDetails user = User.withDefaultPasswordEncoder()
////                .username("user1")
////                .password("password")
////                .roles("USER")
////                .build();
////        return new InMemoryUserDetailsManager(user);
////    }
//    // @formatter:on
//
//
//    private DaoAuthenticationProvider buildDaoAuthenticationProvider() {
//        MyDaoAuthenticationProvider myDaoAuthenticationProvider = new MyDaoAuthenticationProvider(privateKey);
//        myDaoAuthenticationProvider.setPasswordEncoder(passwordEncoder);
//        myDaoAuthenticationProvider.setUserDetailsService(myUserDetailService);
//        return myDaoAuthenticationProvider;
//    }
}
