package com.iiiedu.beauty.member.controller;

import com.iiiedu.beauty.member.repository.MemberDetailsRepository;
import com.iiiedu.beauty.member.services.MemberDetailsService;
import com.iiiedu.beauty.member.util.FileUploadUtil;
import com.iiiedu.beauty.model.MemberDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@Controller
@RequestMapping("/memberDetails")
public class MemberDetailsController {

    @Autowired
    private MemberDetailsService memberDetailsService;

    @Autowired
    private MemberDetailsRepository memberDetailsRepository;

    @RequestMapping("/profile_settings/{memberDetailsPkId}")
    public String viewProfile_settings(@PathVariable(name = "memberDetailsPkId")Integer memberDetailsPkId,
                                           Model model){
        MemberDetails memberDetails = memberDetailsService.get(memberDetailsPkId);
        model.addAttribute("memberDetails" , memberDetails);
        return "profile_settings";
    }

    @PostMapping("/save")
    public ModelAndView saveProfile_settings(@RequestParam(value = "emergencyContact") String emergencyContact,
                                             @RequestParam(value = "emergencyNumber") String emergencyNumber,
                                             @RequestParam(value = "emergencyRelationship") String emergencyRelationship,
                                             @RequestParam(value = "smoke") String smoke,
                                             @RequestParam(value = "betelNut") String betelNut,
                                             @RequestParam(value = "allergy") String allergy,
                                             @RequestParam(value = "surgery") String surgery,
                                             @RequestParam(value = "diseases") String diseases,
                                             @RequestParam@ModelAttribute("memberDetailsPkId")Integer memberDetailsPkId) throws IOException{

        memberDetailsRepository.saveProfile(emergencyContact,emergencyNumber,emergencyRelationship,smoke,betelNut,allergy,surgery,diseases,memberDetailsPkId);

        ModelAndView  model = new ModelAndView("profile_settings");
        MemberDetails memberDetails = memberDetailsService.get(memberDetailsPkId);

        model.addObject("memberDetails",memberDetails);
        return model;
    }

}
