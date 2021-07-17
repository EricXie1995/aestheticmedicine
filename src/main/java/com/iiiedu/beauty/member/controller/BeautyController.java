package com.iiiedu.beauty.member.controller;

import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.member.services.BeautyServices;
import com.iiiedu.beauty.member.services.MemberServices;
import com.iiiedu.beauty.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import static com.iiiedu.beauty.member.util.SiteURL.getSiteURL;

@Controller
public class BeautyController {

    @Autowired
    private BeautyServices beautyServices;

    @Autowired
    private MemberServices memberServices;

    @Autowired
    private MemberRepository memberRepository;

    @GetMapping("")
    public String viewHomePage(){
        return "index";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model){
        model.addAttribute("member",new Member());
        return "register";
    }

    @PostMapping("/process_register")
    public String processRegister(Member member, HttpServletRequest request,
                                  RedirectAttributes redirectAttributes,
                                  BindingResult result,
                                  Model model)
            throws UnsupportedEncodingException, MessagingException {
//        if(result.hasErrors()){
//            return "register";
//        }
        String memberAccount = request.getParameter("memberAccount");
        if(memberRepository.findByMemberAccount(memberAccount)!=null){
            model.addAttribute("error","The Account is already in Member");
            return "register";
        }
        beautyServices.register(member ,getSiteURL(request));
        redirectAttributes.addFlashAttribute("message","You have signed up successfully!<br>Please check your email to verify your account");
        return "redirect:/member/login";
    }

    @RequestMapping("/registerValidate")
    public void registerValidater(HttpServletRequest request,
                                  HttpServletResponse response) {
        String memberAccount = "";
        PrintWriter out = null;
        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");
            out = response.getWriter();
            memberAccount = request.getParameter("memberAccount");
//            System.out.println("memberAccount is:"+memberAccount+".");
            if(memberAccount==null||memberAccount==""){
//                out.println("E-mail Account cannot be empty");
            }else{
                Member member = null;
                try {
                    if(memberServices==null){
                        System.out.println("memberServices is null");
                    }else{
                        member = memberRepository.findByMemberAccount(memberAccount);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (member != null) {
                    out.println("This account has been registered, please change it！");
                } else {
                    out.println("Congratulations, this account can be registered！");
                }
                out.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/verify")
    public String verifyMember(@Param("code") String code,
                               RedirectAttributes redirectAttributes){
        if(beautyServices.verify(code)){
            redirectAttributes.addFlashAttribute("message","Congratulations, your account has been verified");
            return "redirect:/member/login";
        } else {
            redirectAttributes.addFlashAttribute("error","Sorry, we could not verify account<br>" +
                    "It maybe already verified,or verification code is incorrect");
            return "redirect:/member/login";
        }
    }
}
