package com.iiiedu.beauty.member.details;

import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomMemberDetailsService implements UserDetailsService {

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = memberRepository.findByMemberAccount(username);
        if(member == null){
            throw new UsernameNotFoundException("Member not found");
        }
        return new CustomMemberDetails(member);
    }
}
