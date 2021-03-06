package com.iiiedu.beauty.member.services;

import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.MemberDetails;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;

@Service
@Transactional
public class BeautyServices {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JavaMailSender javaMailSender;

    public void register(Member member, String siteURL)
            throws UnsupportedEncodingException, MessagingException {

        String encodePassword = passwordEncoder.encode(member.getMemberPwd());
        member.setMemberPwd(encodePassword);

        String randomCode = RandomString.make(64);
        member.setVerificationCode(randomCode);
        member.setEnabled(false);

        member.setMemberDetails(new MemberDetails());
        memberRepository.save(member);
        sendVerificationEmail(member,siteURL);
    }

    public boolean verify(String verificationCode){
        Member member = memberRepository.findByVerificationCode(verificationCode);
        if(member == null || member.isEnabled()){
            return false;
        } else {
            member.setVerificationCode(null);
            member.setEnabled(true);
            memberRepository.save(member);
            return true;
        }
    }

    private void sendVerificationEmail(Member member,String siteURL)
            throws UnsupportedEncodingException , MessagingException {
        String toAddres = member.getMemberAccount();
        String fromAddress = "shawnhws760306@gmail.com";
        String senderName = "iiideu.beauty";
        String subject = "Please verify your registration";
        String content = "Dear [[name]],<br>"
                + "Please click the link below to verify your registration:<br>"
                + "<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>"
                + "Thank you,<br>"
                + "iiideu.beauty";

        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom(fromAddress,senderName);
        helper.setTo(toAddres);
        helper.setSubject(subject);

        content = content.replace("[[name]]",member.getMemberName());
        String verifyURL = siteURL + "/verify?code=" + member.getVerificationCode();

        content = content.replace("[[URL]]",verifyURL);

        helper.setText(content,true);
        javaMailSender.send(message);
    }

    public void updatePassword(String newPassword, Member member, PasswordEncoder passwordEncoder) {
        String encodePassword = passwordEncoder.encode(newPassword);
        member.setMemberPwd(encodePassword);
        member.setPasswordChangedTime(new Date());
        memberRepository.save(member);
    }
}
