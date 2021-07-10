package com.iiiedu.beauty.member.services;

import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
@Transactional
public class ForgotPasswordServices {

    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private JavaMailSender javaMailSender;

    public void updateResetPasswordToken(String token,String memberAccount)
            throws CustomerNotFoundException{
        Member member = memberRepository.findByMemberAccount(memberAccount);
        if (member != null){
            member.setResetPasswordToken(token);
            memberRepository.save(member);
        }else{
            throw new CustomerNotFoundException("Could not find any member with the email" + memberAccount);
        }
    }

    public Member getByResetPasswordToken(String token){
        return memberRepository.findByResetPasswordToken(token);
    }

    public void updatePassword(Member member,String newMemberPwd){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodePassword = passwordEncoder.encode(newMemberPwd);
        member.setMemberPwd(encodePassword);
        member.setResetPasswordToken(null);
        memberRepository.save(member);
    }

    public void  sendForgotPasswordMail(String recipientEmail , String link)
            throws MessagingException, UnsupportedEncodingException {

        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("shawnhws760306@gmail.com","iiideu.beauty");
        helper.setTo(recipientEmail);

        String subject ="Here's the link to reset your password";
        String content ="<p>Hello , <p>"
                + "<p>You have request to reset your password.<p>"
                + "<p>Click the link below to change your password : <p>"
                + "<p><a href=\"" + link + "\">Change my password</a><p>"
                + "<br>"
                + "<p>Ignore this email if you do remember your password, or you have not made the request.<p>";
        helper.setSubject(subject);
        helper.setText(content,true);
        javaMailSender.send(message);
    }
}
