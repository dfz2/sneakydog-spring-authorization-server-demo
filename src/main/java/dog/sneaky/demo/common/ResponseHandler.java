package dog.sneaky.demo.common;


import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ResponseHandler {

    public static Object handle(Class<?> returnType, String errCode, String errMsg){
        if (isColaResponse(returnType)){
            return handleColaResponse(returnType, errCode, errMsg);
        }
        return null;
    }

    public static Object handle(Class<?> returnType, BaseException e){
//        return handle(returnType, e.getErrCode(), e.getMessage());
        return null;
    }



    private static Object handleColaResponse(Class<?> returnType, String errCode, String errMsg) {
        try {
//            Response response = (Response)returnType.newInstance();
//            response.setSuccess(false);
//            response.setErrCode(errCode);
//            response.setErrMessage(errMsg);
            return null;
        }
        catch (Exception ex){
            log.error(ex.getMessage(), ex);
            return  null;
        }
    }


    private static boolean isColaResponse(Class<?> returnType) {
//        return  returnType == Response.class || returnType.getGenericSuperclass() == Response.class;

        return false;
    }
}
