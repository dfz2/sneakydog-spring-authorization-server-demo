package dog.sneaky.demo.common;


import dog.sneaky.demo.common.util.JsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Aspect
@Component
public class ValidFormAspect {

    @Pointcut("execution(* dog.sneaky.demo.controllers.oauth2.RegisteredClientsController.resetClientSecret(..))")
    public void pointcut111() {
    }

    @Around(value = "pointcut111()")
    public Object around(ProceedingJoinPoint joinPoint) {
        long startTime = System.currentTimeMillis();

        Object response = null;
        try {
            response = joinPoint.proceed();
        } catch (Throwable e) {
            handleException(joinPoint, e);
            response = "redirect:/my-app.html";
        } finally {
            logResponse(startTime, response);
        }

        return response;
    }

    private void handleException(ProceedingJoinPoint joinPoint, Throwable e) {
        MethodSignature ms = (MethodSignature) joinPoint.getSignature();

        Object[] args =  joinPoint.getArgs();

        RedirectAttributes redirectAttributes = null;
        for (Object arg : args) {
            if (arg instanceof RedirectAttributes) {
                redirectAttributes = (RedirectAttributes) arg;
            }
        }

        Class<?> returnType = ms.getReturnType();
        if (e instanceof BizException) {
            log.warn("BIZ EXCEPTION : " + e.getMessage());
            //在Debug的时候，对于BizException也打印堆栈
            if (log.isDebugEnabled()) {
                log.error(e.getMessage(), e);
            }
        }

        if (e instanceof SysException) {
            log.error("SYS EXCEPTION :");
            log.error(e.getMessage(), e);
        }

        log.error("UNKNOWN EXCEPTION :");
        log.error(e.getMessage(), e);

        if (redirectAttributes != null) {
            redirectAttributes.addFlashAttribute("onErrorMessage", e.getMessage());
        }

//        return viewName;

//        return new ModelAndView(viewName, "onErrorMessage", e.getMessage());
    }


    private void logResponse(long startTime, Object response) {
        try {
            long endTime = System.currentTimeMillis();
            log.debug("RESPONSE : " + JsonUtil.toJsonString(response));
            log.debug("COST : " + (endTime - startTime) + "ms");
        } catch (Exception e) {
            //swallow it
            log.error("logResponse error : " + e);
        }
    }

    private void logRequest(ProceedingJoinPoint joinPoint) {
        try {
            log.debug("START PROCESSING: " + joinPoint.getSignature().toShortString());
            Object[] args = joinPoint.getArgs();
            for (Object arg : args) {
                log.debug("REQUEST : " + JsonUtil.toJsonString(arg));
            }
        } catch (Exception e) {
            //swallow it
            log.error("logReqeust error : " + e);
        }
    }
}
