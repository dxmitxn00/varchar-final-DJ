package com.varchar.view.controller;

import java.security.SecureRandom;

import java.security.MessageDigest;

public class Password {
    // 특정 길이의 임의의 영숫자 비밀번호를 생성하는 메서드
    public static String generateRandomPassword(int len){
        // ASCII 범위 – 영숫자(0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
 
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
 
        // 루프의 각 반복은 주어진 문자에서 무작위로 문자 선택
        // ASCII 범위를 `StringBuilder` 인스턴스에 추가
 
        for (int i = 0; i < len; i++)
        {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        return sb.toString();
    }
 
    // 10자리 랜덤수 메서드 실행
    public static String randomPassword(String[] args){
        int len = 10;
        return generateRandomPassword(len);
    }
    
    // 비밀번호 sha256 형식으로 암호화
    public static String ShaPass(String planText) {
    	
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}