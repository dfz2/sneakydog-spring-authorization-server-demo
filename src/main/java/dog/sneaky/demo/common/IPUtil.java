package dog.sneaky.demo.common;

import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.Map;

public class IPUtil {
    private IPUtil() {
    }

    private static final String IP_TAOBAO_URL = "https://ip.taobao.com/outGetIpInfo?ip=%s";
    private static final RestTemplate RESTTEMPLATE = new RestTemplate();

    public static String getClientIP(HttpServletRequest request) {
        String remoteAddr = "";
        if (request != null) {
            String xFORWARDED = request.getHeader("X-FORWARDED-FOR");
            if (xFORWARDED != null && !xFORWARDED.isEmpty()) {
                remoteAddr = xFORWARDED;
            } else {
                remoteAddr = request.getRemoteAddr();
            }
        }
        return remoteAddr;
    }


    @SuppressWarnings("unchecked")
    public static String getAddressByIP(String ip) {
        String address = "UNKNOW";
        ResponseEntity<Map> re = RESTTEMPLATE.getForEntity(String.format(IP_TAOBAO_URL, ip), Map.class);
        if (re.getStatusCodeValue() == 200 && re.getBody() != null) {
            Map jsonObject = re.getBody();
            if (jsonObject.containsKey("data")) {
                LinkedHashMap<String, String> data = (LinkedHashMap<String, String>) jsonObject.get("data");
                if (data.containsKey("region")) {
                    address = data.get("country") + "," + data.get("region");
                }
            }
        }
        return address;
    }
}
