package com.iiiedu.beauty.member.controller;


import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.member.security.MemberUserDetails;
import com.iiiedu.beauty.member.services.MemberServices;
import com.iiiedu.beauty.member.util.FileUploadUtil;
import com.iiiedu.beauty.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberServices memberServices;

    @RequestMapping("/login")
    public String viewLoginPage(HttpSession session, Model model,
                                @AuthenticationPrincipal MemberUserDetails user){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || authentication instanceof AnonymousAuthenticationToken){
            return "login";
        }

        if(user != null){
            Member member = memberRepository.findByMemberAccount(user.getUsername());
            session.setAttribute("memberDetails", member.getMemberDetails());
            session.setAttribute("member",member);
        }
        return "redirect:/";
    }

    @RequestMapping("/basic_settings/{memberPkId}")
    public String viewBasic_settings(@PathVariable(name = "memberPkId")Integer memberPkId,
                                     Model model){
        Member member = memberServices.get(memberPkId);
        model.addAttribute("member" , member);
        return "basic_settings";
    }

    @RequestMapping("/photo_settings/{memberPkId}")
    public String viewphoto_settings(@PathVariable(name = "memberPkId")Integer memberPkId,
                                     Model model){
        Member member = memberServices.get(memberPkId);
        model.addAttribute("member" , member);
        return "photo_settings";
    }

    @PostMapping("/uploadfile")
    public ModelAndView uploadfile(@RequestParam(value = "image") MultipartFile multipartFile,
                                   @ModelAttribute@RequestParam("memberPkId")Integer memberPkId
                                   ) throws IOException {
        String fileName = StringUtils.cleanPath(Objects.requireNonNull(multipartFile.getOriginalFilename()));
        memberRepository.updatePhoto(fileName,memberPkId);
        String uploadDir = "src/main/webapp/member_photos/" + memberPkId;
        FileUploadUtil.saveFile(uploadDir, fileName , multipartFile);

        ModelAndView  model = new ModelAndView("photo_settings");
        Member member = memberServices.get(memberPkId);
        model.addObject("member",member);
        return model;
    }

    @PostMapping("/save")
    public ModelAndView saveMember(
            @RequestParam(value = "memberName") String memberName,
            @RequestParam(value = "memberIdNumber") String memberIdNumber,
            @RequestParam(value = "memberLineId") String memberLineId,
            @RequestParam(value = "memberPhone") String memberPhone,
            @RequestParam(value = "memberAddress") String memberAddress,
            @RequestParam@ModelAttribute("memberPkId")Integer memberPkId) {

        memberRepository.savebasic(memberName,memberIdNumber,memberLineId,memberPhone,memberAddress,memberPkId);

        ModelAndView  model = new ModelAndView("/basic_settings");
        Member member = memberServices.get(memberPkId);
        model.addObject("member",member);
        return model;
    }


}
