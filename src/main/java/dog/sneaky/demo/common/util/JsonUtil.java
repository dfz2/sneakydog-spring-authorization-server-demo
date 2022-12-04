package dog.sneaky.demo.common.util;


import com.nimbusds.jose.shaded.gson.Gson;

public class JsonUtil {

    public static String toJsonString(Object object){
        return new Gson().toJson(object);
    }
}
