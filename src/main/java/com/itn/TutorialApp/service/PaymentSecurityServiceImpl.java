package com.itn.TutorialApp.service;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

@Service
public class PaymentSecurityServiceImpl implements PaymentSecurityService{
    @Override
    public String generateSignature(String message) {
        String hash = null;
        String secret = "8gBm/:&EnhH.1/q";
        try {
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(secret.getBytes(),"HmacSHA256");
            sha256_HMAC.init(secret_key);
            hash = Base64.encodeBase64String(sha256_HMAC.doFinal(message.getBytes()));
            System.out.println(hash);
        }
        catch (Exception e) {
            System.out.println("Encoding exception:");
        }
        return hash;
    }
}
