package com.varchar.view.controller;

import java.security.SecureRandom;

public class RandomPw {
    // 특정 길이의 임의의 영숫자 비밀번호를 생성하는 메소드
    public static String generateRandomPassword(int len)
    {
        // ASCII 범위 – 영숫자(0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
 
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
 
        // 루프의 각 반복은 주어진 문자에서 무작위로 문자를 선택합니다.
        // ASCII 범위를 `StringBuilder` 인스턴스에 추가합니다.
 
        for (int i = 0; i < len; i++)
        {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        return sb.toString();
    }
 
    public static String main(String[] args)
    {
        int len = 10;
        return generateRandomPassword(len);
    }
}