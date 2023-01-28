package dog.sneaky.demo.configuration;


import cn.hutool.core.util.IdUtil;
import dog.sneaky.demo.common.CustomDefaultHandlerExceptionResolver;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.util.ContentCachingResponseWrapper;

import java.io.IOException;
import java.util.List;


@Configuration
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class ApplicationConfiguration {


    @Bean
    public LocaleResolver localeResolver() {
        return new CookieLocaleResolver("LOCALE");
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }

    @Bean
    public WebMvcConfigurer webMvcConfigurer(){
        return new WebMvcConfigurer() {
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(localeChangeInterceptor());
            }

            @Override
            public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> resolvers) {
                resolvers.add(0, new CustomDefaultHandlerExceptionResolver());
            }
        };

    }


    @Slf4j
    @Component
    @Order(Ordered.HIGHEST_PRECEDENCE)
    static class CommonMDCRequestFilter implements Filter {
        public static final String HEADER_REQUEST_ID_PARAMS_NAME = "X-Request-Id";
        @Override
        public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
            MDC.put(HEADER_REQUEST_ID_PARAMS_NAME, IdUtil.randomUUID());
            HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
            ContentCachingResponseWrapper responseWrapper = new ContentCachingResponseWrapper(httpServletResponse);
            filterChain.doFilter(servletRequest, responseWrapper);
            httpServletResponse.setHeader(HEADER_REQUEST_ID_PARAMS_NAME, MDC.get(HEADER_REQUEST_ID_PARAMS_NAME));
            responseWrapper.copyBodyToResponse();
        }

    }

}
