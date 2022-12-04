package dog.sneaky.demo.common.util;

//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.ExpiredJwtException;
//import io.jsonwebtoken.Jwts;
//import io.jsonwebtoken.io.Decoders;
//import io.jsonwebtoken.security.Keys;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

public class JwtUtils {
    static String signingKey  =  "q63x9yt0TUtQAoIVvVV8VA8kaRerHOz/QwzSvm/U7UQ=";

    public static String createJWT(Map<String, Object> claims) {
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        long expMillis = nowMillis + 300000L;
        Date exp = new Date(expMillis);
//        SecretKey key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(signingKey));
//        return Jwts.builder().addClaims(claims)
//                .setIssuedAt(now)
//                .setIssuer("miniapp")
//                .setExpiration(exp)
//                .setId(UUID.randomUUID().toString())
//                .signWith(key)
//                .compact();

        return "";
    }

    public static Object parseJWT(String jwt) {
//        return Jwts.parserBuilder().setSigningKey(signingKey).build().parseClaimsJws(jwt).getBody();
        return null;
    }

    public static boolean checkJWT(String jwt){
//        try {
//            Jwts.parserBuilder().setSigningKey(signingKey).build().parseClaimsJws(jwt);
//            return true;
//        } catch (ExpiredJwtException e) {
//            e.printStackTrace();
//            return false;
//        }
        return false;
    }

    public static void main(String[] args) {

    }
}
