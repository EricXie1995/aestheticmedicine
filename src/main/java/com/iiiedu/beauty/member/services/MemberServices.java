package com.iiiedu.beauty.member.services;

import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.MemberDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Service
@Transactional
public class MemberServices {



    @Autowired
    private MemberRepository memberRepository;

    public Member get(Integer memberPkId){
        return memberRepository.findById(memberPkId).get();
    }

    public void processOAuthPostLogin(String memberAccount,
                                      HttpSession session){
        Member existMember = memberRepository.getMemberByMemberAccount(memberAccount);

        if(existMember == null){
            Member newMember = new Member();
            newMember.setMemberAccount(memberAccount);
            newMember.setMemberDetails(new MemberDetails());
            newMember.setProvider(Member.Provider.GOOGLE);
            newMember.setEnabled(true);
            memberRepository.save(newMember);
        }
        Member member = memberRepository.findByMemberAccount(memberAccount);
        session.setAttribute("memberDetails", member.getMemberDetails());
        session.setAttribute("member",member);
    }
}
