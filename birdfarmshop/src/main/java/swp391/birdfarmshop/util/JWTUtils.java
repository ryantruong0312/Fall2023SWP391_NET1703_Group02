/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import io.jsonwebtoken.JwtBuilder;
import static io.jsonwebtoken.Jwts.header;
import jakarta.xml.bind.DatatypeConverter;
import java.security.Key;
import java.util.Date;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import swp391.birdfarmshop.util.Constants;

/**
 *
 * @author Admin
 */
public class JWTUtils {

    public static String encodeJWT(String content) {
        String code = null;
        try {
            byte[] KeyByByte = DatatypeConverter.parseBase64Binary(Constants.JWT_KEY);
            Key signingKey = new SecretKeySpec(KeyByByte, SignatureAlgorithm.HS256.getJcaName());
            long currentTimeMilis = System.currentTimeMillis();
            //1h = 3600000 ms
            long expirationTimeMilis = currentTimeMilis + 3600000;
            code = Jwts.builder()
                    .setSubject(content)
                    .setIssuedAt(new Date(currentTimeMilis))
                    .setExpiration(new Date(expirationTimeMilis))
                    .signWith(signingKey, SignatureAlgorithm.HS256)
                    .compact();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return code;
    }

    public static String decodeJWT(String code) {
        String content = null;
        try {
            byte[] KeyByByte = DatatypeConverter.parseBase64Binary(Constants.JWT_KEY);
            Key signingKey = new SecretKeySpec(KeyByByte, SignatureAlgorithm.HS256.getJcaName());
            Jws<Claims> claimsJws = Jwts.parserBuilder()
                    .setSigningKey(signingKey)
                    .build()
                    .parseClaimsJws(code);
            content = claimsJws.getBody().getSubject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }
}
