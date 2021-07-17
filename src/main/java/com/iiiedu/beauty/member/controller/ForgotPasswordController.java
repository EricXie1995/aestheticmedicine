package com.iiiedu.beauty.member.controller;

import com.iiiedu.beauty.member.services.ForgotPasswordServices;
import com.iiiedu.beauty.member.services.MemberNotFoundException;
import com.iiiedu.beauty.member.util.SiteURL;
import com.iiiedu.beauty.model.Member;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
public class ForgotPasswordController {

    @Autowired
    private ForgotPasswordServices forgotPasswordServices;

    @GetMapping("/forgot_password")
    public String showForgotPasswordForm(){
        return "forgot_password_form";
    }

    @PostMapping("/forgot_password")
    public String processForgotPassword(HttpServletRequest request, Model model){
        String email = request.getParameter("memberAccount");
        String token = RandomString.make(30);
        try{
            forgotPasswordServices.updateResetPasswordToken(token,email);
            String resetPasswordLink = SiteURL.getSiteURL(request) + "/reset_password?token=" + token;
            forgotPasswordServices.sendForgotPasswordMail(email,resetPasswordLink);
            model.addAttribute("message", "We have sent a reset password link to your email. Please check.");
        } catch (MemberNotFoundException ex) {
            model.addAttribute("error","Member Not Found , Please check your MemberAccount");
        } catch (UnsupportedEncodingException | MessagingException e){
            model.addAttribute("error","Error while sending email");
        }
        return "forgot_password_form";
    }

    @GetMapping("/reset_password")
    public String showResetPasswordForm(@Param(value = "token") String token , Model model){
        Member member = forgotPasswordServices.getByResetPasswordToken(token);
        model.addAttribute("token",token);

        if (member == null){
            model.addAttribute("message","Invalid Token");
            return "message";
        }
        return "reset_password_form";
    }

    @PostMapping("/reset_password")
    public String processResetPassword(HttpServletRequest request,Model model){
        String token = request.getParameter("token");
        String memberPwd = request.getParameter("memberPwd");

        Member member = forgotPasswordServices.getByResetPasswordToken(token);
        model.addAttribute("title","Reset your password");

        if( member == null){
            model.addAttribute("message" , "Invalid Token");
            return "message";
        } else {
            forgotPasswordServices.updatePassword(member,memberPwd);
            model.addAttribute("message","You have successfully changed your password");
        }
        return "login";
    }

}
