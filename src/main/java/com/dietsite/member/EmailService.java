package com.dietsite.member;

public interface EmailService {
    String sendSimpleMessage(String recipient) throws Exception;

    void sendNewPasswordMessage(String email, String tempPassword) throws Exception;
}
