package com.iiiedu.beauty.member.controller;

import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.member.security.MemberUserDetails;
import com.iiiedu.beauty.member.services.BeautyServices;
import com.iiiedu.beauty.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class PasswordController {

    @Autowired
    private BeautyServices beautyServices;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping("/change_password")
    public String showChangePasswordPage(Model model) {
        model.addAttribute("pageTitle", "Change Expired Password");
        return "change_password";
    }

    @PostMapping("/change_password")
    public String processChangePassword(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Model model,
                                        RedirectAttributes redirectAttributes,
                                        @AuthenticationPrincipal MemberUserDetails memberUserDetails)
            throws ServletException {
        Member member = memberRepository.findByMemberAccount(memberUserDetails.getUsername());

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        model.addAttribute("pageTitle", "Change Expired Password");

        if(oldPassword.equals(newPassword)){
            model.addAttribute("message", "Your new password must be different than the old one!");
            return "change_password";
        }

        if(!passwordEncoder.matches(oldPassword,member.getMemberPwd())){
            model.addAttribute("message", "Your old password is incorrect!");
            return "change_password";
        }
        beautyServices.updatePassword(newPassword,member,passwordEncoder);
        request.logout();
        redirectAttributes.addFlashAttribute("message", "You have changed your password successfully!!");
        model.addAttribute("pageTitle", "Login again");
        return "redirect:/member/login";
    }



}
