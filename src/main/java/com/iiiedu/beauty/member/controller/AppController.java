package com.iiiedu.beauty.member.controller;


import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.member.services.MemberServices;
import com.iiiedu.beauty.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class AppController {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberServices memberServices;

    @GetMapping("")
    public String viewHomePage(){
        return "index";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model){
        model.addAttribute("member",new Member());
        return "signup_form";
    }

    @PostMapping("/process_register")
    public String processRegister(Member member,HttpServletRequest request)
            throws UnsupportedEncodingException , MessagingException{
        memberServices.register(member ,getSiteURL(request));
        return "register_success";
    }

    private String getSiteURL(HttpServletRequest request){
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(),"");
    }

    @GetMapping("/members")
    public String listMembers(Model model){
        List<Member> listMembers = memberRepository.findAll();
        model.addAttribute("listMembers" , listMembers);
        return "members";
    }

    @GetMapping("/verify")
    public String verifyMember(@Param("code") String code){
        if(memberServices.verify(code)){
            return "verify_success";
        } else {
            return "verify_fail";
        }
    }

    @GetMapping("/login")
    public String viewLoginPage(){
        return "login";
    }
}
